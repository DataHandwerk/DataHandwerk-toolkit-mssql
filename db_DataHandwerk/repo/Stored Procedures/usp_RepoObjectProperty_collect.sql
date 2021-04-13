﻿CREATE   PROCEDURE [repo].[usp_RepoObjectProperty_collect]
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
PRINT '[repo].[usp_RepoObjectProperty_collect]'
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
--
/*{"ReportUspStep":[{"Number":210,"Name":"AdocUspSteps from [repo].[GeneratorUsp_SqlUsp]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[GeneratorUsp_SqlUsp]","log_target_object":"[repo].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',20,';',210,';',NULL);

MERGE [repo].[RepoObjectProperty] AS t
USING (
 SELECT [RepoObject_guid]
  , [property_name] = 'AdocUspSteps'
  , [property_value] = CAST([AdocUspSteps] AS NVARCHAR(4000))
 FROM [uspgenerator].[GeneratorUsp_SqlUsp]
 WHERE NOT [RepoObject_guid] IS NULL
 ) AS s
 ON t.[RepoObject_guid] = s.[RepoObject_guid]
  AND t.[property_name] = s.[property_name]
WHEN MATCHED
 AND (
  t.[property_value] <> s.[property_value]
  OR t.[property_value] IS NULL AND NOT s.[property_value] IS NULL
  OR s.[property_value] IS NULL AND NOT t.[property_value] IS NULL
  )
 THEN
  UPDATE
  SET [property_value] = s.[property_value]
WHEN NOT MATCHED
 AND NOT s.[property_value] IS NULL
 THEN
  INSERT (
   [RepoObject_guid]
   , [property_name]
   , [property_value]
   )
  VALUES (
   s.[RepoObject_guid]
   , s.[property_name]
   , s.[property_value]
   )
OUTPUT deleted.*
 , $ACTION
 , inserted.*;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'AdocUspSteps from [repo].[GeneratorUsp_SqlUsp]'
SET @source_object = '[repo].[GeneratorUsp_SqlUsp]'
SET @target_object = '[repo].[RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":220,"Name":"UspParameters from [repo].[GeneratorUsp_SqlUsp]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[GeneratorUsp_SqlUsp]","log_target_object":"[repo].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',20,';',220,';',NULL);

MERGE [repo].[RepoObjectProperty] AS t
USING (
 SELECT [RepoObject_guid]
  , [property_name] = 'UspParameters'
  , [property_value] = CAST([UspParameters] AS NVARCHAR(4000))
 FROM [uspgenerator].[GeneratorUsp_SqlUsp]
 WHERE NOT [RepoObject_guid] IS NULL
 ) AS s
 ON t.[RepoObject_guid] = s.[RepoObject_guid]
  AND t.[property_name] = s.[property_name]
WHEN MATCHED
 AND (
  t.[property_value] <> s.[property_value]
  OR t.[property_value] IS NULL AND NOT s.[property_value] IS NULL
  OR s.[property_value] IS NULL AND NOT t.[property_value] IS NULL
  )
 THEN
  UPDATE
  SET [property_value] = s.[property_value]
WHEN NOT MATCHED
 AND NOT s.[property_value] IS NULL
 THEN
  INSERT (
   [RepoObject_guid]
   , [property_name]
   , [property_value]
   )
  VALUES (
   s.[RepoObject_guid]
   , s.[property_name]
   , s.[property_value]
   )
OUTPUT deleted.*
 , $ACTION
 , inserted.*;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'UspParameters from [repo].[GeneratorUsp_SqlUsp]'
SET @source_object = '[repo].[GeneratorUsp_SqlUsp]'
SET @target_object = '[repo].[RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":230,"Name":"UspExamples from [repo].[GeneratorUsp_SqlUsp]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[GeneratorUsp_SqlUsp]","log_target_object":"[repo].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',20,';',230,';',NULL);

MERGE [repo].[RepoObjectProperty] AS t
USING (
 SELECT [RepoObject_guid]
  , [property_name] = 'UspExamples'
  , [property_value] = CAST([UspExamples] AS NVARCHAR(4000))
 FROM [uspgenerator].[GeneratorUsp_SqlUsp]
 WHERE NOT [RepoObject_guid] IS NULL
 ) AS s
 ON t.[RepoObject_guid] = s.[RepoObject_guid]
  AND t.[property_name] = s.[property_name]
WHEN MATCHED
 AND (
  t.[property_value] <> s.[property_value]
  OR t.[property_value] IS NULL
  AND NOT s.[property_value] IS NULL
  OR s.[property_value] IS NULL
  AND NOT t.[property_value] IS NULL
  )
 THEN
  UPDATE
  SET [property_value] = s.[property_value]
WHEN NOT MATCHED
 AND NOT s.[property_value] IS NULL
 THEN
  INSERT (
   [RepoObject_guid]
   , [property_name]
   , [property_value]
   )
  VALUES (
   s.[RepoObject_guid]
   , s.[property_name]
   , s.[property_value]
   )
OUTPUT deleted.*
 , $ACTION
 , inserted.*;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'UspExamples from [repo].[GeneratorUsp_SqlUsp]'
SET @source_object = '[repo].[GeneratorUsp_SqlUsp]'
SET @target_object = '[repo].[RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":240,"Name":"MS_Description from [repo].[GeneratorUsp_SqlUsp]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[GeneratorUsp_SqlUsp]","log_target_object":"[repo].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',20,';',240,';',NULL);

MERGE [repo].[RepoObjectProperty] AS t
USING (
 SELECT [RepoObject_guid]
  , [property_name] = 'MS_Description'
  , [property_value] = CAST([MS_Description] AS NVARCHAR(4000))
 FROM [uspgenerator].[GeneratorUsp_SqlUsp]
 WHERE NOT [RepoObject_guid] IS NULL
 ) AS s
 ON t.[RepoObject_guid] = s.[RepoObject_guid]
  AND t.[property_name] = s.[property_name]
WHEN MATCHED
 AND (
  t.[property_value] <> s.[property_value]
  OR t.[property_value] IS NULL
  AND NOT s.[property_value] IS NULL
  OR s.[property_value] IS NULL
  AND NOT t.[property_value] IS NULL
  )
 THEN
  UPDATE
  SET [property_value] = s.[property_value]
WHEN NOT MATCHED
 AND NOT s.[property_value] IS NULL
 THEN
  INSERT (
   [RepoObject_guid]
   , [property_name]
   , [property_value]
   )
  VALUES (
   s.[RepoObject_guid]
   , s.[property_name]
   , s.[property_value]
   )
OUTPUT deleted.*
 , $ACTION
 , inserted.*;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'MS_Description from [repo].[GeneratorUsp_SqlUsp]'
SET @source_object = '[repo].[GeneratorUsp_SqlUsp]'
SET @target_object = '[repo].[RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":310,"Name":"pk_index_guid","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject_gross]","log_target_object":"[repo].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',20,';',310,';',NULL);

MERGE [repo].[RepoObjectProperty] AS t
USING (
 SELECT [RepoObject_guid]
  , [property_name] = 'pk_index_guid'
  , [property_value] = CAST([pk_index_guid] AS NVARCHAR(4000))
 FROM [repo].[RepoObject_gross]
 WHERE NOT [RepoObject_guid] IS NULL
 ) AS s
 ON t.[RepoObject_guid] = s.[RepoObject_guid]
  AND t.[property_name] = s.[property_name]
WHEN MATCHED
 AND (
  t.[property_value] <> s.[property_value]
  OR t.[property_value] IS NULL AND NOT s.[property_value] IS NULL
  OR s.[property_value] IS NULL AND NOT t.[property_value] IS NULL
  )
 THEN
  UPDATE
  SET [property_value] = s.[property_value]
WHEN NOT MATCHED
 AND NOT s.[property_value] IS NULL
 THEN
  INSERT (
   [RepoObject_guid]
   , [property_name]
   , [property_value]
   )
  VALUES (
   s.[RepoObject_guid]
   , s.[property_name]
   , s.[property_value]
   )
OUTPUT deleted.*
 , $ACTION
 , inserted.*;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'pk_index_guid'
SET @source_object = '[repo].[RepoObject_gross]'
SET @target_object = '[repo].[RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":320,"Name":"pk_IndexPatternColumnDatatype","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject_gross]","log_target_object":"[repo].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',20,';',320,';',NULL);

MERGE [repo].[RepoObjectProperty] AS t
USING (
 SELECT [RepoObject_guid]
  , [property_name] = 'pk_IndexPatternColumnDatatype'
  , [property_value] = CAST([pk_IndexPatternColumnDatatype] AS NVARCHAR(4000))
 FROM [repo].[RepoObject_gross]
 WHERE NOT [RepoObject_guid] IS NULL
 ) AS s
 ON t.[RepoObject_guid] = s.[RepoObject_guid]
  AND t.[property_name] = s.[property_name]
WHEN MATCHED
 AND (
  t.[property_value] <> s.[property_value]
  OR t.[property_value] IS NULL AND NOT s.[property_value] IS NULL
  OR s.[property_value] IS NULL AND NOT t.[property_value] IS NULL
  )
 THEN
  UPDATE
  SET [property_value] = s.[property_value]
WHEN NOT MATCHED
 AND NOT s.[property_value] IS NULL
 THEN
  INSERT (
   [RepoObject_guid]
   , [property_name]
   , [property_value]
   )
  VALUES (
   s.[RepoObject_guid]
   , s.[property_name]
   , s.[property_value]
   )
OUTPUT deleted.*
 , $ACTION
 , inserted.*;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'pk_IndexPatternColumnDatatype'
SET @source_object = '[repo].[RepoObject_gross]'
SET @target_object = '[repo].[RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":330,"Name":"pk_IndexPatternColumnName","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject_gross]","log_target_object":"[repo].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',20,';',330,';',NULL);

MERGE [repo].[RepoObjectProperty] AS t
USING (
 SELECT [RepoObject_guid]
  , [property_name] = 'pk_IndexPatternColumnName'
  , [property_value] = CAST([pk_IndexPatternColumnName] AS NVARCHAR(4000))
 FROM [repo].[RepoObject_gross]
 WHERE NOT [RepoObject_guid] IS NULL
 ) AS s
 ON t.[RepoObject_guid] = s.[RepoObject_guid]
  AND t.[property_name] = s.[property_name]
WHEN MATCHED
 AND (
  t.[property_value] <> s.[property_value]
  OR t.[property_value] IS NULL AND NOT s.[property_value] IS NULL
  OR s.[property_value] IS NULL AND NOT t.[property_value] IS NULL
  )
 THEN
  UPDATE
  SET [property_value] = s.[property_value]
WHEN NOT MATCHED
 AND NOT s.[property_value] IS NULL
 THEN
  INSERT (
   [RepoObject_guid]
   , [property_name]
   , [property_value]
   )
  VALUES (
   s.[RepoObject_guid]
   , s.[property_name]
   , s.[property_value]
   )
OUTPUT deleted.*
 , $ACTION
 , inserted.*;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'pk_IndexPatternColumnName'
SET @source_object = '[repo].[RepoObject_gross]'
SET @target_object = '[repo].[RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":340,"Name":"pk_IndexSemanticGroup","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject_gross]","log_target_object":"[repo].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',20,';',340,';',NULL);

MERGE [repo].[RepoObjectProperty] AS t
USING (
 SELECT [RepoObject_guid]
  , [property_name] = 'pk_IndexSemanticGroup'
  , [property_value] = CAST([pk_IndexSemanticGroup] AS NVARCHAR(4000))
 FROM [repo].[RepoObject_gross]
 WHERE NOT [RepoObject_guid] IS NULL
 ) AS s
 ON t.[RepoObject_guid] = s.[RepoObject_guid]
  AND t.[property_name] = s.[property_name]
WHEN MATCHED
 AND (
  t.[property_value] <> s.[property_value]
  OR t.[property_value] IS NULL AND NOT s.[property_value] IS NULL
  OR s.[property_value] IS NULL AND NOT t.[property_value] IS NULL
  )
 THEN
  UPDATE
  SET [property_value] = s.[property_value]
WHEN NOT MATCHED
 AND NOT s.[property_value] IS NULL
 THEN
  INSERT (
   [RepoObject_guid]
   , [property_name]
   , [property_value]
   )
  VALUES (
   s.[RepoObject_guid]
   , s.[property_name]
   , s.[property_value]
   )
OUTPUT deleted.*
 , $ACTION
 , inserted.*;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'pk_IndexSemanticGroup'
SET @source_object = '[repo].[RepoObject_gross]'
SET @target_object = '[repo].[RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":350,"Name":"is_repo_managed","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject_gross]","log_target_object":"[repo].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',20,';',350,';',NULL);

MERGE [repo].[RepoObjectProperty] AS t
USING (
 SELECT [RepoObject_guid]
  , [property_name] = 'is_repo_managed'
  , [property_value] = CAST([is_repo_managed] AS NVARCHAR(4000))
 FROM [repo].[RepoObject_gross]
 WHERE NOT [RepoObject_guid] IS NULL
 ) AS s
 ON t.[RepoObject_guid] = s.[RepoObject_guid]
  AND t.[property_name] = s.[property_name]
WHEN MATCHED
 AND (
  t.[property_value] <> s.[property_value]
  OR t.[property_value] IS NULL AND NOT s.[property_value] IS NULL
  OR s.[property_value] IS NULL AND NOT t.[property_value] IS NULL
  )
 THEN
  UPDATE
  SET [property_value] = s.[property_value]
WHEN NOT MATCHED
 AND NOT s.[property_value] IS NULL
 THEN
  INSERT (
   [RepoObject_guid]
   , [property_name]
   , [property_value]
   )
  VALUES (
   s.[RepoObject_guid]
   , s.[property_name]
   , s.[property_value]
   )
OUTPUT deleted.*
 , $ACTION
 , inserted.*;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'is_repo_managed'
SET @source_object = '[repo].[RepoObject_gross]'
SET @target_object = '[repo].[RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":360,"Name":"usp_persistence_RepoObject_guid","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject_gross]","log_target_object":"[repo].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',20,';',360,';',NULL);

MERGE [repo].[RepoObjectProperty] AS t
USING (
 SELECT [RepoObject_guid]
  , [property_name] = 'usp_persistence_RepoObject_guid'
  , [property_value] = CAST([usp_persistence_RepoObject_guid] AS NVARCHAR(4000))
 FROM [repo].[RepoObject_gross]
 WHERE NOT [RepoObject_guid] IS NULL
 ) AS s
 ON t.[RepoObject_guid] = s.[RepoObject_guid]
  AND t.[property_name] = s.[property_name]
WHEN MATCHED
 AND (
  t.[property_value] <> s.[property_value]
  OR t.[property_value] IS NULL AND NOT s.[property_value] IS NULL
  OR s.[property_value] IS NULL AND NOT t.[property_value] IS NULL
  )
 THEN
  UPDATE
  SET [property_value] = s.[property_value]
WHEN NOT MATCHED
 AND NOT s.[property_value] IS NULL
 THEN
  INSERT (
   [RepoObject_guid]
   , [property_name]
   , [property_value]
   )
  VALUES (
   s.[RepoObject_guid]
   , s.[property_name]
   , s.[property_value]
   )
OUTPUT deleted.*
 , $ACTION
 , inserted.*;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'usp_persistence_RepoObject_guid'
SET @source_object = '[repo].[RepoObject_gross]'
SET @target_object = '[repo].[RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":370,"Name":"persistence_source_RepoObject_guid","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject_gross]","log_target_object":"[repo].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',20,';',370,';',NULL);

MERGE [repo].[RepoObjectProperty] AS t
USING (
 SELECT [RepoObject_guid]
  , [property_name] = 'persistence_source_RepoObject_guid'
  , [property_value] = CAST([persistence_source_RepoObject_guid] AS NVARCHAR(4000))
 FROM [repo].[RepoObject_gross]
 WHERE NOT [RepoObject_guid] IS NULL
 ) AS s
 ON t.[RepoObject_guid] = s.[RepoObject_guid]
  AND t.[property_name] = s.[property_name]
WHEN MATCHED
 AND (
  t.[property_value] <> s.[property_value]
  OR t.[property_value] IS NULL AND NOT s.[property_value] IS NULL
  OR s.[property_value] IS NULL AND NOT t.[property_value] IS NULL
  )
 THEN
  UPDATE
  SET [property_value] = s.[property_value]
WHEN NOT MATCHED
 AND NOT s.[property_value] IS NULL
 THEN
  INSERT (
   [RepoObject_guid]
   , [property_name]
   , [property_value]
   )
  VALUES (
   s.[RepoObject_guid]
   , s.[property_name]
   , s.[property_value]
   )
OUTPUT deleted.*
 , $ACTION
 , inserted.*;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'persistence_source_RepoObject_guid'
SET @source_object = '[repo].[RepoObject_gross]'
SET @target_object = '[repo].[RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":380,"Name":"persistence_source_RepoObject_fullname","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject_gross]","log_target_object":"[repo].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',20,';',380,';',NULL);

MERGE [repo].[RepoObjectProperty] AS t
USING (
 SELECT [RepoObject_guid]
  , [property_name] = 'persistence_source_RepoObject_fullname'
  , [property_value] = CAST([persistence_source_RepoObject_fullname] AS NVARCHAR(4000))
 FROM [repo].[RepoObject_gross]
 WHERE NOT [RepoObject_guid] IS NULL
 ) AS s
 ON t.[RepoObject_guid] = s.[RepoObject_guid]
  AND t.[property_name] = s.[property_name]
WHEN MATCHED
 AND (
  t.[property_value] <> s.[property_value]
  OR t.[property_value] IS NULL AND NOT s.[property_value] IS NULL
  OR s.[property_value] IS NULL AND NOT t.[property_value] IS NULL
  )
 THEN
  UPDATE
  SET [property_value] = s.[property_value]
WHEN NOT MATCHED
 AND NOT s.[property_value] IS NULL
 THEN
  INSERT (
   [RepoObject_guid]
   , [property_name]
   , [property_value]
   )
  VALUES (
   s.[RepoObject_guid]
   , s.[property_name]
   , s.[property_value]
   )
OUTPUT deleted.*
 , $ACTION
 , inserted.*;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'persistence_source_RepoObject_fullname'
SET @source_object = '[repo].[RepoObject_gross]'
SET @target_object = '[repo].[RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":381,"Name":"persistence_source_RepoObject_fullname2","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject_gross]","log_target_object":"[repo].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',20,';',381,';',NULL);

MERGE [repo].[RepoObjectProperty] AS t
USING (
 SELECT [RepoObject_guid]
  , [property_name] = 'persistence_source_RepoObject_fullname2'
  , [property_value] = CAST([persistence_source_RepoObject_fullname2] AS NVARCHAR(4000))
 FROM [repo].[RepoObject_gross]
 WHERE NOT [RepoObject_guid] IS NULL
 ) AS s
 ON t.[RepoObject_guid] = s.[RepoObject_guid]
  AND t.[property_name] = s.[property_name]
WHEN MATCHED
 AND (
  t.[property_value] <> s.[property_value]
  OR t.[property_value] IS NULL AND NOT s.[property_value] IS NULL
  OR s.[property_value] IS NULL AND NOT t.[property_value] IS NULL
  )
 THEN
  UPDATE
  SET [property_value] = s.[property_value]
WHEN NOT MATCHED
 AND NOT s.[property_value] IS NULL
 THEN
  INSERT (
   [RepoObject_guid]
   , [property_name]
   , [property_value]
   )
  VALUES (
   s.[RepoObject_guid]
   , s.[property_name]
   , s.[property_value]
   )
OUTPUT deleted.*
 , $ACTION
 , inserted.*;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'persistence_source_RepoObject_fullname2'
SET @source_object = '[repo].[RepoObject_gross]'
SET @target_object = '[repo].[RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":382,"Name":"persistence_source_RepoObject_xref","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject_gross]","log_target_object":"[repo].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',20,';',382,';',NULL);

MERGE [repo].[RepoObjectProperty] AS t
USING (
 SELECT [RepoObject_guid]
  , [property_name] = 'persistence_source_RepoObject_xref'
  , [property_value] = CAST([persistence_source_RepoObject_xref] AS NVARCHAR(4000))
 FROM [repo].[RepoObject_gross]
 WHERE NOT [RepoObject_guid] IS NULL
 ) AS s
 ON t.[RepoObject_guid] = s.[RepoObject_guid]
  AND t.[property_name] = s.[property_name]
WHEN MATCHED
 AND (
  t.[property_value] <> s.[property_value]
  OR t.[property_value] IS NULL AND NOT s.[property_value] IS NULL
  OR s.[property_value] IS NULL AND NOT t.[property_value] IS NULL
  )
 THEN
  UPDATE
  SET [property_value] = s.[property_value]
WHEN NOT MATCHED
 AND NOT s.[property_value] IS NULL
 THEN
  INSERT (
   [RepoObject_guid]
   , [property_name]
   , [property_value]
   )
  VALUES (
   s.[RepoObject_guid]
   , s.[property_name]
   , s.[property_value]
   )
OUTPUT deleted.*
 , $ACTION
 , inserted.*;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'persistence_source_RepoObject_xref'
SET @source_object = '[repo].[RepoObject_gross]'
SET @target_object = '[repo].[RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":390,"Name":"has_history","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject_gross]","log_target_object":"[repo].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',20,';',390,';',NULL);

MERGE [repo].[RepoObjectProperty] AS t
USING (
 SELECT [RepoObject_guid]
  , [property_name] = 'has_history'
  , [property_value] = CAST([has_history] AS NVARCHAR(4000))
 FROM [repo].[RepoObject_gross]
 WHERE NOT [RepoObject_guid] IS NULL
 ) AS s
 ON t.[RepoObject_guid] = s.[RepoObject_guid]
  AND t.[property_name] = s.[property_name]
WHEN MATCHED
 AND (
  t.[property_value] <> s.[property_value]
  OR t.[property_value] IS NULL AND NOT s.[property_value] IS NULL
  OR s.[property_value] IS NULL AND NOT t.[property_value] IS NULL
  )
 THEN
  UPDATE
  SET [property_value] = s.[property_value]
WHEN NOT MATCHED
 AND NOT s.[property_value] IS NULL
 THEN
  INSERT (
   [RepoObject_guid]
   , [property_name]
   , [property_value]
   )
  VALUES (
   s.[RepoObject_guid]
   , s.[property_name]
   , s.[property_value]
   )
OUTPUT deleted.*
 , $ACTION
 , inserted.*;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'has_history'
SET @source_object = '[repo].[RepoObject_gross]'
SET @target_object = '[repo].[RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":410,"Name":"has_history_columns","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject_gross]","log_target_object":"[repo].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',20,';',410,';',NULL);

MERGE [repo].[RepoObjectProperty] AS t
USING (
 SELECT [RepoObject_guid]
  , [property_name] = 'has_history_columns'
  , [property_value] = CAST([has_history_columns] AS NVARCHAR(4000))
 FROM [repo].[RepoObject_gross]
 WHERE NOT [RepoObject_guid] IS NULL
 ) AS s
 ON t.[RepoObject_guid] = s.[RepoObject_guid]
  AND t.[property_name] = s.[property_name]
WHEN MATCHED
 AND (
  t.[property_value] <> s.[property_value]
  OR t.[property_value] IS NULL AND NOT s.[property_value] IS NULL
  OR s.[property_value] IS NULL AND NOT t.[property_value] IS NULL
  )
 THEN
  UPDATE
  SET [property_value] = s.[property_value]
WHEN NOT MATCHED
 AND NOT s.[property_value] IS NULL
 THEN
  INSERT (
   [RepoObject_guid]
   , [property_name]
   , [property_value]
   )
  VALUES (
   s.[RepoObject_guid]
   , s.[property_name]
   , s.[property_value]
   )
OUTPUT deleted.*
 , $ACTION
 , inserted.*;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'has_history_columns'
SET @source_object = '[repo].[RepoObject_gross]'
SET @target_object = '[repo].[RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":420,"Name":"is_persistence","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject_gross]","log_target_object":"[repo].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',20,';',420,';',NULL);

MERGE [repo].[RepoObjectProperty] AS t
USING (
 SELECT [RepoObject_guid]
  , [property_name] = 'is_persistence'
  , [property_value] = CAST([is_persistence] AS NVARCHAR(4000))
 FROM [repo].[RepoObject_gross]
 WHERE NOT [RepoObject_guid] IS NULL
 ) AS s
 ON t.[RepoObject_guid] = s.[RepoObject_guid]
  AND t.[property_name] = s.[property_name]
WHEN MATCHED
 AND (
  t.[property_value] <> s.[property_value]
  OR t.[property_value] IS NULL AND NOT s.[property_value] IS NULL
  OR s.[property_value] IS NULL AND NOT t.[property_value] IS NULL
  )
 THEN
  UPDATE
  SET [property_value] = s.[property_value]
WHEN NOT MATCHED
 AND NOT s.[property_value] IS NULL
 THEN
  INSERT (
   [RepoObject_guid]
   , [property_name]
   , [property_value]
   )
  VALUES (
   s.[RepoObject_guid]
   , s.[property_name]
   , s.[property_value]
   )
OUTPUT deleted.*
 , $ACTION
 , inserted.*;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'is_persistence'
SET @source_object = '[repo].[RepoObject_gross]'
SET @target_object = '[repo].[RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":421,"Name":"is_persistence_check_duplicate_per_pk","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject_gross]","log_target_object":"[repo].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',20,';',421,';',NULL);

MERGE [repo].[RepoObjectProperty] AS t
USING (
 SELECT [RepoObject_guid]
  , [property_name] = 'is_persistence_check_duplicate_per_pk'
  , [property_value] = CAST([is_persistence_check_duplicate_per_pk] AS NVARCHAR(4000))
 FROM [repo].[RepoObject_gross]
 WHERE NOT [RepoObject_guid] IS NULL
 ) AS s
 ON t.[RepoObject_guid] = s.[RepoObject_guid]
  AND t.[property_name] = s.[property_name]
WHEN MATCHED
 AND (
  t.[property_value] <> s.[property_value]
  OR t.[property_value] IS NULL AND NOT s.[property_value] IS NULL
  OR s.[property_value] IS NULL AND NOT t.[property_value] IS NULL
  )
 THEN
  UPDATE
  SET [property_value] = s.[property_value]
WHEN NOT MATCHED
 AND NOT s.[property_value] IS NULL
 THEN
  INSERT (
   [RepoObject_guid]
   , [property_name]
   , [property_value]
   )
  VALUES (
   s.[RepoObject_guid]
   , s.[property_name]
   , s.[property_value]
   )
OUTPUT deleted.*
 , $ACTION
 , inserted.*;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'is_persistence_check_duplicate_per_pk'
SET @source_object = '[repo].[RepoObject_gross]'
SET @target_object = '[repo].[RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":422,"Name":"is_persistence_check_for_empty_source","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject_gross]","log_target_object":"[repo].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',20,';',422,';',NULL);

MERGE [repo].[RepoObjectProperty] AS t
USING (
 SELECT [RepoObject_guid]
  , [property_name] = 'is_persistence_check_for_empty_source'
  , [property_value] = CAST([is_persistence_check_for_empty_source] AS NVARCHAR(4000))
 FROM [repo].[RepoObject_gross]
 WHERE NOT [RepoObject_guid] IS NULL
 ) AS s
 ON t.[RepoObject_guid] = s.[RepoObject_guid]
  AND t.[property_name] = s.[property_name]
WHEN MATCHED
 AND (
  t.[property_value] <> s.[property_value]
  OR t.[property_value] IS NULL AND NOT s.[property_value] IS NULL
  OR s.[property_value] IS NULL AND NOT t.[property_value] IS NULL
  )
 THEN
  UPDATE
  SET [property_value] = s.[property_value]
WHEN NOT MATCHED
 AND NOT s.[property_value] IS NULL
 THEN
  INSERT (
   [RepoObject_guid]
   , [property_name]
   , [property_value]
   )
  VALUES (
   s.[RepoObject_guid]
   , s.[property_name]
   , s.[property_value]
   )
OUTPUT deleted.*
 , $ACTION
 , inserted.*;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'is_persistence_check_for_empty_source'
SET @source_object = '[repo].[RepoObject_gross]'
SET @target_object = '[repo].[RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":423,"Name":"is_persistence_delete_missing","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject_gross]","log_target_object":"[repo].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',20,';',423,';',NULL);

MERGE [repo].[RepoObjectProperty] AS t
USING (
 SELECT [RepoObject_guid]
  , [property_name] = 'is_persistence_delete_missing'
  , [property_value] = CAST([is_persistence_delete_missing] AS NVARCHAR(4000))
 FROM [repo].[RepoObject_gross]
 WHERE NOT [RepoObject_guid] IS NULL
 ) AS s
 ON t.[RepoObject_guid] = s.[RepoObject_guid]
  AND t.[property_name] = s.[property_name]
WHEN MATCHED
 AND (
  t.[property_value] <> s.[property_value]
  OR t.[property_value] IS NULL AND NOT s.[property_value] IS NULL
  OR s.[property_value] IS NULL AND NOT t.[property_value] IS NULL
  )
 THEN
  UPDATE
  SET [property_value] = s.[property_value]
WHEN NOT MATCHED
 AND NOT s.[property_value] IS NULL
 THEN
  INSERT (
   [RepoObject_guid]
   , [property_name]
   , [property_value]
   )
  VALUES (
   s.[RepoObject_guid]
   , s.[property_name]
   , s.[property_value]
   )
OUTPUT deleted.*
 , $ACTION
 , inserted.*;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'is_persistence_delete_missing'
SET @source_object = '[repo].[RepoObject_gross]'
SET @target_object = '[repo].[RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":424,"Name":"is_persistence_delete_changed","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject_gross]","log_target_object":"[repo].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',20,';',424,';',NULL);

MERGE [repo].[RepoObjectProperty] AS t
USING (
 SELECT [RepoObject_guid]
  , [property_name] = 'is_persistence_delete_changed'
  , [property_value] = CAST([is_persistence_delete_changed] AS NVARCHAR(4000))
 FROM [repo].[RepoObject_gross]
 WHERE NOT [RepoObject_guid] IS NULL
 ) AS s
 ON t.[RepoObject_guid] = s.[RepoObject_guid]
  AND t.[property_name] = s.[property_name]
WHEN MATCHED
 AND (
  t.[property_value] <> s.[property_value]
  OR t.[property_value] IS NULL AND NOT s.[property_value] IS NULL
  OR s.[property_value] IS NULL AND NOT t.[property_value] IS NULL
  )
 THEN
  UPDATE
  SET [property_value] = s.[property_value]
WHEN NOT MATCHED
 AND NOT s.[property_value] IS NULL
 THEN
  INSERT (
   [RepoObject_guid]
   , [property_name]
   , [property_value]
   )
  VALUES (
   s.[RepoObject_guid]
   , s.[property_name]
   , s.[property_value]
   )
OUTPUT deleted.*
 , $ACTION
 , inserted.*;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'is_persistence_delete_changed'
SET @source_object = '[repo].[RepoObject_gross]'
SET @target_object = '[repo].[RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":425,"Name":"is_persistence_insert","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject_gross]","log_target_object":"[repo].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',20,';',425,';',NULL);

MERGE [repo].[RepoObjectProperty] AS t
USING (
 SELECT [RepoObject_guid]
  , [property_name] = 'is_persistence_insert'
  , [property_value] = CAST([is_persistence_insert] AS NVARCHAR(4000))
 FROM [repo].[RepoObject_gross]
 WHERE NOT [RepoObject_guid] IS NULL
 ) AS s
 ON t.[RepoObject_guid] = s.[RepoObject_guid]
  AND t.[property_name] = s.[property_name]
WHEN MATCHED
 AND (
  t.[property_value] <> s.[property_value]
  OR t.[property_value] IS NULL AND NOT s.[property_value] IS NULL
  OR s.[property_value] IS NULL AND NOT t.[property_value] IS NULL
  )
 THEN
  UPDATE
  SET [property_value] = s.[property_value]
WHEN NOT MATCHED
 AND NOT s.[property_value] IS NULL
 THEN
  INSERT (
   [RepoObject_guid]
   , [property_name]
   , [property_value]
   )
  VALUES (
   s.[RepoObject_guid]
   , s.[property_name]
   , s.[property_value]
   )
OUTPUT deleted.*
 , $ACTION
 , inserted.*;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'is_persistence_insert'
SET @source_object = '[repo].[RepoObject_gross]'
SET @target_object = '[repo].[RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":426,"Name":"is_persistence_truncate","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject_gross]","log_target_object":"[repo].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',20,';',426,';',NULL);

MERGE [repo].[RepoObjectProperty] AS t
USING (
 SELECT [RepoObject_guid]
  , [property_name] = 'is_persistence_truncate'
  , [property_value] = CAST([is_persistence_truncate] AS NVARCHAR(4000))
 FROM [repo].[RepoObject_gross]
 WHERE NOT [RepoObject_guid] IS NULL
 ) AS s
 ON t.[RepoObject_guid] = s.[RepoObject_guid]
  AND t.[property_name] = s.[property_name]
WHEN MATCHED
 AND (
  t.[property_value] <> s.[property_value]
  OR t.[property_value] IS NULL AND NOT s.[property_value] IS NULL
  OR s.[property_value] IS NULL AND NOT t.[property_value] IS NULL
  )
 THEN
  UPDATE
  SET [property_value] = s.[property_value]
WHEN NOT MATCHED
 AND NOT s.[property_value] IS NULL
 THEN
  INSERT (
   [RepoObject_guid]
   , [property_name]
   , [property_value]
   )
  VALUES (
   s.[RepoObject_guid]
   , s.[property_name]
   , s.[property_value]
   )
OUTPUT deleted.*
 , $ACTION
 , inserted.*;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'is_persistence_truncate'
SET @source_object = '[repo].[RepoObject_gross]'
SET @target_object = '[repo].[RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":427,"Name":"is_persistence_update_changed","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject_gross]","log_target_object":"[repo].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',20,';',427,';',NULL);

MERGE [repo].[RepoObjectProperty] AS t
USING (
 SELECT [RepoObject_guid]
  , [property_name] = 'is_persistence_update_changed'
  , [property_value] = CAST([is_persistence_update_changed] AS NVARCHAR(4000))
 FROM [repo].[RepoObject_gross]
 WHERE NOT [RepoObject_guid] IS NULL
 ) AS s
 ON t.[RepoObject_guid] = s.[RepoObject_guid]
  AND t.[property_name] = s.[property_name]
WHEN MATCHED
 AND (
  t.[property_value] <> s.[property_value]
  OR t.[property_value] IS NULL AND NOT s.[property_value] IS NULL
  OR s.[property_value] IS NULL AND NOT t.[property_value] IS NULL
  )
 THEN
  UPDATE
  SET [property_value] = s.[property_value]
WHEN NOT MATCHED
 AND NOT s.[property_value] IS NULL
 THEN
  INSERT (
   [RepoObject_guid]
   , [property_name]
   , [property_value]
   )
  VALUES (
   s.[RepoObject_guid]
   , s.[property_name]
   , s.[property_value]
   )
OUTPUT deleted.*
 , $ACTION
 , inserted.*;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'is_persistence_update_changed'
SET @source_object = '[repo].[RepoObject_gross]'
SET @target_object = '[repo].[RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":440,"Name":"history_schema_name","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject_gross]","log_target_object":"[repo].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',20,';',440,';',NULL);

MERGE [repo].[RepoObjectProperty] AS t
USING (
 SELECT [RepoObject_guid]
  , [property_name] = 'history_schema_name'
  , [property_value] = CAST([history_schema_name] AS NVARCHAR(4000))
 FROM [repo].[RepoObject_gross]
 WHERE NOT [RepoObject_guid] IS NULL
 ) AS s
 ON t.[RepoObject_guid] = s.[RepoObject_guid]
  AND t.[property_name] = s.[property_name]
WHEN MATCHED
 AND (
  t.[property_value] <> s.[property_value]
  OR t.[property_value] IS NULL AND NOT s.[property_value] IS NULL
  OR s.[property_value] IS NULL AND NOT t.[property_value] IS NULL
  )
 THEN
  UPDATE
  SET [property_value] = s.[property_value]
WHEN NOT MATCHED
 AND NOT s.[property_value] IS NULL
 THEN
  INSERT (
   [RepoObject_guid]
   , [property_name]
   , [property_value]
   )
  VALUES (
   s.[RepoObject_guid]
   , s.[property_name]
   , s.[property_value]
   )
OUTPUT deleted.*
 , $ACTION
 , inserted.*;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'history_schema_name'
SET @source_object = '[repo].[RepoObject_gross]'
SET @target_object = '[repo].[RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":445,"Name":"history_table_name","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject_gross]","log_target_object":"[repo].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',20,';',445,';',NULL);

MERGE [repo].[RepoObjectProperty] AS t
USING (
 SELECT [RepoObject_guid]
  , [property_name] = 'history_table_name'
  , [property_value] = CAST([history_table_name] AS NVARCHAR(4000))
 FROM [repo].[RepoObject_gross]
 WHERE NOT [RepoObject_guid] IS NULL
 ) AS s
 ON t.[RepoObject_guid] = s.[RepoObject_guid]
  AND t.[property_name] = s.[property_name]
WHEN MATCHED
 AND (
  t.[property_value] <> s.[property_value]
  OR t.[property_value] IS NULL AND NOT s.[property_value] IS NULL
  OR s.[property_value] IS NULL AND NOT t.[property_value] IS NULL
  )
 THEN
  UPDATE
  SET [property_value] = s.[property_value]
WHEN NOT MATCHED
 AND NOT s.[property_value] IS NULL
 THEN
  INSERT (
   [RepoObject_guid]
   , [property_name]
   , [property_value]
   )
  VALUES (
   s.[RepoObject_guid]
   , s.[property_name]
   , s.[property_value]
   )
OUTPUT deleted.*
 , $ACTION
 , inserted.*;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'history_table_name'
SET @source_object = '[repo].[RepoObject_gross]'
SET @target_object = '[repo].[RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":510,"Name":"AntoraReferencedList","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject_gross]","log_target_object":"[repo].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',20,';',510,';',NULL);

MERGE [repo].[RepoObjectProperty] AS t
USING (
 SELECT [RepoObject_guid]
  , [property_name] = 'AntoraReferencedList'
  , [property_value] = CAST([AntoraReferencedList] AS NVARCHAR(4000))
 FROM [repo].[RepoObject_gross]
 WHERE NOT [RepoObject_guid] IS NULL
 ) AS s
 ON t.[RepoObject_guid] = s.[RepoObject_guid]
  AND t.[property_name] = s.[property_name]
WHEN MATCHED
 AND (
  t.[property_value] <> s.[property_value]
  OR t.[property_value] IS NULL AND NOT s.[property_value] IS NULL
  OR s.[property_value] IS NULL AND NOT t.[property_value] IS NULL
  )
 THEN
  UPDATE
  SET [property_value] = s.[property_value]
WHEN NOT MATCHED
 AND NOT s.[property_value] IS NULL
 THEN
  INSERT (
   [RepoObject_guid]
   , [property_name]
   , [property_value]
   )
  VALUES (
   s.[RepoObject_guid]
   , s.[property_name]
   , s.[property_value]
   )
OUTPUT deleted.*
 , $ACTION
 , inserted.*;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'AntoraReferencedList'
SET @source_object = '[repo].[RepoObject_gross]'
SET @target_object = '[repo].[RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":520,"Name":"AntoraReferencingList","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject_gross]","log_target_object":"[repo].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',20,';',520,';',NULL);

MERGE [repo].[RepoObjectProperty] AS t
USING (
 SELECT [RepoObject_guid]
  , [property_name] = 'AntoraReferencingList'
  , [property_value] = CAST([AntoraReferencingList] AS NVARCHAR(4000))
 FROM [repo].[RepoObject_gross]
 WHERE NOT [RepoObject_guid] IS NULL
 ) AS s
 ON t.[RepoObject_guid] = s.[RepoObject_guid]
  AND t.[property_name] = s.[property_name]
WHEN MATCHED
 AND (
  t.[property_value] <> s.[property_value]
  OR t.[property_value] IS NULL AND NOT s.[property_value] IS NULL
  OR s.[property_value] IS NULL AND NOT t.[property_value] IS NULL
  )
 THEN
  UPDATE
  SET [property_value] = s.[property_value]
WHEN NOT MATCHED
 AND NOT s.[property_value] IS NULL
 THEN
  INSERT (
   [RepoObject_guid]
   , [property_name]
   , [property_value]
   )
  VALUES (
   s.[RepoObject_guid]
   , s.[property_name]
   , s.[property_value]
   )
OUTPUT deleted.*
 , $ACTION
 , inserted.*;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'AntoraReferencingList'
SET @source_object = '[repo].[RepoObject_gross]'
SET @target_object = '[repo].[RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":1100,"Name":"[repo].[RepoObjectProperty_from_sql_modules_definition]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObjectProperty_from_sql_modules_definition]","log_target_object":"[repo].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',20,';',1100,';',NULL);

MERGE [repo].[RepoObjectProperty] AS t
USING (
 SELECT [RepoObject_guid]
  , [property_name]
  , [property_value]
 FROM [repo].[RepoObjectProperty_from_sql_modules_definition]
 WHERE NOT [RepoObject_guid] IS NULL
 ) AS s
 ON t.[RepoObject_guid] = s.[RepoObject_guid]
  AND t.[property_name] = s.[property_name]
WHEN MATCHED
 AND (
  t.[property_value] <> s.[property_value]
  OR t.[property_value] IS NULL
  AND NOT s.[property_value] IS NULL
  OR s.[property_value] IS NULL
  AND NOT t.[property_value] IS NULL
  )
 THEN
  UPDATE
  SET [property_value] = s.[property_value]
WHEN NOT MATCHED
 AND NOT s.[property_value] IS NULL
 THEN
  INSERT (
   [RepoObject_guid]
   , [property_name]
   , [property_value]
   )
  VALUES (
   s.[RepoObject_guid]
   , s.[property_name]
   , s.[property_value]
   )
OUTPUT deleted.*
 , $ACTION
 , inserted.*;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = '[repo].[RepoObjectProperty_from_sql_modules_definition]'
SET @source_object = '[repo].[RepoObjectProperty_from_sql_modules_definition]'
SET @target_object = '[repo].[RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":3000,"Name":"DELETE WHERE [property_value] IS NULL","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObjectProperty]","log_target_object":"[repo].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"d"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',20,';',3000,';',NULL);

DELETE
FROM [dhw_self].[repo].[RepoObjectProperty]
WHERE [property_value] IS NULL

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'DELETE WHERE [property_value] IS NULL'
SET @source_object = '[repo].[RepoObjectProperty]'
SET @target_object = '[repo].[RepoObjectProperty]'

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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'bd24df58-0b9a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_RepoObjectProperty_collect';

