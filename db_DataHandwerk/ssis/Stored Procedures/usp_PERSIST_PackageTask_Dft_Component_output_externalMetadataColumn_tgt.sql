/*
code of this procedure is managed in the dhw repository. Do not modify manually.
Use [uspgenerator].[GeneratorUsp], [uspgenerator].[GeneratorUspParameter], [uspgenerator].[GeneratorUspStep], [uspgenerator].[GeneratorUsp_SqlUsp]
*/
CREATE   PROCEDURE [ssis].[usp_PERSIST_PackageTask_Dft_Component_output_externalMetadataColumn_tgt]
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
PRINT '[ssis].[usp_PERSIST_PackageTask_Dft_Component_output_externalMetadataColumn_tgt]'
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
--
/*{"ReportUspStep":[{"Number":200,"Name":"persist source into #source","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[ssis].[PackageTask_Dft_Component_output_externalMetadataColumn_src]","log_target_object":"#source","log_flag_InsertUpdateDelete":"I"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',134,';',200,';',NULL);

--do this in two steps: create table and then fill table
--create empty temp table #source
SELECT Top 0 * into #source  FROM [ssis].[PackageTask_Dft_Component_output_externalMetadataColumn_src]
--fill temp table #source from source
INSERT
INTO #source
SELECT * FROM [ssis].[PackageTask_Dft_Component_output_externalMetadataColumn_src]

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'persist source into #source'
SET @source_object = '[ssis].[PackageTask_Dft_Component_output_externalMetadataColumn_src]'
SET @target_object = '#source'

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

/*{"ReportUspStep":[{"Number":500,"Name":"delete persistence target missing in source","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"#source","log_target_object":"[ssis].[PackageTask_Dft_Component_output_externalMetadataColumn_tgt]","log_flag_InsertUpdateDelete":"D"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',134,';',500,';',NULL);

DELETE T
FROM [ssis].[PackageTask_Dft_Component_output_externalMetadataColumn_tgt] AS T
WHERE
NOT EXISTS
(SELECT 1 FROM #source AS S
WHERE
T.[AntoraModule] = S.[AntoraModule]
AND T.[PackageName] = S.[PackageName]
AND T.[Column_refId] = S.[Column_refId]
)
 

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'delete persistence target missing in source'
SET @source_object = '#source'
SET @target_object = '[ssis].[PackageTask_Dft_Component_output_externalMetadataColumn_tgt]'

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

/*{"ReportUspStep":[{"Number":600,"Name":"update changed","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"#source","log_target_object":"[ssis].[PackageTask_Dft_Component_output_externalMetadataColumn_tgt]","log_flag_InsertUpdateDelete":"U"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',134,';',600,';',NULL);

UPDATE T
SET
  T.[AntoraModule] = S.[AntoraModule]
, T.[PackageName] = S.[PackageName]
, T.[Column_refId] = S.[Column_refId]
, T.[Column_dataType] = S.[Column_dataType]
, T.[Column_length] = S.[Column_length]
, T.[Column_name] = S.[Column_name]
, T.[Column_precision] = S.[Column_precision]
, T.[Column_scale] = S.[Column_scale]
, T.[Component_refId] = S.[Component_refId]
, T.[ControlFlowDetailsRowID] = S.[ControlFlowDetailsRowID]
, T.[externalMetadataColumns_isused] = S.[externalMetadataColumns_isused]
, T.[output_name] = S.[output_name]
, T.[output_refId] = S.[output_refId]
, T.[TaskPath] = S.[TaskPath]

FROM [ssis].[PackageTask_Dft_Component_output_externalMetadataColumn_tgt] AS T
INNER JOIN #source AS S
ON
T.[AntoraModule] = S.[AntoraModule]
AND T.[PackageName] = S.[PackageName]
AND T.[Column_refId] = S.[Column_refId]

WHERE
   T.[Column_dataType] <> S.[Column_dataType] OR (S.[Column_dataType] IS NULL AND NOT T.[Column_dataType] IS NULL) OR (NOT S.[Column_dataType] IS NULL AND T.[Column_dataType] IS NULL)
OR T.[Column_length] <> S.[Column_length] OR (S.[Column_length] IS NULL AND NOT T.[Column_length] IS NULL) OR (NOT S.[Column_length] IS NULL AND T.[Column_length] IS NULL)
OR T.[Column_name] <> S.[Column_name] OR (S.[Column_name] IS NULL AND NOT T.[Column_name] IS NULL) OR (NOT S.[Column_name] IS NULL AND T.[Column_name] IS NULL)
OR T.[Column_precision] <> S.[Column_precision] OR (S.[Column_precision] IS NULL AND NOT T.[Column_precision] IS NULL) OR (NOT S.[Column_precision] IS NULL AND T.[Column_precision] IS NULL)
OR T.[Column_scale] <> S.[Column_scale] OR (S.[Column_scale] IS NULL AND NOT T.[Column_scale] IS NULL) OR (NOT S.[Column_scale] IS NULL AND T.[Column_scale] IS NULL)
OR T.[Component_refId] <> S.[Component_refId] OR (S.[Component_refId] IS NULL AND NOT T.[Component_refId] IS NULL) OR (NOT S.[Component_refId] IS NULL AND T.[Component_refId] IS NULL)
OR T.[ControlFlowDetailsRowID] <> S.[ControlFlowDetailsRowID]
OR T.[externalMetadataColumns_isused] <> S.[externalMetadataColumns_isused] OR (S.[externalMetadataColumns_isused] IS NULL AND NOT T.[externalMetadataColumns_isused] IS NULL) OR (NOT S.[externalMetadataColumns_isused] IS NULL AND T.[externalMetadataColumns_isused] IS NULL)
OR T.[output_name] <> S.[output_name] OR (S.[output_name] IS NULL AND NOT T.[output_name] IS NULL) OR (NOT S.[output_name] IS NULL AND T.[output_name] IS NULL)
OR T.[output_refId] <> S.[output_refId] OR (S.[output_refId] IS NULL AND NOT T.[output_refId] IS NULL) OR (NOT S.[output_refId] IS NULL AND T.[output_refId] IS NULL)
OR T.[TaskPath] <> S.[TaskPath] OR (S.[TaskPath] IS NULL AND NOT T.[TaskPath] IS NULL) OR (NOT S.[TaskPath] IS NULL AND T.[TaskPath] IS NULL)


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'update changed'
SET @source_object = '#source'
SET @target_object = '[ssis].[PackageTask_Dft_Component_output_externalMetadataColumn_tgt]'

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

/*{"ReportUspStep":[{"Number":700,"Name":"insert missing","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"#source","log_target_object":"[ssis].[PackageTask_Dft_Component_output_externalMetadataColumn_tgt]","log_flag_InsertUpdateDelete":"I"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',134,';',700,';',NULL);

INSERT INTO 
 [ssis].[PackageTask_Dft_Component_output_externalMetadataColumn_tgt]
 (
  [AntoraModule]
, [PackageName]
, [Column_refId]
, [Column_dataType]
, [Column_length]
, [Column_name]
, [Column_precision]
, [Column_scale]
, [Component_refId]
, [ControlFlowDetailsRowID]
, [externalMetadataColumns_isused]
, [output_name]
, [output_refId]
, [TaskPath]
)
SELECT
  [AntoraModule]
, [PackageName]
, [Column_refId]
, [Column_dataType]
, [Column_length]
, [Column_name]
, [Column_precision]
, [Column_scale]
, [Component_refId]
, [ControlFlowDetailsRowID]
, [externalMetadataColumns_isused]
, [output_name]
, [output_refId]
, [TaskPath]

FROM #source AS S
WHERE
NOT EXISTS
(SELECT 1
FROM [ssis].[PackageTask_Dft_Component_output_externalMetadataColumn_tgt] AS T
WHERE
T.[AntoraModule] = S.[AntoraModule]
AND T.[PackageName] = S.[PackageName]
AND T.[Column_refId] = S.[Column_refId]
)

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'insert missing'
SET @source_object = '#source'
SET @target_object = '[ssis].[PackageTask_Dft_Component_output_externalMetadataColumn_tgt]'

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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '26950354-dc3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'PROCEDURE', @level1name = N'usp_PERSIST_PackageTask_Dft_Component_output_externalMetadataColumn_tgt';

