/*
code of this procedure is managed in the dhw repository. Do not modify manually.
Use [uspgenerator].[GeneratorUsp], [uspgenerator].[GeneratorUspParameter], [uspgenerator].[GeneratorUspStep], [uspgenerator].[GeneratorUsp_SqlUsp]
*/
CREATE   PROCEDURE [ssas].[usp_PERSIST_TMSCHEMA_RELATIONSHIPS_T]
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
PRINT '[ssas].[usp_PERSIST_TMSCHEMA_RELATIONSHIPS_T]'
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
--
/*{"ReportUspStep":[{"Number":500,"Name":"delete persistence target missing in source","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[ssas].[TMSCHEMA_RELATIONSHIPS]","log_target_object":"[ssas].[TMSCHEMA_RELATIONSHIPS_T]","log_flag_InsertUpdateDelete":"D"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',82,';',500,';',NULL);

DELETE T
FROM [ssas].[TMSCHEMA_RELATIONSHIPS_T] AS T
WHERE
NOT EXISTS
(SELECT 1 FROM [ssas].[TMSCHEMA_RELATIONSHIPS] AS S
WHERE
T.[databasename] = S.[databasename]
AND T.[ID] = S.[ID]
)
 

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'delete persistence target missing in source'
SET @source_object = '[ssas].[TMSCHEMA_RELATIONSHIPS]'
SET @target_object = '[ssas].[TMSCHEMA_RELATIONSHIPS_T]'

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

/*{"ReportUspStep":[{"Number":600,"Name":"update changed","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[ssas].[TMSCHEMA_RELATIONSHIPS]","log_target_object":"[ssas].[TMSCHEMA_RELATIONSHIPS_T]","log_flag_InsertUpdateDelete":"U"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',82,';',600,';',NULL);

UPDATE T
SET
  T.[databasename] = S.[databasename]
, T.[ID] = S.[ID]
, T.[CrossFilteringBehavior] = S.[CrossFilteringBehavior]
, T.[FromCardinality] = S.[FromCardinality]
, T.[FromColumnID] = S.[FromColumnID]
, T.[FromTableID] = S.[FromTableID]
, T.[IsActive] = S.[IsActive]
, T.[JoinOnDateBehavior] = S.[JoinOnDateBehavior]
, T.[ModelID] = S.[ModelID]
, T.[ModifiedTime] = S.[ModifiedTime]
, T.[Name] = S.[Name]
, T.[RefreshedTime] = S.[RefreshedTime]
, T.[RelationshipStorage2ID] = S.[RelationshipStorage2ID]
, T.[RelationshipStorageID] = S.[RelationshipStorageID]
, T.[RelyOnReferentialIntegrity] = S.[RelyOnReferentialIntegrity]
, T.[SecurityFilteringBehavior] = S.[SecurityFilteringBehavior]
, T.[State] = S.[State]
, T.[ToCardinality] = S.[ToCardinality]
, T.[ToColumnID] = S.[ToColumnID]
, T.[ToTableID] = S.[ToTableID]
, T.[Type] = S.[Type]

FROM [ssas].[TMSCHEMA_RELATIONSHIPS_T] AS T
INNER JOIN [ssas].[TMSCHEMA_RELATIONSHIPS] AS S
ON
T.[databasename] = S.[databasename]
AND T.[ID] = S.[ID]

WHERE
   T.[CrossFilteringBehavior] <> S.[CrossFilteringBehavior]
OR T.[FromCardinality] <> S.[FromCardinality]
OR T.[FromColumnID] <> S.[FromColumnID]
OR T.[FromTableID] <> S.[FromTableID]
OR T.[IsActive] <> S.[IsActive]
OR T.[JoinOnDateBehavior] <> S.[JoinOnDateBehavior]
OR T.[ModelID] <> S.[ModelID]
OR T.[ModifiedTime] <> S.[ModifiedTime]
OR T.[Name] <> S.[Name]
OR T.[RefreshedTime] <> S.[RefreshedTime] OR (S.[RefreshedTime] IS NULL AND NOT T.[RefreshedTime] IS NULL) OR (NOT S.[RefreshedTime] IS NULL AND T.[RefreshedTime] IS NULL)
OR T.[RelationshipStorage2ID] <> S.[RelationshipStorage2ID] OR (S.[RelationshipStorage2ID] IS NULL AND NOT T.[RelationshipStorage2ID] IS NULL) OR (NOT S.[RelationshipStorage2ID] IS NULL AND T.[RelationshipStorage2ID] IS NULL)
OR T.[RelationshipStorageID] <> S.[RelationshipStorageID] OR (S.[RelationshipStorageID] IS NULL AND NOT T.[RelationshipStorageID] IS NULL) OR (NOT S.[RelationshipStorageID] IS NULL AND T.[RelationshipStorageID] IS NULL)
OR T.[RelyOnReferentialIntegrity] <> S.[RelyOnReferentialIntegrity]
OR T.[SecurityFilteringBehavior] <> S.[SecurityFilteringBehavior]
OR T.[State] <> S.[State]
OR T.[ToCardinality] <> S.[ToCardinality]
OR T.[ToColumnID] <> S.[ToColumnID]
OR T.[ToTableID] <> S.[ToTableID]
OR T.[Type] <> S.[Type]


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'update changed'
SET @source_object = '[ssas].[TMSCHEMA_RELATIONSHIPS]'
SET @target_object = '[ssas].[TMSCHEMA_RELATIONSHIPS_T]'

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

/*{"ReportUspStep":[{"Number":700,"Name":"insert missing","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[ssas].[TMSCHEMA_RELATIONSHIPS]","log_target_object":"[ssas].[TMSCHEMA_RELATIONSHIPS_T]","log_flag_InsertUpdateDelete":"I"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',82,';',700,';',NULL);

INSERT INTO 
 [ssas].[TMSCHEMA_RELATIONSHIPS_T]
 (
  [databasename]
, [ID]
, [CrossFilteringBehavior]
, [FromCardinality]
, [FromColumnID]
, [FromTableID]
, [IsActive]
, [JoinOnDateBehavior]
, [ModelID]
, [ModifiedTime]
, [Name]
, [RefreshedTime]
, [RelationshipStorage2ID]
, [RelationshipStorageID]
, [RelyOnReferentialIntegrity]
, [SecurityFilteringBehavior]
, [State]
, [ToCardinality]
, [ToColumnID]
, [ToTableID]
, [Type]
)
SELECT
  [databasename]
, [ID]
, [CrossFilteringBehavior]
, [FromCardinality]
, [FromColumnID]
, [FromTableID]
, [IsActive]
, [JoinOnDateBehavior]
, [ModelID]
, [ModifiedTime]
, [Name]
, [RefreshedTime]
, [RelationshipStorage2ID]
, [RelationshipStorageID]
, [RelyOnReferentialIntegrity]
, [SecurityFilteringBehavior]
, [State]
, [ToCardinality]
, [ToColumnID]
, [ToTableID]
, [Type]

FROM [ssas].[TMSCHEMA_RELATIONSHIPS] AS S
WHERE
NOT EXISTS
(SELECT 1
FROM [ssas].[TMSCHEMA_RELATIONSHIPS_T] AS T
WHERE
T.[databasename] = S.[databasename]
AND T.[ID] = S.[ID]
)

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'insert missing'
SET @source_object = '[ssas].[TMSCHEMA_RELATIONSHIPS]'
SET @target_object = '[ssas].[TMSCHEMA_RELATIONSHIPS_T]'

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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '666e8dee-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'PROCEDURE', @level1name = N'usp_PERSIST_TMSCHEMA_RELATIONSHIPS_T';

