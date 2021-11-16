/*
code of this procedure is managed in the dhw repository. Do not modify manually.
Use [uspgenerator].[GeneratorUsp], [uspgenerator].[GeneratorUspParameter], [uspgenerator].[GeneratorUspStep], [uspgenerator].[GeneratorUsp_SqlUsp]
*/
CREATE   PROCEDURE [repo].[usp_sync_guid_RepoObject]
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
PRINT '[repo].[usp_sync_guid_RepoObject]'
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
--
/*{"ReportUspStep":[{"Number":100,"Name":"config.fs_get_parameter_value ( 'sync enable', 'dwh' ) = 0","has_logging":1,"is_condition":1,"is_inactive":0,"is_SubProcedure":0}]}*/
IF config.fs_get_parameter_value ( 'sync enable', 'dwh' ) = 0

/*{"ReportUspStep":[{"Number":110,"Parent_Number":100,"Name":"RETURN","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":0}]}*/
BEGIN
PRINT CONCAT('usp_id;Number;Parent_Number: ',8,';',110,';',100);

RETURN
END;

/*{"ReportUspStep":[{"Number":210,"Name":"SET several RepoObject_SysObject_... via guid","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo_sys].[SysObject]","log_target_object":"[repo].[RepoObject]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',8,';',210,';',NULL);

/*
use objects with [RepoObject_guid] stored in extended properties
	
* SysObject could be renamed after previous sync
** => update SysObject properties in RepoObject
** don't change RepoObject names

*/
Update
    repo.SysObject_RepoObject_via_guid
Set
    RepoObject_SysObject_id = SysObject_id
  , RepoObject_SysObject_schema_name = SysObject_schema_name
  , RepoObject_SysObject_name = SysObject_name
  , RepoObject_SysObject_type = SysObject_type
  , RepoObject_SysObject_modify_date = modify_date
  , RepoObject_SysObject_parent_object_id = parent_object_id
  , RepoObject_is_SysObject_missing = Null
Where
    Not RepoObject_guid Is Null
    And
    (
        RepoObject_SysObject_id                  <> SysObject_id
        Or RepoObject_SysObject_id Is Null
        Or RepoObject_SysObject_schema_name      <> SysObject_schema_name
        Or RepoObject_SysObject_name             <> SysObject_name
        Or RepoObject_SysObject_type             <> SysObject_type
        Or RepoObject_SysObject_modify_date      <> modify_date
        Or RepoObject_SysObject_modify_date Is Null
        Or RepoObject_SysObject_parent_object_id <> parent_object_id
        Or RepoObject_is_SysObject_missing       = 1
        Or NOT(RepoObject_is_SysObject_missing IS NULL)
    --
    )

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'SET several RepoObject_SysObject_... via guid'
SET @source_object = '[repo_sys].[SysObject]'
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

/*{"ReportUspStep":[{"Number":310,"Name":"SET [SysObject_name] = [repo].[RepoObject].[RepoObject_guid]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo_sys].[SysObject]","log_target_object":"[repo].[RepoObject]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',8,';',310,';',NULL);

/*
in case of possible conflict when inserting missing guid because auf [UK_RepoObject__SysNames] conflicting entries get 

[SysObject_name] = [repo].[RepoObject].[RepoObject_guid]

this will allow INSERT in the next step without issues

*/
UPDATE repo.RepoObject
SET [SysObject_name] = [repo].[RepoObject].[RepoObject_guid]
FROM [repo].[RepoObject]
INNER JOIN (
 SELECT [SysObject_id]
  , [SysObject_RepoObject_guid]
  , [SysObject_schema_name]
  , [SysObject_name]
 FROM [repo].[SysObject_RepoObject_via_guid]
 WHERE
  --SysObject, which exists in database and have a RepoObject_guid assigned in extended properties 
  NOT [SysObject_RepoObject_guid] IS NULL
  --but the have not yet a RepoObject_guid assigned in [repo].[RepoObject] 
  AND [RepoObject_guid] IS NULL
 ) AS [missing_guid]
 ON [repo].[RepoObject].[SysObject_schema_name] = [missing_guid].[SysObject_schema_name]
  AND [repo].[RepoObject].[SysObject_name] = [missing_guid].[SysObject_name]

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'SET [SysObject_name] = [repo].[RepoObject].[RepoObject_guid]'
SET @source_object = '[repo_sys].[SysObject]'
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

