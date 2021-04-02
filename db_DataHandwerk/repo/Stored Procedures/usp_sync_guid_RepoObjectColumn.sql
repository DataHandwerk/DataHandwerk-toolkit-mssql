﻿CREATE   PROCEDURE [repo].[usp_sync_guid_RepoObjectColumn]
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
PRINT '[repo].[usp_sync_guid_RepoObjectColumn]'
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
--
/*{"ReportUspStep":[{"Number":100,"Name":"intro","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":0}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',6,';',100,';',NULL);

/*
ATTENTION!
Column guid syncronization requires existing RepoObject guid synchronization (all RepoObject in the database need a RepoObject_guid)
because RepoObject_guid is used to join
	
=>
[repo_sys].[usp_sync_guid_RepoObject]
must be executed _before_ to ensure all RepoObject guid are synchronized
*/

/*{"ReportUspStep":[{"Number":210,"Name":"UPDATE repo_sys.SysColumn_RepoObjectColumn_via_RepoObjectColumn_guid","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo_sys].[SysColumn]","log_target_object":"[repo].[RepoObjectColumn]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',6,';',210,';',NULL);

/*
use objects with [RepoObjectColumn_guid] stored in extended properties
	
- SysObjectColumn could be renamed after previous sync
	- => update SysObjectColum properties in RepoObjectColumn
	- don't change RepoObjectColumn names
*/
UPDATE repo.SysColumn_RepoObjectColumn_via_guid
SET [SysObjectColumn_name] = [SysObject_column_name]
 , [SysObjectColumn_column_id] = [SysObject_column_id]
 , [RepoObject_guid] = [SysObject_RepoObject_guid]
WHERE NOT [RepoObjectColumn_guid] IS NULL
 AND (
  --
  [SysObjectColumn_name] <> [SysObject_column_name]
  OR [SysObjectColumn_name] IS NULL
  OR [SysObjectColumn_column_id] <> [SysObject_column_id]
  OR [SysObjectColumn_column_id] IS NULL
  OR [RepoObject_guid] <> [SysObject_RepoObject_guid]
  ----
  );

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'UPDATE repo_sys.SysColumn_RepoObjectColumn_via_RepoObjectColumn_guid'
SET @source_object = '[repo_sys].[SysColumn]'
SET @target_object = '[repo].[RepoObjectColumn]'

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

/*{"ReportUspStep":[{"Number":310,"Name":"SET [SysObjectColumn_name] = [RepoObjectColumn_guid] (to avoid conflict in the next INSERT step)","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObjectColumn]","log_target_object":"[repo].[RepoObjectColumn]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',6,';',310,';',NULL);

/*
in case of possible conflict when inserting missing guid because auf [UK_RepoObjectColumn__SysNames] conflicting entries get 
[SysObjectColumn_name] = [repo].[RepoObjectColumn].[RepoObjectColumn_guid]
this will allow INSERT in the next step without issues
*/
UPDATE repo.RepoObjectColumn
SET [SysObjectColumn_name] = [repo].[RepoObjectColumn].[RepoObjectColumn_guid]
FROM [repo].[RepoObjectColumn]
INNER JOIN (
 SELECT [SysObject_id]
  , [SysObject_RepoObject_guid]
  , [SysObject_schema_name]
  , [SysObject_name]
  , [SysObject_column_name]
  , [SysObjectColumn_column_id]
  , [SysObject_RepoObjectColumn_guid]
  , [RepoObject_guid]
  , [RepoObjectColumn_guid]
 FROM [repo].[SysColumn_RepoObjectColumn_via_guid]
 WHERE
  --SysObjectColumns, which exists in database and have a RepoObjectColumn_guid assigned in extended properties 
  NOT [SysObject_RepoObjectColumn_guid] IS NULL
  --but the have not yet a RepoObjectColumn_guid assigned in [repo].[RepoObjectColumns] 
  AND [RepoObjectColumn_guid] IS NULL
 ) AS [missing_guid]
 ON [repo].[RepoObjectColumn].[RepoObject_guid] = [missing_guid].[RepoObject_guid]
  AND [repo].[RepoObjectColumn].[SysObjectColumn_name] = [missing_guid].[SysObject_column_name]

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'SET [SysObjectColumn_name] = [RepoObjectColumn_guid] (to avoid conflict in the next INSERT step)'
SET @source_object = '[repo].[RepoObjectColumn]'
SET @target_object = '[repo].[RepoObjectColumn]'

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

/*{"ReportUspStep":[{"Number":410,"Name":"[SysObject_RepoObjectColumn_guid] -> [RepoObjectColumn_guid] ([RepoObjectColumn_guid] is stored in extended properties)","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo_sys].[SysColumn]","log_target_object":"[repo].[RepoObjectColumn]","log_flag_InsertUpdateDelete":"i"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',6,';',410,';',NULL);

/*
	
if a [RepoObjectColumn_guid] is stored in extended properties but missing in RepoObjectColumn, it should be restored
use columns with [RepoObjectColumn_guid] stored in extended properties
	
- restore / insert RepoObjectColumn_guid from [SysObject_RepoObjectColumn_guid]
- SysObjectColumn names are restored as SysObject names
- a conflict could happen when some RepoObjectColumn have been renamed and when they now conflict with SysObjectColumn names  
	[UK_RepoObject_Names] was defined to raise an error
	=> thats way we use [RepoObjectColumn_guid] as [RepoObjectColumn_name] to avoid conflicts we will later rename [RepoObjectColumn_name] to [SysObjectColumn_name] where this is possible
	
*/
INSERT INTO repo.RepoObjectColumn (
 [RepoObjectColumn_guid]
 , [RepoObject_guid]
 , [SysObjectColumn_name]
 , [SysObjectColumn_column_id]
 , [RepoObjectColumn_name]
 , [Repo_default_is_system_named]
 , [Repo_default_name]
 , [Repo_default_definition]
 , [Repo_definition]
 , [Repo_generated_always_type]
 , [Repo_graph_type]
 , [Repo_is_computed]
 , [Repo_is_identity]
 , [Repo_is_nullable]
 , [Repo_is_persisted]
 , [Repo_seed_value]
 , [Repo_increment_value]
 , [Repo_user_type_name]
 , [Repo_user_type_fullname]
 , [Repo_uses_database_collation]
 )
