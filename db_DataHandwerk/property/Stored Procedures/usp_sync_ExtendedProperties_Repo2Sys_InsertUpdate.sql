/*
code of this procedure is managed in the dhw repository. Do not modify manually.
Use [uspgenerator].[GeneratorUsp], [uspgenerator].[GeneratorUspParameter], [uspgenerator].[GeneratorUspStep], [uspgenerator].[GeneratorUsp_SqlUsp]
*/
CREATE   PROCEDURE [property].[usp_sync_ExtendedProperties_Repo2Sys_InsertUpdate]
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
PRINT '[property].[usp_sync_ExtendedProperties_Repo2Sys_InsertUpdate]'
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
--
/*{"ReportUspStep":[{"Number":100,"Name":"DECLARE","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":0}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',13,';',100,';',NULL);

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

/*{"ReportUspStep":[{"Number":300,"Name":"Level0-Properties - INSERT + UPDATE","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[property].[ExtendedProperty_Repo2Sys_level0]","log_target_object":"[repo_sys].[usp_AddOrUpdateExtendedProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',13,';',300,';',NULL);

Declare property_cursor Cursor Read_Only For
--
--level 0 extended properties
Select
    property_name
  , property_value
  , level0type
  , level0name
  , level1type
  , level1name
  , level2type
  , level2name
From
    property.ExtendedProperty_Repo2Sys_level0 As S
--do not change extended properties with exact match
Where
    Not Exists
(
    Select
        1
    From
        repo_sys.ExtendedProperties_ParameterForAddUpdateDrop As T
    Where
        T.property_name      = S.property_name
        And T.property_value = S.property_value
        And T.level0type     = S.level0type
        And T.level0name     = S.level0name
        And T.level1type Is Null
        And T.level1name  Is Null
        And T.level2type Is Null
        And T.level2name Is Null
);

--DECLARE @property_name NVARCHAR(128)
-- , @property_value SQL_VARIANT
-- , @schema_name NVARCHAR(128)
-- , @level0type VARCHAR(128)
-- , @level0name NVARCHAR(128)
-- , @level1type VARCHAR(128)
-- , @level1name NVARCHAR(128)
-- , @level2type VARCHAR(128)
-- , @level2name NVARCHAR(128)
Set @rows = 0;

Open property_cursor;

Fetch Next From property_cursor
Into
    @property_name
  , @property_value
  , @level0type
  , @level0name
  , @level1type
  , @level1name
  , @level2type
  , @level2name;

While @@Fetch_Status <> -1
Begin
    If @@Fetch_Status <> -2
    Begin
        Exec repo_sys.usp_AddOrUpdateExtendedProperty
            @name = @property_name
          , @value = @property_value
          , @level0type = @level0type
          , @level0name = @level0name
          , @level1type = @level1type
          , @level1name = @level1name
          , @level2type = @level2type
          , @level2name = @level2name;

        Set @rows = @rows + 1;
    End;

    Fetch Next From property_cursor
    Into
        @property_name
      , @property_value
      , @level0type
      , @level0name
      , @level1type
      , @level1name
      , @level2type
      , @level2name;
End;

Close property_cursor;
Deallocate property_cursor;

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'Level0-Properties - INSERT + UPDATE'
SET @source_object = '[property].[ExtendedProperty_Repo2Sys_level0]'
SET @target_object = '[repo_sys].[usp_AddOrUpdateExtendedProperty]'

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

/*{"ReportUspStep":[{"Number":310,"Name":"Level1-Properties - INSERT + UPDATE","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[property].[ExtendedProperty_Repo2Sys_level1]","log_target_object":"[repo_sys].[usp_AddOrUpdateExtendedProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',13,';',310,';',NULL);

Declare property_cursor Cursor Read_Only For
--
--level 1 extended properties
Select
    property_name
  , property_value
  , level0type
  , level0name
  , level1type
  , level1name
  , level2type
  , level2name
From
    property.ExtendedProperty_Repo2Sys_level1 As S
--do not change extended properties with exact match
Where
    Not Exists
(
    Select
        1
    From
        repo_sys.ExtendedProperties_ParameterForAddUpdateDrop As T
    Where
        T.property_name      = S.property_name
        And T.property_value = S.property_value
        And T.level0type     = S.level0type
        And T.level0name     = S.level0name
        And T.level1type     = S.level1type
        And T.level1name     = S.level1name
        And T.level2type Is Null
        And T.level2name Is Null
);

--DECLARE @property_name NVARCHAR(128)
-- , @property_value SQL_VARIANT
-- , @schema_name NVARCHAR(128)
-- , @level0type VARCHAR(128)
-- , @level0name NVARCHAR(128)
-- , @level1type VARCHAR(128)
-- , @level1name NVARCHAR(128)
-- , @level2type VARCHAR(128)
-- , @level2name NVARCHAR(128)
Set @rows = 0;

Open property_cursor;

Fetch Next From property_cursor
Into
    @property_name
  , @property_value
  , @level0type
  , @level0name
  , @level1type
  , @level1name
  , @level2type
  , @level2name;

While @@Fetch_Status <> -1
Begin
    If @@Fetch_Status <> -2
    Begin
        Exec repo_sys.usp_AddOrUpdateExtendedProperty
            @name = @property_name
          , @value = @property_value
          , @level0type = @level0type
          , @level0name = @level0name
          , @level1type = @level1type
          , @level1name = @level1name
          , @level2type = @level2type
          , @level2name = @level2name;

        Set @rows = @rows + 1;
    End;

    Fetch Next From property_cursor
    Into
        @property_name
      , @property_value
      , @level0type
      , @level0name
      , @level1type
      , @level1name
      , @level2type
      , @level2name;
End;

Close property_cursor;
Deallocate property_cursor;

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'Level1-Properties - INSERT + UPDATE'
SET @source_object = '[property].[ExtendedProperty_Repo2Sys_level1]'
SET @target_object = '[repo_sys].[usp_AddOrUpdateExtendedProperty]'

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

/*{"ReportUspStep":[{"Number":320,"Name":"Level2-Properties - INSERT + UPDATE","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[property].[ExtendedProperty_Repo2Sys_level2_Union]","log_target_object":"[repo_sys].[usp_AddOrUpdateExtendedProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',13,';',320,';',NULL);

Declare property_cursor Cursor Read_Only For
--
--level 2 extended properties
Select
    property_name
  , property_value
  , level0type
  , level0name
  , level1type
  , level1name
  , level2type
  , level2name
From
    property.ExtendedProperty_Repo2Sys_level2_Union As S
--do not change extended properties with exact match
Where
    Not Exists
(
    Select
        1
    From
        repo_sys.ExtendedProperties_ParameterForAddUpdateDrop As T
    Where
        T.property_name      = S.property_name
        And T.property_value = S.property_value
        And T.level0type     = S.level0type
        And T.level0name     = S.level0name
        And T.level1type     = S.level1type
        And T.level1name     = S.level1name
        And T.level2type     = S.level2type
        And T.level2name     = S.level2name
);

--DECLARE @property_name NVARCHAR(128)
-- , @property_value SQL_VARIANT
-- , @schema_name NVARCHAR(128)
-- , @level0type VARCHAR(128)
-- , @level0name NVARCHAR(128)
-- , @level1type VARCHAR(128)
-- , @level1name NVARCHAR(128)
-- , @level2type VARCHAR(128)
-- , @level2name NVARCHAR(128)
Set @rows = 0;

Open property_cursor;

Fetch Next From property_cursor
Into
    @property_name
  , @property_value
  , @level0type
  , @level0name
  , @level1type
  , @level1name
  , @level2type
  , @level2name;

While @@Fetch_Status <> -1
Begin
    If @@Fetch_Status <> -2
    Begin
        Exec repo_sys.usp_AddOrUpdateExtendedProperty
            @name = @property_name
          , @value = @property_value
          , @level0type = @level0type
          , @level0name = @level0name
          , @level1type = @level1type
          , @level1name = @level1name
          , @level2type = @level2type
          , @level2name = @level2name;

        Set @rows = @rows + 1;
    End;

    Fetch Next From property_cursor
    Into
        @property_name
      , @property_value
      , @level0type
      , @level0name
      , @level1type
      , @level1name
      , @level2type
      , @level2name;
End;

Close property_cursor;
Deallocate property_cursor;

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'Level2-Properties - INSERT + UPDATE'
SET @source_object = '[property].[ExtendedProperty_Repo2Sys_level2_Union]'
SET @target_object = '[repo_sys].[usp_AddOrUpdateExtendedProperty]'

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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5ab33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'PROCEDURE', @level1name = N'usp_sync_ExtendedProperties_Repo2Sys_InsertUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'UspParameters', @value = NULL, @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'PROCEDURE', @level1name = N'usp_sync_ExtendedProperties_Repo2Sys_InsertUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'UspExamples', @value = NULL, @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'PROCEDURE', @level1name = N'usp_sync_ExtendedProperties_Repo2Sys_InsertUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'AdocUspSteps', @value = N'.Steps in [property].[usp_sync_ExtendedProperties_Repo2Sys_InsertUpdate]
[cols="d,15a,d"]
|===
|Number|Name (Action, Source, Target)|Parent

|100
|
*DECLARE*


|

|300
|
*Level0-Properties - INSERT + UPDATE*

* u
* [property].[ExtendedProperty_Repo2Sys_level0]
* [repo_sys].[usp_AddOrUpdateExtendedProperty]

|

|310
|
*Level1-Properties - INSERT + UPDATE*

* u
* [property].[ExtendedProperty_Repo2Sys_level1]
* [repo_sys].[usp_AddOrUpdateExtendedProperty]

|

|320
|
*Level2-Properties - INSERT + UPDATE*

* u
* [property].[ExtendedProperty_Repo2Sys_level2_Union]
* [repo_sys].[usp_AddOrUpdateExtendedProperty]

|
|===
', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'PROCEDURE', @level1name = N'usp_sync_ExtendedProperties_Repo2Sys_InsertUpdate';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [logs].[usp_ExecutionLog_insert]
* [property].[ExtendedProperty_Repo2Sys_level0]
* [property].[ExtendedProperty_Repo2Sys_level1]
* [property].[ExtendedProperty_Repo2Sys_level2_Union]
* [repo_sys].[ExtendedProperties_ParameterForAddUpdateDrop]
* [repo_sys].[usp_AddOrUpdateExtendedProperty]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'PROCEDURE', @level1name = N'usp_sync_ExtendedProperties_Repo2Sys_InsertUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'ExampleUsage', @value = N'EXEC [property].[usp_sync_ExtendedProperties_Repo2Sys_InsertUpdate]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'PROCEDURE', @level1name = N'usp_sync_ExtendedProperties_Repo2Sys_InsertUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:logs.usp_ExecutionLog_insert.adoc[]
* xref:property.ExtendedProperty_Repo2Sys_level0.adoc[]
* xref:property.ExtendedProperty_Repo2Sys_level1.adoc[]
* xref:property.ExtendedProperty_Repo2Sys_level2_Union.adoc[]
* xref:repo_sys.ExtendedProperties_ParameterForAddUpdateDrop.adoc[]
* xref:repo_sys.usp_AddOrUpdateExtendedProperty.adoc[]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'PROCEDURE', @level1name = N'usp_sync_ExtendedProperties_Repo2Sys_InsertUpdate';

