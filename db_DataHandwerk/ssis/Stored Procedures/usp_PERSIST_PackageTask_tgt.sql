/*
code of this procedure is managed in the dhw repository. Do not modify manually.
Use [uspgenerator].[GeneratorUsp], [uspgenerator].[GeneratorUspParameter], [uspgenerator].[GeneratorUspStep], [uspgenerator].[GeneratorUsp_SqlUsp]
*/
CREATE   PROCEDURE [ssis].[usp_PERSIST_PackageTask_tgt]
----keep the code between logging parameters and "START" unchanged!
---- parameters, used for logging; you don't need to care about them, but you can use them, wenn calling from SSIS or in your workflow to log the context of the procedure call
  @execution_instance_guid UNIQUEIDENTIFIER = NULL --SSIS system variable ExecutionInstanceGUID could be used, any other unique guid is also fine. If NULL, then NEWID() is used to create one
, @ssis_execution_id BIGINT = NULL --only SSIS system variable ServerExecutionID should be used, or any other consistent number system, do not mix different number systems
, @sub_execution_id INT = NULL --in case you log some sub_executions, for example in SSIS loops or sub packages
, @parent_execution_log_id BIGINT = NULL --in case a sup procedure is called, the @current_execution_log_id of the parent procedure should be propagated here. It allowes call stack analyzing

AS
BEGIN
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
  SELECT TOP 1 [event_info]
  FROM sys.dm_exec_input_buffer(@@spid, CURRENT_REQUEST_ID())
  ORDER BY [event_info]
  )

IF @execution_instance_guid IS NULL
 SET @execution_instance_guid = NEWID();
--
--SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1
SET @step_name = 'start'
SET @source_object = NULL
SET @target_object = NULL

