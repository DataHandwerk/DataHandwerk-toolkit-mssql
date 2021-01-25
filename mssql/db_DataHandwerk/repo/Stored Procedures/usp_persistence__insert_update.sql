/*
create or update persistence:

create RepoObject for a new persistence table, based on a given source view or table

- source NULL, persistence NULL
  - error
- source NULL, persistence NOT NULL
  - try to get source
	- SET source = [source_RepoObject_guid]
- source NOT NULL, persistence NULL
  - create new persistence
- source not NULL, persistence not NULL
  - insert or update [repo].[RepoObject_persistence] for (target_RepoObject_guid, [source_RepoObject_guid])
update existing RepoObject which is a persistence table


in any case:
- update attributes in [repo].[RepoObject_persistence]
- refresh columns in [repo].[RepoObjectColumn]
- sql for persistence table => repo.RepoObject_SqlCreateTable
- sql for persistence procedure => todo


test

--1)

exec repo.[usp_persistence__insert_update]
--=> error

--2)
--create new default persistence

DECLARE
     @source_RepoObject_guid UNIQUEIDENTIFIER

SET @source_RepoObject_guid =
(
    SELECT
           [RepoObject_guid]
    FROM
         [repo].[RepoObject]
    WHERE  [SysObject_fullname] = '[dbo].[view_1]'
)

PRINT @source_RepoObject_guid

EXEC repo.[usp_persistence__insert_update]
     @source_RepoObject_guid = @source_RepoObject_guid


--3)
--mark a table which exists as RepoObject as persistence of a source
--or update persistence if the entry already exists in [repo].[RepoObject_persistence]

DECLARE
     @source_RepoObject_guid      UNIQUEIDENTIFIER
   , @persistence_RepoObject_guid UNIQUEIDENTIFIER

SET @source_RepoObject_guid =
(
    SELECT
           [RepoObject_guid]
    FROM
         [repo].[RepoObject]
    WHERE  [SysObject_fullname] = '[dbo].[view_1]'
)

PRINT @source_RepoObject_guid

SET @persistence_RepoObject_guid =
(
    SELECT
           [RepoObject_guid]
    FROM
         [repo].[RepoObject]
    WHERE  [RepoObject_fullname] = '[dbo].[view_1_T]'
)

--SET @persistence_RepoObject_guid =
--(
--    SELECT TOP 1
--           [target_RepoObject_guid]
--    FROM
--         [repo].[RepoObject_persistence]
--    WHERE  [source_RepoObject_guid] = @source_RepoObject_guid
--    ORDER BY
--             [target_RepoObject_guid]
--)

PRINT @persistence_RepoObject_guid

EXEC repo.[usp_persistence__insert_update]
     @source_RepoObject_guid = @source_RepoObject_guid
   , @persistence_RepoObject_guid = @persistence_RepoObject_guid



*/
--todo: überlegen, ob @source_RepoObject_guid NULL sein darf, wenn @persistence_RepoObject_guid NOT NULL
CREATE PROCEDURE [repo].[usp_persistence__insert_update] @source_RepoObject_guid UNIQUEIDENTIFIER = NULL --
 , @persistence_RepoObject_guid UNIQUEIDENTIFIER = NULL OUTPUT --if this parameter is not null then an existing RepoObject is used to modify, if it is null then a RepoObject will be created
 , @persistence_table_name NVARCHAR(128) = NULL --default: @source_table_name + @persistence_name_suffix; default schema is @source_schema_name
 , @is_persistence_check_for_empty_source BIT = NULL
 , @is_persistence_truncate BIT = NULL
 , @is_persistence_delete_missing BIT = NULL
 , @is_persistence_delete_changed BIT = NULL
 , @is_persistence_update_changed BIT = NULL
 , @is_persistence_insert BIT = NULL
 , @has_history_columns BIT = NULL
 , @has_history BIT = NULL
 , @history_schema_name NVARCHAR(128) = NULL
 , @history_table_name NVARCHAR(128) = NULL
 --todo:
 --think about an additional parameter
 --@is_remove_target_column_not_in_source
 --don't remove: persistence columns, calculated columns
 --but there could be dependencies from these columns
 --these should be checked
 --maybe som kind of maintenance procedure would be better then to integrate this here
 --
 --by default the source schema is used and the source name with prefix '_T' for table
 --todo: use general parameters to define this
 -- some optional parameters, used for logging
 , @execution_instance_guid UNIQUEIDENTIFIER = NULL --SSIS system variable ExecutionInstanceGUID could be used, but other any other guid
 , @ssis_execution_id BIGINT = NULL --only SSIS system variable ServerExecutionID should be used, or any other consistent number system, do not mix
 , @sub_execution_id INT = NULL
 , @parent_execution_log_id BIGINT = NULL
