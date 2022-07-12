/*
code of this procedure is managed in the dhw repository. Do not modify manually.
Use [uspgenerator].[GeneratorUsp], [uspgenerator].[GeneratorUspParameter], [uspgenerator].[GeneratorUspStep], [uspgenerator].[GeneratorUsp_SqlUsp]
*/
CREATE   PROCEDURE [property].[usp_external_property_import]
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
PRINT '[property].[usp_external_property_import]'
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
--
/*{"ReportUspStep":[{"Number":100,"Name":"DECLARE","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":0}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',102,';',100,';',NULL);

Declare @RepoDatabaseName NVarchar(128)
Declare @command NVarchar(4000)

/*{"ReportUspStep":[{"Number":200,"Name":"merge into [reference].[additional_Reference] from external repositories","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_target_object":"[reference].[additional_Reference]","log_flag_InsertUpdateDelete":"i"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',102,';',200,';',NULL);

Declare db_cursor Cursor Local Fast_Forward For
Select
    RepoDatabaseName
From
    reference.additional_Reference_database_T
Where
    Not RepoDatabaseName Is Null

Open db_cursor

Fetch Next From db_cursor
Into
    @RepoDatabaseName

While @@Fetch_Status = 0
Begin
    Set @command
        = N'
Merge Into reference.additional_Reference As tgt
Using ' + @RepoDatabaseName
          + N'.reference.additional_Reference As src
On tgt.referenced_AntoraComponent = src.referenced_AntoraComponent Collate Database_Default
   And tgt.referenced_AntoraModule = src.referenced_AntoraModule Collate Database_Default
   And tgt.referenced_Schema = src.referenced_Schema Collate Database_Default
   And tgt.referenced_Object = src.referenced_Object Collate Database_Default
   And IsNull ( tgt.referenced_Column, '''' ) = IsNull ( src.referenced_Column Collate Database_Default, '''' )
   And tgt.referencing_AntoraComponent = src.referencing_AntoraComponent Collate Database_Default
   And tgt.referencing_AntoraModule = src.referencing_AntoraModule Collate Database_Default
   And tgt.referencing_Schema = src.referencing_Schema Collate Database_Default
   And tgt.referencing_Object = src.referencing_Object Collate Database_Default
   And IsNull ( tgt.referencing_Column, '''' ) = IsNull ( src.referencing_Column Collate Database_Default, '''' )
When Not Matched By Target And
--only related to the current Component and Module	
(
    src.referenced_AntoraComponent Collate Database_Default = config.fs_get_parameter_value ( ''AntoraComponent'', '''' )
    And src.referenced_AntoraModule Collate Database_Default = config.fs_get_parameter_value ( ''AntoraModule'', '''' )
    Or src.referencing_AntoraComponent Collate Database_Default = config.fs_get_parameter_value ( ''AntoraComponent'', '''' )
       And src.referencing_AntoraModule Collate Database_Default = config.fs_get_parameter_value ( ''AntoraModule'', '''' )
)
    Then Insert
         (
             referenced_AntoraComponent
           , referenced_AntoraModule
           , referenced_Schema
           , referenced_Object
           , referenced_Column
           , referencing_AntoraComponent
           , referencing_AntoraModule
           , referencing_Schema
           , referencing_Object
           , referencing_Column
         )
         Values
             (
                 src.referenced_AntoraComponent
               , src.referenced_AntoraModule
               , src.referenced_Schema
               , src.referenced_Object
               , src.referenced_Column
               , src.referencing_AntoraComponent
               , src.referencing_AntoraModule
               , src.referencing_Schema
               , src.referencing_Object
               , src.referencing_Column
             )
Output
    $action
  , inserted.*;
'

    Print @command

    Execute sys.sp_executesql @command

    Fetch Next From db_cursor
    Into
        @RepoDatabaseName
End

Close db_cursor
Deallocate db_cursor

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'merge into [reference].[additional_Reference] from external repositories'
SET @source_object = NULL
SET @target_object = '[reference].[additional_Reference]'

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

/*{"ReportUspStep":[{"Number":240,"Name":"[reference].[usp_additional_Reference]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [reference].[usp_additional_Reference]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":400,"Name":"[property].[external_RepoObjectProperty]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_target_object":"[property].[external_RepoObjectProperty]","log_flag_InsertUpdateDelete":"i"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',102,';',400,';',NULL);

Truncate Table property.external_RepoObjectProperty

Declare db_cursor Cursor Local Fast_Forward For
Select
    RepoDatabaseName
From
    reference.additional_Reference_database_T
Where
    Not RepoDatabaseName Is Null

Open db_cursor

Fetch Next From db_cursor
Into
    @RepoDatabaseName

While @@Fetch_Status = 0
Begin
    Set @command
        = N'
Insert Into property.external_RepoObjectProperty
(
    RepoObject_guid
  , property_name
  , property_value
  , repo_database
  , dwh_database
  , AntoraComponent
  , AntoraModule
  , RepoObject_schema_name
  , RepoObject_name
)
Select
    aro.RepoObject_guid
  , src.property_name
  , src.property_value
  , src.repo_database
  , src.dwh_database
  , src.AntoraComponent
  , src.AntoraModule
  , src.RepoObject_schema_name
  , src.RepoObject_name
From
    ----[RepoDatabaseName] needs to used dynamicaly from reference.additional_Reference_database_T.[RepoDatabaseName]
    --dhw_self.property.RepoObjectProperty_ForUpdate As src
' + @RepoDatabaseName
          + N'.property.RepoObjectProperty_ForUpdate As src
    Left Join
        property.PropertyName_RepoObject_T         As pn
            On
            pn.property_name        = src.property_name Collate Database_Default

    Left Join
        reference.additional_Reference_Object_T    As aro
            On
            aro.SchemaName          = src.RepoObject_schema_name Collate Database_Default
            And aro.ObjectName      = src.RepoObject_name Collate Database_Default
            And aro.AntoraComponent = src.AntoraComponent Collate Database_Default
            And aro.AntoraModule    = src.AntoraModule Collate Database_Default
--database is also important, it will be set when generating the dynamic sql
--and one combination (AntoraComponent, AntoraModule) hs only one [DatabaseName] and [RepoDatabaseName]
Where
    pn.has_inheritance = 1
    And Not aro.RepoObject_guid Is Null
'

    Print @command

    Execute sys.sp_executesql @command

    Fetch Next From db_cursor
    Into
        @RepoDatabaseName
End

Close db_cursor
Deallocate db_cursor


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = '[property].[external_RepoObjectProperty]'
SET @source_object = NULL
SET @target_object = '[property].[external_RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":420,"Name":"[property].[usp_PERSIST_RepoObjectProperty_external_tgt]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [property].[usp_PERSIST_RepoObjectProperty_external_tgt]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":500,"Name":"[property].[external_RepoObjectColumnProperty]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_target_object":"[property].[external_RepoObjectColumnProperty]","log_flag_InsertUpdateDelete":"i"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',102,';',500,';',NULL);

Truncate Table property.external_RepoObjectColumnProperty

Declare db_cursor Cursor Local Fast_Forward For
Select
    RepoDatabaseName
From
    reference.additional_Reference_database_T
Where
    Not RepoDatabaseName Is Null

Open db_cursor

Fetch Next From db_cursor
Into
    @RepoDatabaseName

While @@Fetch_Status = 0
Begin
    Set @command
        = N'
Insert Into property.external_RepoObjectColumnProperty
(
    RepoObjectColumn_guid
  , property_name
  , property_value
  , repo_database
  , dwh_database
  , AntoraComponent
  , AntoraModule
  , RepoObject_schema_name
  , RepoObject_name
  , RepoObjectColumn_name
)
Select
    aroc.RepoObjectColumn_guid
  , src.property_name
  , src.property_value
  , src.repo_database
  , src.dwh_database
  , src.AntoraComponent
  , src.AntoraModule
  , src.RepoObject_schema_name
  , src.RepoObject_name
  , src.RepoObjectColumn_name
From
    ----[RepoDatabaseName] needs to used dynamicaly from reference.additional_Reference_database_T.[RepoDatabaseName]
    --dhw_self.property.RepoObjectColumnProperty_ForUpdate As src
' + @RepoDatabaseName
          + N'.property.RepoObjectColumnProperty_ForUpdate As src
    Left Join
        property.PropertyName_RepoObjectColumn_T         As pn
            On
            pn.property_name        = src.property_name Collate Database_Default

    Left Join
        reference.additional_Reference_ObjectColumn_T    As aroc
            On
            aroc.SchemaName          = src.RepoObject_schema_name Collate Database_Default
            And aroc.ObjectName      = src.RepoObject_name Collate Database_Default
            And aroc.ColumnName      = src.RepoObjectColumn_name Collate Database_Default
            And aroc.AntoraComponent = src.AntoraComponent Collate Database_Default
            And aroc.AntoraModule    = src.AntoraModule Collate Database_Default
--database is also important, it will be set when generating the dynamic sql
--and one combination (AntoraComponent, AntoraModule) hs only one [DatabaseName] and [RepoDatabaseName]
Where
    pn.has_inheritance = 1
    And Not aroc.RepoObjectColumn_guid Is Null
'

    Print @command

    Execute sys.sp_executesql @command

    Fetch Next From db_cursor
    Into
        @RepoDatabaseName
End

Close db_cursor
Deallocate db_cursor

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = '[property].[external_RepoObjectColumnProperty]'
SET @source_object = NULL
SET @target_object = '[property].[external_RepoObjectColumnProperty]'

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

/*{"ReportUspStep":[{"Number":520,"Name":"[property].[usp_PERSIST_RepoObjectColumnProperty_external_tgt]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [property].[usp_PERSIST_RepoObjectColumnProperty_external_tgt]
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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7f28f9b8-521d-ec11-8522-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'PROCEDURE', @level1name = N'usp_external_property_import';