/*{"ReportUspStep":[{"Number":410,"Name":"[SysObject_RepoObject_guid] -> [RepoObject_guid]; some name, type, …","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo_sys].[SysObject]","log_target_object":"[repo].[RepoObject]","log_flag_InsertUpdateDelete":"i"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',8,';',410,';',NULL);

/*
if a [RepoObject_guid] is stored in extended properties but missing in RepoObject, it should be restored

use objects with [RepoObject_guid] stored in extended properties
	
* restore / insert RepoObject_guid from [SysObject_RepoObject_guid]
* SysObject names are restored as SysObject names
* a conflict could happen when some RepoObject have been renamed and when they now conflict with existing RepoObject names +
  [UK_RepoObject_Names] +
  => thats why we use [RepoObject_guid] as [RepoObject_name] to avoid conflicts we will later rename [RepoObject_name] to [SysObject_name] where this is possible

*/
INSERT INTO repo.RepoObject (
 [RepoObject_guid]
 , [SysObject_id]
 , [SysObject_schema_name]
 , [SysObject_name]
 , [SysObject_type]
 , [SysObject_modify_date]
 , [SysObject_parent_object_id]
 , [RepoObject_schema_name]
 , [RepoObject_name]
 , [RepoObject_type]
 )
SELECT [SysObject_RepoObject_guid] AS [RepoObject_guid]
 , [SysObject_id]
 , [SysObject_schema_name]
 , [SysObject_name]
 , [SysObject_type]
 , [modify_date] AS [SysObject_modify_date]
 , [parent_object_id] AS [SysObject_parent_object_id]
 , [SysObject_schema_name] AS [RepoObject_schema_name]
 , [SysObject_RepoObject_guid] AS [RepoObject_name] --guid is used as name!
 , [SysObject_type] AS [RepoObject_type]
FROM repo.SysObject_RepoObject_via_guid
WHERE NOT [SysObject_RepoObject_guid] IS NULL
 AND [RepoObject_guid] IS NULL

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = '[SysObject_RepoObject_guid] -> [RepoObject_guid]; some name, type, …'
SET @source_object = '[repo_sys].[SysObject]'
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
 , @inserted = @rows
-- Logging END --

/*{"ReportUspStep":[{"Number":510,"Name":"INSERT still missing Object","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo_sys].[SysObject]","log_target_object":"[repo].[RepoObject]","log_flag_InsertUpdateDelete":"i"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',8,';',510,';',NULL);

/*
ensure all objects existing in database (as SysObject) are also included into [repo].[RepoObject]
	
* this should be SysObject without RepoObject_guid in extended properties
* when inserting they get a RepoObject_guid
* we should use this new RepoObject_guid as [RepoObject_name], but we don't know it, when we insert. That's why we use anything else unique: NEWID()

*/
INSERT INTO repo.RepoObject (
 [SysObject_id]
 , [RepoObject_schema_name]
 --, [RepoObject_name]
 , [RepoObject_type]
 , [SysObject_schema_name]
 , [SysObject_name]
 , [SysObject_type]
 , [SysObject_modify_date]
 , [SysObject_parent_object_id]
 )
SELECT [SysObject_id]
 , [SysObject_schema_name]
 --, NEWID() AS          [RepoObject_name]
 , [SysObject_type] AS [RepoObject_type]
 , [SysObject_schema_name]
 , [SysObject_name]
 , [SysObject_type]
 , [modify_date] AS [SysObject_modify_date]
 , [parent_object_id] AS [SysObject_parent_object_id]
FROM repo.SysObject_RepoObject_via_name
WHERE [RepoObject_guid] IS NULL;

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'INSERT still missing Object'
SET @source_object = '[repo_sys].[SysObject]'
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
 , @inserted = @rows
-- Logging END --

/*{"ReportUspStep":[{"Number":610,"Name":"SET [RepoObject_schema_name] = [SysObject_schema_name] , [RepoObject_name] = [SysObject_name]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject]","log_target_object":"[repo].[RepoObject]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',8,';',610,';',NULL);

/*
now we try to set [RepoObject_name] = [SysObject_name] where this is possible whithout conflicts

remaining [RepoObject_name] still could have some guid, and this needs to solved separately

*/
UPDATE repo.RepoObject
SET [RepoObject_schema_name] = [SysObject_schema_name]
 , [RepoObject_name] = [SysObject_name]
