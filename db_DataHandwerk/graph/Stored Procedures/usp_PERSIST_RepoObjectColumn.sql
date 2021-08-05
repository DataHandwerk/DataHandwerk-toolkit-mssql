CREATE   PROCEDURE [graph].[usp_PERSIST_RepoObjectColumn]
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
PRINT '[graph].[usp_PERSIST_RepoObjectColumn]'
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
--
/*{"ReportUspStep":[{"Number":100,"Name":"check for empty source","has_logging":0,"is_condition":1,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[graph].[RepoObjectColumn_S]"}]}*/
IF (SELECT count(*) FROM [graph].[RepoObjectColumn_S]) = 0

/*{"ReportUspStep":[{"Number":110,"Parent_Number":100,"Name":"ERROR 50110: persistence source is empty","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":0}]}*/
BEGIN
PRINT CONCAT('usp_id;Number;Parent_Number: ',10,';',110,';',100);

 THROW 50110
  , 'persistence source is empty: [graph].[RepoObjectColumn_S]'
  , 1;

END;

/*{"ReportUspStep":[{"Number":500,"Name":"delete persistence target missing in source","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[graph].[RepoObjectColumn_S]","log_target_object":"[graph].[RepoObjectColumn]","log_flag_InsertUpdateDelete":"D"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',10,';',500,';',NULL);

DELETE T
FROM [graph].[RepoObjectColumn] AS T
WHERE
NOT EXISTS
(SELECT 1 FROM [graph].[RepoObjectColumn_S] AS S
WHERE
T.[RepoObjectColumn_guid] = S.[RepoObjectColumn_guid]
)
 

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'delete persistence target missing in source'
SET @source_object = '[graph].[RepoObjectColumn_S]'
SET @target_object = '[graph].[RepoObjectColumn]'

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

/*{"ReportUspStep":[{"Number":600,"Name":"update changed","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[graph].[RepoObjectColumn_S]","log_target_object":"[graph].[RepoObjectColumn]","log_flag_InsertUpdateDelete":"U"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',10,';',600,';',NULL);

UPDATE T
SET
  T.[RepoObject_fullname] = S.[RepoObject_fullname]
, T.[RepoObject_fullname2] = S.[RepoObject_fullname2]
, T.[RepoObject_guid] = S.[RepoObject_guid]
, T.[RepoObject_type] = S.[RepoObject_type]
, T.[RepoObjectColumn_fullname] = S.[RepoObjectColumn_fullname]
, T.[RepoObjectColumn_fullname2] = S.[RepoObjectColumn_fullname2]
, T.[RepoObjectColumn_guid] = S.[RepoObjectColumn_guid]
, T.[RepoObjectColumn_name] = S.[RepoObjectColumn_name]
, T.[RepoObjectColumn_type] = S.[RepoObjectColumn_type]

FROM [graph].[RepoObjectColumn] AS T
INNER JOIN [graph].[RepoObjectColumn_S] AS S
ON
T.[RepoObjectColumn_guid] = S.[RepoObjectColumn_guid]

WHERE
   T.[RepoObject_fullname] <> S.[RepoObject_fullname]
OR T.[RepoObject_fullname2] <> S.[RepoObject_fullname2] OR (S.[RepoObject_fullname2] IS NULL AND NOT T.[RepoObject_fullname2] IS NULL) OR (NOT S.[RepoObject_fullname2] IS NULL AND T.[RepoObject_fullname2] IS NULL)
OR T.[RepoObject_guid] <> S.[RepoObject_guid]
OR T.[RepoObject_type] <> S.[RepoObject_type]
OR T.[RepoObjectColumn_fullname] <> S.[RepoObjectColumn_fullname]
OR T.[RepoObjectColumn_fullname2] <> S.[RepoObjectColumn_fullname2] OR (S.[RepoObjectColumn_fullname2] IS NULL AND NOT T.[RepoObjectColumn_fullname2] IS NULL) OR (NOT S.[RepoObjectColumn_fullname2] IS NULL AND T.[RepoObjectColumn_fullname2] IS NULL)
OR T.[RepoObjectColumn_guid] <> S.[RepoObjectColumn_guid]
OR T.[RepoObjectColumn_name] <> S.[RepoObjectColumn_name]
OR T.[RepoObjectColumn_type] <> S.[RepoObjectColumn_type] OR (S.[RepoObjectColumn_type] IS NULL AND NOT T.[RepoObjectColumn_type] IS NULL) OR (NOT S.[RepoObjectColumn_type] IS NULL AND T.[RepoObjectColumn_type] IS NULL)


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'update changed'
SET @source_object = '[graph].[RepoObjectColumn_S]'
SET @target_object = '[graph].[RepoObjectColumn]'

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

/*{"ReportUspStep":[{"Number":700,"Name":"insert missing","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[graph].[RepoObjectColumn_S]","log_target_object":"[graph].[RepoObjectColumn]","log_flag_InsertUpdateDelete":"I"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',10,';',700,';',NULL);

INSERT INTO 
 [graph].[RepoObjectColumn]
 (
  [RepoObject_fullname]
, [RepoObject_fullname2]
, [RepoObject_guid]
, [RepoObject_type]
, [RepoObjectColumn_fullname]
, [RepoObjectColumn_fullname2]
, [RepoObjectColumn_guid]
, [RepoObjectColumn_name]
, [RepoObjectColumn_type]
)
SELECT
  [RepoObject_fullname]
, [RepoObject_fullname2]
, [RepoObject_guid]
, [RepoObject_type]
, [RepoObjectColumn_fullname]
, [RepoObjectColumn_fullname2]
, [RepoObjectColumn_guid]
, [RepoObjectColumn_name]
, [RepoObjectColumn_type]

FROM [graph].[RepoObjectColumn_S] AS S
WHERE
NOT EXISTS
(SELECT 1
FROM [graph].[RepoObjectColumn] AS T
WHERE
T.[RepoObjectColumn_guid] = S.[RepoObjectColumn_guid]
)

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'insert missing'
SET @source_object = '[graph].[RepoObjectColumn_S]'
SET @target_object = '[graph].[RepoObjectColumn]'

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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'be364096-6065-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'PROCEDURE', @level1name = N'usp_PERSIST_RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'UspParameters', @value = NULL, @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'PROCEDURE', @level1name = N'usp_PERSIST_RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'UspExamples', @value = NULL, @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'PROCEDURE', @level1name = N'usp_PERSIST_RepoObjectColumn';


GO



GO
EXECUTE sp_addextendedproperty @name = N'AdocUspSteps', @value = N'.Steps in [graph].[usp_PERSIST_RepoObjectColumn]
[cols="d,15a,d"]
|===
|Number|Name (Action, Source, Target)|Parent

|100
|
*check for empty source*

* `IF (SELECT count(*) FROM [graph].[RepoObjectColumn_S]) = 0`
* [graph].[RepoObjectColumn_S]

|

|110
|
*ERROR 50110: persistence source is empty*


|100

|500
|
*delete persistence target missing in source*

* D
* [graph].[RepoObjectColumn_S]
* [graph].[RepoObjectColumn]

|

|600
|
*update changed*

* U
* [graph].[RepoObjectColumn_S]
* [graph].[RepoObjectColumn]

|

|700
|
*insert missing*

* I
* [graph].[RepoObjectColumn_S]
* [graph].[RepoObjectColumn]

|
|===
', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'PROCEDURE', @level1name = N'usp_PERSIST_RepoObjectColumn';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [graph].[RepoObjectColumn]
* [graph].[RepoObjectColumn_S]
* [logs].[usp_ExecutionLog_insert]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'PROCEDURE', @level1name = N'usp_PERSIST_RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'ExampleUsage', @value = N'EXEC [graph].[usp_PERSIST_RepoObjectColumn]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'PROCEDURE', @level1name = N'usp_PERSIST_RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.usp_sync_guid_RepoObjectColumn.adoc[]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'PROCEDURE', @level1name = N'usp_PERSIST_RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:graph.RepoObjectColumn.adoc[]
* xref:graph.RepoObjectColumn_S.adoc[]
* xref:logs.usp_ExecutionLog_insert.adoc[]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'PROCEDURE', @level1name = N'usp_PERSIST_RepoObjectColumn';

