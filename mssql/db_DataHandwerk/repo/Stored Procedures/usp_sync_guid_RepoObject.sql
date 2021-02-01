CREATE   PROCEDURE [repo].[usp_sync_guid_RepoObject]
----keep the code between logging parameters and "START" unchanged!
---- parameters, used for logging; you don't need to care about them, but you can use them, wenn calling from SSIS or in your workflow to log the context of the procedure call
  @execution_instance_guid UNIQUEIDENTIFIER = NULL --SSIS system variable ExecutionInstanceGUID could be used, any other unique guid is also fine. If NULL, then NEWID() is used to create one
, @ssis_execution_id BIGINT = NULL --only SSIS system variable ServerExecutionID should be used, or any other consistent number system, do not mix different number systems
, @sub_execution_id INT = NULL --in case you log some sub_executions, for example in SSIS loops or sub packages
, @parent_execution_log_id BIGINT = NULL --in case a sup procedure is called, the @current_execution_log_id of the parent procedure should be propagated here. It allowes call stack analyzing
AS
DECLARE
 --
   @current_execution_log_id BIGINT --this variable should be filled only once per procedure call, it contains the first logging call for the step 'start'.
 , @current_execution_guid UNIQUEIDENTIFIER = NEWID() --a unique guid for any procedure call. It should be propagated to sub procedures using "@parent_execution_log_id = @current_execution_log_id"
 , @source_object NVARCHAR(261) = NULL --use it like '[schema].[object]', this allows data flow vizualizatiuon (include square brackets)
 , @target_object NVARCHAR(261) = NULL --use it like '[schema].[object]', this allows data flow vizualizatiuon (include square brackets)
 , @proc_id INT = @@procid
 , @proc_schema_name NVARCHAR(128) = OBJECT_SCHEMA_NAME(@@procid) --schema ande name of the current procedure should be automatically logged
 , @proc_name NVARCHAR(128) = OBJECT_NAME(@@procid)               --schema ande name of the current procedure should be automatically logged
 , @event_info NVARCHAR(MAX)
 , @step_id INT = 0
 , @step_name NVARCHAR(1000) = NULL
 , @rows INT

--[event_info] get's only the information about the "outer" calling process
--wenn the procedure calls sub procedures, the [event_info] will not change
SET @event_info = (
  SELECT [event_info]
  FROM sys.dm_exec_input_buffer(@@spid, CURRENT_REQUEST_ID())
  )

IF @execution_instance_guid IS NULL
 SET @execution_instance_guid = NEWID();
--
--SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1
SET @step_name = 'start'
SET @source_object = NULL
SET @target_object = NULL

EXEC repo.usp_ExecutionLog_insert
 --these parameters should be the same for all logging execution
   @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @parent_execution_log_id
 , @current_execution_guid = @current_execution_guid
 , @proc_id = @proc_id
 , @proc_schema_name = @proc_schema_name
 , @proc_name = @proc_name
 , @event_info = @event_info
 --the following parameters are individual for each call
 , @step_id = @step_id --@step_id should be incremented before each call
 , @step_name = @step_name --assign individual step names for each call
 --only the "start" step should return the log id into @current_execution_log_id
 --all other calls should not overwrite @current_execution_log_id
 , @execution_log_id = @current_execution_log_id OUTPUT
----you can log the content of your own parameters, do this only in the start-step
----data type is sql_variant

--
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
--
/*{"ReportUspStep":[{"Number":210,"Name":"SET several RepoObject_SysObject_...","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo_sys].[SysObject]","log_target_object":"[repo].[RepoObject]","log_flag_InsertUpdateDelete":"u"}]}*/
/*
use objects with [RepoObject_guid] stored in extended properties
	
- SysObject could be renamed after previous sync
	- => update SysObject properties in RepoObject
	- don't change RepoObject names
*/
UPDATE repo.SysObject_RepoObject_via_guid
SET [RepoObject_SysObject_id] = [SysObject_id]
 , [RepoObject_SysObject_schema_name] = [SysObject_schema_name]
 , [RepoObject_SysObject_name] = [SysObject_name]
 , [RepoObject_SysObject_type] = [SysObject_type]
 , [RepoObject_SysObject_modify_date] = [modify_date]
 --, [RepoObject_parent_SysObject_id] = [SysObject_parent_SysObject_id]
 --, [RepoObject_SysObject_temporal_type] = [SysObject_temporal_type]
 --, [RepoObject_SysObject_history_table_id] = [SysObject_history_table_id]
 --, [RepoObject_SysObject_max_column_id_used] = [SysObject_max_column_id_used]
 , [RepoObject_is_SysObject_missing] = NULL