WHERE
 [has_different_sys_names] = 1
 --exclude surrogate [SysObject_name] as source
 AND [is_SysObject_name_uniqueidentifier] = 0
 --update [is_repo_managed] RepoObjects only, if [is_RepoObject_name_uniqueidentifier], to get a real name
 AND  (ISNULL([is_repo_managed], 0) = 0 OR [is_RepoObject_name_uniqueidentifier] = 1)
  --avoid not unique entries
 --do not update, if the target entry ([RepoObject_schema_name], [RepoObject_name]) exists
 --The UK would prevent that
 AND NOT EXISTS (
  SELECT [RepoObject_schema_name]
   , [RepoObject_name]
  FROM [repo].[RepoObject] AS [ro2]
  WHERE [repo].[RepoObject].[SysObject_schema_name] = [ro2].[RepoObject_schema_name]
   AND [repo].[RepoObject].[SysObject_name] = [ro2].[RepoObject_name]
  )

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'SET [RepoObject_schema_name] = [SysObject_schema_name] , [RepoObject_name] = [SysObject_name]'
SET @source_object = '[repo].[RepoObject]'
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

/*{"ReportUspStep":[{"Number":700,"Name":"[repo].[RepoObject_RequiredRepoObjectMerge]","has_logging":1,"is_condition":1,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject]","log_target_object":"[repo].[RepoObject]"}]}*/
IF (SELECT COUNT(*) FROM [repo].[RepoObject_RequiredRepoObjectMerge]) >= 1

/*{"ReportUspStep":[{"Number":710,"Parent_Number":700,"Name":"merge RepoObject","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject]","log_target_object":"[repo].[RepoObject]"}]}*/
BEGIN
PRINT CONCAT('usp_id;Number;Parent_Number: ',8,';',710,';',700);

Begin Try

    /*
based on repo.RepoObject_RequiredRepoObjectMerge
keep ro1 (which has the right RepoObject_fullname)
mark them set is_required_ObjectMerge = 1
*/
    Update
        ro
    Set
        is_required_ObjectMerge = 1
    From
        repo.RepoObject                             As ro
        Inner Join
            repo.RepoObject_RequiredRepoObjectMerge As Filter
                On
                Filter.RepoObject_guid = ro.RepoObject_guid;

    /*
delete objects with RepoObject_guid in ro2_RepoObject_guid
*/
    Delete
    ro
    From
        repo.RepoObject                             As ro
        Inner Join
            repo.RepoObject_RequiredRepoObjectMerge As Filter
                On
                Filter.ro2_RepoObject_guid = ro.RepoObject_guid;

    /*
set SysObject_name = RepoObject_name (for ro1, for marked columns)
*/
    Update
        ro
    Set
        SysObject_name = RepoObject_name
    From
        repo.RepoObject As ro
    Where
        is_required_ObjectMerge = 1;

    /*
remove marker where SysObject_name = RepoObject_name
*/
    Update
        ro
    Set
        is_required_ObjectMerge = Null
    From
        repo.RepoObject As ro
    Where
        is_required_ObjectMerge = 1
        And SysObject_name      = RepoObject_name;

End Try
Begin Catch
    Print 'issue merging RepoObject';

    Throw;
End Catch;

/*
--old code
BEGIN TRY
 UPDATE T
 SET [target_RepoObject_guid] = [S].[ro2_RepoObject_guid]
 FROM [repo].[RepoObject_persistence] [T]
 INNER JOIN [repo].[RepoObject_RequiredRepoObjectMerge] [S]
  ON [S].[RepoObject_guid] = [T].[target_RepoObject_guid]

 UPDATE T
 SET [source_RepoObject_guid] = [S].[ro2_RepoObject_guid]
 FROM [repo].[RepoObject_persistence] [T]
 INNER JOIN [repo].[RepoObject_RequiredRepoObjectMerge] [S]
  ON [S].[RepoObject_guid] = [T].[source_RepoObject_guid]

 UPDATE T
 SET [Procedure_RepoObject_guid] = [S].[ro2_RepoObject_guid]
 FROM [repo].[ProcedureInstance] [T]
 INNER JOIN [repo].[RepoObject_RequiredRepoObjectMerge] [S]
  ON [S].[RepoObject_guid] = [T].[Procedure_RepoObject_guid]

 --now [T].[RepoObject_guid] has been replaced and can be deleted
 DELETE T
 FROM [repo].[RepoObject] T
 INNER JOIN [repo].[RepoObject_RequiredRepoObjectMerge] [S]
  ON [S].[RepoObject_guid] = [T].[RepoObject_guid]
END TRY

BEGIN CATCH
 PRINT 'issue merging RepoObject';

 THROW;
END CATCH;
*/

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'merge RepoObject'
SET @source_object = '[repo].[RepoObject]'
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