SELECT [SysObject_RepoObjectColumn_guid]
 , [SysObject_RepoObject_guid]
 , [SysObject_column_name]
 , [SysObject_column_id]
 , [SysObject_RepoObjectColumn_guid] AS [RepoObjectColumn_name] --guid is used as name!
 , [default_is_system_named]
 , [default_name]
 , [default_definition]
 , [definition]
 , [generated_always_type]
 , [graph_type]
 , [graph_type]
 , [is_computed]
 , [is_nullable]
 , [is_persisted]
 , [seed_value]
 , [increment_value]
 , [user_type_name]
 , [user_type_fullname]
 , [uses_database_collation]
FROM repo.SysColumn_RepoObjectColumn_via_guid
WHERE [RepoObjectColumn_guid] IS NULL
 AND NOT [SysObject_RepoObjectColumn_guid] IS NULL;

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = '[SysObject_RepoObjectColumn_guid] -> [RepoObjectColumn_guid] ([RepoObjectColumn_guid] is stored in extended properties)'
SET @source_object = '[repo_sys].[SysColumn]'
SET @target_object = '[repo].[RepoObjectColumn]'

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
 , @inserted = @rows
-- Logging END --

/*{"ReportUspStep":[{"Number":510,"Name":"DELETE repo.RepoObjectColumn, WHERE (RowNumberOverName > 1); via [repo].[SysColumn_RepoObjectColumn_via_name]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo_sys].[SysColumn]","log_target_object":"[repo].[RepoObjectColumn]","log_flag_InsertUpdateDelete":"d"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',6,';',510,';',NULL);

--in case we have more then one [RepoObjectColumn_guid] per Schema.Object.Column
DELETE roc
FROM [repo].[RepoObjectColumn] [roc]
WHERE EXISTS (
  SELECT [RepoObjectColumn_guid]
   , [RowNumberOverName]
  FROM [repo].[SysColumn_RepoObjectColumn_via_name] AS [scroc]
  WHERE ([RowNumberOverName] > 1)
   AND [roc].[RepoObjectColumn_guid] = [scroc].[RepoObjectColumn_guid]
  )

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'DELETE repo.RepoObjectColumn, WHERE (RowNumberOverName > 1); via [repo].[SysColumn_RepoObjectColumn_via_name]'
SET @source_object = '[repo_sys].[SysColumn]'
SET @target_object = '[repo].[RepoObjectColumn]'

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
 , @deleted = @rows
-- Logging END --

/*{"ReportUspStep":[{"Number":610,"Name":"INSERT still missing Column","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo_sys].[SysColumn]","log_target_object":"[repo].[RepoObjectColumn]","log_flag_InsertUpdateDelete":"i"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',6,';',610,';',NULL);

/*
	
ensure all object columns existing in database (as SysObjectColumn) are also included into [repo].[RepoObjectColumn]
	
- this should be SysObjectColm without RepoObjectColumn_guid in extended properties
- when inserting they get a RepoObjectColumn_guid
- we should use this new RepoObjectColumn_guid as [RepoObjectColumn_name], but we don't know it, when we insert. That's why we use anything else unique: NEWID()  
	or we don't insert the RepoObjectColumn_name and they get a NEWID() as default, defined in repo.RepoObjectColumn
	
[SysObject_RepoObject_guid] must exists, because it is required to link to repo.RepoObject
*/
INSERT INTO repo.RepoObjectColumn (
 [RepoObject_guid]
 , [SysObjectColumn_name]
 , [SysObjectColumn_column_id]
 --, [RepoObjectColumn_name]
 , [Repo_default_is_system_named]
 , [Repo_default_name]
 , [Repo_default_definition]
 , [Repo_definition]
 , [Repo_generated_always_type]
 , [Repo_graph_type]
 , [Repo_is_computed]
 , [Repo_is_identity]
 , [Repo_is_nullable]
 , [Repo_is_persisted]
 , [Repo_seed_value]
 , [Repo_increment_value]
 , [Repo_user_type_name]
 , [Repo_user_type_fullname]
 , [Repo_uses_database_collation]
 )
SELECT [SysObject_RepoObject_guid]
 , [SysObject_column_name]
 , [SysObject_column_id]
 --, NEWID() AS [RepoObjectColumn_name] --a default is defined now
 , [default_is_system_named]
 , [default_name]
 , [default_definition]
 , [definition]
 , [generated_always_type]
 , [graph_type]
 , [is_computed]
 , [is_identity]
 , [is_nullable]
 , [is_persisted]
 , [seed_value]
 , [increment_value]
 , [user_type_name]
 , [user_type_fullname]
 , [uses_database_collation]
