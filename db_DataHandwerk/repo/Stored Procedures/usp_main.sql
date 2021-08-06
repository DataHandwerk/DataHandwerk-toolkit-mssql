CREATE   PROCEDURE [repo].[usp_main]
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
PRINT '[repo].[usp_main]'
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
--
/*{"ReportUspStep":[{"Number":210,"Name":"[repo].[usp_sync_guid]","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [repo].[usp_sync_guid]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":220,"Name":"[reference].[usp_PERSIST_RepoObject_reference_T]","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [reference].[usp_PERSIST_RepoObject_reference_T]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":230,"Name":"[reference].[usp_PERSIST_RepoObjectColumn_reference_T]","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [reference].[usp_PERSIST_RepoObjectColumn_reference_T]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":300,"Name":"(select [config].[fs_get_parameter_value]('main enable usp_RepoObjectSource_FirstResultSet', DEFAULT)) = 1","has_logging":0,"is_condition":1,"is_inactive":0,"is_SubProcedure":0}]}*/
IF (select [config].[fs_get_parameter_value]('main enable usp_RepoObjectSource_FirstResultSet', DEFAULT)) = 1

/*{"ReportUspStep":[{"Number":310,"Parent_Number":300,"Name":"[reference].[usp_RepoObjectSource_FirstResultSet]","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
BEGIN
EXEC [reference].[usp_RepoObjectSource_FirstResultSet]
--This can take a very long time
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id

END;

/*{"ReportUspStep":[{"Number":400,"Name":"(select [config].[fs_get_parameter_value]('main enable usp_RepoObject_update_SysObjectQueryPlan', DEFAULT)) = 1","has_logging":0,"is_condition":1,"is_inactive":0,"is_SubProcedure":0}]}*/
IF (select [config].[fs_get_parameter_value]('main enable usp_RepoObject_update_SysObjectQueryPlan', DEFAULT)) = 1

/*{"ReportUspStep":[{"Number":410,"Parent_Number":400,"Name":"[reference].[usp_RepoObject_update_SysObjectQueryPlan]","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
BEGIN
EXEC [reference].[usp_RepoObject_update_SysObjectQueryPlan]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id

END;

/*{"ReportUspStep":[{"Number":500,"Name":"(select [config].[fs_get_parameter_value]('main enable usp_RepoObjectSource_QueryPlan', DEFAULT)) = 1","has_logging":0,"is_condition":1,"is_inactive":0,"is_SubProcedure":0}]}*/
IF (select [config].[fs_get_parameter_value]('main enable usp_RepoObjectSource_QueryPlan', DEFAULT)) = 1

