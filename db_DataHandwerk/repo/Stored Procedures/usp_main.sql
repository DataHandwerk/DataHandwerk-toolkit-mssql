/*
code of this procedure is managed in the dhw repository. Do not modify manually.
Use [uspgenerator].[GeneratorUsp], [uspgenerator].[GeneratorUspParameter], [uspgenerator].[GeneratorUspStep], [uspgenerator].[GeneratorUsp_SqlUsp]
*/
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
/*{"ReportUspStep":[{"Number":210,"Name":"(select config.fs_get_parameter_value ( 'sync enable', 'dwh' )) = 1","has_logging":0,"is_condition":1,"is_inactive":0,"is_SubProcedure":0}]}*/
IF (select config.fs_get_parameter_value ( 'sync enable', 'dwh' )) = 1

/*{"ReportUspStep":[{"Number":211,"Parent_Number":210,"Name":"[repo].[usp_sync_guid]","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
BEGIN
EXEC [repo].[usp_sync_guid]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id

END;

/*{"ReportUspStep":[{"Number":220,"Name":"(select config.fs_get_parameter_value ( 'sync enable', 'ssas' )) = 1","has_logging":0,"is_condition":1,"is_inactive":0,"is_SubProcedure":0}]}*/
IF (select config.fs_get_parameter_value ( 'sync enable', 'ssas' )) = 1

