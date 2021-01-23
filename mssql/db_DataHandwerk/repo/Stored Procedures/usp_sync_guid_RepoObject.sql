
-- Create Procedure usp_sync_guid_RepoObject
CREATE PROCEDURE [repo].[usp_sync_guid_RepoObject]
-- some optional parameters, used for logging
     @execution_instance_guid UNIQUEIDENTIFIER = NULL --SSIS system variable ExecutionInstanceGUID could be used, but other any other guid
   , @ssis_execution_id       BIGINT           = NULL --only SSIS system variable ServerExecutionID should be used, or any other consistent number system, do not mix
   , @sub_execution_id        INT              = NULL
   , @parent_execution_log_id BIGINT           = NULL
AS
DECLARE
     @current_execution_log_id BIGINT
   , @current_execution_guid   UNIQUEIDENTIFIER = NEWID()
   , @source_object            NVARCHAR(261)    = NULL
   , @target_object            NVARCHAR(261)    = NULL
   , @proc_id                  INT              = @@procid
   , @proc_schema_name         NVARCHAR(128)    = OBJECT_SCHEMA_NAME(@@procid)
   , @proc_name                NVARCHAR(128)    = OBJECT_NAME(@@PROCID)
   , @event_info               NVARCHAR(MAX)
   , @step_id                  INT              = 0
   , @step_name                NVARCHAR(1000)   = NULL
   , @rows                     INT

SET @event_info =
(
    SELECT
           [event_info]
    FROM
         sys.dm_exec_input_buffer(@@spid , CURRENT_REQUEST_ID())
)

IF @execution_instance_guid IS NULL
    SET @execution_instance_guid = NEWID();

--SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1
SET @step_name = 'start'
--SET @source_object = NULL
--SET @target_object = NULL
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
   , @execution_log_id = @current_execution_log_id OUTPUT;
--
----START
--
/*

use objects with [RepoObject_guid] stored in extended properties

- SysObject could be renamed after previous sync
  - => update SysObject properties in RepoObject
  - don't change RepoObject names
*/

UPDATE repo.SysObject_RepoObject_via_guid
  SET
      [RepoObject_SysObject_id] = [SysObject_id]
    , [RepoObject_SysObject_schema_name] = [SysObject_schema_name]
    , [RepoObject_SysObject_name] = [SysObject_name]
    , [RepoObject_SysObject_type] = [SysObject_type]
    , [RepoObject_SysObject_modify_date] = [modify_date]
      --, [RepoObject_parent_SysObject_id] = [SysObject_parent_SysObject_id]
      --, [RepoObject_SysObject_temporal_type] = [SysObject_temporal_type]
      --, [RepoObject_SysObject_history_table_id] = [SysObject_history_table_id]
      --, [RepoObject_SysObject_max_column_id_used] = [SysObject_max_column_id_used]
    , [RepoObject_is_SysObject_missing] = NULL
WHERE
      NOT [RepoObject_guid] IS NULL
      AND ([RepoObject_SysObject_id] <> [SysObject_id]
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
      );

SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1;
SET @step_name = 'SET several RepoObject_SysObject_...'
SET @source_object = NULL
SET @target_object = '[repo].[SysObject_RepoObject_via_guid]'

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

/*
in case of possible conflict when inserting missing guid because auf [UK_RepoObject__SysNames] conflicting entries get 
[SysObject_name] = [repo].[RepoObject].[RepoObject_guid]
this will allow INSERT in the next step without issues
*/

UPDATE repo.RepoObject
  SET
      [SysObject_name] = [repo].[RepoObject].[RepoObject_guid]
FROM   [repo].[RepoObject]
       INNER JOIN
