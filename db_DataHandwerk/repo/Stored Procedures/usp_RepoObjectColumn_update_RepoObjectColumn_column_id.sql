
/*
exec repo.usp_RepoObjectColumn__update_RepoObjectColumn_column_id

exec repo.usp_RepoObjectColumn__update_RepoObjectColumn_column_id
@RepoObject_guid = '7E756329-D857-EB11-84D8-A81E8446D5B0'

*/
--if @RepoObject_guid = NULL then all RepoObject will be updated
--@OrderBy is defined by a parameter: 'RepoObjectColumn_column_id_OrderBy'
CREATE PROCEDURE [repo].[usp_RepoObjectColumn_update_RepoObjectColumn_column_id]
 --
 @RepoObject_guid UNIQUEIDENTIFIER = NULL
 ,
 -- some optional parameters, used for logging
 @execution_instance_guid UNIQUEIDENTIFIER = NULL --SSIS system variable ExecutionInstanceGUID could be used, but other any other guid
 , @ssis_execution_id BIGINT = NULL --only SSIS system variable ServerExecutionID should be used, or any other consistent number system, do not mix
 , @sub_execution_id INT = NULL
 , @parent_execution_log_id BIGINT = NULL
 --, @debug                   BIT              = 0
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

EXEC [logs].usp_ExecutionLog_insert @execution_instance_guid = @execution_instance_guid
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
DECLARE @OrderBy NVARCHAR(1000)
DECLARE @sqlCommand NVARCHAR(4000)

--set @RepoObject_guid = '7E756329-D857-EB11-84D8-A81E8446D5B0'
SET @OrderBy = CAST((
   SELECT [repo].[fs_get_parameter_value]('RepoObjectColumn_column_id_OrderBy', DEFAULT)
   ) AS NVARCHAR(1000))
--'
--[roc].[Repo_is_identity]
--, [roc].[Repo_is_computed]
--, ISNULL([ic].[index_column_id] , 99999) --ensure PK index is sorted before other columns
--, [roc].[Repo_generated_always_type]
--, [roc].[RepoObjectColumn_name]
--'
--	SET @sqlCommand = '
--SELECT
--     [roc].[RepoObjectColumn_guid]
--     ,  [RepoObjectColumn_column_id_setpoint] = ROW_NUMBER() OVER(PARTITION BY [roc].[RepoObject_guid]
--       ORDER BY
--       --
--' + @OrderBy + '
--       --
--       )
--     , [roc].[RepoObjectColumn_column_id]
--     , [roc].[RepoObject_guid]
--     , [roc].[Repo_is_identity]
--     , [roc].[Repo_is_computed]
--     , [ic].[index_column_id]
--     , [ic].[is_index_primary_key]
--     , [roc].[Repo_generated_always_type]
--     , [roc].[SysObjectColumn_column_id]
--     , [roc].[RepoObjectColumn_name]
--FROM
--     [repo].[RepoObjectColumn] AS roc
--     LEFT JOIN
--     [repo].[IndexColumn_union] AS ic
--     ON ic.RepoObjectColumn_guid = roc.RepoObjectColumn_guid
--        AND ic.[is_index_primary_key] = 1
--WHERE
----not [is_query_plan_expression]
--[is_query_plan_expression] IS NULL
----we need the datatype
--AND NOT [Repo_user_type_fullname] IS NULL
--'
--	IF NOT @RepoObject_guid IS NULL
--		SET @sqlCommand = @sqlCommand + '
--AND [roc].[RepoObject_guid] = @RepoObject_guid
--'
SET @sqlCommand = CONCAT (
  '
UPDATE roc
SET [RepoObjectColumn_column_id] = rocg.[RepoObjectColumn_column_id_setpoint]
FROM repo.RepoObjectColumn roc
LEFT JOIN (
 SELECT [roc].[RepoObjectColumn_guid]
  , [RepoObjectColumn_column_id_setpoint] = ROW_NUMBER() OVER (
   PARTITION BY [roc].[RepoObject_guid] ORDER BY
       --
'
  , @OrderBy
  , '
       --
   )
  , [roc].[RepoObjectColumn_column_id]
  , [roc].[RepoObject_guid]
  , [roc].[Repo_is_identity]
  , [roc].[Repo_is_computed]
  , [ic].[index_column_id]
  , [ic].[is_index_primary_key]
  , [roc].[Repo_generated_always_type]
  , [roc].[SysObjectColumn_column_id]
  , [roc].[RepoObjectColumn_name]
 FROM [repo].[RepoObjectColumn] AS roc
 LEFT JOIN [repo].[IndexColumn_union] AS ic
  ON ic.RepoObjectColumn_guid = roc.RepoObjectColumn_guid
   AND ic.[is_index_primary_key] = 1
 WHERE
  --not [is_query_plan_expression]
  [is_query_plan_expression] IS NULL
  --we need the datatype
  AND NOT [roc].[Repo_user_type_fullname] IS NULL
'
  , CASE 
   WHEN NOT @RepoObject_guid IS NULL
    THEN ' AND [roc].[RepoObject_guid] = @RepoObject_guid
'
   END
  , ' ) rocg
 ON rocg.[RepoObjectColumn_guid] = roc.RepoObjectColumn_guid
WHERE rocg.[RepoObjectColumn_column_id_setpoint] <> ISNULL(roc.RepoObjectColumn_column_id, 0)
'
  )

PRINT @sqlCommand

--EXECUTE sp_executesql @sqlCommand
EXECUTE sp_executesql @sqlCommand
 , N'@RepoObject_guid uniqueidentifier'
 , @RepoObject_guid = @RepoObject_guid

--
--END
--
--SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1;
SET @step_name = 'end'
SET @source_object = NULL
SET @target_object = NULL

EXEC [logs].usp_ExecutionLog_insert @execution_instance_guid = @execution_instance_guid
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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9b90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_RepoObjectColumn_update_RepoObjectColumn_column_id';


GO