/*{"ReportUspStep":[{"Number":221,"Parent_Number":220,"Name":"[repo].[usp_sync_guid_ssas]","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
BEGIN
EXEC [repo].[usp_sync_guid_ssas]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id

END;

/*{"ReportUspStep":[{"Number":240,"Name":"[reference].[usp_additional_Reference]","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [reference].[usp_additional_Reference]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":250,"Name":"[reference].[usp_PERSIST_RepoObject_reference_T]","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [reference].[usp_PERSIST_RepoObject_reference_T]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":261,"Name":"[reference].[RepoObject_reference_T] set referenced_is_PersistenceSource, referencing_is_PersistenceTarget from [reference].[RepoObject_reference_persistence] ","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[reference].[RepoObject_reference_persistence]","log_target_object":"[reference].[RepoObject_reference_T]"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',2,';',261,';',NULL);

Update
    T1
Set
    referenced_is_PersistenceSource = 1
  , referencing_is_PersistenceTarget = 1
From
    reference.RepoObject_reference_T               As T1
    Inner Join
        reference.RepoObject_reference_persistence As T2
            On
            T1.referenced_RepoObject_guid      = T2.referenced_RepoObject_guid
            And T1.referencing_RepoObject_guid = T2.referencing_RepoObject_guid;

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = '[reference].[RepoObject_reference_T] set referenced_is_PersistenceSource, referencing_is_PersistenceTarget from [reference].[RepoObject_reference_persistence] '
SET @source_object = '[reference].[RepoObject_reference_persistence]'
SET @target_object = '[reference].[RepoObject_reference_T]'

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

-- Logging END --

/*{"ReportUspStep":[{"Number":262,"Name":"[reference].[RepoObject_reference_T] set referenced_is_PersistenceSource, referencing_is_PersistenceTarget, is_ReversePersistenceViaView from [reference].[RepoObject_reference_persistence_target_as_source]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[reference].[RepoObject_reference_persistence_target_as_source]","log_target_object":"[reference].[RepoObject_reference_T]"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',2,';',262,';',NULL);

Update
    T1
Set
    referenced_is_PersistenceSource = 1
  , referencing_is_PersistenceTarget = 1
  , is_ReversePersistenceViaView = 1
From
    reference.RepoObject_reference_T                                    As T1
    Inner Join
        [reference].[RepoObject_reference_persistence_target_as_source] As T2
            On
            T1.referenced_RepoObject_guid      = T2.referenced_RepoObject_guid
            And T1.referencing_RepoObject_guid = T2.referencing_RepoObject_guid;

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = '[reference].[RepoObject_reference_T] set referenced_is_PersistenceSource, referencing_is_PersistenceTarget, is_ReversePersistenceViaView from [reference].[RepoObject_reference_persistence_target_as_source]'
SET @source_object = '[reference].[RepoObject_reference_persistence_target_as_source]'
SET @target_object = '[reference].[RepoObject_reference_T]'

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

-- Logging END --

/*{"ReportUspStep":[{"Number":263,"Name":"[reference].[RepoObject_reference_T] set referenced_is_PersistenceTarget, referencing_is_PersistenceUspTargetRef","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject]","log_target_object":"[reference].[RepoObject_reference_T]"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',2,';',263,';',NULL);

Update
    T1
Set
    referenced_is_PersistenceTarget = 1
  , referencing_is_PersistenceUspTargetRef = 1
From
    reference.RepoObject_reference_T As T1
    Inner Join
        repo.RepoObject              As T2
            On
            T1.referenced_RepoObject_guid = T2.RepoObject_guid
            And T1.referencing_fullname2  = T2.usp_persistence_fullname2;

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = '[reference].[RepoObject_reference_T] set referenced_is_PersistenceTarget, referencing_is_PersistenceUspTargetRef'
SET @source_object = '[repo].[RepoObject]'
SET @target_object = '[reference].[RepoObject_reference_T]'

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

-- Logging END --

/*{"ReportUspStep":[{"Number":280,"Name":"[reference].[usp_RepoObject_ReferenceTree_insert]","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [reference].[usp_RepoObject_ReferenceTree_insert]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":290,"Name":"[reference].[usp_PERSIST_RepoObjectColumn_reference_T]","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
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


/*{"ReportUspStep":[{"Number":920,"Name":"Persistence Target: update repo.RepoObject set InheritanceType = 13 (if NULL)","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject_persistence]","log_target_object":"[repo].[RepoObject]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',2,';',920,';',NULL);

Update
    repo.RepoObject
Set
    InheritanceType = 13
Where
    ( RepoObject_type = 'U' )
    And ( InheritanceType Is Null )
    And Exists
(
    Select
        1
    From
        repo.RepoObject_persistence As rop
    Where
        rop.target_RepoObject_guid = repo.RepoObject.RepoObject_guid
)

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'Persistence Target: update repo.RepoObject set InheritanceType = 13 (if NULL)'
SET @source_object = '[repo].[RepoObject_persistence]'
SET @target_object = '[repo].[RepoObject]'

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

/*{"ReportUspStep":[{"Number":3100,"Name":"[property].[usp_external_property_import]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [property].[usp_external_property_import]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":3200,"Name":"[repo].[usp_RepoObjectProperty_collect]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [property].[usp_RepoObjectProperty_collect]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


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
* [logs].[usp_ExecutionLog_insert]
* [property].[usp_RepoObject_Inheritance]
* [property].[usp_RepoObjectColumn_Inheritance]
* [reference].[RepoObject_reference_persistence]
* [reference].[RepoObject_reference_persistence_target_as_source]
* [reference].[RepoObject_reference_T]
* [reference].[usp_PERSIST_RepoObject_reference_T]
* [reference].[usp_PERSIST_RepoObjectColumn_reference_T]
* [reference].[usp_RepoObject_ReferenceTree_insert]
* [reference].[usp_RepoObject_update_SysObjectQueryPlan]
* [reference].[usp_RepoObjectSource_FirstResultSet]
* [reference].[usp_RepoObjectSource_QueryPlan]
* [reference].[usp_update_Referencing_Count]
* [repo].[RepoObject]
* [repo].[usp_Index_ForeignKey]
* [repo].[usp_index_inheritance]
* [repo].[usp_RepoObjectColumn_update_RepoObjectColumn_column_id]
* [repo].[usp_sync_guid]
* [repo].[usp_sync_guid_ssas]
* [uspgenerator].[usp_GeneratorUsp_insert_update_persistence]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_main';




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
* xref:logs.usp_ExecutionLog_insert.adoc[]
* xref:property.usp_RepoObject_Inheritance.adoc[]
* xref:property.usp_RepoObjectColumn_Inheritance.adoc[]
* xref:reference.RepoObject_reference_persistence.adoc[]
* xref:reference.RepoObject_reference_persistence_target_as_source.adoc[]
* xref:reference.RepoObject_reference_T.adoc[]
* xref:reference.usp_PERSIST_RepoObject_reference_T.adoc[]
* xref:reference.usp_PERSIST_RepoObjectColumn_reference_T.adoc[]
* xref:reference.usp_RepoObject_ReferenceTree_insert.adoc[]
* xref:reference.usp_RepoObject_update_SysObjectQueryPlan.adoc[]
* xref:reference.usp_RepoObjectSource_FirstResultSet.adoc[]
* xref:reference.usp_RepoObjectSource_QueryPlan.adoc[]
* xref:reference.usp_update_Referencing_Count.adoc[]
* xref:repo.RepoObject.adoc[]
* xref:repo.usp_Index_ForeignKey.adoc[]
* xref:repo.usp_index_inheritance.adoc[]
* xref:repo.usp_RepoObjectColumn_update_RepoObjectColumn_column_id.adoc[]
* xref:repo.usp_sync_guid.adoc[]
* xref:repo.usp_sync_guid_ssas.adoc[]
* xref:uspgenerator.usp_GeneratorUsp_insert_update_persistence.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_main';








GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_main';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_main';

