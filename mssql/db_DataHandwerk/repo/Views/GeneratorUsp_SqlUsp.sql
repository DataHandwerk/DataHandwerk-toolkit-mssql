/*
[SqlUsp] contains the final code for the usp, defined in
- [repo].[GeneratorUsp]
- [repo].[GeneratorUspParameter]
- [repo].[GeneratorUspStep]
*/
CREATE
 

 VIEW [repo].[GeneratorUsp_SqlUsp]
AS
SELECT [u].[id] AS [Usp_id]
 , [SqlUsp] = CONCAT (
  --todo - maybe add description as comment
  'CREATE PROCEDURE '
  , [u].[usp_fullname]
  , CHAR(13)
  , CHAR(10)
  , [ParameterList].[ParameterList]
  , CASE [u].[has_logging]
   WHEN 1
    THEN CONCAT (
      IIF([ParameterList].[ParameterList] <> '', ',' + CHAR(13) + CHAR(10), '')
      , 
      '----keep the code between logging parameters and "START" unchanged!
---- parameters, used for logging; you don''t need to care about them, but you can use them, wenn calling from SSIS or in your workflow to log the context of the procedure call
@execution_instance_guid UNIQUEIDENTIFIER = NULL --SSIS system variable ExecutionInstanceGUID could be used, any other unique guid is also fine. If NULL, then NEWID() is used to create one
, @ssis_execution_id BIGINT = NULL --only SSIS system variable ServerExecutionID should be used, or any other consistent number system, do not mix different number systems
, @sub_execution_id INT = NULL --in case you log some sub_executions, for example in SSIS loops or sub packages
, @parent_execution_log_id BIGINT = NULL --in the current procedure @current_execution_log_id get the log_id of the start-log, it should be used when calling sub procedures to allow call stack analyzing
AS
DECLARE
 --
 @current_execution_log_id BIGINT --this variable will be filled with the first logging call for the step ''start''
 , @current_execution_guid UNIQUEIDENTIFIER = NEWID()
 , @source_object NVARCHAR(261) = NULL --use it like ''[schema].[object]'', this allows data flow vizualizatiuon
 , @target_object NVARCHAR(261) = NULL --use it like ''[schema].[object]'', this allows data flow vizualizatiuon
 , @proc_id INT = @@procid
 , @proc_schema_name NVARCHAR(128) = OBJECT_SCHEMA_NAME(@@procid)
 , @proc_name NVARCHAR(128) = OBJECT_NAME(@@procid)
 , @event_info NVARCHAR(MAX)
 , @step_id INT = 0
 , @step_name NVARCHAR(1000) = NULL
 , @rows INT

--[event_info] get''s only the information about the "outer" calling process
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
SET @step_name = ''start''
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
'
      , [ParameterList].[ParameterListLogging]
      , '
--
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
--
'
      )
   END --[u].[has_logging]
  , [StepList].[StepList]
  , CASE [u].[has_logging]
   WHEN 1
    THEN '
--
--finish your own code here
--keep the code between "END" and the end of the procedure unchanged!
--
--END
--
--SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = ''end''
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
'
   END --[u].[has_logging]
  )
 , [u].[usp_schema]
 , [u].[usp_name]
 , [u].[has_logging]
 , [u].[usp_Description]
 , [u].[usp_fullname]
 , [ParameterList].[ParameterList]
 , [StepList].[StepList]
FROM [repo].[GeneratorUsp] AS u
LEFT JOIN [repo].[GeneratorUsp_ParameterList] AS ParameterList
 ON ParameterList.Usp_id = u.id
LEFT JOIN [repo].[GeneratorUsp_StepList] AS StepList
 ON StepList.Usp_id = u.id