WHERE NOT [RepoObject_guid] IS NULL
 AND (
  [RepoObject_SysObject_id] <> [SysObject_id]
  OR [RepoObject_SysObject_id] IS NULL
  OR [RepoObject_SysObject_schema_name] <> [SysObject_schema_name]
  OR [RepoObject_SysObject_name] <> [SysObject_name]
  OR [RepoObject_SysObject_type] <> [SysObject_type]
  OR [RepoObject_SysObject_modify_date] <> [modify_date]
  OR [RepoObject_SysObject_modify_date] IS NULL
  --OR [RepoObject_parent_SysObject_id] <> [SysObject_parent_SysObject_id]
  --OR [RepoObject_SysObject_temporal_type] <> [SysObject_temporal_type]
  --OR ([RepoObject_SysObject_temporal_type] IS NULL
  --    AND NOT [SysObject_temporal_type] IS NULL)
  --OR (NOT [RepoObject_SysObject_temporal_type] IS NULL
  --    AND [SysObject_temporal_type] IS NULL)
  --OR [RepoObject_SysObject_history_table_id] <> [SysObject_history_table_id]
  --OR ([RepoObject_SysObject_history_table_id] IS NULL
  --    AND NOT [SysObject_history_table_id] IS NULL)
  --OR (NOT [RepoObject_SysObject_history_table_id] IS NULL
  --    AND [SysObject_history_table_id] IS NULL)
  --OR [RepoObject_SysObject_max_column_id_used] <> [SysObject_max_column_id_used]
  --OR ([RepoObject_SysObject_max_column_id_used] IS NULL
  --    AND NOT [SysObject_max_column_id_used] IS NULL)
  --OR (NOT [RepoObject_SysObject_max_column_id_used] IS NULL
  --    AND [SysObject_max_column_id_used] IS NULL)
  --
  )

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'SET several RepoObject_SysObject_...'
SET @source_object = '[repo_sys].[SysObject]'
SET @target_object = '[repo].[RepoObject]'

EXEC repo.usp_ExecutionLog_insert 
 @execution_instance_guid = @execution_instance_guid
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
 , @updated = @rows
-- Logging END --

/*{"ReportUspStep":[{"Number":310,"Name":"SET [SysObject_name] = [repo].[RepoObject].[RepoObject_guid]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo_sys].[SysObject]","log_target_object":"[repo].[RepoObject]","log_flag_InsertUpdateDelete":"u"}]}*/
/*
in case of possible conflict when inserting missing guid because auf [UK_RepoObject__SysNames] conflicting entries get 
[SysObject_name] = [repo].[RepoObject].[RepoObject_guid]
this will allow INSERT in the next step without issues
*/
UPDATE repo.RepoObject
SET [SysObject_name] = [repo].[RepoObject].[RepoObject_guid]
FROM [repo].[RepoObject]
INNER JOIN (
 SELECT [SysObject_id]
  , [SysObject_RepoObject_guid]
  , [SysObject_schema_name]
  , [SysObject_name]
 FROM [repo].[SysObject_RepoObject_via_guid]
 WHERE
  --SysObject, which exists in database and have a RepoObject_guid assigned in extended properties 
  NOT [SysObject_RepoObject_guid] IS NULL
  --but the have not yet a RepoObject_guid assigned in [repo].[RepoObject] 
  AND [RepoObject_guid] IS NULL
 ) AS [missing_guid]
 ON [repo].[RepoObject].[SysObject_schema_name] = [missing_guid].[SysObject_schema_name]
  AND [repo].[RepoObject].[SysObject_name] = [missing_guid].[SysObject_name]

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'SET [SysObject_name] = [repo].[RepoObject].[RepoObject_guid]'
SET @source_object = '[repo_sys].[SysObject]'
SET @target_object = '[repo].[RepoObject]'

EXEC repo.usp_ExecutionLog_insert 
 @execution_instance_guid = @execution_instance_guid
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
 , @updated = @rows
-- Logging END --