-- Logging END --

/*{"ReportUspStep":[{"Number":720,"Parent_Number":710,"Name":"SET [RepoObject_schema_name] = [SysObject_schema_name] , [RepoObject_name] = [SysObject_name]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject]","log_target_object":"[repo].[RepoObject]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',8,';',720,';',710);

/*
now we try to set [RepoObject_name] = [SysObject_name] where this is possible whithout conflicts

remaining [RepoObject_name] still could have some guid, and this needs to solved separately

*/
UPDATE repo.RepoObject
SET [RepoObject_schema_name] = [SysObject_schema_name]
 , [RepoObject_name] = [SysObject_name]
WHERE
 [has_different_sys_names] = 1
 --exclude surrogate [SysObject_name] as source
 AND [is_SysObject_name_uniqueidentifier] = 0
 --update [is_repo_managed] RepoObjects only, if [is_RepoObject_name_uniqueidentifier], to get a real name
 AND  (ISNULL([is_repo_managed], 0) = 0 OR [is_RepoObject_name_uniqueidentifier] = 1)
  --avoid not unique entries
 --do not update, if the target entry ([RepoObject_schema_name], [RepoObject_name]) exists
 --The UK would prevent that
 AND NOT EXISTS (
  SELECT [RepoObject_schema_name]
   , [RepoObject_name]
  FROM [repo].[RepoObject] AS [ro2]
  WHERE [repo].[RepoObject].[SysObject_schema_name] = [ro2].[RepoObject_schema_name]
   AND [repo].[RepoObject].[SysObject_name] = [ro2].[RepoObject_name]
  )

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'SET [RepoObject_schema_name] = [SysObject_schema_name] , [RepoObject_name] = [SysObject_name]'
SET @source_object = '[repo].[RepoObject]'
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
END;

/*{"ReportUspStep":[{"Number":2000,"Name":"config.fs_get_parameter_value ( 'dwh_readonly', '' ) = 0","has_logging":1,"is_condition":1,"is_inactive":0,"is_SubProcedure":0}]}*/
IF config.fs_get_parameter_value ( 'dwh_readonly', '' ) = 0

/*{"ReportUspStep":[{"Number":2010,"Parent_Number":2000,"Name":"write RepoObject_guid into extended properties of SysObject","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject]","log_target_object":"[repo_sys].[SysObject]"}]}*/
BEGIN
PRINT CONCAT('usp_id;Number;Parent_Number: ',8,';',2010,';',2000);

Declare property_cursor Cursor Local Fast_Forward For
--
--level 1 objects which are in level1type
Select
    [T1].[RepoObject_guid]
  , [T1].[SysObject_schema_name]
  , [T2].[level1type]
  , [level1Name] = [T1].[SysObject_name]
  , [Level2Type] = Null
  , [level2Name] = Null
  , [T1].[SysObject_type]
From
    repo.SysObject_RepoObject_via_name         As T1
    Inner Join
        [configT].[type_level1type_level2type] As T2
            On
            T1.SysObject_type = T2.type
Where
    Not [T1].[RepoObject_guid] Is Null
    And
    (
        [T1].[SysObject_RepoObject_guid] Is Null
        Or [T1].[SysObject_RepoObject_guid]       <> [T1].[RepoObject_guid]
    )
    --level1Type objects
    And Not [T2].[level1type] Is Null
    --the next is redundant, these kind of Objects should not exist in the database
    And [T1].[is_SysObject_name_uniqueidentifier] = 0
