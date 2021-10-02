/*
code of this procedure is managed in the dhw repository. Do not modify manually.
Use [uspgenerator].[GeneratorUsp], [uspgenerator].[GeneratorUspParameter], [uspgenerator].[GeneratorUspStep], [uspgenerator].[GeneratorUsp_SqlUsp]
*/
CREATE   PROCEDURE [property].[usp_sync_ExtendedProperties_Sys2Repo_InsertUpdate]
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
PRINT '[property].[usp_sync_ExtendedProperties_Sys2Repo_InsertUpdate]'
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
--
/*{"ReportUspStep":[{"Number":100,"Name":"DECLARE","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":0}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',12,';',100,';',NULL);

DECLARE
 --
 @property_name NVARCHAR(128)
 , @property_value NVARCHAR(4000)
 , @schema_name NVARCHAR(128)
 , @level0type VARCHAR(128)
 , @level0name NVARCHAR(128)
 , @level1type VARCHAR(128)
 , @level1name NVARCHAR(128)
 , @level2type VARCHAR(128)
 , @level2name NVARCHAR(128)

/*{"ReportUspStep":[{"Number":310,"Name":"property.RepoObjectProperty - INSERT","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[property].[RepoObjectProperty_sys_repo]","log_target_object":"[property].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"i"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',12,';',310,';',NULL);

Insert Into property.RepoObjectProperty
(
    RepoObject_guid
  , property_name
  , property_value
)
Select
    Distinct
    RepoObject_guid
  , property_name
  , CAST(property_value as NVarchar(max))
From
    property.RepoObjectProperty_sys_repo As T1
Where
    RepoObjectProperty_id Is Null;

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'property.RepoObjectProperty - INSERT'
SET @source_object = '[property].[RepoObjectProperty_sys_repo]'
SET @target_object = '[property].[RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":320,"Name":"property.RepoObjectProperty - UPDATE","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[property].[RepoObjectProperty_sys_repo]","log_target_object":"[property].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',12,';',320,';',NULL);

/*
update table [property].[RepoObjectProperty] via view

*/
Update
    property.RepoObjectProperty_sys_repo
Set
    RepoObjectProperty_property_value = CAST(property_value as NVarchar(4000))
Where
    Not RepoObjectProperty_id Is Null
    And RepoObjectProperty_property_value <> CAST(property_value as NVarchar(4000));

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'property.RepoObjectProperty - UPDATE'
SET @source_object = '[property].[RepoObjectProperty_sys_repo]'
SET @target_object = '[property].[RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":410,"Name":"property.RepoObjectColumnProperty - INSERT","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[property].[RepoObjectColumnProperty_sys_repo]","log_target_object":"[property].[RepoObjectColumnProperty]","log_flag_InsertUpdateDelete":"i"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',12,';',410,';',NULL);

Insert Into property.RepoObjectColumnProperty
(
    RepoObjectColumn_guid
  , property_name
  , property_value
)
Select
    Distinct
    RepoObjectColumn_guid
  , property_name
  , CAST(property_value as NVarchar(max))
From
    property.RepoObjectColumnProperty_sys_repo As T1
Where
    RepoObjectColumnProperty_id Is Null;

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'property.RepoObjectColumnProperty - INSERT'
SET @source_object = '[property].[RepoObjectColumnProperty_sys_repo]'
SET @target_object = '[property].[RepoObjectColumnProperty]'

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

/*{"ReportUspStep":[{"Number":420,"Name":"property.RepoObjectColumnProperty - UPDATE","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[property].[RepoObjectColumnProperty_sys_repo]","log_target_object":"[property].[RepoObjectColumnProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',12,';',420,';',NULL);

/*
update table [property].[RepoObjectColumnProperty] via view

*/
Update
    property.RepoObjectColumnProperty_sys_repo
Set
    RepoObjectColumnProperty_property_value = CAST(property_value as NVarchar(4000))
Where
    Not RepoObjectColumnProperty_id Is Null
    And RepoObjectColumnProperty_property_value <> CAST(property_value as NVarchar(4000));

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'property.RepoObjectColumnProperty - UPDATE'
SET @source_object = '[property].[RepoObjectColumnProperty_sys_repo]'
SET @target_object = '[property].[RepoObjectColumnProperty]'

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