/*{"ReportUspStep":[{"Number":410,"Name":"[SysObject_RepoObject_guid] -> [RepoObject_guid]; some name, type, …","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo_sys].[SysObject]","log_target_object":"[repo].[RepoObject]","log_flag_InsertUpdateDelete":"i"}]}*/
/*
if a [RepoObject_guid] is stored in extended properties but missing in RepoObject, it should be restored
use objects with [RepoObject_guid] stored in extended properties
	
- restore / insert RepoObject_guid from [SysObject_RepoObject_guid]
- SysObject names are restored as SysObject names
- a conflict could happen when some RepoObject have been renamed and when they now conflict with existing RepoObject names  
	[UK_RepoObject_Names]
	=> thats way we use [RepoObject_guid] as [RepoObject_name] to avoid conflicts we will later rename [RepoObject_name] to [SysObject_name] where this is possible
*/
INSERT INTO repo.RepoObject (
 [RepoObject_guid]
 , [SysObject_id]
 , [SysObject_schema_name]
 , [SysObject_name]
 , [SysObject_type]
 , [SysObject_modify_date]
 , [SysObject_parent_object_id]
 , [RepoObject_schema_name]
 , [RepoObject_name]
 , [RepoObject_type]
 )
SELECT [SysObject_RepoObject_guid] AS [RepoObject_guid]
 , [SysObject_id]
 , [SysObject_schema_name]
 , [SysObject_name]
 , [SysObject_type]
 , [modify_date] AS [SysObject_modify_date]
 , [parent_object_id] AS [SysObject_parent_object_id]
 , [SysObject_schema_name] AS [RepoObject_schema_name]
 , [SysObject_RepoObject_guid] AS [RepoObject_name] --guid is used as name!
 , [SysObject_type] AS [RepoObject_type]
FROM repo.SysObject_RepoObject_via_guid
WHERE NOT [SysObject_RepoObject_guid] IS NULL
 AND [RepoObject_guid] IS NULL

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = '[SysObject_RepoObject_guid] -> [RepoObject_guid]; some name, type, …'
SET @source_object = '[repo_sys].[SysObject]'
SET @target_object = '[repo].[RepoObject]'

EXEC repo.usp_ExecutionLog_insert 
 @execution_instance_guid = @execution_instance_guid
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
-- Logging END --

/*{"ReportUspStep":[{"Number":510,"Name":"INSERT still missing Object","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo_sys].[SysObject]","log_target_object":"[repo].[RepoObject]","log_flag_InsertUpdateDelete":"i"}]}*/
/*
ensure all objects existing in database (as SysObject) are also included into [repo].[RepoObject]
	
- this should be SysObject without RepoObject_guid in extended properties
- when inserting they get a RepoObject_guid
- we should use this new RepoObject_guid as [RepoObject_name], but we don't know it, when we insert. That's why we use anything else unique: NEWID()
*/
INSERT INTO repo.RepoObject (
 [SysObject_id]
 , [RepoObject_schema_name]
 --, [RepoObject_name]
 , [RepoObject_type]
 , [SysObject_schema_name]
 , [SysObject_name]
 , [SysObject_type]
 , [SysObject_modify_date]
 , [SysObject_parent_object_id]
 )
SELECT [SysObject_id]
 , [SysObject_schema_name]
 --, NEWID() AS          [RepoObject_name]
 , [SysObject_type] AS [RepoObject_type]
 , [SysObject_schema_name]
 , [SysObject_name]
 , [SysObject_type]
 , [modify_date] AS [SysObject_modify_date]
 , [parent_object_id] AS [SysObject_parent_object_id]
FROM repo.SysObject_RepoObject_via_name
WHERE [RepoObject_guid] IS NULL;

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'INSERT still missing Object'
SET @source_object = '[repo_sys].[SysObject]'
SET @target_object = '[repo].[RepoObject]'

EXEC repo.usp_ExecutionLog_insert 
 @execution_instance_guid = @execution_instance_guid
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
-- Logging END --

/*{"ReportUspStep":[{"Number":610,"Name":"SET [SysObject_name] = [repo].[RepoObject].[RepoObject_guid]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject]","log_target_object":"[repo].[RepoObject]","log_flag_InsertUpdateDelete":"u"}]}*/
/*
now we try to set [RepoObject_name] = [SysObject_name] where this is possible whithout conflicts
remaining [RepoObject_name] still have some guid and this needs to solved separately
*/
UPDATE repo.RepoObject
SET [RepoObject_schema_name] = [SysObject_schema_name]
 , [RepoObject_name] = [SysObject_name]
