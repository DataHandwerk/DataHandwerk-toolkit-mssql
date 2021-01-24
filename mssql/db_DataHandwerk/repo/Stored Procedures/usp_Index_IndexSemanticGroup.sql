CREATE PROCEDURE [repo].[usp_Index_IndexSemanticGroup]
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
DELETE T2
FROM [repo].[Index_IndexSemanticGroup] [T2]
WHERE NOT EXISTS (
  SELECT [index_guid]
  FROM [repo].[Index_IndexPattern] AS [T1]
  WHERE [T2].[index_guid] = [T1].[index_guid]
  )

SET @rows = @@rowcount;
SET @step_id = @step_id + 1;
SET @step_name = 'DELETE'
SET @source_object = '[repo].[Index_IndexPattern]'
SET @target_object = '[repo].[Index_IndexSemanticGroup]'

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

INSERT INTO repo.Index_IndexSemanticGroup (
 [index_guid]
 , [IndexPatternColumnName]
 , [IndexPatternColumnDatatype]
 )
SELECT [index_guid]
 , [IndexPatternColumnName]
 , [IndexPatternColumnDatatype]
FROM repo.Index_IndexPattern AS T1
WHERE NOT EXISTS (
  SELECT [index_guid]
  FROM [repo].[Index_IndexSemanticGroup] AS [T2]
  WHERE [T2].[index_guid] = [T1].[index_guid]
  )

SET @rows = @@rowcount;
SET @step_id = @step_id + 1;
SET @step_name = 'INSERT'
SET @source_object = '[repo].[Index_IndexPattern]'
SET @target_object = '[repo].[Index_IndexSemanticGroup]'

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

UPDATE repo.Index_IndexSemanticGroup
SET [IndexPatternColumnName] = [T1].[IndexPatternColumnName]
 , [IndexPatternColumnDatatype] = [T1].[IndexPatternColumnDatatype]
FROM [repo].[Index_IndexSemanticGroup] [T2]
LEFT JOIN [repo].[Index_IndexPattern] AS [T1]
 ON [T2].[index_guid] = [T1].[index_guid]
WHERE [T1].[IndexPatternColumnName] <> ISNULL([T2].[IndexPatternColumnName], '')
 OR [T1].[IndexPatternColumnDatatype] <> ISNULL([T2].[IndexPatternColumnDatatype], '')

SET @rows = @@rowcount;
SET @step_id = @step_id + 1;
SET @step_name = 'UPDATE'
SET @source_object = '[repo].[Index_IndexPattern]'
SET @target_object = '[repo].[Index_IndexSemanticGroup]'

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
