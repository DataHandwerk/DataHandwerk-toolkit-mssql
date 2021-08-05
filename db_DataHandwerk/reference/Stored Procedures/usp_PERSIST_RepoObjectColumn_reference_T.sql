﻿CREATE   PROCEDURE [reference].[usp_PERSIST_RepoObjectColumn_reference_T]
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
PRINT '[reference].[usp_PERSIST_RepoObjectColumn_reference_T]'
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
--
/*{"ReportUspStep":[{"Number":500,"Name":"delete persistence target missing in source","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[reference].[RepoObjectColumn_reference]","log_target_object":"[reference].[RepoObjectColumn_reference_T]","log_flag_InsertUpdateDelete":"D"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',44,';',500,';',NULL);

DELETE T
FROM [reference].[RepoObjectColumn_reference_T] AS T
WHERE
NOT EXISTS
(SELECT 1 FROM [reference].[RepoObjectColumn_reference] AS S
WHERE
T.[referenced_RepoObjectColumn_guid] = S.[referenced_RepoObjectColumn_guid]
AND T.[referencing_RepoObjectColumn_guid] = S.[referencing_RepoObjectColumn_guid]
)
 

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'delete persistence target missing in source'
SET @source_object = '[reference].[RepoObjectColumn_reference]'
SET @target_object = '[reference].[RepoObjectColumn_reference_T]'

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

/*{"ReportUspStep":[{"Number":600,"Name":"update changed","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[reference].[RepoObjectColumn_reference]","log_target_object":"[reference].[RepoObjectColumn_reference_T]","log_flag_InsertUpdateDelete":"U"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',44,';',600,';',NULL);

UPDATE T
SET
  T.[referenced_RepoObjectColumn_guid] = S.[referenced_RepoObjectColumn_guid]
, T.[referencing_RepoObjectColumn_guid] = S.[referencing_RepoObjectColumn_guid]
, T.[is_referenced_object] = S.[is_referenced_object]
, T.[is_referencing_object_equal_referenced_object] = S.[is_referencing_object_equal_referenced_object]
, T.[referenced_column_name] = S.[referenced_column_name]
, T.[referenced_entity_name] = S.[referenced_entity_name]
, T.[referenced_RepoObject_guid] = S.[referenced_RepoObject_guid]
, T.[referenced_schema_name] = S.[referenced_schema_name]
, T.[referenced_type] = S.[referenced_type]
, T.[referencing_column_name] = S.[referencing_column_name]
, T.[referencing_entity_name] = S.[referencing_entity_name]
, T.[referencing_RepoObject_guid] = S.[referencing_RepoObject_guid]
, T.[referencing_schema_name] = S.[referencing_schema_name]
, T.[referencing_type] = S.[referencing_type]

FROM [reference].[RepoObjectColumn_reference_T] AS T
INNER JOIN [reference].[RepoObjectColumn_reference] AS S
ON
T.[referenced_RepoObjectColumn_guid] = S.[referenced_RepoObjectColumn_guid]
AND T.[referencing_RepoObjectColumn_guid] = S.[referencing_RepoObjectColumn_guid]

WHERE
   T.[is_referenced_object] <> S.[is_referenced_object] OR (S.[is_referenced_object] IS NULL AND NOT T.[is_referenced_object] IS NULL) OR (NOT S.[is_referenced_object] IS NULL AND T.[is_referenced_object] IS NULL)
OR T.[is_referencing_object_equal_referenced_object] <> S.[is_referencing_object_equal_referenced_object] OR (S.[is_referencing_object_equal_referenced_object] IS NULL AND NOT T.[is_referencing_object_equal_referenced_object] IS NULL) OR (NOT S.[is_referencing_object_equal_referenced_object] IS NULL AND T.[is_referencing_object_equal_referenced_object] IS NULL)
OR T.[referenced_column_name] <> S.[referenced_column_name] OR (S.[referenced_column_name] IS NULL AND NOT T.[referenced_column_name] IS NULL) OR (NOT S.[referenced_column_name] IS NULL AND T.[referenced_column_name] IS NULL)
OR T.[referenced_entity_name] <> S.[referenced_entity_name] OR (S.[referenced_entity_name] IS NULL AND NOT T.[referenced_entity_name] IS NULL) OR (NOT S.[referenced_entity_name] IS NULL AND T.[referenced_entity_name] IS NULL)
OR T.[referenced_RepoObject_guid] <> S.[referenced_RepoObject_guid] OR (S.[referenced_RepoObject_guid] IS NULL AND NOT T.[referenced_RepoObject_guid] IS NULL) OR (NOT S.[referenced_RepoObject_guid] IS NULL AND T.[referenced_RepoObject_guid] IS NULL)
OR T.[referenced_schema_name] <> S.[referenced_schema_name] OR (S.[referenced_schema_name] IS NULL AND NOT T.[referenced_schema_name] IS NULL) OR (NOT S.[referenced_schema_name] IS NULL AND T.[referenced_schema_name] IS NULL)
OR T.[referenced_type] <> S.[referenced_type] OR (S.[referenced_type] IS NULL AND NOT T.[referenced_type] IS NULL) OR (NOT S.[referenced_type] IS NULL AND T.[referenced_type] IS NULL)
OR T.[referencing_column_name] <> S.[referencing_column_name] OR (S.[referencing_column_name] IS NULL AND NOT T.[referencing_column_name] IS NULL) OR (NOT S.[referencing_column_name] IS NULL AND T.[referencing_column_name] IS NULL)
OR T.[referencing_entity_name] <> S.[referencing_entity_name] OR (S.[referencing_entity_name] IS NULL AND NOT T.[referencing_entity_name] IS NULL) OR (NOT S.[referencing_entity_name] IS NULL AND T.[referencing_entity_name] IS NULL)
OR T.[referencing_RepoObject_guid] <> S.[referencing_RepoObject_guid] OR (S.[referencing_RepoObject_guid] IS NULL AND NOT T.[referencing_RepoObject_guid] IS NULL) OR (NOT S.[referencing_RepoObject_guid] IS NULL AND T.[referencing_RepoObject_guid] IS NULL)
OR T.[referencing_schema_name] <> S.[referencing_schema_name] OR (S.[referencing_schema_name] IS NULL AND NOT T.[referencing_schema_name] IS NULL) OR (NOT S.[referencing_schema_name] IS NULL AND T.[referencing_schema_name] IS NULL)
OR T.[referencing_type] <> S.[referencing_type] OR (S.[referencing_type] IS NULL AND NOT T.[referencing_type] IS NULL) OR (NOT S.[referencing_type] IS NULL AND T.[referencing_type] IS NULL)


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'update changed'
SET @source_object = '[reference].[RepoObjectColumn_reference]'
SET @target_object = '[reference].[RepoObjectColumn_reference_T]'

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

/*{"ReportUspStep":[{"Number":700,"Name":"insert missing","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[reference].[RepoObjectColumn_reference]","log_target_object":"[reference].[RepoObjectColumn_reference_T]","log_flag_InsertUpdateDelete":"I"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',44,';',700,';',NULL);

INSERT INTO 
 [reference].[RepoObjectColumn_reference_T]
 (
  [referenced_RepoObjectColumn_guid]
, [referencing_RepoObjectColumn_guid]
, [is_referenced_object]
, [is_referencing_object_equal_referenced_object]
, [referenced_column_name]
, [referenced_entity_name]
, [referenced_RepoObject_guid]
, [referenced_schema_name]
, [referenced_type]
, [referencing_column_name]
, [referencing_entity_name]
, [referencing_RepoObject_guid]
, [referencing_schema_name]
, [referencing_type]
)
SELECT
  [referenced_RepoObjectColumn_guid]
, [referencing_RepoObjectColumn_guid]
, [is_referenced_object]
, [is_referencing_object_equal_referenced_object]
, [referenced_column_name]
, [referenced_entity_name]
, [referenced_RepoObject_guid]
, [referenced_schema_name]
, [referenced_type]
, [referencing_column_name]
, [referencing_entity_name]
, [referencing_RepoObject_guid]
, [referencing_schema_name]
, [referencing_type]

FROM [reference].[RepoObjectColumn_reference] AS S
WHERE
NOT EXISTS
(SELECT 1
FROM [reference].[RepoObjectColumn_reference_T] AS T
WHERE
T.[referenced_RepoObjectColumn_guid] = S.[referenced_RepoObjectColumn_guid]
AND T.[referencing_RepoObjectColumn_guid] = S.[referencing_RepoObjectColumn_guid]
)

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'insert missing'
SET @source_object = '[reference].[RepoObjectColumn_reference]'
SET @target_object = '[reference].[RepoObjectColumn_reference_T]'

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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'db0785a9-5df5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'PROCEDURE', @level1name = N'usp_PERSIST_RepoObjectColumn_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'ExampleUsage', @value = N'EXEC [reference].[usp_PERSIST_RepoObjectColumn_reference_T]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'PROCEDURE', @level1name = N'usp_PERSIST_RepoObjectColumn_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.usp_main.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'PROCEDURE', @level1name = N'usp_PERSIST_RepoObjectColumn_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:logs.usp_ExecutionLog_insert.adoc[]
* xref:reference.RepoObjectColumn_reference.adoc[]
* xref:reference.RepoObjectColumn_reference_T.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'PROCEDURE', @level1name = N'usp_PERSIST_RepoObjectColumn_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'AdocUspSteps', @value = N'.Steps in [reference].[usp_PERSIST_RepoObjectColumn_reference_T]
[cols="d,15a,d"]
|===
|Number|Name (Action, Source, Target)|Parent

|500
|
*delete persistence target missing in source*

* D
* [reference].[RepoObjectColumn_reference]
* [reference].[RepoObjectColumn_reference_T]

|

|600
|
*update changed*

* U
* [reference].[RepoObjectColumn_reference]
* [reference].[RepoObjectColumn_reference_T]

|

|700
|
*insert missing*

* I
* [reference].[RepoObjectColumn_reference]
* [reference].[RepoObjectColumn_reference_T]

|
|===
', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'PROCEDURE', @level1name = N'usp_PERSIST_RepoObjectColumn_reference_T';