WHERE
 --don't touch entries, which are managed by repo
 ISNULL([is_repo_managed], 0) = 0
 AND [has_different_sys_names] = 1
 --exclude surrogate [SysObject_name]
 AND [is_SysObject_name_uniqueidentifier] = 0
 --avoid not unique entries
 --do not update, if the target entry ([RepoObject_schema_name], [RepoObject_name]) exists
 --The UK would prevent that
 AND NOT EXISTS (
  SELECT [RepoObject_schema_name]
   , [RepoObject_name]
  FROM [repo].[RepoObject] AS [ro2]
  WHERE [repo].[RepoObject].[SysObject_schema_name] = [ro2].[RepoObject_schema_name]
   AND [repo].[RepoObject].[SysObject_name] = [ro2].[RepoObject_name]
  )

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'SET [SysObject_name] = [repo].[RepoObject].[RepoObject_guid]'
SET @source_object = '[repo].[RepoObject]'
SET @target_object = '[repo].[RepoObject]'

EXEC repo.usp_ExecutionLog_insert 
 @execution_instance_guid = @execution_instance_guid
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
 , @updated = @rows
-- Logging END --

/*{"ReportUspStep":[{"Number":1010,"Name":"write RepoObject_guid into extended properties of SysObject","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject]","log_target_object":"[repo_sys].[SysObject]"}]}*/
DECLARE property_cursor CURSOR READ_ONLY
FOR
--
--level 1 objects which are in level1type
SELECT [T1].[RepoObject_guid]
 , [T1].[SysObject_schema_name]
 , [T2].[level1type]
 , [level1Name] = [T1].[SysObject_name]
 , [Level2Type] = NULL
 , [level2Name] = NULL
 , [T1].[SysObject_type]
FROM repo.SysObject_RepoObject_via_name AS T1
INNER JOIN repo.[type_level1type_level2type] AS T2
 ON T1.SysObject_type = T2.type
WHERE NOT [T1].[RepoObject_guid] IS NULL
 AND [T1].[SysObject_RepoObject_guid] IS NULL
 --level1Type objects
 AND NOT [T2].[level1type] IS NULL
 --the next is redundant, these kind of Objects should not exist in the database
 AND [T1].[is_SysObject_name_uniqueidentifier] = 0

UNION ALL

SELECT [T1].[RepoObject_guid]
 , [T1].[SysObject_schema_name]
 , [level1type] = [T4].[level1type]
 , [level1Name] = [parent].[SysObject_name]
 , [Level2Type] = [T2].[level2type]
 , [level2Name] = [T1].[SysObject_name]
 , [T1].[SysObject_type]
--, [parent].[SysObject_id]
--, [parent].[SysObject_schema_name]
--, [parent].[SysObject_name]
--, [parent].[SysObject_type]
FROM repo.SysObject_RepoObject_via_name AS T1
INNER JOIN repo.[type_level1type_level2type] AS T2
 ON T1.SysObject_type = T2.type
INNER JOIN repo.SysObject_RepoObject_via_name AS parent
 ON T1.parent_object_id = parent.SysObject_id
INNER JOIN repo.[type_level1type_level2type] AS T4
 ON parent.SysObject_type = T4.type
WHERE NOT [T1].[RepoObject_guid] IS NULL
 AND [T1].[SysObject_RepoObject_guid] IS NULL
 --level2Type objects
 AND NOT [T2].[level2type] IS NULL
 --level1 object
 --the next is redundant, these kind of Objects should not exist in the database
 AND [T1].[is_SysObject_name_uniqueidentifier] = 0

DECLARE @RepoObject_guid UNIQUEIDENTIFIER
 , @schema_name NVARCHAR(128)
 , @level1type VARCHAR(128)
 , @level1name NVARCHAR(128)
 , @level2type VARCHAR(128)
 , @level2name NVARCHAR(128)
 , @type CHAR(2);

SET @rows = 0;

OPEN property_cursor;

FETCH NEXT
FROM property_cursor
INTO @RepoObject_guid
 , @schema_name
 , @level1type
 , @level1name
 , @level2type
 , @level2name
 , @type

WHILE @@fetch_status <> - 1
BEGIN
 IF @@fetch_status <> - 2
 BEGIN
  EXEC repo_sys.[usp_AddOrUpdateExtendedProperty] @name = N'RepoObject_guid'
   , @value = @RepoObject_guid
   , @level0type = N'Schema'
   , @level0name = @schema_name
   , @level1type = @level1type
   , @level1name = @level1name
   , @level2type = @level2type
   , @level2name = @level2name

  SET @rows = @rows + 1;
 END;

 FETCH NEXT
 FROM property_cursor
 INTO @RepoObject_guid
  , @schema_name
  , @level1type
  , @level1name
  , @level2type
  , @level2name
  , @type