EXEC logs.usp_ExecutionLog_insert
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
PRINT '[ssis].[usp_PERSIST_PackageTask_tgt]'
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
--
/*{"ReportUspStep":[{"Number":500,"Name":"delete persistence target missing in source","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[ssis].[PackageTask_src]","log_target_object":"[ssis].[PackageTask_tgt]","log_flag_InsertUpdateDelete":"D"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',122,';',500,';',NULL);

DELETE T
FROM [ssis].[PackageTask_tgt] AS T
WHERE
NOT EXISTS
(SELECT 1 FROM [ssis].[PackageTask_src] AS S
WHERE
T.[AntoraModule] = S.[AntoraModule]
AND T.[PackageName] = S.[PackageName]
AND T.[TaskPath] = S.[TaskPath]
)
 

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'delete persistence target missing in source'
SET @source_object = '[ssis].[PackageTask_src]'
SET @target_object = '[ssis].[PackageTask_tgt]'

EXEC logs.usp_ExecutionLog_insert 
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

/*{"ReportUspStep":[{"Number":600,"Name":"update changed","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[ssis].[PackageTask_src]","log_target_object":"[ssis].[PackageTask_tgt]","log_flag_InsertUpdateDelete":"U"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',122,';',600,';',NULL);

UPDATE T
SET
  T.[AntoraModule] = S.[AntoraModule]
, T.[PackageName] = S.[PackageName]
, T.[TaskPath] = S.[TaskPath]
, T.[ControlFlowDetailsRowID] = S.[ControlFlowDetailsRowID]
, T.[DelayValidationPropertyValue] = S.[DelayValidationPropertyValue]
, T.[ExecutedPackageName] = S.[ExecutedPackageName]
, T.[ExecutePackageConnection] = S.[ExecutePackageConnection]
, T.[ExecutePackageExpression] = S.[ExecutePackageExpression]
, T.[ExpressionValue] = S.[ExpressionValue]
, T.[IsDisabled] = S.[IsDisabled]
, T.[Script] = S.[Script]
, T.[SqlConnection] = S.[SqlConnection]
, T.[SqlStatementSource] = S.[SqlStatementSource]
, T.[TaskDescription] = S.[TaskDescription]
, T.[TaskName] = S.[TaskName]
, T.[TaskType] = S.[TaskType]

FROM [ssis].[PackageTask_tgt] AS T
INNER JOIN [ssis].[PackageTask_src] AS S
ON
T.[AntoraModule] = S.[AntoraModule]
AND T.[PackageName] = S.[PackageName]
AND T.[TaskPath] = S.[TaskPath]

WHERE
   T.[ControlFlowDetailsRowID] <> S.[ControlFlowDetailsRowID]
OR T.[DelayValidationPropertyValue] <> S.[DelayValidationPropertyValue] OR (S.[DelayValidationPropertyValue] IS NULL AND NOT T.[DelayValidationPropertyValue] IS NULL) OR (NOT S.[DelayValidationPropertyValue] IS NULL AND T.[DelayValidationPropertyValue] IS NULL)
OR T.[ExecutedPackageName] <> S.[ExecutedPackageName] OR (S.[ExecutedPackageName] IS NULL AND NOT T.[ExecutedPackageName] IS NULL) OR (NOT S.[ExecutedPackageName] IS NULL AND T.[ExecutedPackageName] IS NULL)
OR T.[ExecutePackageConnection] <> S.[ExecutePackageConnection] OR (S.[ExecutePackageConnection] IS NULL AND NOT T.[ExecutePackageConnection] IS NULL) OR (NOT S.[ExecutePackageConnection] IS NULL AND T.[ExecutePackageConnection] IS NULL)
OR T.[ExecutePackageExpression] <> S.[ExecutePackageExpression] OR (S.[ExecutePackageExpression] IS NULL AND NOT T.[ExecutePackageExpression] IS NULL) OR (NOT S.[ExecutePackageExpression] IS NULL AND T.[ExecutePackageExpression] IS NULL)
OR T.[ExpressionValue] <> S.[ExpressionValue] OR (S.[ExpressionValue] IS NULL AND NOT T.[ExpressionValue] IS NULL) OR (NOT S.[ExpressionValue] IS NULL AND T.[ExpressionValue] IS NULL)
OR T.[IsDisabled] <> S.[IsDisabled] OR (S.[IsDisabled] IS NULL AND NOT T.[IsDisabled] IS NULL) OR (NOT S.[IsDisabled] IS NULL AND T.[IsDisabled] IS NULL)
OR T.[Script] <> S.[Script] OR (S.[Script] IS NULL AND NOT T.[Script] IS NULL) OR (NOT S.[Script] IS NULL AND T.[Script] IS NULL)
OR T.[SqlConnection] <> S.[SqlConnection] OR (S.[SqlConnection] IS NULL AND NOT T.[SqlConnection] IS NULL) OR (NOT S.[SqlConnection] IS NULL AND T.[SqlConnection] IS NULL)
OR T.[SqlStatementSource] <> S.[SqlStatementSource] OR (S.[SqlStatementSource] IS NULL AND NOT T.[SqlStatementSource] IS NULL) OR (NOT S.[SqlStatementSource] IS NULL AND T.[SqlStatementSource] IS NULL)
OR T.[TaskDescription] <> S.[TaskDescription] OR (S.[TaskDescription] IS NULL AND NOT T.[TaskDescription] IS NULL) OR (NOT S.[TaskDescription] IS NULL AND T.[TaskDescription] IS NULL)
OR T.[TaskName] <> S.[TaskName] OR (S.[TaskName] IS NULL AND NOT T.[TaskName] IS NULL) OR (NOT S.[TaskName] IS NULL AND T.[TaskName] IS NULL)
OR T.[TaskType] <> S.[TaskType] OR (S.[TaskType] IS NULL AND NOT T.[TaskType] IS NULL) OR (NOT S.[TaskType] IS NULL AND T.[TaskType] IS NULL)


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'update changed'
SET @source_object = '[ssis].[PackageTask_src]'
SET @target_object = '[ssis].[PackageTask_tgt]'

EXEC logs.usp_ExecutionLog_insert 
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

/*{"ReportUspStep":[{"Number":700,"Name":"insert missing","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[ssis].[PackageTask_src]","log_target_object":"[ssis].[PackageTask_tgt]","log_flag_InsertUpdateDelete":"I"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',122,';',700,';',NULL);

INSERT INTO 
 [ssis].[PackageTask_tgt]
 (
  [AntoraModule]
, [PackageName]
, [TaskPath]
, [ControlFlowDetailsRowID]
, [DelayValidationPropertyValue]
, [ExecutedPackageName]
, [ExecutePackageConnection]
, [ExecutePackageExpression]
, [ExpressionValue]
, [IsDisabled]
, [Script]
, [SqlConnection]
, [SqlStatementSource]
, [TaskDescription]
, [TaskName]
, [TaskType]
)
SELECT
  [AntoraModule]
, [PackageName]
, [TaskPath]
, [ControlFlowDetailsRowID]
, [DelayValidationPropertyValue]
, [ExecutedPackageName]
, [ExecutePackageConnection]
, [ExecutePackageExpression]
, [ExpressionValue]
, [IsDisabled]
, [Script]
, [SqlConnection]
, [SqlStatementSource]
, [TaskDescription]
, [TaskName]
, [TaskType]

FROM [ssis].[PackageTask_src] AS S
WHERE
NOT EXISTS
(SELECT 1
FROM [ssis].[PackageTask_tgt] AS T
WHERE
T.[AntoraModule] = S.[AntoraModule]
AND T.[PackageName] = S.[PackageName]
AND T.[TaskPath] = S.[TaskPath]
)

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'insert missing'
SET @source_object = '[ssis].[PackageTask_src]'
SET @target_object = '[ssis].[PackageTask_tgt]'

EXEC logs.usp_ExecutionLog_insert 
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

EXEC logs.usp_ExecutionLog_insert
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

END
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '494ab625-2d3b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'PROCEDURE', @level1name = N'usp_PERSIST_PackageTask_tgt';

