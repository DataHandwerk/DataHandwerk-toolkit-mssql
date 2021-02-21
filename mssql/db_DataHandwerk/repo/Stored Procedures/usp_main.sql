CREATE   PROCEDURE [repo].[usp_main]
----keep the code between logging parameters and "START" unchanged!
---- parameters, used for logging; you don't need to care about them, but you can use them, wenn calling from SSIS or in your workflow to log the context of the procedure call
  @execution_instance_guid UNIQUEIDENTIFIER = NULL --SSIS system variable ExecutionInstanceGUID could be used, any other unique guid is also fine. If NULL, then NEWID() is used to create one
, @ssis_execution_id BIGINT = NULL --only SSIS system variable ServerExecutionID should be used, or any other consistent number system, do not mix different number systems
, @sub_execution_id INT = NULL --in case you log some sub_executions, for example in SSIS loops or sub packages
, @parent_execution_log_id BIGINT = NULL --in case a sup procedure is called, the @current_execution_log_id of the parent procedure should be propagated here. It allowes call stack analyzing
AS
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
  SELECT [event_info]
  FROM sys.dm_exec_input_buffer(@@spid, CURRENT_REQUEST_ID())
  )

IF @execution_instance_guid IS NULL
 SET @execution_instance_guid = NEWID();
--
--SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1
SET @step_name = 'start'
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

--
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


/*{"ReportUspStep":[{"Number":300,"Name":"(select [repo].[fs_get_parameter_value]('main enable usp_RepoObjectSource_FirstResultSet', DEFAULT)) = 1","has_logging":0,"is_condition":1,"is_inactive":0,"is_SubProcedure":0}]}*/
IF (select [repo].[fs_get_parameter_value]('main enable usp_RepoObjectSource_FirstResultSet', DEFAULT)) = 1

/*{"ReportUspStep":[{"Number":310,"Parent_Number":300,"Name":"[repo].[usp_RepoObjectSource_FirstResultSet]","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
BEGIN
EXEC [repo].[usp_RepoObjectSource_FirstResultSet]
--This can take a very long time
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id

END;

/*{"ReportUspStep":[{"Number":400,"Name":"(select [repo].[fs_get_parameter_value]('main enable usp_RepoObject_update_SysObjectQueryPlan', DEFAULT)) = 1","has_logging":0,"is_condition":1,"is_inactive":0,"is_SubProcedure":0}]}*/
IF (select [repo].[fs_get_parameter_value]('main enable usp_RepoObject_update_SysObjectQueryPlan', DEFAULT)) = 1

/*{"ReportUspStep":[{"Number":410,"Parent_Number":400,"Name":"[repo].[usp_RepoObject_update_SysObjectQueryPlan]","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
BEGIN
EXEC [repo].[usp_RepoObject_update_SysObjectQueryPlan]
--This can take a very long time
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id

END;

/*{"ReportUspStep":[{"Number":500,"Name":"(select [repo].[fs_get_parameter_value]('main enable usp_RepoObjectSource_QueryPlan', DEFAULT)) = 1","has_logging":0,"is_condition":1,"is_inactive":0,"is_SubProcedure":0}]}*/
IF (select [repo].[fs_get_parameter_value]('main enable usp_RepoObjectSource_QueryPlan', DEFAULT)) = 1

/*{"ReportUspStep":[{"Number":510,"Parent_Number":500,"Name":"[repo].[usp_RepoObjectSource_QueryPlan]\r\n--This can take a very long time","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
BEGIN
EXEC [repo].[usp_RepoObjectSource_QueryPlan]
--This can take a very long time
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id

END;

/*{"ReportUspStep":[{"Number":610,"Name":"[repo].[usp_update_Referencing_Count]","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [repo].[usp_update_Referencing_Count]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":710,"Name":"[repo].[usp_index_inheritance]","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [repo].[usp_index_inheritance]
--todo:
--should or could be executed several times until no new indexes are inherited
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
--This must happen later than the index logic, because the PK can change there. And this affects the order of the columns.
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":910,"Name":"[repo].[usp_GeneratorUsp_insert_update_persistence]","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [repo].[usp_GeneratorUsp_insert_update_persistence]
--RepoObjectColumn_column_id is required and should be updated before
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":2110,"Name":"MERGE [graph].[ReferencedObject]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject_reference_union]","log_target_object":"[graph].[ReferencedObject]","log_flag_InsertUpdateDelete":"u"}]}*/
MERGE [graph].[ReferencedObject]
USING (
 (
  SELECT DISTINCT
   --
   [referencing_RepoObject_guid]
   , [referenced_RepoObject_guid]
  FROM [repo].[RepoObject_reference_union]
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
SET @source_object = '[repo].[RepoObject_reference_union]'
SET @target_object = '[graph].[ReferencedObject]'

EXEC repo.usp_ExecutionLog_insert 
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

/*{"ReportUspStep":[{"Number":2120,"Name":"MERGE [graph].[ReferencingObject]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject_reference_union]","log_target_object":"[graph].[ReferencingObject]","log_flag_InsertUpdateDelete":"u"}]}*/
MERGE [graph].[ReferencingObject]
USING (
 (
  SELECT DISTINCT
   --
   [referencing_RepoObject_guid]
   , [referenced_RepoObject_guid]
  FROM [repo].[RepoObject_reference_union]
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
SET @source_object = '[repo].[RepoObject_reference_union]'
SET @target_object = '[graph].[ReferencingObject]'

EXEC repo.usp_ExecutionLog_insert 
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

/*{"ReportUspStep":[{"Number":3110,"Name":"Merge Into [repo].[ProcedureInstanceDependency] (Persistence)","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[Match_RepoObject_referenced_UspPersistence]","log_target_object":"[repo].[ProcedureInstanceDependency]","log_flag_InsertUpdateDelete":"u"}]}*/
Merge Into [repo].[ProcedureInstanceDependency] T
USING
(
    Select TFirst.id As [referencing_id]
         , TLast.id  As [referenced_id]
         , 1         As [is_PersistenceDependency]
    From repo.Match_RepoObject_referenced_UspPersistence T1
        Inner Join [repo].[ProcedureInstance]            TFirst
            On TFirst.[Procedure_RepoObject_guid] = T1.First_usp_persistence_RepoObject_guid
               And TFirst.Instance = ''
        Inner Join [repo].[ProcedureInstance]            TLast
            On TLast.[Procedure_RepoObject_guid] = T1.Last_usp_persistence_RepoObject_guid
               And TLast.Instance = ''
) S
On S.[referencing_id] = T.[referencing_id]
   And S.[referenced_id] = T.[referenced_id]
When MATCHED And T.[is_PersistenceDependency] = 0 Then
    Update Set [is_PersistenceDependency] = 1
When Not MATCHED By TARGET Then
    Insert
    (
        [referencing_id]
      , [referenced_id]
      , [is_PersistenceDependency]
    )
    Values
    (S.[referencing_id], S.[referenced_id], S.[is_PersistenceDependency])
When Not MATCHED By SOURCE Then
    Delete;

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'Merge Into [repo].[ProcedureInstanceDependency] (Persistence)'
SET @source_object = '[repo].[Match_RepoObject_referenced_UspPersistence]'
SET @target_object = '[repo].[ProcedureInstanceDependency]'

EXEC repo.usp_ExecutionLog_insert 
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

EXEC repo.usp_ExecutionLog_insert
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
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '6bcbc49c-3862-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_main';