END

CLOSE property_cursor;

DEALLOCATE property_cursor

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'write RepoObject_guid into extended properties of SysObject'
SET @source_object = '[repo].[RepoObject]'
SET @target_object = '[repo_sys].[SysObject]'

EXEC repo.usp_ExecutionLog_insert 
 @execution_instance_guid = @execution_instance_guid
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

-- Logging END --

/*{"ReportUspStep":[{"Number":2010,"Name":"SET is_SysObject_missing = 1","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject]","log_target_object":"[repo].[RepoObject]","log_flag_InsertUpdateDelete":"u"}]}*/
/*
objects deleted or renamed in database but still referenced in [repo].[RepoObject] will be marked in RepoObject with is_SysObject_missing = 1
check is reuqired by `schema_name` and `name` but not by SysObject_ID, because SysObject_ID can change when objects are recreated
*/
UPDATE repo.RepoObject
SET [is_SysObject_missing] = 1
FROM [repo].[RepoObject] [T1]
WHERE NOT EXISTS (
  SELECT [SysObject_id]
  FROM [repo_sys].[SysObject] AS [Filter]
  WHERE [t1].[SysObject_schema_name] = [Filter].[SysObject_schema_name]
   AND [T1].[SysObject_name] = [Filter].[SysObject_name]
  )

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'SET is_SysObject_missing = 1'
SET @source_object = '[repo].[RepoObject]'
SET @target_object = '[repo].[RepoObject]'

EXEC repo.usp_ExecutionLog_insert 
 @execution_instance_guid = @execution_instance_guid
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
 , @updated = @rows
-- Logging END --

/*{"ReportUspStep":[{"Number":2110,"Name":"DELETE; marked missing SysObject, but not is_repo_managed  = 1","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject]","log_target_object":"[repo].[RepoObject]","log_flag_InsertUpdateDelete":"d"}]}*/
/*
delete objects, missing in SysObjects, if they are not is_repo_managed
if they are is_repo_managed we don't want to delete them but there should be some handling
*/
DELETE repo.RepoObject
WHERE ISNULL([is_repo_managed], 0) = 0
 AND [is_SysObject_missing] = 1

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'DELETE; marked missing SysObject, but not is_repo_managed  = 1'
SET @source_object = '[repo].[RepoObject]'
SET @target_object = '[repo].[RepoObject]'

EXEC repo.usp_ExecutionLog_insert 
 @execution_instance_guid = @execution_instance_guid
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
 , @deleted = @rows
-- Logging END --

/*{"ReportUspStep":[{"Number":2210,"Name":"UPDATE other properties, where not is_repo_managed  = 1","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo_sys].[SysObject]","log_target_object":"[repo].[RepoObject]","log_flag_InsertUpdateDelete":"u"}]}*/
--update other properties for RepoObject which are not is_repo_managed
--we do this after updating guid in SysObjects to ensure the guid can be used to get [history_table_guid]
UPDATE ro
SET [Repo_history_table_guid] = [history_table_guid]
 , [Repo_temporal_type] = [temporal_type]
FROM [repo].[SysObject_RepoObject_via_guid] [ro]
WHERE
 --not is_repo_managed 
 ISNULL([ro].[is_repo_managed], 0) = 0
 AND (
  --
  1 = 0
  --
  OR [Repo_history_table_guid] <> [history_table_guid]
  OR (
   [Repo_history_table_guid] IS NULL
   AND NOT [history_table_guid] IS NULL
   )
  OR (
   [history_table_guid] IS NULL
   AND NOT [Repo_history_table_guid] IS NULL
   )
  OR [Repo_temporal_type] <> [temporal_type]
  OR (
   [Repo_temporal_type] IS NULL
   AND NOT [temporal_type] IS NULL
   )
  OR (
   [temporal_type] IS NULL
   AND NOT [Repo_temporal_type] IS NULL
   )
  --
  )

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'UPDATE other properties, where not is_repo_managed  = 1'
SET @source_object = '[repo_sys].[SysObject]'
SET @target_object = '[repo].[RepoObject]'

EXEC repo.usp_ExecutionLog_insert 
 @execution_instance_guid = @execution_instance_guid
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
 , @updated = @rows
-- Logging END --

/*{"ReportUspStep":[{"Number":3010,"Name":"INSERT missing","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObjectProperty_sys_repo]","log_target_object":"[repo].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"i"}]}*/
INSERT INTO repo.RepoObjectProperty (
 [RepoObject_guid]
 , [property_name]
 , [property_value]
 )