FROM repo.SysColumn_RepoObjectColumn_via_name
WHERE [RepoObjectColumn_guid] IS NULL
 AND NOT [SysObject_RepoObject_guid] IS NULL;

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'INSERT still missing Column'
SET @source_object = '[repo_sys].[SysColumn]'
SET @target_object = '[repo].[RepoObjectColumn]'

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
 , @inserted = @rows
-- Logging END --

/*{"ReportUspStep":[{"Number":710,"Name":"SET [RepoObjectColumn_name] = [SysObjectColumn_name] WHERE (has_different_sys_names = 1) AND (ISNULL(is_repo_managed, 0) = 0)","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObjectColumn]","log_target_object":"[repo].[RepoObjectColumn]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',6,';',710,';',NULL);

/*
	
now we try to set [RepoObject_name] = [SysObject_name] where this is possible whithout conflicts
remaining [RepoObject_name] still have some guid and this needs to solved separately
	
poosible issue
	
Msg 2627, Level 14, State 1, Procedure repo.usp_sync_guid_RepoObjectColumn, Line 392 [Batch Start Line 5]
Violation of UNIQUE KEY constraint 'UK_RepoObjectColumn__RepoNames'. Cannot insert duplicate key in object 'repo.RepoObjectColumn'. The duplicate key value is (e7968530-e846-eb11-84d1-a81e8446d5b0, Repo_default_definition).
	
there was an issue in [repo].[SysColumn] with some column duplicating
	
*/
UPDATE repo.RepoObjectColumn
SET [RepoObjectColumn_name] = [repo].[RepoObjectColumn].[SysObjectColumn_name]
FROM [repo].[RepoObjectColumn]
INNER JOIN [repo].[RepoObject] AS [ro]
 ON [repo].[RepoObjectColumn].[RepoObject_guid] = [ro].[RepoObject_guid]
WHERE
 --don't touch entries, which are managed by repo
 ISNULL([ro].[is_repo_managed], 0) = 0
 AND [repo].[RepoObjectColumn].[has_different_sys_names] = 1
 --exclude surrogate [SysObject_name]
 AND [is_SysObjectColumn_name_uniqueidentifier] = 0
 --exclude virtual columns, created from reference expressions
 AND ISNULL([is_query_plan_expression], 0) = 0
 --avoid not unique entries
 --do not update, if the target entry ([RepoObject_guid], [RepoObjectColumn_name]) exists
 --The UK would prevent that
 AND NOT EXISTS (
  SELECT [RepoObject_guid]
   , [RepoObjectColumn_name]
  FROM [repo].[RepoObjectColumn] AS [roc2]
  WHERE [repo].[RepoObjectColumn].[SysObjectColumn_name] = [roc2].[RepoObjectColumn_name]
   AND [repo].[RepoObjectColumn].[RepoObject_guid] = [roc2].[RepoObject_guid]
  )

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'SET [RepoObjectColumn_name] = [SysObjectColumn_name] WHERE (has_different_sys_names = 1) AND (ISNULL(is_repo_managed, 0) = 0)'
SET @source_object = '[repo].[RepoObjectColumn]'
SET @target_object = '[repo].[RepoObjectColumn]'

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