AS
DECLARE @current_execution_log_id BIGINT
 , @current_execution_guid UNIQUEIDENTIFIER = NEWID()
 , @source_object NVARCHAR(261) = NULL
 , @target_object NVARCHAR(261) = NULL
 , @proc_id INT = @@procid
 , @proc_schema_name NVARCHAR(128) = OBJECT_SCHEMA_NAME(@@procid)
 , @proc_name NVARCHAR(128) = OBJECT_NAME(@@procid)
 , @event_info NVARCHAR(MAX)
 , @step_id INT = 0
 , @step_name NVARCHAR(1000) = NULL
 , @rows INT

SET @event_info = (
  SELECT [event_info]
  FROM sys.dm_exec_input_buffer(@@spid, CURRENT_REQUEST_ID())
  )

IF @execution_instance_guid IS NULL
 SET @execution_instance_guid = NEWID();
--SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1
SET @step_name = 'start'
SET @source_object = NULL
SET @target_object = NULL

EXEC repo.usp_ExecutionLog_insert @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @parent_execution_log_id
 , @current_execution_guid = @current_execution_guid
 , @proc_id = @proc_id
 , @proc_schema_name = @proc_schema_name
 , @proc_name = @proc_name
 , @event_info = @event_info
 , @step_id = @step_id
 , @step_name = @step_name
 , @source_object = @source_object
 , @target_object = @target_object
 , @inserted = NULL
 , @updated = NULL
 , @deleted = NULL
 , @info_01 = NULL
 , @info_02 = NULL
 , @info_03 = NULL
 , @info_04 = NULL
 , @info_05 = NULL
 , @info_06 = NULL
 , @info_07 = NULL
 , @info_08 = NULL
 , @info_09 = NULL
 , @execution_log_id = @current_execution_log_id OUTPUT
 , @parameter_01 = @source_RepoObject_guid
 , @parameter_02 = @persistence_RepoObject_guid
 , @parameter_03 = @persistence_table_name
 , @parameter_04 = @is_persistence_check_for_empty_source
 , @parameter_05 = @is_persistence_truncate
 , @parameter_06 = @is_persistence_delete_missing
 , @parameter_07 = @is_persistence_delete_changed
 , @parameter_08 = @is_persistence_update_changed
 , @parameter_09 = @is_persistence_insert
 , @parameter_10 = @has_history_columns
 , @parameter_11 = @has_history
 , @parameter_12 = @history_schema_name
 , @parameter_13 = @history_table_name

--
----START
--
DECLARE @info_01_message NVARCHAR(1000)
--this table is used for OUTPUT to get the new assigned [RepoObject_guid] when inserting new values
DECLARE @ids TABLE ([guid] UNIQUEIDENTIFIER)
DECLARE @source_schema_name NVARCHAR(128)
 , @source_table_name NVARCHAR(128)
 , @persistence_schema_name NVARCHAR(128)
 , @persistence_name_suffix NVARCHAR(10)

--   , @new_RepoObject_guid     UNIQUEIDENTIFIER
SET @persistence_name_suffix = (
  SELECT [Parameter_value__result_nvarchar]
  FROM [repo].[Parameter]
  WHERE [Parameter_name] = 'persistence_name_suffix'
  )

----the following should not happen
--SET @persistence_name_suffix = (
--  SELECT ISNULL(@persistence_name_suffix, '_T')
--  )
IF @persistence_name_suffix IS NULL
BEGIN
 THROW 51001
  , '@persistence_name_suffix is null, check repo.Parameter, EXEC [repo].[usp_init_parameter]'
  , 1;
END

IF @source_RepoObject_guid IS NULL
 AND @persistence_RepoObject_guid IS NULL
BEGIN
 THROW 51002
  , '@source_RepoObject_guid is null and @persistence_RepoObject_guid is null'
  , 1;
END

IF NOT @persistence_RepoObject_guid IS NULL
 AND @source_RepoObject_guid IS NULL