SELECT DISTINCT [RepoObject_guid]
 , [property_name]
 , [property_value]
FROM repo.RepoObjectProperty_sys_repo AS T1
WHERE [RepoObjectProperty_id] IS NULL

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'INSERT missing'
SET @source_object = '[repo].[RepoObjectProperty_sys_repo]'
SET @target_object = '[repo].[RepoObjectProperty]'

EXEC repo.usp_ExecutionLog_insert 
 @execution_instance_guid = @execution_instance_guid
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
-- Logging END --

/*{"ReportUspStep":[{"Number":3110,"Name":"SET [RepoObjectProperty_property_value] = [property_value]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObjectProperty_sys_repo]","log_target_object":"[repo].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
--update link table [repo].[RepoObjectProperty] via view
UPDATE repo.RepoObjectProperty_sys_repo
SET [RepoObjectProperty_property_value] = [property_value]
WHERE NOT [RepoObjectProperty_id] IS NULL
 AND [RepoObjectProperty_property_value] <> [property_value]

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'SET [RepoObjectProperty_property_value] = [property_value]'
SET @source_object = '[repo].[RepoObjectProperty_sys_repo]'
SET @target_object = '[repo].[RepoObjectProperty]'

EXEC repo.usp_ExecutionLog_insert 
 @execution_instance_guid = @execution_instance_guid
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
 , @updated = @rows
-- Logging END --

/*{"ReportUspStep":[{"Number":4010,"Name":"SET [Repo_temporal_type]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject_persistence]","log_target_object":"[repo].[RepoObject]","log_flag_InsertUpdateDelete":"u"}]}*/
--set temporal_type
--0 = NON_TEMPORAL_TABLE
--1 = HISTORY_TABLE
--2 = SYSTEM_VERSIONED_TEMPORAL_TABLE
UPDATE ro
SET [Repo_temporal_type] = rop.temporal_type
FROM [repo].[RepoObject] ro
INNER JOIN [repo].[RepoObject_persistence] rop
 ON rop.[target_RepoObject_guid] = ro.[RepoObject_guid]
WHERE ro.[Repo_temporal_type] <> rop.temporal_type
 OR ro.[Repo_temporal_type] IS NULL

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'SET [Repo_temporal_type]'
SET @source_object = '[repo].[RepoObject_persistence]'
SET @target_object = '[repo].[RepoObject]'

EXEC repo.usp_ExecutionLog_insert 
 @execution_instance_guid = @execution_instance_guid
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
 , @updated = @rows
-- Logging END --

/*{"ReportUspStep":[{"Number":5010,"Name":"DELETE not existing","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject]","log_target_object":"[graph].[RepoObject]","log_flag_InsertUpdateDelete":"d"}]}*/
DELETE t
FROM [graph].[RepoObject] [t]
WHERE NOT EXISTS (
  SELECT 1
  FROM [repo].[RepoObject] AS [ro]
  WHERE [ro].[RepoObject_guid] = [t].[RepoObject_guid]
  )

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'DELETE not existing'
SET @source_object = '[repo].[RepoObject]'
SET @target_object = '[graph].[RepoObject]'

EXEC repo.usp_ExecutionLog_insert 
 @execution_instance_guid = @execution_instance_guid
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
 , @deleted = @rows
-- Logging END --

/*{"ReportUspStep":[{"Number":5110,"Name":"INSERT missing","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject]","log_target_object":"[graph].[RepoObject]","log_flag_InsertUpdateDelete":"i"}]}*/
INSERT INTO [graph].[RepoObject] ([RepoObject_guid])
SELECT [RepoObject_guid]
FROM [repo].[RepoObject] AS [ro]
WHERE NOT EXISTS (
  SELECT 1
  FROM [graph].[RepoObject] AS [t]
  WHERE [ro].[RepoObject_guid] = [t].[RepoObject_guid]
  )

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'INSERT missing'
SET @source_object = '[repo].[RepoObject]'
SET @target_object = '[graph].[RepoObject]'

EXEC repo.usp_ExecutionLog_insert 
 @execution_instance_guid = @execution_instance_guid
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
-- Logging END --


--
--finish your own code here
--keep the code between "END" and the end of the procedure unchanged!
--
--END
--
--SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'end'
SET @source_object = NULL
SET @target_object = NULL

EXEC repo.usp_ExecutionLog_insert
   @execution_instance_guid = @execution_instance_guid
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

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b090291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_sync_guid_RepoObject';

