/*
references on column level
target: repo.RepoObjectSource
source: sys.dm_exec_describe_first_result_set


sometimes required
truncate table [repo].[RepoObjectSource__dm_exec_describe_first_result_set]
*/
CREATE PROCEDURE [repo].[usp_RepoObjectSource_FirstResultSet]
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
----Make sure that the metadata is up to date
--EXEC repo.usp_sync_guid
--     @execution_instance_guid = @execution_instance_guid
--   , @ssis_execution_id = @ssis_execution_id
--   , @sub_execution_id = @sub_execution_id
--   , @parent_execution_log_id = @current_execution_log_id
--delete FROM repo.RepoObjectSource where query_sql was updated
DELETE
FROM repo.RepoObjectSource_FirstResultSet
FROM [repo].[RepoObjectSource_FirstResultSet]
LEFT OUTER JOIN [repo].[RepoObject] AS [ro]
 ON [repo].[RepoObjectSource_FirstResultSet].[RepoObject_guid] = [ro].[RepoObject_guid]
WHERE [repo].[RepoObjectSource_FirstResultSet].[created_dt] < [ro].[SysObject_modify_date]
 OR [ro].[SysObject_modify_date] IS NULL
 --wrong inserts from prev execution
 OR [target_column_name] IS NULL

SET @rows = @@rowcount;
SET @step_id = @step_id + 1
SET @step_name = 'DELETE modified after last created:dt'
SET @source_object = NULL
SET @target_object = '[repo].[RepoObjectSource_FirstResultSet]'

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

INSERT INTO repo.RepoObjectSource_FirstResultSet (
 [RepoObject_guid]
 , [column_ordinal]
 , [target_column_name]
 , [system_type_id]
 , [system_type_name]
 , [source_server_name]
 , [source_database_name]
 , [source_schema_name]
 , [source_table_name]
 , [source_column_name]
 , [is_hidden]
 , [created_dt]
 )
SELECT [ro_filtered].[RepoObject_guid]
 , [ref].[column_ordinal]
 , [ref].[name]
 , [ref].[system_type_id]
 , [ref].[system_type_name]
 , [ref].[source_server]
 , [ref].[source_database]
 , [ref].[source_schema]
 , [ref].[source_table]
 , [ref].[source_column]
 , [ref].[is_hidden]
 , GETDATE() AS [created_dt]
FROM (
 SELECT [ro].[RepoObject_guid]
  , [ro].[SysObject_query_sql]
 FROM repo.RepoObject_gross AS ro
 LEFT JOIN (
  SELECT [RepoObject_guid]
   , MIN([created_dt]) AS [created_dt_min]
  FROM repo.RepoObjectSource_FirstResultSet AS ros
  GROUP BY [RepoObject_guid]
  ) AS ros
  ON ro.RepoObject_guid = ros.RepoObject_guid
 WHERE NOT [ro].[SysObject_query_sql] IS NULL
  --only tables and views
  AND [ro].[SysObject_type] IN (
   'U'
   , 'V'
   )
  AND (
   [ros].[created_dt_min] IS NULL
   OR [ro].[SysObject_modify_date] IS NULL
   OR [ros].[created_dt_min] < [ro].[SysObject_modify_date]
   )
 ) AS ro_filtered
CROSS APPLY
 --schema sys should be OK here because SysObject_query_sql has a full qualified query including database_name 
 sys.dm_exec_describe_first_result_set(ro_filtered.SysObject_query_sql, NULL, 1) AS ref
WHERE
 --skip invalid entries
 NOT [ref].[name] IS NULL

SET @rows = @@rowcount;
SET @step_id = @step_id + 1
SET @step_name = 'CROSS APPLY sys.dm_exec_describe_first_result_set(ro_filtered.SysObject_query_sql , NULL , 1)'
SET @source_object = '[repo].[RepoObject]'
SET @target_object = '[repo].[RepoObjectSource_FirstResultSet]'

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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9390291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_RepoObjectSource_FirstResultSet';


GO