BEGIN
 --try to get @source_RepoObject_guid
 SET @source_RepoObject_guid = (
   SELECT [source_RepoObject_guid]
   FROM [repo].[RepoObject_persistence] AS ro
   WHERE [target_RepoObject_guid] = @persistence_RepoObject_guid
   )

 IF @source_RepoObject_guid IS NULL
 BEGIN
  SET @info_01_message = '@source_RepoObject_guid IS NULL; @persistence_RepoObject_guid is not NULL but [source_RepoObject_guid] can''t be obtained'
  --SET @rows = @@ROWCOUNT;
  SET @step_id = @step_id + 1
  SET @step_name = 'error'
  SET @source_object = '[repo].[RepoObject_persistence]'
  SET @target_object = NULL

  EXEC repo.usp_ExecutionLog_insert @execution_instance_guid = @execution_instance_guid
   , @ssis_execution_id = @ssis_execution_id
   , @sub_execution_id = @sub_execution_id
   , @parent_execution_log_id = @parent_execution_log_id
   , @current_execution_guid = @current_execution_guid
   , @proc_id = @proc_id
   , @proc_schema_name = @proc_schema_name
   , @proc_name = @proc_name
   , @event_info = @event_info
   , @step_id = @step_id
   , @step_name = @step_name
   , @source_object = @source_object
   , @target_object = @target_object
   , @inserted = NULL
   , @updated = NULL
   , @deleted = NULL
   , @info_01 = @info_01_message
   , @info_02 = @persistence_RepoObject_guid
   , @info_03 = NULL
   , @info_04 = NULL
   , @info_05 = NULL
   , @info_06 = NULL
   , @info_07 = NULL
   , @info_08 = NULL
   , @info_09 = NULL;

  --RETURN 3
  THROW 51003
   , @info_01_message
   , 1;
 END --IF @source_RepoObject_guid IS NULL
END --IF NOT @persistence_RepoObject_guid IS NULL IF NOT @persistence_RepoObject_guid IS NULL AND @source_RepoObject_guid IS NULL 

--now @source_RepoObject_guid should not be NULL, because it was assigned before
IF NOT @source_RepoObject_guid IS NULL
 AND @persistence_RepoObject_guid IS NULL