(
    SELECT
           [SysObject_id]
         , [SysObject_RepoObject_guid]
         , [SysObject_schema_name]
         , [SysObject_name]
    FROM
         [repo].[SysObject_RepoObject_via_guid]
    WHERE
    --SysObject, which exists in database and have a RepoObject_guid assigned in extended properties 
    NOT [SysObject_RepoObject_guid] IS NULL
    --but the have not yet a RepoObject_guid assigned in [repo].[RepoObject] 
    AND [RepoObject_guid] IS NULL
) AS [missing_guid]
       ON [repo].[RepoObject].[SysObject_schema_name] = [missing_guid].[SysObject_schema_name]
          AND [repo].[RepoObject].[SysObject_name] = [missing_guid].[SysObject_name]

SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1;
SET @step_name = 'SET [SysObject_name] = [repo].[RepoObject].[RepoObject_guid]'
SET @source_object = '[repo].[SysObject_RepoObject_via_guid]'
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

/*

if a [RepoObject_guid] is stored in extended properties but missing in RepoObject, it should be restored
use objects with [RepoObject_guid] stored in extended properties

- restore / insert RepoObject_guid from [SysObject_RepoObject_guid]
- SysObject names are restored as SysObject names
- a conflict could happen when some RepoObject have been renamed and when they now conflict with existing RepoObject names  
  [UK_RepoObject_Names]
  => thats way we use [RepoObject_guid] as [RepoObject_name] to avoid conflicts we will later rename [RepoObject_name] to [SysObject_name] where this is possible

*/