/*{"ReportUspStep":[{"Number":810,"Name":"other properties, where (ISNULL(is_repo_managed, 0) = 0)","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo_sys].[SysColumn]","log_target_object":"[repo].[RepoObjectColumn]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',6,';',810,';',NULL);

--update other properties for RepoObject which are not is_repo_managed
UPDATE repo.SysColumn_RepoObjectColumn_via_guid
SET [Repo_default_definition] = [default_definition]
 , [Repo_default_is_system_named] = [default_is_system_named]
 , [Repo_default_name] = [default_name]
 , [Repo_definition] = [definition]
 , [Repo_generated_always_type] = [generated_always_type]
 , [Repo_graph_type] = [graph_type]
 , [Repo_is_nullable] = [is_nullable]
 , [Repo_is_persisted] = [is_persisted]
 , [Repo_user_type_fullname] = [user_type_fullname]
 , [Repo_user_type_name] = [user_type_name]
 , [Repo_uses_database_collation] = [uses_database_collation]
 , [Repo_is_computed] = [is_computed]
 , [Repo_is_identity] = [is_identity]
 , [Repo_seed_value] = [seed_value]
 , [Repo_increment_value] = [increment_value]
WHERE
 --not is_repo_managed 
 ISNULL([is_repo_managed], 0) = 0
 AND (
  --
  1 = 0
  --
  OR [Repo_default_definition] <> [default_definition]
  OR (
   [Repo_default_definition] IS NULL
   AND NOT [default_definition] IS NULL
   )
  OR (
   NOT [Repo_default_definition] IS NULL
   AND [default_definition] IS NULL
   )
  OR [Repo_default_is_system_named] <> [default_is_system_named]
  OR (
   [Repo_default_is_system_named] IS NULL
   AND NOT [default_is_system_named] IS NULL
   )
  OR (
   NOT [Repo_default_is_system_named] IS NULL
   AND [default_is_system_named] IS NULL
   )
  OR [Repo_default_name] <> [default_name]
  OR (
   [Repo_default_name] IS NULL
   AND NOT [default_name] IS NULL
   )
  OR (
   NOT [Repo_default_name] IS NULL
   AND [default_name] IS NULL
   )
  OR [Repo_definition] <> [definition]
  OR (
   [Repo_definition] IS NULL
   AND NOT [definition] IS NULL
   )
  OR (
   NOT [Repo_definition] IS NULL
   AND [definition] IS NULL
   )
  OR [Repo_generated_always_type] <> [generated_always_type]
  OR (
   [Repo_generated_always_type] IS NULL
   AND NOT [generated_always_type] IS NULL
   )
  OR (
   NOT [Repo_generated_always_type] IS NULL
   AND [generated_always_type] IS NULL
   )
  OR [Repo_graph_type] <> [graph_type]
  OR (
   [Repo_graph_type] IS NULL
   AND NOT [graph_type] IS NULL
   )
  OR (
   NOT [Repo_graph_type] IS NULL
   AND [graph_type] IS NULL
   )
  OR [Repo_is_nullable] <> [is_nullable]
  OR (
   [Repo_is_nullable] IS NULL
   AND NOT [is_nullable] IS NULL
   )
  OR (
   NOT [Repo_is_nullable] IS NULL
   AND [is_nullable] IS NULL
   )
  OR [Repo_is_persisted] <> [is_persisted]
  OR (
   [Repo_is_persisted] IS NULL
   AND NOT [is_persisted] IS NULL
   )
  OR (
   NOT [Repo_is_persisted] IS NULL
   AND [is_persisted] IS NULL
   )
  OR [Repo_user_type_fullname] <> [user_type_fullname]
  OR (
   [Repo_user_type_fullname] IS NULL
   AND NOT [user_type_fullname] IS NULL
   )
  OR (
   NOT [Repo_user_type_fullname] IS NULL
   AND [user_type_fullname] IS NULL
   )
  --OR [Repo_user_type_name] <> [user_type_name]
  --OR ([Repo_user_type_name] IS NULL
  --    AND NOT [user_type_name] IS NULL)
  --OR (NOT [Repo_user_type_name] IS NULL
  --    AND [user_type_name] IS NULL)
  OR [Repo_uses_database_collation] <> [uses_database_collation]
  OR (
   [Repo_uses_database_collation] IS NULL
   AND NOT [uses_database_collation] IS NULL
   )
  OR (
   NOT [Repo_uses_database_collation] IS NULL
   AND [uses_database_collation] IS NULL
   )
  OR [Repo_is_computed] <> [is_computed]
  OR (
   [Repo_is_computed] IS NULL
   AND NOT [is_computed] IS NULL
   )
  OR (
   NOT [Repo_is_computed] IS NULL
   AND [is_computed] IS NULL
   )
  OR [Repo_is_identity] <> [is_identity]
  OR (
   [Repo_is_identity] IS NULL
   AND NOT [is_identity] IS NULL
   )
  OR (
   NOT [Repo_is_identity] IS NULL
   AND [is_identity] IS NULL
   )
  OR [Repo_seed_value] <> [seed_value]
  OR (
   [Repo_seed_value] IS NULL
   AND NOT [seed_value] IS NULL
   )
  OR (
   NOT [Repo_seed_value] IS NULL
   AND [seed_value] IS NULL
   )
  OR [Repo_increment_value] <> [increment_value]
  OR (
   [Repo_increment_value] IS NULL
   AND NOT [increment_value] IS NULL
   )
  OR (
   NOT [Repo_increment_value] IS NULL
   AND [increment_value] IS NULL
   )
  --
  );

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'other properties, where (ISNULL(is_repo_managed, 0) = 0)'
SET @source_object = '[repo_sys].[SysColumn]'
SET @target_object = '[repo].[RepoObjectColumn]'

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

/*{"ReportUspStep":[{"Number":1010,"Name":"persistence: update RepoObjectColumn_name and repo attributes from sys attributes of persistence_source_RepoObjectColumn_guid","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo_sys].[SysColumn]","log_target_object":"[repo].[RepoObjectColumn]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',6,';',1010,';',NULL);

--persistence: update RepoObjectColumn_name (and other repo attributes) from SysObjecColumn_name (and other sys attributes) of persistence_source_RepoObjectColumn_guid
UPDATE roc_p
SET [RepoObjectColumn_name] = [scroc].[SysObjectColumn_name]
 --
 , [Repo_default_definition] = [scroc].[default_definition]
 --skip Repo_default_name
 --skip Repo_default_is_system_named
 --, [Repo_default_is_system_named] = [scroc].[default_is_system_named]
 , [Repo_definition] = [scroc].[definition]
 , [Repo_generated_always_type] = [scroc].[generated_always_type]
 , [Repo_graph_type] = [scroc].[graph_type]
 , [Repo_is_nullable] = [scroc].[is_nullable]
 , [Repo_is_persisted] = [scroc].[is_persisted]
 , [Repo_user_type_fullname] = [scroc].[user_type_fullname]
 , [Repo_user_type_name] = [scroc].[user_type_name]
 , [Repo_uses_database_collation] = [scroc].[uses_database_collation]
 , [Repo_is_computed] = [scroc].[is_computed]
 , [Repo_is_identity] = [scroc].[is_identity]
 , [Repo_seed_value] = [scroc].[seed_value]
 , [Repo_increment_value] = [scroc].[increment_value]
FROM [repo].[RepoObjectColumn] [roc_p]
--we need some attributes from roc_s (source)
INNER JOIN [repo].[SysColumn_RepoObjectColumn_via_guid] [scroc]
 ON [scroc].[RepoObjectColumn_guid] = [roc_p].[persistence_source_RepoObjectColumn_guid]
INNER JOIN [repo].[RepoObject] [ro_p]
 ON [roc_p].[RepoObject_guid] = [ro_p].[RepoObject_guid]
WHERE
 --persistence object ist marked [is_repo_managed] = 1
 [ro_p].[is_repo_managed] = 1
 AND (
  --
  1 = 0
  --
  OR [roc_p].[RepoObjectColumn_name] <> [scroc].[SysObjectColumn_name]
  --
  OR [roc_p].[Repo_default_definition] <> [scroc].[default_definition]
  OR (
   [roc_p].[Repo_default_definition] IS NULL
   AND NOT [scroc].[default_definition] IS NULL
   )
  OR (
   NOT [roc_p].[Repo_default_definition] IS NULL
   AND [scroc].[default_definition] IS NULL
   )
  --OR [roc_p].[Repo_default_is_system_named] <> [scroc].[default_is_system_named]
  --OR ([roc_p].[Repo_default_is_system_named] IS NULL
  --    AND NOT [scroc].[default_is_system_named] IS NULL)
  --OR (NOT [roc_p].[Repo_default_is_system_named] IS NULL
  --    AND [scroc].[default_is_system_named] IS NULL)
  OR [roc_p].[Repo_definition] <> [scroc].[definition]
  OR (
   [roc_p].[Repo_definition] IS NULL
   AND NOT [scroc].[definition] IS NULL
   )
  OR (
   NOT [roc_p].[Repo_definition] IS NULL
   AND [scroc].[definition] IS NULL
   )
  OR [roc_p].[Repo_generated_always_type] <> [scroc].[generated_always_type]
  OR (
   [roc_p].[Repo_generated_always_type] IS NULL
   AND NOT [scroc].[generated_always_type] IS NULL
   )
  OR (
   NOT [roc_p].[Repo_generated_always_type] IS NULL
   AND [scroc].[generated_always_type] IS NULL
   )
  OR [roc_p].[Repo_graph_type] <> [scroc].[graph_type]
  OR (
   [roc_p].[Repo_graph_type] IS NULL
   AND NOT [scroc].[graph_type] IS NULL
   )
  OR (
   NOT [roc_p].[Repo_graph_type] IS NULL
   AND [scroc].[graph_type] IS NULL
   )
  OR [roc_p].[Repo_is_nullable] <> [scroc].[is_nullable]
  OR (
   [roc_p].[Repo_is_nullable] IS NULL
   AND NOT [scroc].[is_nullable] IS NULL
   )
  OR (
   NOT [roc_p].[Repo_is_nullable] IS NULL
   AND [scroc].[is_nullable] IS NULL
   )
  OR [roc_p].[Repo_is_persisted] <> [scroc].[is_persisted]
  OR (
   [roc_p].[Repo_is_persisted] IS NULL
   AND NOT [scroc].[is_persisted] IS NULL
   )
  OR (
   NOT [roc_p].[Repo_is_persisted] IS NULL
   AND [scroc].[is_persisted] IS NULL
   )
  OR [roc_p].[Repo_user_type_fullname] <> [scroc].[user_type_fullname]
  OR (
   [roc_p].[Repo_user_type_fullname] IS NULL
   AND NOT [scroc].[user_type_fullname] IS NULL
   )
  OR (
   NOT [roc_p].[Repo_user_type_fullname] IS NULL
   AND [scroc].[user_type_fullname] IS NULL
   )
  --we don't need to check user_type_name, it is included in user_type_fullname
  OR [roc_p].[Repo_uses_database_collation] <> [scroc].[uses_database_collation]
  OR (
   [roc_p].[Repo_uses_database_collation] IS NULL
   AND NOT [scroc].[uses_database_collation] IS NULL
   )
  OR (
   NOT [roc_p].[Repo_uses_database_collation] IS NULL
   AND [scroc].[uses_database_collation] IS NULL
   )
  OR [roc_p].[Repo_is_computed] <> [scroc].[is_computed]
  OR (
   [roc_p].[Repo_is_computed] IS NULL
   AND NOT [scroc].[is_computed] IS NULL
   )
  OR (
   NOT [roc_p].[Repo_is_computed] IS NULL
   AND [scroc].[is_computed] IS NULL
   )
  OR [roc_p].[Repo_is_identity] <> [scroc].[is_identity]
  OR (
   [roc_p].[Repo_is_identity] IS NULL
   AND NOT [scroc].[is_identity] IS NULL
   )
  OR (
   NOT [roc_p].[Repo_is_identity] IS NULL
   AND [scroc].[is_identity] IS NULL
   )
  OR [roc_p].[Repo_seed_value] <> [scroc].[seed_value]
  OR (
   [roc_p].[Repo_seed_value] IS NULL
   AND NOT [scroc].[seed_value] IS NULL
   )
  OR (
   NOT [roc_p].[Repo_seed_value] IS NULL
   AND [scroc].[seed_value] IS NULL
   )
  OR [roc_p].[Repo_increment_value] <> [scroc].[increment_value]
  OR (
   [roc_p].[Repo_increment_value] IS NULL
   AND NOT [scroc].[increment_value] IS NULL
   )
  OR (
   NOT [roc_p].[Repo_increment_value] IS NULL
   AND [scroc].[increment_value] IS NULL
   )
  )

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'persistence: update RepoObjectColumn_name and repo attributes from sys attributes of persistence_source_RepoObjectColumn_guid'
SET @source_object = '[repo_sys].[SysColumn]'
SET @target_object = '[repo].[RepoObjectColumn]'

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

/*{"ReportUspStep":[{"Number":1110,"Name":"persistence: [roc_p].[persistence_source_RepoObjectColumn_guid] = [roc_s].[RepoObjectColumn_guid] (matching by column name via [repo].[RepoObject_persistence])","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObjectColumn]","log_target_object":"[repo].[RepoObjectColumn]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',6,';',1110,';',NULL);

--persistence: try to find [persistence_source_RepoObjectColumn_guid] for existing persistence columns by Column name
UPDATE roc_p
SET [roc_p].[persistence_source_RepoObjectColumn_guid] = [roc_s].[RepoObjectColumn_guid]
FROM [repo].[RepoObjectColumn] AS [roc_p]
INNER JOIN [repo].[RepoObjectColumn] AS [roc_s]
 ON [roc_p].[RepoObjectColumn_name] = [roc_s].[RepoObjectColumn_name]
INNER JOIN [repo].[RepoObject_persistence] rop
 ON rop.target_RepoObject_guid = [roc_p].[RepoObject_guid]
  AND rop.source_RepoObject_guid = [roc_s].[RepoObject_guid]
WHERE (
  [roc_p].[persistence_source_RepoObjectColumn_guid] <> [roc_s].[RepoObjectColumn_guid]
  OR [roc_p].[persistence_source_RepoObjectColumn_guid] IS NULL
  )
 --skip special table columns (ValidFrom, ValidTo) in target (= persistence)
 AND (
  [roc_p].[Repo_generated_always_type] = 0
  OR [roc_p].[Repo_generated_always_type] IS NULL
  )
 --skip [is_query_plan_expression] in target
 AND (
  [roc_p].[is_query_plan_expression] = 0
  OR [roc_p].[is_query_plan_expression] IS NULL
  )

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'persistence: [roc_p].[persistence_source_RepoObjectColumn_guid] = [roc_s].[RepoObjectColumn_guid] (matching by column name via [repo].[RepoObject_persistence])'
SET @source_object = '[repo].[RepoObjectColumn]'
SET @target_object = '[repo].[RepoObjectColumn]'

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

/*{"ReportUspStep":[{"Number":1210,"Name":"persistence: add missing persistence columns existing in source","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObjectColumn]","log_target_object":"[repo].[RepoObjectColumn]","log_flag_InsertUpdateDelete":"i"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',6,';',1210,';',NULL);

--persistence: add missing (in target) persistence columns, existing in source
--before the persistence sql can be created the [repo].[usp_sync_guid_RepoObjectColumn] needs to be executed again
INSERT INTO [repo].[RepoObjectColumn] (
 [RepoObject_guid]
 , [RepoObjectColumn_name]
 , [persistence_source_RepoObjectColumn_guid]
 )
SELECT rop.[target_RepoObject_guid]
 , [roc_s].[RepoObjectColumn_name]
 , [roc_s].[RepoObjectColumn_guid]
FROM [repo].[RepoObjectColumn] AS [roc_s]
INNER JOIN [repo].[RepoObject_persistence] rop
 ON rop.source_RepoObject_guid = [roc_s].[RepoObject_guid]
WHERE
 --
 NOT EXISTS (
  SELECT 1
  FROM [repo].[RepoObjectColumn] AS [roc_p]
  WHERE [roc_p].[RepoObject_guid] = rop.[target_RepoObject_guid]
   AND [roc_p].[persistence_source_RepoObjectColumn_guid] = [roc_s].[RepoObjectColumn_guid]
  )
 --skip is_persistence_no_include
 AND (
  [roc_s].is_persistence_no_include = 0
  OR [roc_s].is_persistence_no_include IS NULL
  )
 --skip special table columns (ValidFrom, ValidTo) in source
 AND (
  [roc_s].[Repo_generated_always_type] = 0
  OR [roc_s].[Repo_generated_always_type] IS NULL
  )
 --skip [is_query_plan_expression] in source
 AND (
  [roc_s].[is_query_plan_expression] = 0
  OR [roc_s].[is_query_plan_expression] IS NULL
  )

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'persistence: add missing persistence columns existing in source'
SET @source_object = '[repo].[RepoObjectColumn]'
SET @target_object = '[repo].[RepoObjectColumn]'

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
 , @inserted = @rows
-- Logging END --

/*{"ReportUspStep":[{"Number":1310,"Name":"persistence: insert missing HistValidColumns","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject_persistence]","log_target_object":"[repo].[RepoObjectColumn]","log_flag_InsertUpdateDelete":"i"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',6,';',1310,';',NULL);

--currently we only insert missing but not delete not required
-- maybe we should delete them?
INSERT INTO [repo].[RepoObjectColumn] (
 [Repo_generated_always_type]
 , [Repo_is_nullable]
 , [Repo_user_type_name]
 , [Repo_user_type_fullname]
 , [RepoObjectColumn_name]
 , [RepoObject_guid]
 )
SELECT [Repo_generated_always_type]
 , [Repo_is_nullable]
 , [Repo_user_type_name]
 , [Repo_user_type_fullname]
 , [RepoObjectColumn_name]
 , [RepoObject_guid]
FROM [repo].[RepoObjectColumn_HistValidColums_setpoint] AS setpoint
WHERE NOT EXISTS (
  SELECT 1
  FROM [repo].[RepoObjectColumn] AS [roc]
  WHERE [roc].[RepoObject_guid] = [setpoint].[RepoObject_guid]
   --we link not by ColumnName, but by [Repo_generated_always_type]
   --this way it is possible to change the name in [repo].[RepoObjectColumn], if required
   AND [roc].[Repo_generated_always_type] = [setpoint].[Repo_generated_always_type]
  )

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'persistence: insert missing HistValidColumns'
SET @source_object = '[repo].[RepoObject_persistence]'
SET @target_object = '[repo].[RepoObjectColumn]'

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
 , @inserted = @rows
-- Logging END --

/*{"ReportUspStep":[{"Number":1410,"Name":"persistence: SET [persistence_source_RepoObjectColumn_guid] = NULL (missing source column)","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObjectColumn]","log_target_object":"[repo].[RepoObjectColumn]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',6,';',1410,';',NULL);

UPDATE roc
SET [persistence_source_RepoObjectColumn_guid] = NULL
FROM [repo].[RepoObjectColumn] roc
WHERE NOT EXISTS (
  SELECT [RepoObjectColumn_guid]
  FROM [repo].[RepoObjectColumn] roc_s
  WHERE roc_s.[RepoObjectColumn_guid] = roc.[persistence_source_RepoObjectColumn_guid]
  )

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'persistence: SET [persistence_source_RepoObjectColumn_guid] = NULL (missing source column)'
SET @source_object = '[repo].[RepoObjectColumn]'
SET @target_object = '[repo].[RepoObjectColumn]'

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

/*{"ReportUspStep":[{"Number":2010,"Name":"write RepoObjectColumn_guid into extended properties of SysObjectColumn, Level2","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObjectColumn]","log_target_object":"[repo_sys].[SysColumn]"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',6,';',2010,';',NULL);

DECLARE property_cursor CURSOR READ_ONLY
FOR
--
SELECT [T1].[RepoObjectColumn_guid]
 , [T1].[SysObject_schema_name]
 , [T2].[level1type]
 , [T1].[SysObject_name]
 , [T1].[SysObject_column_name]
 , [T1].[SysObject_type]
FROM repo.SysColumn_RepoObjectColumn_via_name AS T1
INNER JOIN [config].[type_level1type_level2type] AS T2
 ON T1.SysObject_type = T2.type
WHERE NOT [T1].[RepoObjectColumn_guid] IS NULL
 AND [T1].[SysObject_RepoObjectColumn_guid] IS NULL
 AND NOT [T2].[level1type] IS NULL
 --SchemaCompare has issues comparing extended properties for graph table columns, we exclude them
 AND T1.Repo_graph_type IS NULL
 --the next is redundant, these kind of Objects should not exist in the database
 AND [T1].[is_SysObjectColumn_name_uniqueidentifier] = 0

DECLARE @RepoObjectColumn_guid UNIQUEIDENTIFIER
 , @column_name NVARCHAR(128)
 , @schema_name NVARCHAR(128)
 , @level1type VARCHAR(128)
 , @name NVARCHAR(128)
 , @type CHAR(2)

SET @rows = 0;

OPEN property_cursor;

FETCH NEXT
FROM property_cursor
INTO @RepoObjectColumn_guid
 , @schema_name
 , @level1type
 , @name
 , @column_name
 , @type;

WHILE @@fetch_status <> - 1
BEGIN
 IF @@fetch_status <> - 2
 BEGIN
  EXEC repo_sys.[usp_AddOrUpdateExtendedProperty] @name = N'RepoObjectColumn_guid'
   , @value = @RepoObjectColumn_guid
   , @level0type = N'Schema'
   , @level0name = @schema_name
   , @level1type = @level1type
   , @level1name = @name
   , @level2type = N'COLUMN'
   , @level2name = @column_name;

  SET @rows = @rows + 1;
 END;

 FETCH NEXT
 FROM property_cursor
 INTO @RepoObjectColumn_guid
  , @schema_name
  , @level1type
  , @name
  , @column_name
  , @type;
END;

CLOSE property_cursor;

DEALLOCATE property_cursor;

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'write RepoObjectColumn_guid into extended properties of SysObjectColumn, Level2'
SET @source_object = '[repo].[RepoObjectColumn]'
SET @target_object = '[repo_sys].[SysColumn]'

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

-- Logging END --

/*{"ReportUspStep":[{"Number":2110,"Name":"SET [is_SysObjectColumn_missing] = 1","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo_sys].[SysColumn]","log_target_object":"[repo].[RepoObjectColumn]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',6,';',2110,';',NULL);

/*
columns deleted or renamed in database but still referenced in [repo].[RepoObjectColumn] should be marked: [is_SysObjectColumn_missing] = 1
*/
UPDATE repo.RepoObjectColumn
SET [is_SysObjectColumn_missing] = 1
FROM [repo].[RepoObjectColumn] [T1]
WHERE ISNULL([is_SysObjectColumn_missing], 0) = 0
 AND NOT EXISTS (
  SELECT [SysObject_id]
  FROM [repo_sys].[SysColumn] AS [Filter]
  WHERE [t1].[SysObjectColumn_name] = [Filter].[SysObject_column_name]
   AND [T1].[RepoObject_guid] = [Filter].[SysObject_RepoObject_guid]
  )

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'SET [is_SysObjectColumn_missing] = 1'
SET @source_object = '[repo_sys].[SysColumn]'
SET @target_object = '[repo].[RepoObjectColumn]'

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

