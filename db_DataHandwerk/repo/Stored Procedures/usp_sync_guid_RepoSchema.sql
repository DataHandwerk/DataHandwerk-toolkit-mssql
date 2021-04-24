CREATE   PROCEDURE [repo].[usp_sync_guid_RepoSchema]
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
PRINT '[repo].[usp_sync_guid_RepoSchema]'
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
--
/*{"ReportUspStep":[{"Number":210,"Name":"SET several RepoSchema_SysSchema_...","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo_sys].[SysSchema]","log_target_object":"[repo].[RepoSchema]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',40,';',210,';',NULL);

/*
use Schemas with [RepoSchema_guid] stored in extended properties
	
- SysSchema could be renamed after previous sync
	- => update SysSchema properties in RepoSchema
	- don't change RepoSchema names
*/
Update
    repo.SysSchema_RepoSchema_via_guid
Set
    RepoSchema_SysSchema_id = SysSchema_id
  , RepoSchema_SysSchema_name = SysSchema_name
  , RepoSchema_is_SysSchema_missing = Null
Where
    Not RepoSchema_guid Is Null
    And
    (
        RepoSchema_SysSchema_id      <> SysSchema_id
        Or RepoSchema_SysSchema_id Is Null
        Or RepoSchema_SysSchema_name <> SysSchema_name
    --
    );

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'SET several RepoSchema_SysSchema_...'
SET @source_object = '[repo_sys].[SysSchema]'
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

/*{"ReportUspStep":[{"Number":310,"Name":"SET [SysSchema_name] = [repo].[RepoSchema].[RepoSchema_guid]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo_sys].[SysSchema]","log_target_object":"[repo].[RepoSchema]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',40,';',310,';',NULL);

/*
in case of possible conflict when inserting missing guid because auf [UK_RepoSchema__SysNames] conflicting entries get 
[SysSchema_name] = [repo].[RepoSchema].[RepoSchema_guid]
this will allow INSERT in the next step without issues
*/
Update
    repo.RepoSchema
Set
    SysSchema_name = repo.RepoSchema.RepoSchema_guid
From
    repo.RepoSchema
    Inner Join
    (
        Select
            SysSchema_id
          , SysSchema_RepoSchema_guid
          , SysSchema_name
        From
            repo.SysSchema_RepoSchema_via_guid
        Where
            --SysSchema, which exists in database and have a RepoSchema_guid assigned in extended properties 
            Not SysSchema_RepoSchema_guid Is Null
            --but the have not yet a RepoSchema_guid assigned in [repo].[RepoSchema] 
            And RepoSchema_guid Is Null
    ) As missing_guid
        On
        repo.RepoSchema.SysSchema_name = [missing_guid].[SysSchema_name];

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'SET [SysSchema_name] = [repo].[RepoSchema].[RepoSchema_guid]'
SET @source_object = '[repo_sys].[SysSchema]'
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

/*{"ReportUspStep":[{"Number":410,"Name":"[SysSchema_RepoSchema_guid] -> [RepoSchema_guid]; name","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo_sys].[SysSchema]","log_target_object":"[repo].[RepoSchema]","log_flag_InsertUpdateDelete":"i"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',40,';',410,';',NULL);

/*
if a [RepoSchema_guid] is stored in extended properties but missing in RepoSchema, it should be restored
use schemas with [RepoSchema_guid] stored in extended properties
	
- restore / insert RepoSchema_guid from [SysSchema_RepoSchema_guid]
- SysSchema names are restored as SysSchema names
- a conflict could happen when some RepoSchema have been renamed and when they now conflict with existing RepoSchema names  
	[UK_RepoSchema_Names]
	=> thats why we use [RepoSchema_guid] as [RepoSchema_name] to avoid conflicts we will later rename [RepoSchema_name] to [SysSchema_name] where this is possible
*/
Insert Into repo.RepoSchema
(
    RepoSchema_guid
  , SysSchema_id
  , SysSchema_name
  , RepoSchema_name
)
Select
    SysSchema_RepoSchema_guid As RepoSchema_guid
  , SysSchema_id
  , SysSchema_name
  , SysSchema_RepoSchema_guid As RepoSchema_name --guid is used as name!
From
    repo.SysSchema_RepoSchema_via_guid
Where
    Not SysSchema_RepoSchema_guid Is Null
    And RepoSchema_guid Is Null;

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = '[SysSchema_RepoSchema_guid] -> [RepoSchema_guid]; name'
SET @source_object = '[repo_sys].[SysSchema]'
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
 , @inserted = @rows
-- Logging END --

/*{"ReportUspStep":[{"Number":510,"Name":"INSERT still missing Schema","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo_sys].[SysSchema]","log_target_object":"[repo].[RepoSchema]","log_flag_InsertUpdateDelete":"i"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',40,';',510,';',NULL);

/*
ensure all schemas existing in database (as SysSchema) are also included into [repo].[RepoSchema]
	
- this should be SysSchema without RepoSchema_guid in extended properties
- when inserting they get a RepoSchema_guid
- we should use this new RepoSchema_guid as [RepoSchema_name], but we don't know it, when we insert. That's why we use anything else unique: NEWID()
*/
Insert Into repo.RepoSchema
(
    SysSchema_id
  --, [RepoSchema_name]
  , SysSchema_name
)
Select
    SysSchema_id
  --, NEWID() AS          [RepoSchema_name]
  , SysSchema_name