INSERT INTO repo.RepoObject
(
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
SELECT
       [SysObject_RepoObject_guid] AS [RepoObject_guid]
     , [SysObject_id]
     , [SysObject_schema_name]
     , [SysObject_name]
     , [SysObject_type]
     , [modify_date] AS               [SysObject_modify_date]
     , [parent_object_id] AS          [SysObject_parent_object_id]
     , [SysObject_schema_name] AS     [RepoObject_schema_name]
     , [SysObject_RepoObject_guid] AS [RepoObject_name] --guid is used as name!
     , [SysObject_type] AS            [RepoObject_type]
FROM
     repo.SysObject_RepoObject_via_guid
WHERE  NOT [SysObject_RepoObject_guid] IS NULL
       AND [RepoObject_guid] IS NULL

SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1;
SET @step_name = '[SysObject_RepoObject_guid] -> [RepoObject_guid]; some name, type, ...'
SET @source_object = '[repo].[SysObject_RepoObject_via_guid]'
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

/*

ensure all objects existing in database (as SysObject) are also included into [repo].[RepoObject]

- this should be SysObject without RepoObject_guid in extended properties
- when inserting they get a RepoObject_guid
- we should use this new RepoObject_guid as [RepoObject_name], but we don't know it, when we insert. That's why we use anything else unique: NEWID()

*/

INSERT INTO repo.RepoObject
(
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
SELECT
       [SysObject_id]
     , [SysObject_schema_name]
       --, NEWID() AS          [RepoObject_name]
     , [SysObject_type] AS   [RepoObject_type]
     , [SysObject_schema_name]
     , [SysObject_name]
     , [SysObject_type]
     , [modify_date] AS      [SysObject_modify_date]
     , [parent_object_id] AS [SysObject_parent_object_id]
FROM
     repo.SysObject_RepoObject_via_name
WHERE  [RepoObject_guid] IS NULL;

SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1;
SET @step_name = 'INSERT still missing Object'
SET @source_object = '[repo].[SysObject_RepoObject_via_name]'
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

/*

now we try to set [RepoObject_name] = [SysObject_name] where this is possible whithout conflicts
remaining [RepoObject_name] still have some guid and this needs to solved separately

*/

UPDATE   repo.RepoObject
  SET
      [RepoObject_schema_name] = [SysObject_schema_name]
    , [RepoObject_name] = [SysObject_name]
WHERE
--don't touch entries, which are managed by repo
      ISNULL([is_repo_managed] , 0) = 0
      AND [has_different_sys_names] = 1
      --exclude surrogate [SysObject_name]
      AND [is_SysObject_name_uniqueidentifier] = 0
      --avoid not unique entries
      --do not update, if the target entry ([RepoObject_schema_name], [RepoObject_name]) exists
      --The UK would prevent that
      AND NOT EXISTS
(
    SELECT
           [RepoObject_schema_name]
         , [RepoObject_name]
    FROM
         [repo].[RepoObject] AS [ro2]
    WHERE  [repo].[RepoObject].[SysObject_schema_name] = [ro2].[RepoObject_schema_name]
           AND [repo].[RepoObject].[SysObject_name] = [ro2].[RepoObject_name]
)

SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1;
SET @step_name = 'SET [RepoObject_schema_name] = [SysObject_schema_name], [RepoObject_name] = [SysObject_name]'
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

/*

write RepoObject_guid into extended properties of SysObject

*/

DECLARE property_cursor CURSOR READ_ONLY
FOR
    --
    --level 1 objects which are in level1type
    SELECT
           [T1].[RepoObject_guid]
         , [T1].[SysObject_schema_name]
         , [T2].[level1type]
         , [level1Name] = [T1].[SysObject_name]
         , [Level2Type] = NULL
         , [level2Name] = NULL
         , [T1].[SysObject_type]
    FROM
         repo.SysObject_RepoObject_via_name AS T1
         INNER JOIN
         repo.[type_level1type_level2type] AS T2
         ON T1.SysObject_type = T2.type
    WHERE   NOT [T1].[RepoObject_guid] IS NULL
            AND [T1].[SysObject_RepoObject_guid] IS NULL
            --level1Type objects
            AND NOT [T2].[level1type] IS NULL
            --the next is redundant, these kind of Objects should not exist in the database
            AND [T1].[is_SysObject_name_uniqueidentifier] = 0
    UNION ALL
    SELECT
           [T1].[RepoObject_guid]
         , [T1].[SysObject_schema_name]
         , [level1type] = [T4].[level1type]
         , [level1Name] = [parent].[SysObject_name]
         , [Level2Type] = [T2].[Level2Type]
         , [level2Name] = [T1].[SysObject_name]
         , [T1].[SysObject_type]
    --, [parent].[SysObject_id]
    --, [parent].[SysObject_schema_name]
    --, [parent].[SysObject_name]
    --, [parent].[SysObject_type]
    FROM
         repo.SysObject_RepoObject_via_name AS T1
         INNER JOIN
         repo.[type_level1type_level2type] AS T2
         ON T1.SysObject_type = T2.type
         INNER JOIN
         repo.SysObject_RepoObject_via_name AS parent
         ON T1.parent_object_id = parent.SysObject_id
         INNER JOIN
         repo.[type_level1type_level2type] AS T4
         ON parent.SysObject_type = T4.type
    WHERE  NOT [T1].[RepoObject_guid] IS NULL
           AND [T1].[SysObject_RepoObject_guid] IS NULL
           --level2Type objects
           AND NOT [T2].[level2type] IS NULL
           --level1 object
           --the next is redundant, these kind of Objects should not exist in the database
           AND [T1].[is_SysObject_name_uniqueidentifier] = 0

DECLARE
     @RepoObject_guid UNIQUEIDENTIFIER
   , @schema_name     NVARCHAR(128)
   , @level1type      VARCHAR(128)
   , @level1name      NVARCHAR(128)
   , @level2type      VARCHAR(128)
   , @level2name      NVARCHAR(128)
   , @type            CHAR(2);

SET @rows = 0;

OPEN property_cursor;

FETCH NEXT FROM property_cursor INTO
     @RepoObject_guid
   , @schema_name
   , @level1type
   , @level1name
   , @level2type
   , @level2name
   , @type
WHILE @@fetch_status <> -1
    BEGIN
        IF @@fetch_status <> -2
            BEGIN

                EXEC repo_sys.usp_AddOrUpdateExtendedproperty
                     @name = N'RepoObject_guid'
                   , @value = @RepoObject_guid
                   , @level0type = N'Schema'
                   , @level0name = @schema_name
                   , @level1type = @level1type
                   , @level1name = @level1name
                   , @level2type = @level2type
                   , @level2name = @level2name

                SET @rows = @rows + 1;

        END;
        FETCH NEXT FROM property_cursor INTO
             @RepoObject_guid
           , @schema_name
           , @level1type
           , @level1name
           , @level2type
           , @level2name
           , @type
    END

CLOSE property_cursor;
DEALLOCATE property_cursor;

--SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1;
SET @step_name = 'write RepoObject_guid into extended properties of SysObject, Level1'
SET @source_object = '[repo].[SysObject_RepoObject_via_name]'
SET @target_object = '[repo_sys].[usp_AddOrUpdateExtendedproperty]'

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

/*

objects deleted or renamed in database but still referenced in [repo].[RepoObject] will be marked in RepoObject with is_SysObject_missing = 1
check is reuqired by `schema_name` and `name` but not by SysObject_ID, because SysObject_ID can change when objects are recreated

*/

UPDATE repo.RepoObject
  SET
      [is_SysObject_missing] = 1
FROM   [repo].[RepoObject] [T1]
WHERE
      NOT EXISTS
(
    SELECT
           [SysObject_id]
    FROM
         [repo_sys].[SysObject] AS [Filter]
    WHERE  [t1].[SysObject_schema_name] = [Filter].[SysObject_schema_name]
           AND [T1].[SysObject_name] = [Filter].[SysObject_name]
);

SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1;
SET @step_name = 'SET is_SysObject_missing = 1'
SET @source_object = NULL
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

/*

delete objects, missing in SysObjects, if they are not is_repo_managed
if they are is_repo_managed we don't want to delete them but there should be some handling
*/

DELETE repo.RepoObject
WHERE
      ISNULL([is_repo_managed] , 0) = 0
      AND [is_SysObject_missing] = 1;

SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1;
SET @step_name = 'DELETE; marked missing SysObject, but not is_repo_managed  = 1'
SET @source_object = NULL
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
   , @inserted = NULL
   , @updated = NULL
   , @deleted = @rows
   , @info_01 = NULL
   , @info_02 = NULL
   , @info_03 = NULL
   , @info_04 = NULL
   , @info_05 = NULL
   , @info_06 = NULL
   , @info_07 = NULL
   , @info_08 = NULL
   , @info_09 = NULL

INSERT INTO repo.RepoObjectProperty
(
       [RepoObject_guid]
     , [property_name]
     , [property_value]
)
SELECT DISTINCT
       [RepoObject_guid]
     , [property_name]
     , [property_value]
FROM
     repo.RepoObjectProperty_sys_repo AS T1
WHERE  [RepoObjectProperty_id] IS NULL

SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1;
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

--update link table [repo].[RepoObjectProperty] via view
UPDATE repo.RepoObjectProperty_sys_repo
  SET
      [RepoObjectProperty_property_value] = [property_value]
WHERE
      NOT [RepoObjectProperty_id] IS NULL
      AND [RepoObjectProperty_property_value] <> [property_value]

SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1;
SET @step_name = 'SET [RepoObjectProperty_property_value] = [property_value]'
SET @source_object = '[repo].[RepoObjectProperty_sys_repo]'
SET @target_object = '[repo].[RepoObjectProperty_sys_repo]'

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

/*

todo
- Persistence aus [repo].[RepoObjectProperty] mit [repo].[RepoObject_persistence] synchronisieren
- allerdings mit den richtigen Einstellungen, also müssen auch diese erst mal irgendwo in ep abgelegt werden


Einträge in [repo].[RepoObjectProperty] synchronisieren, also letztendlich mit extend properties

aus [repo].[RepoObjectProperty] temporal table machen


some more handling is required for differences between RepoObject and SysObject:

Why this happens?
- SysObjects deleted but still in RepoObjects
- SysObjects renamed, but not linked to RepoObject_guid
- RepoObjects added but not yet in SysObjects
- RepoObjects renamed and linked to SysObjects

todo
concept for Objects, which can't have extended properties

*/
--
--END
--
--SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1;
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
GO


