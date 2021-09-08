/*
code of this procedure is managed in the dhw repository. Do not modify manually.
Use [uspgenerator].[GeneratorUsp], [uspgenerator].[GeneratorUspParameter], [uspgenerator].[GeneratorUspStep], [uspgenerator].[GeneratorUsp_SqlUsp]
*/
CREATE   PROCEDURE [ssas].[usp_PERSIST_model_json_312_tables_measures_T]
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
PRINT '[ssas].[usp_PERSIST_model_json_312_tables_measures_T]'
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
--
/*{"ReportUspStep":[{"Number":500,"Name":"delete persistence target missing in source","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[ssas].[model_json_312_tables_measures]","log_target_object":"[ssas].[model_json_312_tables_measures_T]","log_flag_InsertUpdateDelete":"D"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',88,';',500,';',NULL);

DELETE T
FROM [ssas].[model_json_312_tables_measures_T] AS T
WHERE
NOT EXISTS
(SELECT 1 FROM [ssas].[model_json_312_tables_measures] AS S
WHERE
T.[databasename] = S.[databasename]
AND T.[tables_name] = S.[tables_name]
AND T.[tables_measures_name] = S.[tables_measures_name]
)
 

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'delete persistence target missing in source'
SET @source_object = '[ssas].[model_json_312_tables_measures]'
SET @target_object = '[ssas].[model_json_312_tables_measures_T]'

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

/*{"ReportUspStep":[{"Number":600,"Name":"update changed","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[ssas].[model_json_312_tables_measures]","log_target_object":"[ssas].[model_json_312_tables_measures_T]","log_flag_InsertUpdateDelete":"U"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',88,';',600,';',NULL);

UPDATE T
SET
  T.[databasename] = S.[databasename]
, T.[tables_name] = S.[tables_name]
, T.[tables_measures_name] = S.[tables_measures_name]
, T.[RepoObject_guid] = S.[RepoObject_guid]
, T.[tables_measures_description] = S.[tables_measures_description]
, T.[tables_measures_description_ja] = S.[tables_measures_description_ja]
, T.[tables_measures_displayFolder] = S.[tables_measures_displayFolder]
, T.[tables_measures_expression] = S.[tables_measures_expression]
, T.[tables_measures_expression_ja] = S.[tables_measures_expression_ja]
, T.[tables_measures_formatString] = S.[tables_measures_formatString]
, T.[tables_measures_isHidden] = S.[tables_measures_isHidden]

FROM [ssas].[model_json_312_tables_measures_T] AS T
INNER JOIN [ssas].[model_json_312_tables_measures] AS S
ON
T.[databasename] = S.[databasename]
AND T.[tables_name] = S.[tables_name]
AND T.[tables_measures_name] = S.[tables_measures_name]

WHERE
   T.[RepoObject_guid] <> S.[RepoObject_guid]
OR T.[tables_measures_description] <> S.[tables_measures_description] OR (S.[tables_measures_description] IS NULL AND NOT T.[tables_measures_description] IS NULL) OR (NOT S.[tables_measures_description] IS NULL AND T.[tables_measures_description] IS NULL)
OR T.[tables_measures_description_ja] <> S.[tables_measures_description_ja] OR (S.[tables_measures_description_ja] IS NULL AND NOT T.[tables_measures_description_ja] IS NULL) OR (NOT S.[tables_measures_description_ja] IS NULL AND T.[tables_measures_description_ja] IS NULL)
OR T.[tables_measures_displayFolder] <> S.[tables_measures_displayFolder] OR (S.[tables_measures_displayFolder] IS NULL AND NOT T.[tables_measures_displayFolder] IS NULL) OR (NOT S.[tables_measures_displayFolder] IS NULL AND T.[tables_measures_displayFolder] IS NULL)
OR T.[tables_measures_expression] <> S.[tables_measures_expression] OR (S.[tables_measures_expression] IS NULL AND NOT T.[tables_measures_expression] IS NULL) OR (NOT S.[tables_measures_expression] IS NULL AND T.[tables_measures_expression] IS NULL)
OR T.[tables_measures_expression_ja] <> S.[tables_measures_expression_ja] OR (S.[tables_measures_expression_ja] IS NULL AND NOT T.[tables_measures_expression_ja] IS NULL) OR (NOT S.[tables_measures_expression_ja] IS NULL AND T.[tables_measures_expression_ja] IS NULL)
OR T.[tables_measures_formatString] <> S.[tables_measures_formatString] OR (S.[tables_measures_formatString] IS NULL AND NOT T.[tables_measures_formatString] IS NULL) OR (NOT S.[tables_measures_formatString] IS NULL AND T.[tables_measures_formatString] IS NULL)
OR T.[tables_measures_isHidden] <> S.[tables_measures_isHidden] OR (S.[tables_measures_isHidden] IS NULL AND NOT T.[tables_measures_isHidden] IS NULL) OR (NOT S.[tables_measures_isHidden] IS NULL AND T.[tables_measures_isHidden] IS NULL)


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'update changed'
SET @source_object = '[ssas].[model_json_312_tables_measures]'
SET @target_object = '[ssas].[model_json_312_tables_measures_T]'

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

/*{"ReportUspStep":[{"Number":700,"Name":"insert missing","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[ssas].[model_json_312_tables_measures]","log_target_object":"[ssas].[model_json_312_tables_measures_T]","log_flag_InsertUpdateDelete":"I"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',88,';',700,';',NULL);

INSERT INTO 
 [ssas].[model_json_312_tables_measures_T]
 (
  [databasename]
, [tables_name]
, [tables_measures_name]
, [RepoObject_guid]
, [tables_measures_description]
, [tables_measures_description_ja]
, [tables_measures_displayFolder]
, [tables_measures_expression]
, [tables_measures_expression_ja]
, [tables_measures_formatString]
, [tables_measures_isHidden]
)
SELECT
  [databasename]
, [tables_name]
, [tables_measures_name]
, [RepoObject_guid]
, [tables_measures_description]
, [tables_measures_description_ja]
, [tables_measures_displayFolder]
, [tables_measures_expression]
, [tables_measures_expression_ja]
, [tables_measures_formatString]
, [tables_measures_isHidden]

FROM [ssas].[model_json_312_tables_measures] AS S
WHERE
NOT EXISTS
(SELECT 1
FROM [ssas].[model_json_312_tables_measures_T] AS T
WHERE
T.[databasename] = S.[databasename]
AND T.[tables_name] = S.[tables_name]
AND T.[tables_measures_name] = S.[tables_measures_name]
)

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'insert missing'
SET @source_object = '[ssas].[model_json_312_tables_measures]'
SET @target_object = '[ssas].[model_json_312_tables_measures_T]'

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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'e6f27b65-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'PROCEDURE', @level1name = N'usp_PERSIST_model_json_312_tables_measures_T';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [logs].[usp_ExecutionLog_insert]
* [ssas].[model_json_312_tables_measures]
* [ssas].[model_json_312_tables_measures_T]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'PROCEDURE', @level1name = N'usp_PERSIST_model_json_312_tables_measures_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'PROCEDURE', @level1name = N'usp_PERSIST_model_json_312_tables_measures_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'PROCEDURE', @level1name = N'usp_PERSIST_model_json_312_tables_measures_T';


GO
EXECUTE sp_addextendedproperty @name = N'ExampleUsage', @value = N'EXEC [ssas].[usp_PERSIST_model_json_312_tables_measures_T]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'PROCEDURE', @level1name = N'usp_PERSIST_model_json_312_tables_measures_T';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:logs.usp_ExecutionLog_insert.adoc[]
* xref:ssas.model_json_312_tables_measures.adoc[]
* xref:ssas.model_json_312_tables_measures_T.adoc[]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'PROCEDURE', @level1name = N'usp_PERSIST_model_json_312_tables_measures_T';