BEGIN
 --create new @persistence_RepoObject_guid
 --check, if @source_RepoObject_guid exists and it is a view or table
 SELECT @source_schema_name = [SysObject_schema_name]
  , @source_table_name = [SysObject_name]
 FROM repo.RepoObject AS ro
 WHERE [ro].[SysObject_type] IN (
   'V'
   , 'U'
   )
  AND [RepoObject_guid] = @source_RepoObject_guid

 IF @source_schema_name IS NULL
 BEGIN
  SET @info_01_message = CONCAT (
    @source_RepoObject_guid
    , ': Source object is missing in [repo].[RepoObject] or type is not U or V'
    )
  --SET @rows = @@ROWCOUNT;
  SET @step_id = @step_id + 1
  SET @step_name = 'error'
  SET @source_object = '[repo].[RepoObject]'
  SET @target_object = NULL

  EXEC repo.usp_ExecutionLog_insert @execution_instance_guid = @execution_instance_guid
   , @ssis_execution_id = @ssis_execution_id
   , @sub_execution_id = @sub_execution_id
   , @parent_execution_log_id = @parent_execution_log_id
   , @current_execution_guid = @current_execution_guid
   , @proc_id = @proc_id
   , @proc_schema_name = @proc_schema_name
   , @proc_name = @proc_name
   , @event_info = @event_info
   , @step_id = @step_id
   , @step_name = @step_name
   , @source_object = @source_object
   , @target_object = @target_object
   , @inserted = NULL
   , @updated = NULL
   , @deleted = NULL
   , @info_01 = @info_01_message
   , @info_02 = @source_RepoObject_guid
   , @info_03 = NULL
   , @info_04 = NULL
   , @info_05 = NULL
   , @info_06 = NULL
   , @info_07 = NULL
   , @info_08 = NULL
   , @info_09 = NULL;

  --RETURN 4
  THROW 51004
   , @info_01_message
   , 1;
 END --IF @source_schema_name IS NULL

 --insert new entry for persistence table into [repo].[RepoObject]
 --@source_schema_name is used also as @persistence_schema_name
 --but if required this can be changed later in repo.RepoObject
 --todo: if required, we could implement a procedure parameter @persistence_schema_name
 SET @persistence_schema_name = @source_schema_name
 SET @persistence_table_name = ISNULL(@persistence_table_name, CONCAT (
    @source_table_name
    , @persistence_name_suffix
    ))

 IF EXISTS (
   SELECT [RepoObject_guid]
   FROM repo.RepoObject
   WHERE [RepoObject_schema_name] = @persistence_schema_name
    AND [RepoObject_name] = @persistence_table_name
   )
 BEGIN
  SET @info_01_message = 'Persistence Table already exists by ([RepoObject_schema_name], [RepoObject_name]) in repo.RepoObject'
  --SET @rows = @@ROWCOUNT;
  SET @step_id = @step_id + 1
  SET @step_name = 'error'
  SET @source_object = '[repo].[RepoObject]'
  SET @target_object = NULL

  EXEC repo.usp_ExecutionLog_insert @execution_instance_guid = @execution_instance_guid
   , @ssis_execution_id = @ssis_execution_id
   , @sub_execution_id = @sub_execution_id
   , @parent_execution_log_id = @parent_execution_log_id
   , @current_execution_guid = @current_execution_guid
   , @proc_id = @proc_id
   , @proc_schema_name = @proc_schema_name
   , @proc_name = @proc_name
   , @event_info = @event_info
   , @step_id = @step_id
   , @step_name = @step_name
   , @source_object = @source_object
   , @target_object = @target_object
   , @inserted = NULL
   , @updated = NULL
   , @deleted = NULL
   , @info_01 = @info_01_message
   , @info_02 = @persistence_schema_name
   , @info_03 = @persistence_table_name
   , @info_04 = NULL
   , @info_05 = NULL
   , @info_06 = NULL
   , @info_07 = NULL
   , @info_08 = NULL
   , @info_09 = NULL;

  --RETURN 5
  THROW 51005
   , @info_01_message
   , 1;
 END

 --finaly create new @persistence_RepoObject_guid
 --make sure the @ids table is empty
 DELETE @ids

 INSERT INTO repo.RepoObject (
  [RepoObject_schema_name]
  , [RepoObject_name]
  , [RepoObject_type]
  , [SysObject_schema_name] --can't be NULL
  , [is_repo_managed]
  )
 OUTPUT [INSERTED].[RepoObject_guid]
 INTO @ids
 VALUES (
  @persistence_schema_name
  , @persistence_table_name
  , 'U'
  , @persistence_schema_name
  , 1
  )

 SET @persistence_RepoObject_guid = (
   SELECT [guid]
   FROM @ids
   )
END --IF NOT @source_RepoObject_guid IS NULL AND @persistence_RepoObject_guid IS NULL

--now both @source_RepoObject_guid and @persistence_RepoObject_guid should be not empty and exists in [repo].[RepoObject]
IF @source_RepoObject_guid IS NULL
 OR @persistence_RepoObject_guid IS NULL
BEGIN
 THROW 51011
  , 'source and persistence not matching, still: @source_RepoObject_guid is null OR @persistence_RepoObject_guid is null'
  , 1;
END

--now [repo].[RepoObject] should contain the @persistence_RepoObject_guid
--
--check if @persistence_RepoObject_guid is a table
IF NOT EXISTS (
  SELECT [RepoObject_type]
  FROM [repo].[RepoObject]
  WHERE [RepoObject_guid] = @persistence_RepoObject_guid
   AND [RepoObject_type] = 'U'
  )
BEGIN
 SET @info_01_message = '@persistence_RepoObject_guid has not [RepoObject_type] = ''U'''
 --SET @rows = @@ROWCOUNT;
 SET @step_id = @step_id + 1
 SET @step_name = 'error'
 SET @source_object = '[repo].[RepoObject]'
 SET @target_object = NULL

 EXEC repo.usp_ExecutionLog_insert @execution_instance_guid = @execution_instance_guid
  , @ssis_execution_id = @ssis_execution_id
  , @sub_execution_id = @sub_execution_id
  , @parent_execution_log_id = @parent_execution_log_id
  , @current_execution_guid = @current_execution_guid
  , @proc_id = @proc_id
  , @proc_schema_name = @proc_schema_name
  , @proc_name = @proc_name
  , @event_info = @event_info
  , @step_id = @step_id
  , @step_name = @step_name
  , @source_object = @source_object
  , @target_object = @target_object
  , @inserted = NULL
  , @updated = NULL
  , @deleted = NULL
  , @info_01 = @info_01_message
  , @info_02 = @persistence_RepoObject_guid
  , @info_03 = NULL
  , @info_04 = NULL
  , @info_05 = NULL
  , @info_06 = NULL
  , @info_07 = NULL
  , @info_08 = NULL
  , @info_09 = NULL;

 --RETURN 6
 THROW 51006
  , @info_01_message
  , 1;