From
    repo.SysSchema_RepoSchema_via_name
Where
    RepoSchema_guid Is Null;

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'INSERT still missing Schema'
SET @source_object = '[repo_sys].[SysSchema]'
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
 , @inserted = @rows
-- Logging END --

/*{"ReportUspStep":[{"Number":610,"Name":"SET [RepoSchema_name] = [SysSchema_name]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoSchema]","log_target_object":"[repo].[RepoSchema]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',40,';',610,';',NULL);

--now we try to set [RepoSchema_name] = [SysSchema_name] where this is possible whithout conflicts
--remaining [RepoSchema_name] still could have some guid, and this needs to solved separately
Update
    repo.RepoSchema
Set
    RepoSchema_name = SysSchema_name
Where
    has_different_sys_names                 = 1
    --exclude surrogate [SysSchema_name] as source
    And is_SysSchema_name_uniqueidentifier  = 0
    And is_RepoSchema_name_uniqueidentifier = 1
    --avoid not unique entries
    --do not update, if the target entry ([RepoSchema_name]) exists
    --The UK would prevent that
    And Not Exists
(
    Select
        RepoSchema_name
    From
        repo.RepoSchema As ro2
    Where
        repo.RepoSchema.SysSchema_name = [ro2].[RepoSchema_name]
);

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'SET [RepoSchema_name] = [SysSchema_name]'
SET @source_object = '[repo].[RepoSchema]'
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

/*{"ReportUspStep":[{"Number":1010,"Name":"write RepoSchema_guid into extended properties of SysSchema","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoSchema]","log_target_object":"[repo_sys].[SysSchema]"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',40,';',1010,';',NULL);

Declare property_cursor Cursor Local Fast_Forward For
--
--level 1 objects which are in level1type
Select
    T1.RepoSchema_guid
  , T1.SysSchema_name
  , level1type = Null
  , level1Name = Null
  , Level2Type = Null
  , level2Name = Null
From
    repo.SysSchema_RepoSchema_via_name As T1
Where
    Not T1.RepoSchema_guid Is Null
    And T1.SysSchema_RepoSchema_guid Is Null
    --the next is redundant, these kind of Objects should not exist in the database
    And T1.is_SysSchema_name_uniqueidentifier = 0;

Declare
    @RepoSchema_guid UniqueIdentifier
  , @schema_name     NVarchar(128)
  , @level1type      Varchar(128)
  , @level1name      NVarchar(128)
  , @level2type      Varchar(128)
  , @level2name      NVarchar(128);

Set @rows = 0;

Open property_cursor;

Fetch Next From property_cursor
Into
    @RepoSchema_guid
  , @schema_name
  , @level1type
  , @level1name
  , @level2type
  , @level2name;

While @@Fetch_Status <> -1
Begin
    If @@Fetch_Status <> -2
    Begin
        Exec repo_sys.usp_AddOrUpdateExtendedProperty
            @name = N'RepoSchema_guid'
          , @value = @RepoSchema_guid
          , @level0type = N'Schema'
          , @level0name = @schema_name
          , @level1type = @level1type
          , @level1name = @level1name
          , @level2type = @level2type
          , @level2name = @level2name;

        Set @rows = @rows + 1;
    End;

    Fetch Next From property_cursor
    Into
        @RepoSchema_guid
      , @schema_name
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
SET @step_name = 'write RepoSchema_guid into extended properties of SysSchema'
SET @source_object = '[repo].[RepoSchema]'
SET @target_object = '[repo_sys].[SysSchema]'

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

/*{"ReportUspStep":[{"Number":2010,"Name":"SET is_SysSchema_missing = 1","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoSchema]","log_target_object":"[repo].[RepoSchema]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',40,';',2010,';',NULL);

/*
objects deleted or renamed in database but still referenced in [repo].[RepoSchema] will be marked in RepoSchema with is_SysSchema_missing = 1
check is required by `schema_name` and `name` but not by SysSchema_ID, because SysSchema_ID can change when objects are recreated
*/
Update
    repo.RepoSchema
Set
    is_SysSchema_missing = 1
From
    repo.RepoSchema T1
Where
    Not Exists
(
    Select
        SysSchema_id
    From
        repo_sys.SysSchema As Filter
    Where
        t1.SysSchema_name = Filter.SysSchema_name
);

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'SET is_SysSchema_missing = 1'
SET @source_object = '[repo].[RepoSchema]'
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

/*{"ReportUspStep":[{"Number":2110,"Name":"DELETE; marked missing SysSchema","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoSchema]","log_target_object":"[repo].[RepoSchema]","log_flag_InsertUpdateDelete":"d"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',40,';',2110,';',NULL);

/*
delete objects, missing in SysSchemas
*/
Delete
repo.RepoSchema
Where
    is_SysSchema_missing = 1;

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'DELETE; marked missing SysSchema'
SET @source_object = '[repo].[RepoSchema]'
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
 , @deleted = @rows
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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b60747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_sync_guid_RepoSchema';

