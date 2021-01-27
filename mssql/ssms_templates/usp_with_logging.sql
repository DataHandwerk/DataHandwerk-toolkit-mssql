CREATE PROCEDURE [dbo].[usp_procedure_1]
 ----add your own parameters here; remember to add a "," between your own paramters and the logging parameters
 --@parameter1 int = NULL
 ----keep the code between logging parameters and "START" unchanged!
 ---- parameters, used for logging; you den't need to care about then, but you can use them, wenn calling from SSIS or in your workflow to log the context of the procedure call
 @execution_instance_guid UNIQUEIDENTIFIER = NULL --SSIS system variable ExecutionInstanceGUID could be used, any other unique guid is also fine. If NULL, then NEWID() is used to create one
 , @ssis_execution_id BIGINT = NULL --only SSIS system variable ServerExecutionID should be used, or any other consistent number system, do not mix different number systems
 , @sub_execution_id INT = NULL --in case you log some sub_executions, for example in SSIS loops or sub packages
 , @parent_execution_log_id BIGINT = NULL --in the current procedure @current_execution_log_id get the log_id of the start-log, it should be used when calling sub procedures to allow call stack analyzing
AS
DECLARE
 --
 @current_execution_log_id BIGINT --this variable will be filled with the first logging call for the step 'start'
 , @current_execution_guid UNIQUEIDENTIFIER = NEWID()
 , @source_object NVARCHAR(261) = NULL --use it like '[schema].[object]', this allows data flow vizualizatiuon
 , @target_object NVARCHAR(261) = NULL --use it like '[schema].[object]', this allows data flow vizualizatiuon
 , @proc_id INT = @@procid
 , @proc_schema_name NVARCHAR(128) = OBJECT_SCHEMA_NAME(@@procid)
 , @proc_name NVARCHAR(128) = OBJECT_NAME(@@procid)
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
 , @source_object = @source_object --logging source and target allows some visualizaton
 , @target_object = @target_object
 --use only one of (@inserted, @updated, @deleted) in each step, for example: '@inserted = @rows' and keep both others NULL
 , @inserted = NULL
 , @updated = NULL
 , @deleted = NULL
 --add any additional information you want to log, you don't need to care about the data type, it is sql_variant
 , @info_01 = NULL
 , @info_02 = NULL
 , @info_03 = NULL
 , @info_04 = NULL
 , @info_05 = NULL
 , @info_06 = NULL
 , @info_07 = NULL
 , @info_08 = NULL
 , @info_09 = NULL
 --only the "start" step should return the log id into @current_execution_log_id
 --all other calls should not overwrite @current_execution_log_id
 , @execution_log_id = @current_execution_log_id OUTPUT

----you can log the content of your own parameters, do this only in the start-step
----data type is sql_variant
--, @parameter_01 = @source_RepoObject_guid
--, @parameter_02 = @persistence_RepoObject_guid
--, @parameter_03 = @persistence_table_name
--, @parameter_04 = @is_persistence_check_for_empty_source
--, @parameter_05 = @is_persistence_truncate
--, @parameter_06 = @is_persistence_delete_missing
--, @parameter_07 = @is_persistence_delete_changed
--, @parameter_08 = @is_persistence_update_changed
--, @parameter_09 = @is_persistence_insert
--, @parameter_10 = @has_history_columns
--, @parameter_11 = @has_history
--, @parameter_12 = @history_schema_name
--, @parameter_13 = @history_table_name
--
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own individual code
--
--
--example call sub procedure:
EXEC dbo.usp_sub_procedure_2
 --add your own parameters
 --logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id

----example logging for a step:
----have a look: only "@inserted = @rows" are assigned, but "@updated = NULL" and "@deleted = NULL"
SELECT TOP 10 ID
FROM [repo].[ExecutionLog]

SET @rows = @@ROWCOUNT --use @rows to log inserted, updated, deleted rows
SET @step_id = @step_id + 1 --automatic incremented for each step
SET @step_name = 'list log entries'
SET @source_object = '[repo].[ExecutionLog]'
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
 , @inserted = @rows
 , @updated = NULL
 , @deleted = NULL
 --add any additional information you want to log, you don't need to care about the data type, it is sql_variant
 , @info_01 = NULL
 , @info_02 = NULL
 , @info_03 = NULL
 , @info_04 = NULL
 , @info_05 = NULL
 , @info_06 = NULL
 , @info_07 = NULL
 , @info_08 = NULL
 , @info_09 = NULL

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