END

--
--[repo].[RepoObject_persistence]
--ensure @persistence_RepoObject_guid is in [repo].[RepoObject_persistence]
--we will not insert other parameters because they can be NULL
--instead of the defaults from the table will be used and we will update later in a separate step
INSERT INTO [repo].[RepoObject_persistence] (
 [target_RepoObject_guid]
 , [source_RepoObject_guid]
 )
SELECT @persistence_RepoObject_guid
 , @source_RepoObject_guid
WHERE NOT EXISTS (
  SELECT [target_RepoObject_guid]
  FROM [repo].[RepoObject_persistence] AS [rop]
  WHERE [rop].[target_RepoObject_guid] = @persistence_RepoObject_guid
  )

SET @rows = @@rowcount;
SET @step_id = @step_id + 1
SET @step_name = 'INSERT SELECT @persistence_RepoObject_guid, @source_RepoObject_guid'
SET @source_object = NULL
SET @target_object = '[repo].[RepoObject_persistence]'

EXEC repo.usp_ExecutionLog_insert @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @parent_execution_log_id
 , @current_execution_guid = @current_execution_guid
 , @proc_id = @proc_id
 , @proc_schema_name = @proc_schema_name
 , @proc_name = @proc_name
 , @event_info = @event_info
 , @step_id = @step_id
 , @step_name = @step_name
 , @source_object = @source_object
 , @target_object = @target_object
 , @inserted = @rows
 , @updated = NULL
 , @deleted = NULL
 , @info_01 = @persistence_RepoObject_guid
 , @info_02 = NULL
 , @info_03 = NULL
 , @info_04 = NULL
 , @info_05 = NULL
 , @info_06 = NULL
 , @info_07 = NULL
 , @info_08 = NULL
 , @info_09 = NULL

--update only, if procedure parameters are not NULL
UPDATE [repo].[RepoObject_persistence]
SET [source_RepoObject_guid] = @source_RepoObject_guid
 , [is_persistence_truncate] = ISNULL(@is_persistence_truncate, [is_persistence_truncate])
 , [is_persistence_delete_missing] = ISNULL(@is_persistence_delete_missing, [is_persistence_delete_missing])
 , [is_persistence_delete_changed] = ISNULL(@is_persistence_delete_changed, [is_persistence_delete_changed])
 , [is_persistence_update_changed] = ISNULL(@is_persistence_update_changed, [is_persistence_update_changed])
 , [is_persistence_insert] = ISNULL(@is_persistence_insert, [is_persistence_insert])
 , [has_history_columns] = ISNULL(@has_history_columns, [has_history_columns])
 , [has_history] = ISNULL(@has_history, [has_history])
 , [is_persistence_check_for_empty_source] = ISNULL(@is_persistence_check_for_empty_source, [is_persistence_check_for_empty_source])
 , [history_schema_name] = ISNULL(@history_schema_name, [history_schema_name])
 , [history_table_name] = ISNULL(@history_table_name, [history_table_name])
WHERE [target_RepoObject_guid] = @persistence_RepoObject_guid

SET @rows = @@rowcount;
SET @step_id = @step_id + 1
SET @step_name = 'SET parameters from procedure call'
SET @source_object = NULL
SET @target_object = '[repo].[RepoObject_persistence]'

EXEC repo.usp_ExecutionLog_insert @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @parent_execution_log_id
 , @current_execution_guid = @current_execution_guid
 , @proc_id = @proc_id
 , @proc_schema_name = @proc_schema_name
 , @proc_name = @proc_name
 , @event_info = @event_info
 , @step_id = @step_id
 , @step_name = @step_name
 , @source_object = @source_object
 , @target_object = @target_object
 , @inserted = NULL
 , @updated = @rows
 , @deleted = NULL
 , @info_01 = @persistence_RepoObject_guid
 , @info_02 = NULL
 , @info_03 = NULL
 , @info_04 = NULL
 , @info_05 = NULL
 , @info_06 = NULL
 , @info_07 = NULL
 , @info_08 = NULL
 , @info_09 = NULL