/*{"ReportUspStep":[{"Number":510,"Parent_Number":500,"Name":"[reference].[usp_RepoObjectSource_QueryPlan]\r\n--This can take a very long time","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
BEGIN
EXEC [reference].[usp_RepoObjectSource_QueryPlan]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id

END;

/*{"ReportUspStep":[{"Number":610,"Name":"[reference].[usp_update_Referencing_Count]","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [reference].[usp_update_Referencing_Count]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":710,"Name":"[repo].[usp_index_inheritance]","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [repo].[usp_index_inheritance]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":720,"Name":"[repo].[usp_Index_ForeignKey]","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [repo].[usp_Index_ForeignKey]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":810,"Name":"[repo].[usp_RepoObjectColumn_update_RepoObjectColumn_column_id]","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [repo].[usp_RepoObjectColumn_update_RepoObjectColumn_column_id]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":910,"Name":"[repo].[usp_GeneratorUsp_insert_update_persistence]","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [uspgenerator].[usp_GeneratorUsp_insert_update_persistence]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":2110,"Name":"MERGE [graph].[ReferencedObject]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[reference].[RepoObject_reference_union]","log_target_object":"[graph].[ReferencedObject]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',2,';',2110,';',NULL);

MERGE [graph].[ReferencedObject]
USING (
 (
  SELECT DISTINCT
   --
   [referencing_RepoObject_guid]
   , [referenced_RepoObject_guid]
  FROM [reference].[RepoObject_reference_T]
  ) AS S
 --
 JOIN [graph].[RepoObject] referencing
  ON S.[referencing_RepoObject_guid] = referencing.[RepoObject_guid]
 JOIN [graph].[RepoObject] referenced
  ON S.[referenced_RepoObject_guid] = referenced.[RepoObject_guid]
 )
 ON MATCH(referencing - (ReferencedObject) - > referenced)
WHEN NOT MATCHED BY TARGET
 THEN
  INSERT (
   $FROM_ID
   , $TO_ID
   )
  VALUES (
   referencing.$NODE_ID
   , referenced.$NODE_ID
   )
WHEN NOT MATCHED BY SOURCE
 THEN
  DELETE
OUTPUT deleted.*
 , $ACTION
 , inserted.*;

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'MERGE [graph].[ReferencedObject]'
SET @source_object = '[reference].[RepoObject_reference_union]'
SET @target_object = '[graph].[ReferencedObject]'

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

/*{"ReportUspStep":[{"Number":2120,"Name":"MERGE [graph].[ReferencingObject]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[reference].[RepoObject_reference_union]","log_target_object":"[graph].[ReferencingObject]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',2,';',2120,';',NULL);

MERGE [graph].[ReferencingObject]
USING (
 (
  SELECT DISTINCT
   --
   [referencing_RepoObject_guid]
   , [referenced_RepoObject_guid]
  FROM [reference].[RepoObject_reference_T]
  ) AS S
 --
 JOIN [graph].[RepoObject] referencing
  ON S.[referencing_RepoObject_guid] = referencing.[RepoObject_guid]
 JOIN [graph].[RepoObject] referenced
  ON S.[referenced_RepoObject_guid] = referenced.[RepoObject_guid]
 )
 ON MATCH(referenced - (ReferencingObject) - > referencing)
WHEN NOT MATCHED BY TARGET
 THEN
  INSERT (
   $FROM_ID
   , $TO_ID
   )
  VALUES (
   referenced.$NODE_ID
   , referencing.$NODE_ID
   )
WHEN NOT MATCHED BY SOURCE
 THEN
  DELETE
OUTPUT deleted.*
 , $ACTION
 , inserted.*;

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'MERGE [graph].[ReferencingObject]'
SET @source_object = '[reference].[RepoObject_reference_union]'
SET @target_object = '[graph].[ReferencingObject]'

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

/*{"ReportUspStep":[{"Number":2210,"Name":"MERGE [graph].[ReferencedObjectColumn]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[reference].[RepoObjectColumn_reference_union]","log_target_object":"[graph].[ReferencedObjectColumn]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',2,';',2210,';',NULL);

MERGE [graph].[ReferencedObjectColumn]
USING (
 (
  SELECT DISTINCT
   --
   [referencing_RepoObjectColumn_guid]
   , [referenced_RepoObjectColumn_guid]
  FROM [reference].[RepoObjectColumn_reference_T]
  where not [referencing_RepoObjectColumn_guid] is null
  and not [referenced_RepoObjectColumn_guid] is null
  ) AS S
 --
 JOIN [graph].[RepoObjectColumn] referencing
  ON S.[referencing_RepoObjectColumn_guid] = referencing.[RepoObjectColumn_guid]
 JOIN [graph].[RepoObjectColumn] referenced
  ON S.[referenced_RepoObjectColumn_guid] = referenced.[RepoObjectColumn_guid]
 )
 ON MATCH(referencing - (ReferencedObjectColumn) - > referenced)
WHEN NOT MATCHED BY TARGET
 THEN
  INSERT (
   $FROM_ID
   , $TO_ID
   )
  VALUES (
   referencing.$NODE_ID
   , referenced.$NODE_ID
   )
WHEN NOT MATCHED BY SOURCE
 THEN
  DELETE
OUTPUT deleted.*
 , $ACTION
 , inserted.*;

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'MERGE [graph].[ReferencedObjectColumn]'
SET @source_object = '[reference].[RepoObjectColumn_reference_union]'
SET @target_object = '[graph].[ReferencedObjectColumn]'

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

/*{"ReportUspStep":[{"Number":3110,"Name":"Merge Into [workflow].[ProcedureDependency] (Persistence)","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[Match_RepoObject_referenced_UspPersistence]","log_target_object":"[workflow].[ProcedureDependency]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',2,';',3110,';',NULL);

Merge Into workflow.ProcedureDependency T
Using
(
    Select
        First_usp_persistence_RepoObject_guid
      , Last_usp_persistence_RepoObject_guid
      , 1 As is_PersistenceDependency
    From
        reference.Match_RepoObject_referenced_UspPersistence As T1
    Where
        ( Not ( First_usp_persistence_RepoObject_guid Is Null ))
        And ( Not ( Last_usp_persistence_RepoObject_guid Is Null ))
) S
On S.First_usp_persistence_RepoObject_guid = T.referenced_Procedure_RepoObject_guid
   And S.Last_usp_persistence_RepoObject_guid = T.referencing_Procedure_RepoObject_guid
When Matched And T.is_PersistenceDependency = 0
    Then Update Set
             is_PersistenceDependency = 1
When Not Matched By Target
    Then Insert
         (
             referenced_Procedure_RepoObject_guid
           , referencing_Procedure_RepoObject_guid
           , is_PersistenceDependency
         )
         Values
             (
                 S.First_usp_persistence_RepoObject_guid
               , S.Last_usp_persistence_RepoObject_guid
               , S.is_PersistenceDependency
             )
When Not Matched By Source And T.is_PersistenceDependency = 1
    Then Delete;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'Merge Into [workflow].[ProcedureDependency] (Persistence)'
SET @source_object = '[repo].[Match_RepoObject_referenced_UspPersistence]'
SET @target_object = '[workflow].[ProcedureDependency]'

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

/*{"ReportUspStep":[{"Number":4110,"Name":"[property].[usp_RepoObject_Inheritance]","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [property].[usp_RepoObject_Inheritance]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":4120,"Name":"[property].[usp_RepoObjectColumn_Inheritance]","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [property].[usp_RepoObjectColumn_Inheritance]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '6bcbc49c-3862-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_main';


GO
EXECUTE sp_addextendedproperty @name = N'UspParameters', @value = NULL, @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_main';


GO
EXECUTE sp_addextendedproperty @name = N'UspExamples', @value = N'EXEC = [repo].[usp_main]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_main';


GO



GO
EXECUTE sp_addextendedproperty @name = N'AdocUspSteps', @value = N'.Steps in [repo].[usp_main]
[cols="d,15a,d"]
|===
|Number|Name (Action, Source, Target)|Parent

|210
|
*[repo].[usp_sync_guid]*

* `EXEC [repo].[usp_sync_guid]`

|

|220
|
*[reference].[usp_PERSIST_RepoObject_reference_T]*

* `EXEC [reference].[usp_PERSIST_RepoObject_reference_T]`

|

|230
|
*[reference].[usp_PERSIST_RepoObjectColumn_reference_T]*

* `EXEC [reference].[usp_PERSIST_RepoObjectColumn_reference_T]`

|

|300
|
*(select [config].[fs_get_parameter_value](''main enable usp_RepoObjectSource_FirstResultSet'', DEFAULT)) = 1*

* `IF (select [config].[fs_get_parameter_value](''main enable usp_RepoObjectSource_FirstResultSet'', DEFAULT)) = 1`

|

|310
|
*[reference].[usp_RepoObjectSource_FirstResultSet]*

* `EXEC [reference].[usp_RepoObjectSource_FirstResultSet]
--This can take a very long time`

|300

|400
|
*(select [config].[fs_get_parameter_value](''main enable usp_RepoObject_update_SysObjectQueryPlan'', DEFAULT)) = 1*

* `IF (select [config].[fs_get_parameter_value](''main enable usp_RepoObject_update_SysObjectQueryPlan'', DEFAULT)) = 1`

|

|410
|
*[reference].[usp_RepoObject_update_SysObjectQueryPlan]*

* `EXEC [reference].[usp_RepoObject_update_SysObjectQueryPlan]`


This can take a very long time
|400

|500
|
*(select [config].[fs_get_parameter_value](''main enable usp_RepoObjectSource_QueryPlan'', DEFAULT)) = 1*

* `IF (select [config].[fs_get_parameter_value](''main enable usp_RepoObjectSource_QueryPlan'', DEFAULT)) = 1`

|

|510
|
*[reference].[usp_RepoObjectSource_QueryPlan]
--This can take a very long time*

* `EXEC [reference].[usp_RepoObjectSource_QueryPlan]`


This can take a very long time
|500

|610
|
*[reference].[usp_update_Referencing_Count]*

* `EXEC [reference].[usp_update_Referencing_Count]`

|

|710
|
*[repo].[usp_index_inheritance]*

* `EXEC [repo].[usp_index_inheritance]`


todo:

should or could be executed several times until no new indexes are inherited
|

|720
|
*[repo].[usp_Index_ForeignKey]*

* `EXEC [repo].[usp_Index_ForeignKey]`

|

|810
|
*[repo].[usp_RepoObjectColumn_update_RepoObjectColumn_column_id]*

* `EXEC [repo].[usp_RepoObjectColumn_update_RepoObjectColumn_column_id]`


This must happen later than the index logic, because the PK can change there. And this affects the order of the columns.
|

|910
|
*[repo].[usp_GeneratorUsp_insert_update_persistence]*

* `EXEC [uspgenerator].[usp_GeneratorUsp_insert_update_persistence]`


RepoObjectColumn_column_id is required and should be updated before
|

|2110
|
*MERGE [graph].[ReferencedObject]*

* u
* [reference].[RepoObject_reference_union]
* [graph].[ReferencedObject]

|

|2120
|
*MERGE [graph].[ReferencingObject]*

* u
* [reference].[RepoObject_reference_union]
* [graph].[ReferencingObject]

|

|2210
|
*MERGE [graph].[ReferencedObjectColumn]*

* u
* [reference].[RepoObjectColumn_reference_union]
* [graph].[ReferencedObjectColumn]

|

|3110
|
*Merge Into [workflow].[ProcedureDependency] (Persistence)*

* u
* [repo].[Match_RepoObject_referenced_UspPersistence]
* [workflow].[ProcedureDependency]

|

|4110
|
*[property].[usp_RepoObject_Inheritance]*

* `EXEC [property].[usp_RepoObject_Inheritance]`

|

|4120
|
*[property].[usp_RepoObjectColumn_Inheritance]*

* `EXEC [property].[usp_RepoObjectColumn_Inheritance]`

|
|===
', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_main';






GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [config].[fs_get_parameter_value]
* [graph].[ReferencedObject]
* [graph].[ReferencedObjectColumn]
* [graph].[ReferencingObject]
* [graph].[ReferencingObjectColumn]
* [graph].[RepoObject]
* [graph].[RepoObjectColumn]
* [logs].[usp_ExecutionLog_insert]
* [property].[usp_RepoObject_Inheritance]
* [property].[usp_RepoObjectColumn_Inheritance]
* [reference].[Match_RepoObject_referenced_UspPersistence]
* [reference].[RepoObject_reference_union]
* [reference].[RepoObjectColumn_reference_union]
* [reference].[usp_RepoObject_update_SysObjectQueryPlan]
* [reference].[usp_RepoObjectSource_FirstResultSet]
* [reference].[usp_RepoObjectSource_QueryPlan]
* [reference].[usp_update_Referencing_Count]
* [repo].[usp_Index_ForeignKey]
* [repo].[usp_index_inheritance]
* [repo].[usp_RepoObjectColumn_update_RepoObjectColumn_column_id]
* [repo].[usp_sync_guid]
* [uspgenerator].[usp_GeneratorUsp_insert_update_persistence]
* [workflow].[ProcedureDependency]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_main';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'main procedure

this central procedure must be executed regularly, try to get e feeling, when it is required +
It does:

* `EXEC repo.usp_sync_guid` to synchronize repository database and dwh database
** some dwh database extended properties (ep) are synchronized with repository database
*** ep RepoObject_guid for each database object
*** ep RepoObjectColumn_guid for each database object column
* index processing
** combination of real and virtual indexes
** virtual and real foreign key
** code generation and updates for persistence procedures
* process references and data lineage
* inheritance of properties

see xref:sqldb:repo.usp_main.adoc#_procdure_steps[Procedure steps] for details.

use links in xref:sqldb:repo.usp_main.adoc#_referenced_objects[Referenced objects] to get details of called sub procedures', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_main';


GO
EXECUTE sp_addextendedproperty @name = N'ExampleUsage', @value = N'EXEC [repo].[usp_main]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_main';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:config.fs_get_parameter_value.adoc[]
* xref:graph.ReferencedObject.adoc[]
* xref:graph.ReferencedObjectColumn.adoc[]
* xref:graph.ReferencingObject.adoc[]
* xref:graph.RepoObject.adoc[]
* xref:graph.RepoObjectColumn.adoc[]
* xref:logs.usp_ExecutionLog_insert.adoc[]
* xref:property.usp_RepoObject_Inheritance.adoc[]
* xref:property.usp_RepoObjectColumn_Inheritance.adoc[]
* xref:reference.Match_RepoObject_referenced_UspPersistence.adoc[]
* xref:reference.RepoObject_reference_T.adoc[]
* xref:reference.RepoObjectColumn_reference_T.adoc[]
* xref:reference.usp_PERSIST_RepoObject_reference_T.adoc[]
* xref:reference.usp_PERSIST_RepoObjectColumn_reference_T.adoc[]
* xref:reference.usp_RepoObject_update_SysObjectQueryPlan.adoc[]
* xref:reference.usp_RepoObjectSource_FirstResultSet.adoc[]
* xref:reference.usp_RepoObjectSource_QueryPlan.adoc[]
* xref:reference.usp_update_Referencing_Count.adoc[]
* xref:repo.usp_Index_ForeignKey.adoc[]
* xref:repo.usp_index_inheritance.adoc[]
* xref:repo.usp_RepoObjectColumn_update_RepoObjectColumn_column_id.adoc[]
* xref:repo.usp_sync_guid.adoc[]
* xref:uspgenerator.usp_GeneratorUsp_insert_update_persistence.adoc[]
* xref:workflow.ProcedureDependency.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_main';



