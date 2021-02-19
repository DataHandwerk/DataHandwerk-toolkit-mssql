CREATE   PROCEDURE [repo].[usp_sync_ExtendedProperties_Repo2Sys_Delete]
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
/*{"ReportUspStep":[{"Number":100,"Name":"DECLARE","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":0}]}*/
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

/*{"ReportUspStep":[{"Number":410,"Name":"Level1-Properties - DROP","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[ExtendedProperty_Repo2Sys_level1]","log_target_object":"[sys].[sp_dropextendedproperty]","log_flag_InsertUpdateDelete":"d"}]}*/
DECLARE property_cursor CURSOR READ_ONLY
FOR
--
--level 1 extended properties
SELECT [property_name]
 , [property_value]
 , [level0type]
 , [level0name]
 , [level1type]
 , [level1name]
 , [level2type]
 , [level2name]
FROM [repo_sys].[ExtendedProperties_ParameterForAddUpdateDrop] AS [T]
WHERE NOT [T].[property_name] = 'RepoObject_guid'
 AND NOT [T].[property_name] = 'RepoObjectColumn_guid'
 AND [T].[level2type] IS NULL
 AND [T].[level2name] IS NULL
 AND NOT EXISTS (
  SELECT 1
  FROM [repo].[ExtendedProperty_Repo2Sys_level1] AS [S]
  WHERE [T].[property_name] = [S].[property_name]
   AND [T].[level0type] = [S].[level0type]
   AND [T].[level0name] = [S].[level0name]
   AND [T].[level1type] = [S].[level1type]
   AND [T].[level1name] = [S].[level1name]
   AND [S].[level2type] IS NULL
   AND [S].[level2name] IS NULL
  )

--DECLARE @property_name NVARCHAR(128)
-- , @property_value SQL_VARIANT
-- , @schema_name NVARCHAR(128)
-- , @level0type VARCHAR(128)
-- , @level0name NVARCHAR(128)
-- , @level1type VARCHAR(128)
-- , @level1name NVARCHAR(128)
-- , @level2type VARCHAR(128)
-- , @level2name NVARCHAR(128)

SET @rows = 0;

OPEN property_cursor;

FETCH NEXT
FROM property_cursor
INTO @property_name
 , @property_value
 , @level0type
 , @level0name
 , @level1type
 , @level1name
 , @level2type
 , @level2name

WHILE @@fetch_status <> - 1
BEGIN
 IF @@fetch_status <> - 2
 BEGIN
  EXEC sys.sp_dropextendedproperty @name = @property_name
   , @level0type = @level0type
   , @level0name = @level0name
   , @level1type = @level1type
   , @level1name = @level1name
   , @level2type = @level2type
   , @level2name = @level2name

  SET @rows = @rows + 1;
 END;

 FETCH NEXT
 FROM property_cursor
 INTO @property_name
  , @property_value
  , @level0type
  , @level0name
  , @level1type
  , @level1name
  , @level2type
  , @level2name
END

CLOSE property_cursor;

DEALLOCATE property_cursor

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'Level1-Properties - DROP'
SET @source_object = '[repo].[ExtendedProperty_Repo2Sys_level1]'
SET @target_object = '[sys].[sp_dropextendedproperty]'

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

/*{"ReportUspStep":[{"Number":420,"Name":"Level2-Properties - DROP","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[ExtendedProperty_Repo2Sys_level2_Union]","log_target_object":"[sys].[sp_dropextendedproperty]","log_flag_InsertUpdateDelete":"d"}]}*/
DECLARE property_cursor CURSOR READ_ONLY
FOR
--
--level 2 extended properties
SELECT [property_name]
 , [property_value]
 , [level0type]
 , [level0name]
 , [level1type]
 , [level1name]
 , [level2type]
 , [level2name]
FROM [repo_sys].[ExtendedProperties_ParameterForAddUpdateDrop] AS [T]
WHERE NOT [T].[property_name] = 'RepoObject_guid'
 AND NOT [T].[property_name] = 'RepoObjectColumn_guid'
 AND NOT [T].[level2type] IS NULL
 AND NOT [T].[level2name] IS NULL
 AND NOT EXISTS (
  SELECT 1
  FROM [repo].[ExtendedProperty_Repo2Sys_level2_Union] AS [S]
  WHERE [T].[property_name] = [S].[property_name]
   AND [T].[level0type] = [S].[level0type]
   AND [T].[level0name] = [S].[level0name]
   AND [T].[level1type] = [S].[level1type]
   AND [T].[level1name] = [S].[level1name]
   AND [T].[level2type] = [S].[level2type]
   AND [T].[level2name] = [S].[level2name]
  )

--DECLARE @property_name NVARCHAR(128)
-- , @property_value SQL_VARIANT
-- , @schema_name NVARCHAR(128)
-- , @level0type VARCHAR(128)
-- , @level0name NVARCHAR(128)
-- , @level1type VARCHAR(128)
-- , @level1name NVARCHAR(128)
-- , @level2type VARCHAR(128)
-- , @level2name NVARCHAR(128)

SET @rows = 0;

OPEN property_cursor;

FETCH NEXT
FROM property_cursor
INTO @property_name
 , @property_value
 , @level0type
 , @level0name
 , @level1type
 , @level1name
 , @level2type
 , @level2name

WHILE @@fetch_status <> - 1
BEGIN
 IF @@fetch_status <> - 2
 BEGIN
  EXEC sys.sp_dropextendedproperty @name = @property_name
   , @level0type = @level0type
   , @level0name = @level0name
   , @level1type = @level1type
   , @level1name = @level1name
   , @level2type = @level2type
   , @level2name = @level2name

  SET @rows = @rows + 1;
 END;

 FETCH NEXT
 FROM property_cursor
 INTO @property_name
  , @property_value
  , @level0type
  , @level0name
  , @level1type
  , @level1name
  , @level2type
  , @level2name
END

CLOSE property_cursor;

DEALLOCATE property_cursor

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'Level2-Properties - DROP'
SET @source_object = '[repo].[ExtendedProperty_Repo2Sys_level2_Union]'
SET @target_object = '[sys].[sp_dropextendedproperty]'

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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5bb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_sync_ExtendedProperties_Repo2Sys_Delete';