--ensure @persistence_RepoObject_guid is marked as [is_repo_managed] = 1
UPDATE [repo].[RepoObject]
SET [is_repo_managed] = 1
WHERE ISNULL([is_repo_managed], 0) <> 1
 AND [RepoObject_guid] = @persistence_RepoObject_guid

SET @rows = @@rowcount;
SET @step_id = @step_id + 1
SET @step_name = 'SET [is_repo_managed] = 1 (WHERE [RepoObject_guid] = @persistence_RepoObject_guid)'
SET @source_object = NULL
SET @target_object = '[repo].[RepoObject]'

EXEC repo.usp_ExecutionLog_insert @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @parent_execution_log_id
 , @current_execution_guid = @current_execution_guid
 , @proc_id = @proc_id
 , @proc_schema_name = @proc_schema_name
 , @proc_name = @proc_name
 , @event_info = @event_info
 , @step_id = @step_id
 , @step_name = @step_name
 , @source_object = @source_object
 , @target_object = @target_object
 , @inserted = NULL
 , @updated = @rows
 , @deleted = NULL
 , @info_01 = NULL
 , @info_02 = NULL
 , @info_03 = NULL
 , @info_04 = NULL
 , @info_05 = NULL
 , @info_06 = NULL
 , @info_07 = NULL
 , @info_08 = NULL
 , @info_09 = NULL

--set temporal_type
--0 = NON_TEMPORAL_TABLE
--1 = HISTORY_TABLE
--2 = SYSTEM_VERSIONED_TEMPORAL_TABLE
UPDATE ro
SET [Repo_temporal_type] = rop.temporal_type
FROM [repo].[RepoObject] ro
INNER JOIN [repo].[RepoObject_persistence] rop
 ON rop.[target_RepoObject_guid] = ro.[RepoObject_guid]
WHERE ro.[RepoObject_guid] = @persistence_RepoObject_guid
 AND (
  ro.[Repo_temporal_type] <> rop.temporal_type
  OR ro.[Repo_temporal_type] IS NULL
  )

SET @rows = @@rowcount;
SET @step_id = @step_id + 1
SET @step_name = 'SET [Repo_temporal_type]'
SET @source_object = '[repo].[RepoObject_persistence]'
SET @target_object = '[repo].[RepoObject]'

EXEC repo.usp_ExecutionLog_insert @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @parent_execution_log_id
 , @current_execution_guid = @current_execution_guid
 , @proc_id = @proc_id
 , @proc_schema_name = @proc_schema_name
 , @proc_name = @proc_name
 , @event_info = @event_info
 , @step_id = @step_id
 , @step_name = @step_name
 , @source_object = @source_object
 , @target_object = @target_object
 , @inserted = NULL
 , @updated = @rows
 , @deleted = NULL
 , @info_01 = NULL
 , @info_02 = NULL
 , @info_03 = NULL
 , @info_04 = NULL
 , @info_05 = NULL
 , @info_06 = NULL
 , @info_07 = NULL
 , @info_08 = NULL
 , @info_09 = NULL

