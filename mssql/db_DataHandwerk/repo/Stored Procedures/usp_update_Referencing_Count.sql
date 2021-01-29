CREATE PROCEDURE [repo].[usp_update_Referencing_Count]
 -- some optional parameters, used for logging
 @execution_instance_guid UNIQUEIDENTIFIER = NULL --SSIS system variable ExecutionInstanceGUID could be used, but other any other guid
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

--SET @source_object = NULL
--SET @target_object = NULL
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
 , @execution_log_id = @current_execution_log_id OUTPUT;

--
----START
--
UPDATE repo.RepoObject
SET [RepoObject_Referencing_Count] = [rorc].[Referencing_Count]
FROM [repo].[RepoObject]
LEFT OUTER JOIN (
 SELECT [RepoObject_guid]
  , COUNT(*) AS [Referencing_Count]
 FROM [repo_sys].[RepoObjectReferencing] AS [ror]
 GROUP BY [RepoObject_guid]
 ) AS [rorc]
 ON [repo].[RepoObject].[RepoObject_guid] = [rorc].[RepoObject_guid]
WHERE ISNULL([repo].[RepoObject].[RepoObject_Referencing_Count], 0) <> ISNULL([rorc].[Referencing_Count], 0)

SET @rows = @@rowcount;
SET @step_id = @step_id + 1
SET @step_name = 'SET [RepoObject_Referencing_Count] = [rorc].[Referencing_Count]'
SET @source_object = '[repo_sys].[RepoObjectReferencing]'
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

UPDATE repo.RepoObjectColumn
SET [Referencing_Count] = [rorc].[Referencing_Count]
FROM [repo].[RepoObjectColumn]
LEFT OUTER JOIN [repo].[RepoObject] [ro]
 ON [repo].[RepoObjectColumn].[RepoObject_guid] = [ro].[RepoObject_guid]
LEFT OUTER JOIN (
 SELECT [referenced_schema_name]
  , [referenced_entity_name]
  , [referenced_minor_name]
  , COUNT(DISTINCT [RepoObject_guid]) AS [Referencing_Count]
 FROM [repo_sys].[RepoObjectReferenced] AS [ror]
 WHERE [referenced_database_name] = [repo].[fs_dwh_database_name]()
  OR [referenced_database_name] IS NULL
 GROUP BY [referenced_schema_name]
  , [referenced_entity_name]
  , [referenced_minor_name]
 ) AS [rorc]
 ON [repo].[RepoObjectColumn].[SysObjectColumn_name] = [rorc].[referenced_minor_name]
  AND [ro].[SysObject_name] = [rorc].[referenced_entity_name]
  AND [ro].[SysObject_schema_name] = [referenced_schema_name]
WHERE ISNULL([repo].[RepoObjectColumn].[Referencing_Count], 0) <> ISNULL([rorc].[Referencing_Count], 0)

SET @rows = @@rowcount;
SET @step_id = @step_id + 1
SET @step_name = 'SET [Referencing_Count] = [rorc].[Referencing_Count]'
SET @source_object = '[repo_sys].[RepoObjectReferenced]'
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

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9190291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_update_Referencing_Count';