Union All
Select
    [T1].[RepoObject_guid]
  , [T1].[SysObject_schema_name]
  , [level1type] = [T4].[level1type]
  , [level1Name] = [parent].[SysObject_name]
  , [Level2Type] = [T2].[level2type]
  , [level2Name] = [T1].[SysObject_name]
  , [T1].[SysObject_type]
--, [parent].[SysObject_id]
--, [parent].[SysObject_schema_name]
--, [parent].[SysObject_name]
--, [parent].[SysObject_type]
From
    repo.SysObject_RepoObject_via_name         As T1
    Inner Join
        [configT].[type_level1type_level2type] As T2
            On
            T1.SysObject_type     = T2.type

    Inner Join
        repo.SysObject_RepoObject_via_name     As parent
            On
            T1.parent_object_id   = parent.SysObject_id

    Inner Join
        [configT].[type_level1type_level2type] As T4
            On
            parent.SysObject_type = T4.type
Where
    Not [T1].[RepoObject_guid] Is Null
    And
    (
        [T1].[SysObject_RepoObject_guid] Is Null
        Or [T1].[SysObject_RepoObject_guid]       <> [T1].[RepoObject_guid]
    )
    --level2Type objects
    And Not [T2].[level2type] Is Null
    --level1 object
    --the next is redundant, these kind of Objects should not exist in the database
    And [T1].[is_SysObject_name_uniqueidentifier] = 0;

Declare
    @RepoObject_guid UniqueIdentifier
  , @schema_name     NVarchar(128)
  , @level1type      Varchar(128)
  , @level1name      NVarchar(128)
  , @level2type      Varchar(128)
  , @level2name      NVarchar(128)
  , @type            Char(2);

Set @rows = 0;

Open property_cursor;

Fetch Next From property_cursor
Into
    @RepoObject_guid
  , @schema_name
  , @level1type
  , @level1name
  , @level2type
  , @level2name
  , @type;

While @@Fetch_Status <> -1
Begin
    If @@Fetch_Status <> -2
    Begin
        Exec repo_sys.[usp_AddOrUpdateExtendedProperty]
            @name = N'RepoObject_guid'
          , @value = @RepoObject_guid
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
        @RepoObject_guid
      , @schema_name
      , @level1type
      , @level1name
      , @level2type
      , @level2name
      , @type;
End;

Close property_cursor;

Deallocate property_cursor;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'write RepoObject_guid into extended properties of SysObject'
SET @source_object = '[repo].[RepoObject]'
SET @target_object = '[repo_sys].[SysObject]'

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
END;

/*{"ReportUspStep":[{"Number":2110,"Name":"SET is_SysObject_missing = 1","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject]","log_target_object":"[repo].[RepoObject]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',8,';',2110,';',NULL);

/*
objects deleted or renamed in database but still referenced in [repo].[RepoObject] will be marked in RepoObject with is_SysObject_missing = 1

check is required by `schema_name` and `name` but not by SysObject_ID, because SysObject_ID can change when objects are recreated
*/
Update
    repo.RepoObject
Set
    is_SysObject_missing = 1
From
    repo.RepoObject As T1
Where
    Not Exists
(
    Select
        Filter.SysObject_id
    From
        repo_sys.SysObject As Filter
    Where
        t1.SysObject_schema_name = Filter.SysObject_schema_name
        And t1.SysObject_name    = Filter.SysObject_name
)
    And T1.is_ssas     = 0
    And T1.is_external = 0

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'SET is_SysObject_missing = 1'
SET @source_object = '[repo].[RepoObject]'
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

/*{"ReportUspStep":[{"Number":2115,"Name":"SET is_SysObject_missing = 0 where not missing","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject]","log_target_object":"[repo].[RepoObject]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',8,';',2115,';',NULL);

/*
some objects could still be marked as missing, but they are not missing +
but normally this should not happen
*/
Update
    repo.RepoObject
Set
    is_SysObject_missing = Null
From
    repo.RepoObject As T1
Where
    T1.is_SysObject_missing = 1
    And
    (
        Exists
(
    Select
        Filter.SysObject_id
    From
        repo_sys.SysObject As Filter
    Where
        t1.SysObject_schema_name = Filter.SysObject_schema_name
        And t1.SysObject_name    = Filter.SysObject_name
)
        Or T1.is_ssas       = 1
        Or T1.is_external   = 1
    )

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'SET is_SysObject_missing = 0 where not missing'
SET @source_object = '[repo].[RepoObject]'
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