-------------------------------------------------
-------------  COLUMNS  -------------------------
-------------------------------------------------
--
--ensure all columns from source exists:
--the following already happens in [repo].[usp_sync_guid_RepoObjectColumn] and we don't need to repeat it here:
--
/*
--persistence: update RepoObjectColumn_name from SysObjecColumn_name of persistence_source_RepoObjectColumn_guid
UPDATE roc_p
	SET
	    [RepoObjectColumn_name] = [roc_s].[SysObjectColumn_name]
	, [Repo_user_type_name] = [roc_s].[Sys_user_type_name]
	, [Repo_user_type_fullname] = [roc_s].[Sys_user_type_fullname]
FROM   [repo].[RepoObjectColumn] [roc_p]
	    INNER JOIN
	    [repo].[RepoObjectColumn] [roc_s]
	    ON [roc_p].[persistence_source_RepoObjectColumn_guid] = [roc_s].[RepoObjectColumn_guid]
	    INNER JOIN
	    [repo].[RepoObject] [ro_p]
	    ON [roc_p].[RepoObject_guid] = [ro_p].[RepoObject_guid]
WHERE
	    [ro_p].[is_repo_managed] = 1
	    AND ([roc_p].[RepoObjectColumn_name] <> [roc_s].[SysObjectColumn_name]
	        OR [roc_p].[Repo_user_type_fullname] <> [roc_s].[Sys_user_type_fullname]
	        OR ([roc_p].[Repo_user_type_fullname] IS NULL
	            AND NOT [roc_s].[Sys_user_type_fullname] IS NULL)
	        OR (NOT [roc_p].[Repo_user_type_fullname] IS NULL
	            AND [roc_s].[Sys_user_type_fullname] IS NULL)
	    --we don't need to check user_type_name, it is included in user_type_fullname
	    --OR [roc_p].[Repo_user_type_name] <> [roc_s].[Sys_user_type_name]
	    --
	    )
*/
--
--try to find [persistence_source_RepoObjectColumn_guid] for existing persistence columns by Column name
UPDATE roc_p
SET [roc_p].[persistence_source_RepoObjectColumn_guid] = [roc_s].[RepoObjectColumn_guid]
--update attributes later in a separate step:
--, [roc_p].[Repo_user_type_name] = [roc_s].[Sys_user_type_name]
--, [roc_p].[Repo_user_type_fullname] = [roc_s].[Sys_user_type_fullname]
FROM [repo].[RepoObjectColumn] AS [roc_p]
INNER JOIN [repo].[RepoObjectColumn] AS [roc_s]
 ON [roc_p].[RepoObjectColumn_name] = [roc_s].[RepoObjectColumn_name]
WHERE [roc_p].[persistence_source_RepoObjectColumn_guid] IS NULL
 AND [roc_p].[RepoObject_guid] = @persistence_RepoObject_guid
 AND [roc_s].[RepoObject_guid] = @source_RepoObject_guid
 --skip special table columns (ValidFrom, ValidTo) in target (= persistence)
 AND (
  [roc_p].[Repo_generated_always_type] = 0
  OR [roc_p].[Repo_generated_always_type] IS NULL
  )
 --skip [is_query_plan_expression] in target
 AND (
  [roc_p].[is_query_plan_expression] = 0
  OR [roc_p].[is_query_plan_expression] IS NULL
  )

SET @rows = @@rowcount;
SET @step_id = @step_id + 1
SET @step_name = '[roc_p].[persistence_source_RepoObjectColumn_guid] = [roc_s].[RepoObjectColumn_guid] (matching by column name)'
SET @source_object = '[repo].[RepoObjectColumn]'
SET @target_object = '[repo].[RepoObjectColumn]'

EXEC repo.usp_ExecutionLog_insert @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @parent_execution_log_id
 , @current_execution_guid = @current_execution_guid
 , @proc_id = @proc_id
 , @proc_schema_name = @proc_schema_name
 , @proc_name = @proc_name
 , @event_info = @event_info
 , @step_id = @step_id
 , @step_name = @step_name
 , @source_object = @source_object
 , @target_object = @target_object
 , @inserted = NULL
 , @updated = @rows
 , @deleted = NULL
 , @info_01 = NULL
 , @info_02 = NULL
 , @info_03 = NULL
 , @info_04 = NULL
 , @info_05 = NULL
 , @info_06 = NULL
 , @info_07 = NULL
 , @info_08 = NULL
 , @info_09 = NULL

--add missing (in target) persistence columns, existing in source
INSERT INTO [repo].[RepoObjectColumn] (
 [RepoObject_guid]
 , [RepoObjectColumn_name]
 , [persistence_source_RepoObjectColumn_guid]
 )
--do this in a separate step:
--, [Repo_user_type_name]
--, [Repo_user_type_fullname]
SELECT @persistence_RepoObject_guid
 , [roc_s].[RepoObjectColumn_name]
 , [roc_s].[RepoObjectColumn_guid]
