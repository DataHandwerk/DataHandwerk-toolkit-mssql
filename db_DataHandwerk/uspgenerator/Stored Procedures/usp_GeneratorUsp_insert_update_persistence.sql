CREATE   PROCEDURE [uspgenerator].[usp_GeneratorUsp_insert_update_persistence]
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
PRINT '[repo].[usp_GeneratorUsp_insert_update_persistence]'
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
--
/*{"ReportUspStep":[{"Number":210,"Name":"delete old usp, which doesn't exist anymore","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject_gross]","log_target_object":" [repo].[GeneratorUsp]","log_flag_InsertUpdateDelete":"d"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',3,';',210,';',NULL);

--ATTENTION, destructive!
--we should delete only usp definitions for persistence!
DELETE u
FROM [uspgenerator].[GeneratorUsp] [u]
WHERE LEFT([u].[usp_name], 12) = 'usp_PERSIST_'
 AND NOT EXISTS (
  SELECT 1
  FROM [repo].[RepoObject_gross] AS [ro]
  WHERE [u].[usp_schema] = [ro].[RepoObject_schema_name]
   AND [u].[usp_name] = [ro].[usp_persistence_name]
  )

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'delete old usp, which doesn''t exist anymore'
SET @source_object = '[repo].[RepoObject_gross]'
SET @target_object = ' [repo].[GeneratorUsp]'

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

/*{"ReportUspStep":[{"Number":310,"Name":"insert new usp","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject_gross]","log_target_object":"[repo].[GeneratorUsp]","log_flag_InsertUpdateDelete":"i"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',3,';',310,';',NULL);

INSERT INTO [uspgenerator].[GeneratorUsp] (
 [usp_schema]
 , [usp_name]
 , [has_logging]
 )
SELECT [usp_schema] = [RepoObject_schema_name]
 , [usp_name] = [usp_persistence_name]
 , 1
FROM [repo].[RepoObject_gross] AS ro
WHERE [is_persistence] = 1
 AND NOT EXISTS (
  SELECT 1
  FROM [uspgenerator].[GeneratorUsp] AS [u]
  WHERE [u].[usp_schema] = [ro].[RepoObject_schema_name]
   AND [u].[usp_name] = [ro].[usp_persistence_name]
  )

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'insert new usp'
SET @source_object = '[repo].[RepoObject_gross]'
SET @target_object = '[repo].[GeneratorUsp]'

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

/*{"ReportUspStep":[{"Number":510,"Name":"update steps, changed","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[GeneratorUspStep_Persistence]","log_target_object":"[repo].[GeneratorUspStep]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',3,';',510,';',NULL);

UPDATE T
SET [Parent_Number] = [S].[Parent_Number]
 , [Name] = [S].[Name]
 , [has_logging] = [S].[has_logging]
 , [is_condition] = [S].[is_condition]
 , [is_SubProcedure] = [S].[is_SubProcedure]
 , [Statement] = [S].[Statement]
 , [log_source_object] = [S].[log_source_object]
 , [log_target_object] = [S].[log_target_object]
 , [log_flag_InsertUpdateDelete] = [S].[log_flag_InsertUpdateDelete]
FROM [uspgenerator].[GeneratorUspStep] [T]
INNER JOIN [uspgenerator].[GeneratorUspStep_Persistence] AS [S]
 ON [T].[usp_id] = [S].[usp_id]
  AND [T].[Number] = [S].[Number]
WHERE
 --
 [T].[Parent_Number] <> [S].[Parent_Number]
 OR [T].[Parent_Number] IS NULL
 AND NOT [S].[Parent_Number] IS NULL
 OR NOT [T].[Parent_Number] IS NULL
 AND [S].[Parent_Number] IS NULL
 --
 OR [T].[Name] <> [S].[Name]
 OR [T].[Name] IS NULL
 AND NOT [S].[Name] IS NULL
 OR NOT [T].[Name] IS NULL
 AND [S].[Name] IS NULL
 --
 OR [T].[has_logging] <> [S].[has_logging]
 OR [T].[has_logging] IS NULL
 AND NOT [S].[has_logging] IS NULL
 OR NOT [T].[has_logging] IS NULL
 AND [S].[has_logging] IS NULL
 --
 OR [T].[is_condition] <> [S].[is_condition]
 OR [T].[is_condition] IS NULL
 AND NOT [S].[is_condition] IS NULL
 OR NOT [T].[is_condition] IS NULL
 AND [S].[is_condition] IS NULL
 --
 OR [T].[is_SubProcedure] <> [S].[is_SubProcedure]
 OR [T].[is_SubProcedure] IS NULL
 AND NOT [S].[is_SubProcedure] IS NULL
 OR NOT [T].[is_SubProcedure] IS NULL
 AND [S].[is_SubProcedure] IS NULL
 --
 OR [T].[Statement] <> [S].[Statement]
 OR [T].[Statement] IS NULL
 AND NOT [S].[Statement] IS NULL
 OR NOT [T].[Statement] IS NULL
 AND [S].[Statement] IS NULL
 --
 OR [T].[log_source_object] <> [S].[log_source_object]
 OR [T].[log_source_object] IS NULL
 AND NOT [S].[log_source_object] IS NULL
 OR NOT [T].[log_source_object] IS NULL
 AND [S].[log_source_object] IS NULL
 --
 OR [T].[log_target_object] <> [S].[log_target_object]
 OR [T].[log_target_object] IS NULL
 AND NOT [S].[log_target_object] IS NULL
 OR NOT [T].[log_target_object] IS NULL
 AND [S].[log_target_object] IS NULL
 --
 OR [T].[log_flag_InsertUpdateDelete] <> [S].[log_flag_InsertUpdateDelete]
 OR [T].[log_flag_InsertUpdateDelete] IS NULL
 AND NOT [S].[log_flag_InsertUpdateDelete] IS NULL
 OR NOT [T].[log_flag_InsertUpdateDelete] IS NULL
 AND [S].[log_flag_InsertUpdateDelete] IS NULL

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'update steps, changed'
SET @source_object = '[repo].[GeneratorUspStep_Persistence]'
SET @target_object = '[repo].[GeneratorUspStep]'

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

/*{"ReportUspStep":[{"Number":610,"Name":"insert steps, not existing","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[GeneratorUspStep_Persistence]","log_target_object":"[repo].[GeneratorUspStep]","log_flag_InsertUpdateDelete":"i"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',3,';',610,';',NULL);

INSERT INTO [uspgenerator].[GeneratorUspStep] (
 [usp_id]
 , [Number]
 , [Parent_Number]
 , [Name]
 , [has_logging]
 , [is_condition]
 , [is_inactive]
 , [is_SubProcedure]
 , [Statement]
 , [log_source_object]
 , [log_target_object]
 , [log_flag_InsertUpdateDelete]
 )
--,[info_01]
--,[info_02]
--,[info_03]
--,[info_04]
--,[info_05]
--,[info_06]
--,[info_07]
--,[info_08]
--,[info_09]
SELECT [usp_id]
 , [Number]
 , [Parent_Number]
 , [Name]
 , [has_logging]
 , [is_condition]
 , [is_inactive]
 , [is_SubProcedure]
 , [Statement]
 , [log_source_object]
 , [log_target_object]
 , [log_flag_InsertUpdateDelete]
FROM [uspgenerator].[GeneratorUspStep_Persistence] AS S
WHERE NOT EXISTS (
  SELECT 1
  FROM [uspgenerator].[GeneratorUspStep] AS [T]
  WHERE [T].[usp_id] = [S].[usp_id]
   AND [T].[Number] = [S].[Number]
  )

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'insert steps, not existing'
SET @source_object = '[repo].[GeneratorUspStep_Persistence]'
SET @target_object = '[repo].[GeneratorUspStep]'

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

/*{"ReportUspStep":[{"Number":710,"Name":"update steps; SET [is_inactive] = [setpoint].[is_inactive]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[GeneratorUspStep_Persistence_IsInactive_setpoint]","log_target_object":"[repo].[GeneratorUspStep]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',3,';',710,';',NULL);

UPDATE step
SET [is_inactive] = [setpoint].[is_inactive]
FROM [uspgenerator].[GeneratorUspStep] [step]
INNER JOIN [uspgenerator].[GeneratorUspStep_Persistence_IsInactive_setpoint] [setpoint]
 ON [setpoint].[usp_id] = [step].[usp_id]
  AND [setpoint].[Number] = [step].[Number]
WHERE [setpoint].[is_inactive] <> [step].[is_inactive]

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'update steps; SET [is_inactive] = [setpoint].[is_inactive]'
SET @source_object = '[repo].[GeneratorUspStep_Persistence_IsInactive_setpoint]'
SET @target_object = '[repo].[GeneratorUspStep]'

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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a390291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'PROCEDURE', @level1name = N'usp_GeneratorUsp_insert_update_persistence';


GO
EXECUTE sp_addextendedproperty @name = N'UspParameters', @value = NULL, @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'PROCEDURE', @level1name = N'usp_GeneratorUsp_insert_update_persistence';


GO
EXECUTE sp_addextendedproperty @name = N'UspExamples', @value = NULL, @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'PROCEDURE', @level1name = N'usp_GeneratorUsp_insert_update_persistence';


GO



GO
EXECUTE sp_addextendedproperty @name = N'AdocUspSteps', @value = N'.Steps in [repo].[usp_GeneratorUsp_insert_update_persistence]
[cols="5,200,1,100,100,1"]
|===
|Number
|Name
|Condition
|Source
|Target
|Action

|210
|delete old usp, which doesn''t exist anymore
|0
|[repo].[RepoObject_gross]
| [repo].[GeneratorUsp]
|d

|310
|insert new usp
|0
|[repo].[RepoObject_gross]
|[repo].[GeneratorUsp]
|i

|510
|update steps, changed
|0
|[repo].[GeneratorUspStep_Persistence]
|[repo].[GeneratorUspStep]
|u

|610
|insert steps, not existing
|0
|[repo].[GeneratorUspStep_Persistence]
|[repo].[GeneratorUspStep]
|i

|710
|update steps; SET [is_inactive] = [setpoint].[is_inactive]
|0
|[repo].[GeneratorUspStep_Persistence_IsInactive_setpoint]
|[repo].[GeneratorUspStep]
|u
|===
', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'PROCEDURE', @level1name = N'usp_GeneratorUsp_insert_update_persistence';