/*{"ReportUspStep":[{"Number":2210,"Name":"where is_SysObjectColumn_missing = 1, but not in objects which are is_repo_managed","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo_sys].[RepoObjectColumn]","log_target_object":"[repo].[RepoObjectColumn]","log_flag_InsertUpdateDelete":"d"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',6,';',2210,';',NULL);

/*
delete columns, marked as missing in [repo_sys].SysColumn
which are not [is_repo_managed]
*/
DELETE
FROM repo.RepoObjectColumn
FROM [repo].[RepoObjectColumn]
INNER JOIN [repo].[RepoObject] AS [ro]
 ON [repo].[RepoObjectColumn].[RepoObject_guid] = [ro].[RepoObject_guid]
WHERE ISNULL([ro].[is_repo_managed], 0) = 0
 AND [repo].[RepoObjectColumn].[is_SysObjectColumn_missing] = 1
 --do not delete virtual colums required for source reference analysis
 AND ISNULL([repo].[RepoObjectColumn].[is_query_plan_expression], 0) = 0

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'where is_SysObjectColumn_missing = 1, but not in objects which are is_repo_managed'
SET @source_object = '[repo_sys].[RepoObjectColumn]'
SET @target_object = '[repo].[RepoObjectColumn]'

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
 , @deleted = @rows
