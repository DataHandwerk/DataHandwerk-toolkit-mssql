/*
code of this procedure is managed in the dhw repository. Do not modify manually.
Use [uspgenerator].[GeneratorUsp], [uspgenerator].[GeneratorUspParameter], [uspgenerator].[GeneratorUspStep], [uspgenerator].[GeneratorUsp_SqlUsp]
*/
CREATE   PROCEDURE [ssis].[usp_PERSIST_Package_tgt]
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
PRINT '[ssis].[usp_PERSIST_Package_tgt]'
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
--
/*{"ReportUspStep":[{"Number":500,"Name":"delete persistence target missing in source","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[ssis].[Package_src]","log_target_object":"[ssis].[Package_tgt]","log_flag_InsertUpdateDelete":"D"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',115,';',500,';',NULL);

DELETE T
FROM [ssis].[Package_tgt] AS T
WHERE
NOT EXISTS
(SELECT 1 FROM [ssis].[Package_src] AS S
WHERE
T.[AntoraModule] = S.[AntoraModule]
AND T.[PackageName] = S.[PackageName]
)
 

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'delete persistence target missing in source'
SET @source_object = '[ssis].[Package_src]'
SET @target_object = '[ssis].[Package_tgt]'

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

/*{"ReportUspStep":[{"Number":600,"Name":"update changed","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[ssis].[Package_src]","log_target_object":"[ssis].[Package_tgt]","log_flag_InsertUpdateDelete":"U"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',115,';',600,';',NULL);

UPDATE T
SET
  T.[AntoraModule] = S.[AntoraModule]
, T.[PackageName] = S.[PackageName]
, T.[PackageCreationDate] = S.[PackageCreationDate]
, T.[PackageCreatorComputerName] = S.[PackageCreatorComputerName]
, T.[PackageCreatorName] = S.[PackageCreatorName]
, T.[PackageDescription] = S.[PackageDescription]
, T.[PackageDTSID] = S.[PackageDTSID]
, T.[PackageLastModifiedProductVersion] = S.[PackageLastModifiedProductVersion]
, T.[PackageLocaleID] = S.[PackageLocaleID]
, T.[PackageObjectName] = S.[PackageObjectName]
, T.[PackagePath] = S.[PackagePath]
, T.[PackageProtectionLevel] = S.[PackageProtectionLevel]
, T.[PackageProtectionLevelName] = S.[PackageProtectionLevelName]
, T.[PackageVersionGUID] = S.[PackageVersionGUID]
, T.[ProjectPath] = S.[ProjectPath]
, T.[RowID] = S.[RowID]

FROM [ssis].[Package_tgt] AS T
INNER JOIN [ssis].[Package_src] AS S
ON
T.[AntoraModule] = S.[AntoraModule]
AND T.[PackageName] = S.[PackageName]

WHERE
   T.[PackageCreationDate] <> S.[PackageCreationDate] OR (S.[PackageCreationDate] IS NULL AND NOT T.[PackageCreationDate] IS NULL) OR (NOT S.[PackageCreationDate] IS NULL AND T.[PackageCreationDate] IS NULL)
OR T.[PackageCreatorComputerName] <> S.[PackageCreatorComputerName] OR (S.[PackageCreatorComputerName] IS NULL AND NOT T.[PackageCreatorComputerName] IS NULL) OR (NOT S.[PackageCreatorComputerName] IS NULL AND T.[PackageCreatorComputerName] IS NULL)
OR T.[PackageCreatorName] <> S.[PackageCreatorName] OR (S.[PackageCreatorName] IS NULL AND NOT T.[PackageCreatorName] IS NULL) OR (NOT S.[PackageCreatorName] IS NULL AND T.[PackageCreatorName] IS NULL)
OR T.[PackageDescription] <> S.[PackageDescription] OR (S.[PackageDescription] IS NULL AND NOT T.[PackageDescription] IS NULL) OR (NOT S.[PackageDescription] IS NULL AND T.[PackageDescription] IS NULL)
OR T.[PackageDTSID] <> S.[PackageDTSID] OR (S.[PackageDTSID] IS NULL AND NOT T.[PackageDTSID] IS NULL) OR (NOT S.[PackageDTSID] IS NULL AND T.[PackageDTSID] IS NULL)
OR T.[PackageLastModifiedProductVersion] <> S.[PackageLastModifiedProductVersion] OR (S.[PackageLastModifiedProductVersion] IS NULL AND NOT T.[PackageLastModifiedProductVersion] IS NULL) OR (NOT S.[PackageLastModifiedProductVersion] IS NULL AND T.[PackageLastModifiedProductVersion] IS NULL)
OR T.[PackageLocaleID] <> S.[PackageLocaleID] OR (S.[PackageLocaleID] IS NULL AND NOT T.[PackageLocaleID] IS NULL) OR (NOT S.[PackageLocaleID] IS NULL AND T.[PackageLocaleID] IS NULL)
OR T.[PackageObjectName] <> S.[PackageObjectName] OR (S.[PackageObjectName] IS NULL AND NOT T.[PackageObjectName] IS NULL) OR (NOT S.[PackageObjectName] IS NULL AND T.[PackageObjectName] IS NULL)
OR T.[PackagePath] <> S.[PackagePath]
OR T.[PackageProtectionLevel] <> S.[PackageProtectionLevel] OR (S.[PackageProtectionLevel] IS NULL AND NOT T.[PackageProtectionLevel] IS NULL) OR (NOT S.[PackageProtectionLevel] IS NULL AND T.[PackageProtectionLevel] IS NULL)
OR T.[PackageProtectionLevelName] <> S.[PackageProtectionLevelName] OR (S.[PackageProtectionLevelName] IS NULL AND NOT T.[PackageProtectionLevelName] IS NULL) OR (NOT S.[PackageProtectionLevelName] IS NULL AND T.[PackageProtectionLevelName] IS NULL)
OR T.[PackageVersionGUID] <> S.[PackageVersionGUID] OR (S.[PackageVersionGUID] IS NULL AND NOT T.[PackageVersionGUID] IS NULL) OR (NOT S.[PackageVersionGUID] IS NULL AND T.[PackageVersionGUID] IS NULL)
OR T.[ProjectPath] <> S.[ProjectPath]
OR T.[RowID] <> S.[RowID]


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'update changed'
SET @source_object = '[ssis].[Package_src]'
SET @target_object = '[ssis].[Package_tgt]'

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

/*{"ReportUspStep":[{"Number":700,"Name":"insert missing","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[ssis].[Package_src]","log_target_object":"[ssis].[Package_tgt]","log_flag_InsertUpdateDelete":"I"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',115,';',700,';',NULL);

INSERT INTO 
 [ssis].[Package_tgt]
 (
  [AntoraModule]
, [PackageName]
, [PackageCreationDate]
, [PackageCreatorComputerName]
, [PackageCreatorName]
, [PackageDescription]
, [PackageDTSID]
, [PackageLastModifiedProductVersion]
, [PackageLocaleID]
, [PackageObjectName]
, [PackagePath]
, [PackageProtectionLevel]
, [PackageProtectionLevelName]
, [PackageVersionGUID]
, [ProjectPath]
, [RowID]
)
SELECT
  [AntoraModule]
, [PackageName]
, [PackageCreationDate]
, [PackageCreatorComputerName]
, [PackageCreatorName]
, [PackageDescription]
, [PackageDTSID]
, [PackageLastModifiedProductVersion]
, [PackageLocaleID]
, [PackageObjectName]
, [PackagePath]
, [PackageProtectionLevel]
, [PackageProtectionLevelName]
, [PackageVersionGUID]
, [ProjectPath]
, [RowID]

FROM [ssis].[Package_src] AS S
WHERE
NOT EXISTS
(SELECT 1
FROM [ssis].[Package_tgt] AS T
WHERE
T.[AntoraModule] = S.[AntoraModule]
AND T.[PackageName] = S.[PackageName]
)

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'insert missing'
SET @source_object = '[ssis].[Package_src]'
SET @target_object = '[ssis].[Package_tgt]'

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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '474ab625-2d3b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'PROCEDURE', @level1name = N'usp_PERSIST_Package_tgt';