--, [roc_s].[Sys_user_type_name]
--, [roc_s].[Sys_user_type_fullname]
FROM [repo].[RepoObjectColumn] AS [roc_s]
WHERE [roc_s].[RepoObject_guid] = @source_RepoObject_guid
 AND NOT EXISTS (
  SELECT 1
  FROM [repo].[RepoObjectColumn] AS [roc_p]
  WHERE [roc_p].[RepoObject_guid] = @persistence_RepoObject_guid
   AND [roc_p].[persistence_source_RepoObjectColumn_guid] = [roc_s].[RepoObjectColumn_guid]
  )
 --skip special table columns (ValidFrom, ValidTo) in source
 AND (
  [roc_s].[Repo_generated_always_type] = 0
  OR [roc_s].[Repo_generated_always_type] IS NULL
  )
 --skip [is_query_plan_expression] in source
 AND (
  [roc_s].[is_query_plan_expression] = 0
  OR [roc_s].[is_query_plan_expression] IS NULL
  )

SET @rows = @@rowcount;
SET @step_id = @step_id + 1
SET @step_name = 'add missing persistence columns existing in source'
SET @source_object = '[repo].[RepoObjectColumn]'
SET @target_object = '[repo].[RepoObjectColumn]'

EXEC repo.usp_ExecutionLog_insert @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @parent_execution_log_id
 , @current_execution_guid = @current_execution_guid
 , @proc_id = @proc_id
 , @proc_schema_name = @proc_schema_name
 , @proc_name = @proc_name
 , @event_info = @event_info
 , @step_id = @step_id
 , @step_name = @step_name
 , @source_object = @source_object
 , @target_object = @target_object
 , @inserted = @rows
 , @updated = NULL
 , @deleted = NULL
 , @info_01 = NULL
 , @info_02 = NULL
 , @info_03 = NULL
 , @info_04 = NULL
 , @info_05 = NULL
 , @info_06 = NULL
 , @info_07 = NULL
 , @info_08 = NULL
 , @info_09 = NULL

--sync new columns, use existing procedure to manage the filling of Repo_... columns
EXEC [repo].[usp_sync_guid] @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id

/*
	ensure all columns from source exists
	
	
	[has_history_columns]
	über [repo].[RepoObjectColumn] oder direkt im sql der Tabelle?
	wass passiert, wenn diese Spalten erst später hinzugefügt werden sollen?
	
	*/
-------------------------------------------------
-------------  SQL for table  -------------------
-------------------------------------------------
--
--
-------------------------------------------------
-------------  SQL for procedure  ---------------
-------------------------------------------------
--
--
----todo: which to use for persistence name? RepoObject names or SysObject names?
----SysObject Names could be still empty, if @persistence_RepoObject_guid exists only in repo but not yet in database
--SELECT
--       @persistence_schema_name = [RepoObject_schema_name]
--     , @persistence_table_name = [RepoObject_name]
--FROM
--     repo.RepoObject AS ro
--WHERE  [ro].[SysObject_type] = 'U'
--       AND [RepoObject_guid] = @persistence_RepoObject_guid
/*
	if not @persistence_RepoObject_guid is null
	check, if @persistence_RepoObject_guid exists and it is a user table
	
	check, if @persistence_RepoObject_guid is in [repo].[RepoObject_persistence]
	wenn nicht, dieses dort eintragen
	
	
	if @persistence_RepoObject_guid is null
	
	create new RepoObject and insert into [repo].[RepoObject_persistence]
	set @persistence_RepoObject_guid to the new RepoObject
	
	Spalten
	
	sql für create table
	
	nachdenken über
	- umbenannte Spalten
	- geänderter Datentyp
	- neue Spalten
	- nicht mehr existierende Spalten
	
	sql für Prozedure zum Befüllen der Persistierung 
	
	*/
--
--END
--
--SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1;
SET @step_name = 'end'
SET @source_object = NULL
SET @target_object = NULL

EXEC repo.usp_ExecutionLog_insert @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @parent_execution_log_id
 , @current_execution_guid = @current_execution_guid
 , @proc_id = @proc_id
 , @proc_schema_name = @proc_schema_name
 , @proc_name = @proc_name
 , @event_info = @event_info
 , @step_id = @step_id
 , @step_name = @step_name
 , @source_object = @source_object
 , @target_object = @target_object
 , @inserted = NULL
 , @updated = NULL
 , @deleted = NULL
 , @info_01 = NULL
 , @info_02 = NULL
 , @info_03 = NULL
 , @info_04 = NULL
 , @info_05 = NULL
 , @info_06 = NULL
 , @info_07 = NULL
 , @info_08 = NULL
 , @info_09 = NULL