-- Logging END --

/*{"ReportUspStep":[{"Number":5200,"Name":"[graph].[usp_PERSIST_RepoObjectColumn]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [graph].[usp_PERSIST_RepoObjectColumn]
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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b590291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_sync_guid_RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'UspParameters', @value = NULL, @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_sync_guid_RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'UspExamples', @value = NULL, @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_sync_guid_RepoObjectColumn';


GO



GO
EXECUTE sp_addextendedproperty @name = N'AdocUspSteps', @value = N'.Steps in [repo].[usp_sync_guid_RepoObjectColumn]
[cols="5,200,1,100,100,1"]
|===
|Number
|Name
|Condition
|Source
|Target
|Action

|100
|intro
|0
|
|
|

|210
|UPDATE repo_sys.SysColumn_RepoObjectColumn_via_RepoObjectColumn_guid
|0
|[repo_sys].[SysColumn]
|[repo].[RepoObjectColumn]
|u

|310
|SET [SysObjectColumn_name] = [RepoObjectColumn_guid] (to avoid conflict in the next INSERT step)
|0
|[repo].[RepoObjectColumn]
|[repo].[RepoObjectColumn]
|u

|410
|[SysObject_RepoObjectColumn_guid] -> [RepoObjectColumn_guid] ([RepoObjectColumn_guid] is stored in extended properties)
|0
|[repo_sys].[SysColumn]
|[repo].[RepoObjectColumn]
|i

|510
|DELETE repo.RepoObjectColumn, WHERE (RowNumberOverName > 1); via [repo].[SysColumn_RepoObjectColumn_via_name]
|0
|[repo_sys].[SysColumn]
|[repo].[RepoObjectColumn]
|d

|610
|INSERT still missing Column
|0
|[repo_sys].[SysColumn]
|[repo].[RepoObjectColumn]
|i

|710
|SET [RepoObjectColumn_name] = [SysObjectColumn_name] WHERE (has_different_sys_names = 1) AND (ISNULL(is_repo_managed, 0) = 0)
|0
|[repo].[RepoObjectColumn]
|[repo].[RepoObjectColumn]
|u

|810
|other properties, where (ISNULL(is_repo_managed, 0) = 0)
|0
|[repo_sys].[SysColumn]
|[repo].[RepoObjectColumn]
|u

|1010
|persistence: update RepoObjectColumn_name and repo attributes from sys attributes of persistence_source_RepoObjectColumn_guid
|0
|[repo_sys].[SysColumn]
|[repo].[RepoObjectColumn]
|u

|1110
|persistence: [roc_p].[persistence_source_RepoObjectColumn_guid] = [roc_s].[RepoObjectColumn_guid] (matching by column name via [repo].[RepoObject_persistence])
|0
|[repo].[RepoObjectColumn]
|[repo].[RepoObjectColumn]
|u

|1210
|persistence: add missing persistence columns existing in source
|0
|[repo].[RepoObjectColumn]
|[repo].[RepoObjectColumn]
|i

|1310
|persistence: insert missing HistValidColumns
|0
|[repo].[RepoObject_persistence]
|[repo].[RepoObjectColumn]
|i

|1410
|persistence: SET [persistence_source_RepoObjectColumn_guid] = NULL (missing source column)
|0
|[repo].[RepoObjectColumn]
|[repo].[RepoObjectColumn]
|u

|2010
|write RepoObjectColumn_guid into extended properties of SysObjectColumn, Level2
|0
|[repo].[RepoObjectColumn]
|[repo_sys].[SysColumn]
|

|2110
|SET [is_SysObjectColumn_missing] = 1
|0
|[repo_sys].[SysColumn]
|[repo].[RepoObjectColumn]
|u

|2210
|where is_SysObjectColumn_missing = 1, but not in objects which are is_repo_managed
|0
|[repo_sys].[RepoObjectColumn]
|[repo].[RepoObjectColumn]
|d

|5200
|[graph].[usp_PERSIST_RepoObjectColumn]
|0
|
|
|
|===
', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_sync_guid_RepoObjectColumn';