/*{"ReportUspStep":[{"Number":2120,"Name":"DELETE; marked missing SysObject, but not is_repo_managed  = 1","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject]","log_target_object":"[repo].[RepoObject]","log_flag_InsertUpdateDelete":"d"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',8,';',2120,';',NULL);

/*
delete objects, missing in SysObjects, if they are not is_repo_managed +
if they are is_repo_managed we don't want to delete them but there should be some handling

*/
Delete
repo.RepoObject
Where
    is_SysObject_missing              = 1
    And IsNull ( is_repo_managed, 0 ) = 0
    And is_ssas                       = 0
    And is_external                   = 0

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'DELETE; marked missing SysObject, but not is_repo_managed  = 1'
SET @source_object = '[repo].[RepoObject]'
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
 , @deleted = @rows
-- Logging END --

/*{"ReportUspStep":[{"Number":2310,"Name":"UPDATE other properties, where not is_repo_managed  = 1","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo_sys].[SysObject]","log_target_object":"[repo].[RepoObject]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',8,';',2310,';',NULL);

/*
update other properties for RepoObject which are not is_repo_managed

we do this after updating guid in SysObjects to ensure the guid can be used to get [history_table_guid]

*/
Update
    ro
Set
    ro.Repo_history_table_guid = ro.history_table_guid
  , ro.Repo_temporal_type = ro.temporal_type
From
    repo.SysObject_RepoObject_via_guid As ro
Where
    --not is_repo_managed
    IsNull ( ro.is_repo_managed, 0 )  = 0
    And ro.is_ssas                    = 0
    And ro.is_external                = 0
    And
    (
        --
        1                             = 0
        --
        Or ro.Repo_history_table_guid <> ro.history_table_guid
        Or
        (
            ro.Repo_history_table_guid Is Null
            And Not ro.history_table_guid Is Null
        )
        Or
        (
            ro.history_table_guid Is Null
            And Not ro.Repo_history_table_guid Is Null
        )
        Or ro.Repo_temporal_type      <> ro.temporal_type
        Or
        (
            ro.Repo_temporal_type Is Null
            And Not ro.temporal_type Is Null
        )
        Or
        (
            ro.temporal_type Is Null
            And Not ro.Repo_temporal_type Is Null
        )
    --
    )

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'UPDATE other properties, where not is_repo_managed  = 1'
SET @source_object = '[repo_sys].[SysObject]'
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

/*{"ReportUspStep":[{"Number":3010,"Name":"DELETE [reference].[RepoObjectSource_virtual] missing Source_RepoObject_guid","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject]","log_target_object":"[reference].[RepoObjectSource_virtual]","log_flag_InsertUpdateDelete":"d"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',8,';',3010,';',NULL);

Delete
ros
From
    reference.RepoObjectSource_virtual As ros
Where
    Not Exists
(
    Select
        1
    From
        repo.RepoObject As ro
    Where
        ro.RepoObject_guid = ros.Source_RepoObject_guid
)


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'DELETE [reference].[RepoObjectSource_virtual] missing Source_RepoObject_guid'
SET @source_object = '[repo].[RepoObject]'
SET @target_object = '[reference].[RepoObjectSource_virtual]'

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

/*{"ReportUspStep":[{"Number":4010,"Name":"SET [Repo_temporal_type]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject_persistence]","log_target_object":"[repo].[RepoObject]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',8,';',4010,';',NULL);

/*
set temporal_type

* 0 = NON_TEMPORAL_TABLE
* 1 = HISTORY_TABLE
* 2 = SYSTEM_VERSIONED_TEMPORAL_TABLE
*/
Update
    ro
Set
    ro.Repo_temporal_type = rop.temporal_type
From
    repo.RepoObject                 As ro
    Inner Join
        repo.RepoObject_persistence As rop
            On
            rop.target_RepoObject_guid = ro.RepoObject_guid
Where
    ro.Repo_temporal_type <> rop.temporal_type
    Or ro.Repo_temporal_type Is Null

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'SET [Repo_temporal_type]'
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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b090291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_sync_guid_RepoObject';


GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'AdocUspSteps', @value = N'.Steps in [repo].[usp_sync_guid_RepoObject]
[cols="5,200,1,100,100,1"]
|===
|Number
|Name
|Condition
|Source
|Target
|Action

|210
|SET several RepoObject_SysObject_...
|0
|[repo_sys].[SysObject]
|[repo].[RepoObject]
|u

|310
|SET [SysObject_name] = [repo].[RepoObject].[RepoObject_guid]
|0
|[repo_sys].[SysObject]
|[repo].[RepoObject]
|u

|410
|[SysObject_RepoObject_guid] -> [RepoObject_guid]; some name, type, …
|0
|[repo_sys].[SysObject]
|[repo].[RepoObject]
|i

|510
|INSERT still missing Object
|0
|[repo_sys].[SysObject]
|[repo].[RepoObject]
|i

|610
|SET [RepoObject_schema_name] = [SysObject_schema_name] , [RepoObject_name] = [SysObject_name]
|0
|[repo].[RepoObject]
|[repo].[RepoObject]
|u

|700
|[repo].[RepoObject_RequiredRepoObjectMerge]
|1
|[repo].[RepoObject]
|[repo].[RepoObject]
|

|710
|merge RepoObject
|0
|[repo].[RepoObject]
|[repo].[RepoObject]
|

|720
|SET [RepoObject_schema_name] = [SysObject_schema_name] , [RepoObject_name] = [SysObject_name]
|0
|[repo].[RepoObject]
|[repo].[RepoObject]
|u

|1010
|write RepoObject_guid into extended properties of SysObject
|0
|[repo].[RepoObject]
|[repo_sys].[SysObject]
|

|2010
|SET is_SysObject_missing = 1
|0
|[repo].[RepoObject]
|[repo].[RepoObject]
|u

|2110
|DELETE; marked missing SysObject, but not is_repo_managed  = 1
|0
|[repo].[RepoObject]
|[repo].[RepoObject]
|d

|2210
|UPDATE other properties, where not is_repo_managed  = 1
|0
|[repo_sys].[SysObject]
|[repo].[RepoObject]
|u

|4010
|SET [Repo_temporal_type]
|0
|[repo].[RepoObject_persistence]
|[repo].[RepoObject]
|u

|4110
|MERGE INTO [repo].[ProcedureInstance]
|0
|[repo].[RepoObject]
|[repo].[ProcedureInstance]
|u

|5200
|[graph].[usp_PERSIST_RepoObject]
|0
|
|
|

|5220
|[graph].[usp_PERSIST_ProcedureInstance]
|0
|
|
|
|===
', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_sync_guid_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [config].[fs_get_parameter_value]
* [configT].[type_level1type_level2type]
* [logs].[usp_ExecutionLog_insert]
* [reference].[RepoObjectSource_virtual]
* [repo].[RepoObject]
* [repo].[RepoObject_persistence]
* [repo].[RepoObject_RequiredRepoObjectMerge]
* [repo].[SysObject_RepoObject_via_guid]
* [repo].[SysObject_RepoObject_via_name]
* [repo_sys].[SysObject]
* [repo_sys].[usp_AddOrUpdateExtendedProperty]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_sync_guid_RepoObject';




GO



GO
EXECUTE sp_addextendedproperty @name = N'ExampleUsage', @value = N'EXEC [repo].[usp_sync_guid_RepoObject]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_sync_guid_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.usp_sync_guid.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_sync_guid_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:config.fs_get_parameter_value.adoc[]
* xref:configT.type_level1type_level2type.adoc[]
* xref:logs.usp_ExecutionLog_insert.adoc[]
* xref:reference.RepoObjectSource_virtual.adoc[]
* xref:repo.RepoObject.adoc[]
* xref:repo.RepoObject_persistence.adoc[]
* xref:repo.RepoObject_RequiredRepoObjectMerge.adoc[]
* xref:repo.SysObject_RepoObject_via_guid.adoc[]
* xref:repo.SysObject_RepoObject_via_name.adoc[]
* xref:repo_sys.SysObject.adoc[]
* xref:repo_sys.usp_AddOrUpdateExtendedProperty.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_sync_guid_RepoObject';




GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_sync_guid_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_sync_guid_RepoObject';

