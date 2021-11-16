/*
code of this procedure is managed in the dhw repository. Do not modify manually.
Use [uspgenerator].[GeneratorUsp], [uspgenerator].[GeneratorUspParameter], [uspgenerator].[GeneratorUspStep], [uspgenerator].[GeneratorUsp_SqlUsp]
*/
CREATE   PROCEDURE [ssis].[usp_PERSIST_PackageTask_Dft_Component_tgt]
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
PRINT '[ssis].[usp_PERSIST_PackageTask_Dft_Component_tgt]'
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
--
/*{"ReportUspStep":[{"Number":500,"Name":"delete persistence target missing in source","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[ssis].[PackageTask_Dft_Component_src]","log_target_object":"[ssis].[PackageTask_Dft_Component_tgt]","log_flag_InsertUpdateDelete":"D"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',130,';',500,';',NULL);

DELETE T
FROM [ssis].[PackageTask_Dft_Component_tgt] AS T
WHERE
NOT EXISTS
(SELECT 1 FROM [ssis].[PackageTask_Dft_Component_src] AS S
WHERE
T.[AntoraModule] = S.[AntoraModule]
AND T.[PackageName] = S.[PackageName]
AND T.[Component_refId] = S.[Component_refId]
)
 

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'delete persistence target missing in source'
SET @source_object = '[ssis].[PackageTask_Dft_Component_src]'
SET @target_object = '[ssis].[PackageTask_Dft_Component_tgt]'

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

/*{"ReportUspStep":[{"Number":600,"Name":"update changed","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[ssis].[PackageTask_Dft_Component_src]","log_target_object":"[ssis].[PackageTask_Dft_Component_tgt]","log_flag_InsertUpdateDelete":"U"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',130,';',600,';',NULL);

UPDATE T
SET
  T.[AntoraModule] = S.[AntoraModule]
, T.[PackageName] = S.[PackageName]
, T.[Component_refId] = S.[Component_refId]
, T.[Component_AccessMode] = S.[Component_AccessMode]
, T.[Component_AlwaysUseDefaultCodePage] = S.[Component_AlwaysUseDefaultCodePage]
, T.[Component_CommandTimeout] = S.[Component_CommandTimeout]
, T.[Component_componentClassID] = S.[Component_componentClassID]
, T.[Component_Connection_description] = S.[Component_Connection_description]
, T.[Component_Connection_name] = S.[Component_Connection_name]
, T.[Component_Connection_refId] = S.[Component_Connection_refId]
, T.[Component_connectionManagerID] = S.[Component_connectionManagerID]
, T.[Component_connectionManagerRefId] = S.[Component_connectionManagerRefId]
, T.[Component_ContactInfo] = S.[Component_ContactInfo]
, T.[Component_DefaultCodePage] = S.[Component_DefaultCodePage]
, T.[Component_description] = S.[Component_description]
, T.[Component_FastLoadKeepIdentity] = S.[Component_FastLoadKeepIdentity]
, T.[Component_FastLoadKeepNulls] = S.[Component_FastLoadKeepNulls]
, T.[Component_FastLoadMaxInsertCommitSize] = S.[Component_FastLoadMaxInsertCommitSize]
, T.[Component_FastLoadOptions] = S.[Component_FastLoadOptions]
, T.[Component_IsSortedProperty] = S.[Component_IsSortedProperty]
, T.[Component_name] = S.[Component_name]
, T.[Component_OpenRowset] = S.[Component_OpenRowset]
, T.[Component_OpenRowsetVariable] = S.[Component_OpenRowsetVariable]
, T.[Component_ParameterMapping] = S.[Component_ParameterMapping]
, T.[Component_SqlCommand] = S.[Component_SqlCommand]
, T.[Component_SqlCommandVariable] = S.[Component_SqlCommandVariable]
, T.[Component_VariableName] = S.[Component_VariableName]
, T.[ControlFlowDetailsRowID] = S.[ControlFlowDetailsRowID]
, T.[TaskPath] = S.[TaskPath]

FROM [ssis].[PackageTask_Dft_Component_tgt] AS T
INNER JOIN [ssis].[PackageTask_Dft_Component_src] AS S
ON
T.[AntoraModule] = S.[AntoraModule]
AND T.[PackageName] = S.[PackageName]
AND T.[Component_refId] = S.[Component_refId]

WHERE
   T.[Component_AccessMode] <> S.[Component_AccessMode] OR (S.[Component_AccessMode] IS NULL AND NOT T.[Component_AccessMode] IS NULL) OR (NOT S.[Component_AccessMode] IS NULL AND T.[Component_AccessMode] IS NULL)
OR T.[Component_AlwaysUseDefaultCodePage] <> S.[Component_AlwaysUseDefaultCodePage] OR (S.[Component_AlwaysUseDefaultCodePage] IS NULL AND NOT T.[Component_AlwaysUseDefaultCodePage] IS NULL) OR (NOT S.[Component_AlwaysUseDefaultCodePage] IS NULL AND T.[Component_AlwaysUseDefaultCodePage] IS NULL)
OR T.[Component_CommandTimeout] <> S.[Component_CommandTimeout] OR (S.[Component_CommandTimeout] IS NULL AND NOT T.[Component_CommandTimeout] IS NULL) OR (NOT S.[Component_CommandTimeout] IS NULL AND T.[Component_CommandTimeout] IS NULL)
OR T.[Component_componentClassID] <> S.[Component_componentClassID] OR (S.[Component_componentClassID] IS NULL AND NOT T.[Component_componentClassID] IS NULL) OR (NOT S.[Component_componentClassID] IS NULL AND T.[Component_componentClassID] IS NULL)
OR T.[Component_Connection_description] <> S.[Component_Connection_description] OR (S.[Component_Connection_description] IS NULL AND NOT T.[Component_Connection_description] IS NULL) OR (NOT S.[Component_Connection_description] IS NULL AND T.[Component_Connection_description] IS NULL)
OR T.[Component_Connection_name] <> S.[Component_Connection_name] OR (S.[Component_Connection_name] IS NULL AND NOT T.[Component_Connection_name] IS NULL) OR (NOT S.[Component_Connection_name] IS NULL AND T.[Component_Connection_name] IS NULL)
OR T.[Component_Connection_refId] <> S.[Component_Connection_refId] OR (S.[Component_Connection_refId] IS NULL AND NOT T.[Component_Connection_refId] IS NULL) OR (NOT S.[Component_Connection_refId] IS NULL AND T.[Component_Connection_refId] IS NULL)
OR T.[Component_connectionManagerID] <> S.[Component_connectionManagerID] OR (S.[Component_connectionManagerID] IS NULL AND NOT T.[Component_connectionManagerID] IS NULL) OR (NOT S.[Component_connectionManagerID] IS NULL AND T.[Component_connectionManagerID] IS NULL)
OR T.[Component_connectionManagerRefId] <> S.[Component_connectionManagerRefId] OR (S.[Component_connectionManagerRefId] IS NULL AND NOT T.[Component_connectionManagerRefId] IS NULL) OR (NOT S.[Component_connectionManagerRefId] IS NULL AND T.[Component_connectionManagerRefId] IS NULL)
OR T.[Component_ContactInfo] <> S.[Component_ContactInfo] OR (S.[Component_ContactInfo] IS NULL AND NOT T.[Component_ContactInfo] IS NULL) OR (NOT S.[Component_ContactInfo] IS NULL AND T.[Component_ContactInfo] IS NULL)
OR T.[Component_DefaultCodePage] <> S.[Component_DefaultCodePage] OR (S.[Component_DefaultCodePage] IS NULL AND NOT T.[Component_DefaultCodePage] IS NULL) OR (NOT S.[Component_DefaultCodePage] IS NULL AND T.[Component_DefaultCodePage] IS NULL)
OR T.[Component_description] <> S.[Component_description] OR (S.[Component_description] IS NULL AND NOT T.[Component_description] IS NULL) OR (NOT S.[Component_description] IS NULL AND T.[Component_description] IS NULL)
OR T.[Component_FastLoadKeepIdentity] <> S.[Component_FastLoadKeepIdentity] OR (S.[Component_FastLoadKeepIdentity] IS NULL AND NOT T.[Component_FastLoadKeepIdentity] IS NULL) OR (NOT S.[Component_FastLoadKeepIdentity] IS NULL AND T.[Component_FastLoadKeepIdentity] IS NULL)
OR T.[Component_FastLoadKeepNulls] <> S.[Component_FastLoadKeepNulls] OR (S.[Component_FastLoadKeepNulls] IS NULL AND NOT T.[Component_FastLoadKeepNulls] IS NULL) OR (NOT S.[Component_FastLoadKeepNulls] IS NULL AND T.[Component_FastLoadKeepNulls] IS NULL)
OR T.[Component_FastLoadMaxInsertCommitSize] <> S.[Component_FastLoadMaxInsertCommitSize] OR (S.[Component_FastLoadMaxInsertCommitSize] IS NULL AND NOT T.[Component_FastLoadMaxInsertCommitSize] IS NULL) OR (NOT S.[Component_FastLoadMaxInsertCommitSize] IS NULL AND T.[Component_FastLoadMaxInsertCommitSize] IS NULL)
OR T.[Component_FastLoadOptions] <> S.[Component_FastLoadOptions] OR (S.[Component_FastLoadOptions] IS NULL AND NOT T.[Component_FastLoadOptions] IS NULL) OR (NOT S.[Component_FastLoadOptions] IS NULL AND T.[Component_FastLoadOptions] IS NULL)
OR T.[Component_IsSortedProperty] <> S.[Component_IsSortedProperty] OR (S.[Component_IsSortedProperty] IS NULL AND NOT T.[Component_IsSortedProperty] IS NULL) OR (NOT S.[Component_IsSortedProperty] IS NULL AND T.[Component_IsSortedProperty] IS NULL)
OR T.[Component_name] <> S.[Component_name] OR (S.[Component_name] IS NULL AND NOT T.[Component_name] IS NULL) OR (NOT S.[Component_name] IS NULL AND T.[Component_name] IS NULL)
OR T.[Component_OpenRowset] <> S.[Component_OpenRowset] OR (S.[Component_OpenRowset] IS NULL AND NOT T.[Component_OpenRowset] IS NULL) OR (NOT S.[Component_OpenRowset] IS NULL AND T.[Component_OpenRowset] IS NULL)
OR T.[Component_OpenRowsetVariable] <> S.[Component_OpenRowsetVariable] OR (S.[Component_OpenRowsetVariable] IS NULL AND NOT T.[Component_OpenRowsetVariable] IS NULL) OR (NOT S.[Component_OpenRowsetVariable] IS NULL AND T.[Component_OpenRowsetVariable] IS NULL)
OR T.[Component_ParameterMapping] <> S.[Component_ParameterMapping] OR (S.[Component_ParameterMapping] IS NULL AND NOT T.[Component_ParameterMapping] IS NULL) OR (NOT S.[Component_ParameterMapping] IS NULL AND T.[Component_ParameterMapping] IS NULL)
OR T.[Component_SqlCommand] <> S.[Component_SqlCommand] OR (S.[Component_SqlCommand] IS NULL AND NOT T.[Component_SqlCommand] IS NULL) OR (NOT S.[Component_SqlCommand] IS NULL AND T.[Component_SqlCommand] IS NULL)
OR T.[Component_SqlCommandVariable] <> S.[Component_SqlCommandVariable] OR (S.[Component_SqlCommandVariable] IS NULL AND NOT T.[Component_SqlCommandVariable] IS NULL) OR (NOT S.[Component_SqlCommandVariable] IS NULL AND T.[Component_SqlCommandVariable] IS NULL)
OR T.[Component_VariableName] <> S.[Component_VariableName] OR (S.[Component_VariableName] IS NULL AND NOT T.[Component_VariableName] IS NULL) OR (NOT S.[Component_VariableName] IS NULL AND T.[Component_VariableName] IS NULL)
OR T.[ControlFlowDetailsRowID] <> S.[ControlFlowDetailsRowID]
OR T.[TaskPath] <> S.[TaskPath] OR (S.[TaskPath] IS NULL AND NOT T.[TaskPath] IS NULL) OR (NOT S.[TaskPath] IS NULL AND T.[TaskPath] IS NULL)


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'update changed'
SET @source_object = '[ssis].[PackageTask_Dft_Component_src]'
SET @target_object = '[ssis].[PackageTask_Dft_Component_tgt]'

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

/*{"ReportUspStep":[{"Number":700,"Name":"insert missing","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[ssis].[PackageTask_Dft_Component_src]","log_target_object":"[ssis].[PackageTask_Dft_Component_tgt]","log_flag_InsertUpdateDelete":"I"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',130,';',700,';',NULL);

INSERT INTO 
 [ssis].[PackageTask_Dft_Component_tgt]
 (
  [AntoraModule]
, [PackageName]
, [Component_refId]
, [Component_AccessMode]
, [Component_AlwaysUseDefaultCodePage]
, [Component_CommandTimeout]
, [Component_componentClassID]
, [Component_Connection_description]
, [Component_Connection_name]
, [Component_Connection_refId]
, [Component_connectionManagerID]
, [Component_connectionManagerRefId]
, [Component_ContactInfo]
, [Component_DefaultCodePage]
, [Component_description]
, [Component_FastLoadKeepIdentity]
, [Component_FastLoadKeepNulls]
, [Component_FastLoadMaxInsertCommitSize]
, [Component_FastLoadOptions]
, [Component_IsSortedProperty]
, [Component_name]
, [Component_OpenRowset]
, [Component_OpenRowsetVariable]
, [Component_ParameterMapping]
, [Component_SqlCommand]
, [Component_SqlCommandVariable]
, [Component_VariableName]
, [ControlFlowDetailsRowID]
, [TaskPath]
)
SELECT
  [AntoraModule]
, [PackageName]
, [Component_refId]
, [Component_AccessMode]
, [Component_AlwaysUseDefaultCodePage]
, [Component_CommandTimeout]
, [Component_componentClassID]
, [Component_Connection_description]
, [Component_Connection_name]
, [Component_Connection_refId]
, [Component_connectionManagerID]
, [Component_connectionManagerRefId]
, [Component_ContactInfo]
, [Component_DefaultCodePage]
, [Component_description]
, [Component_FastLoadKeepIdentity]
, [Component_FastLoadKeepNulls]
, [Component_FastLoadMaxInsertCommitSize]
, [Component_FastLoadOptions]
, [Component_IsSortedProperty]
, [Component_name]
, [Component_OpenRowset]
, [Component_OpenRowsetVariable]
, [Component_ParameterMapping]
, [Component_SqlCommand]
, [Component_SqlCommandVariable]
, [Component_VariableName]
, [ControlFlowDetailsRowID]
, [TaskPath]

FROM [ssis].[PackageTask_Dft_Component_src] AS S
WHERE
NOT EXISTS
(SELECT 1
FROM [ssis].[PackageTask_Dft_Component_tgt] AS T
WHERE
T.[AntoraModule] = S.[AntoraModule]
AND T.[PackageName] = S.[PackageName]
AND T.[Component_refId] = S.[Component_refId]
)

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'insert missing'
SET @source_object = '[ssis].[PackageTask_Dft_Component_src]'
SET @target_object = '[ssis].[PackageTask_Dft_Component_tgt]'

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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '252faab3-533f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'PROCEDURE', @level1name = N'usp_PERSIST_PackageTask_Dft_Component_tgt';