/*{"ReportUspStep":[{"Number":520,"Name":"UPDATE [repo].[RepoSchema] - [RepoSchema_ms_description]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo_sys].[ExtendedProperties]","log_target_object":"[repo].[RepoSchema]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',12,';',520,';',NULL);

Update
    rs
Set
    RepoSchema_ms_description = Cast(ses.property_value As NVarchar(4000))
From
    repo.RepoSchema                 rs
    Inner Join
        repo_sys.ExtendedProperties As ses
            On
            ses.major_id          = rs.SysSchema_id
            And ses.class         = 3 --schema
            And ses.property_name = 'MS_Description'
Where
    rs.RepoSchema_ms_description Is Null
    Or rs.RepoSchema_ms_description <> ses.property_value;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'UPDATE [repo].[RepoSchema] - [RepoSchema_ms_description]'
SET @source_object = '[repo_sys].[ExtendedProperties]'
SET @target_object = '[repo].[RepoSchema]'

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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '59b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'PROCEDURE', @level1name = N'usp_sync_ExtendedProperties_Sys2Repo_InsertUpdate';


GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'AdocUspSteps', @value = N'.Steps in [property].[usp_sync_ExtendedProperties_Sys2Repo_InsertUpdate]
[cols="d,15a,d"]
|===
|Number|Name (Action, Source, Target)|Parent

|100
|
*DECLARE*



.Statement
[%collapsible]
=====
[source,sql]
----
DECLARE
 --
 @property_name NVARCHAR(128)
 , @property_value SQL_VARIANT
 , @schema_name NVARCHAR(128)
 , @level0type VARCHAR(128)
 , @level0name NVARCHAR(128)
 , @level1type VARCHAR(128)
 , @level1name NVARCHAR(128)
 , @level2type VARCHAR(128)
 , @level2name NVARCHAR(128)
----
=====

|


|310
|
*property.RepoObjectProperty - INSERT*

* i
* [property].[RepoObjectProperty_sys_repo]
* [property].[RepoObjectProperty]


.Statement
[%collapsible]
=====
[source,sql]
----
Insert Into property.RepoObjectProperty
(
    RepoObject_guid
  , property_name
  , property_value
)
Select
    Distinct
    RepoObject_guid
  , property_name
  , CAST(property_value as NVarchar(max))
From
    property.RepoObjectProperty_sys_repo As T1
Where
    RepoObjectProperty_id Is Null;
----
=====

|


|320
|
*property.RepoObjectProperty - UPDATE*

* u
* [property].[RepoObjectProperty_sys_repo]
* [property].[RepoObjectProperty]


update table [property].[RepoObjectProperty] via view


.Statement
[%collapsible]
=====
[source,sql]
----
Update
    property.RepoObjectProperty_sys_repo
Set
    RepoObjectProperty_property_value = CAST(property_value as NVarchar(4000))
Where
    Not RepoObjectProperty_id Is Null
    And RepoObjectProperty_property_value <> CAST(property_value as NVarchar(4000));
----
=====

|


|410
|
*property.RepoObjectColumnProperty - INSERT*

* i
* [property].[RepoObjectColumnProperty_sys_repo]
* [property].[RepoObjectColumnProperty]


.Statement
[%collapsible]
=====
[source,sql]
----
Insert Into property.RepoObjectColumnProperty
(
    RepoObjectColumn_guid
  , property_name
  , property_value
)
Select
    Distinct
    RepoObjectColumn_guid
  , property_name
  , CAST(property_value as NVarchar(max))
From
    property.RepoObjectColumnProperty_sys_repo As T1
Where
    RepoObjectColumnProperty_id Is Null;
----
=====

|


|420
|
*property.RepoObjectColumnProperty - UPDATE*

* u
* [property].[RepoObjectColumnProperty_sys_repo]
* [property].[RepoObjectColumnProperty]


update table [property].[RepoObjectColumnProperty] via view


.Statement
[%collapsible]
=====
[source,sql]
----
Update
    property.RepoObjectColumnProperty_sys_repo
Set
    RepoObjectColumnProperty_property_value = CAST(property_value as NVarchar(4000))
Where
    Not RepoObjectColumnProperty_id Is Null
    And RepoObjectColumnProperty_property_value <> CAST(property_value as NVarchar(4000));
----
=====

|


|520
|
*UPDATE [repo].[RepoSchema] - [RepoSchema_ms_description]*

* u
* [repo_sys].[ExtendedProperties]
* [repo].[RepoSchema]


.Statement
[%collapsible]
=====
[source,sql]
----
Update
    rs
Set
    RepoSchema_ms_description = Cast(ses.property_value As NVarchar(4000))
From
    repo.RepoSchema                 rs
    Inner Join
        repo_sys.ExtendedProperties As ses
            On
            ses.major_id          = rs.SysSchema_id
            And ses.class         = 3 --schema
            And ses.property_name = ''MS_Description''
Where
    rs.RepoSchema_ms_description Is Null
    Or rs.RepoSchema_ms_description <> ses.property_value;

----
=====

|

|===
', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'PROCEDURE', @level1name = N'usp_sync_ExtendedProperties_Sys2Repo_InsertUpdate';






GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [logs].[usp_ExecutionLog_insert]
* [property].[RepoObjectColumnProperty]
* [property].[RepoObjectColumnProperty_sys_repo]
* [property].[RepoObjectProperty]
* [property].[RepoObjectProperty_sys_repo]
* [repo].[RepoSchema]
* [repo_sys].[ExtendedProperties]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'PROCEDURE', @level1name = N'usp_sync_ExtendedProperties_Sys2Repo_InsertUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'ExampleUsage', @value = N'EXEC [property].[usp_sync_ExtendedProperties_Sys2Repo_InsertUpdate]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'PROCEDURE', @level1name = N'usp_sync_ExtendedProperties_Sys2Repo_InsertUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:logs.usp_ExecutionLog_insert.adoc[]
* xref:property.RepoObjectColumnProperty.adoc[]
* xref:property.RepoObjectColumnProperty_sys_repo.adoc[]
* xref:property.RepoObjectProperty.adoc[]
* xref:property.RepoObjectProperty_sys_repo.adoc[]
* xref:repo.RepoSchema.adoc[]
* xref:repo_sys.ExtendedProperties.adoc[]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'PROCEDURE', @level1name = N'usp_sync_ExtendedProperties_Sys2Repo_InsertUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'PROCEDURE', @level1name = N'usp_sync_ExtendedProperties_Sys2Repo_InsertUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'PROCEDURE', @level1name = N'usp_sync_ExtendedProperties_Sys2Repo_InsertUpdate';

