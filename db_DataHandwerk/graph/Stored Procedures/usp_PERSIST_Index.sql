CREATE   PROCEDURE [graph].[usp_PERSIST_Index]
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
PRINT '[graph].[usp_PERSIST_Index]'
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
--
/*{"ReportUspStep":[{"Number":100,"Name":"check for empty source","has_logging":0,"is_condition":1,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[graph].[Index_S]"}]}*/
IF (SELECT count(*) FROM [graph].[Index_S]) = 0

/*{"ReportUspStep":[{"Number":110,"Parent_Number":100,"Name":"ERROR 50110: persistence source is empty","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":0}]}*/
BEGIN
PRINT CONCAT('usp_id;Number;Parent_Number: ',22,';',110,';',100);

 THROW 50110
  , 'persistence source is empty: [graph].[Index_S]'
  , 1;

END;

/*{"ReportUspStep":[{"Number":300,"Name":"check duplicate per PK","has_logging":0,"is_condition":1,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[graph].[Index_S]"}]}*/
IF EXISTS(SELECT TOP 1 1 FROM [graph].[Index_S] GROUP BY  [Index_guid] HAVING COUNT(*) > 1)

/*{"ReportUspStep":[{"Number":310,"Parent_Number":300,"Name":"ERROR 50310: persistence source PK not unique","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":0}]}*/
BEGIN
PRINT CONCAT('usp_id;Number;Parent_Number: ',22,';',310,';',300);

 THROW 50310
  , 'persistence source PK not unique: [graph].[Index_S];  [Index_guid]'
  , 1;

END;

/*{"ReportUspStep":[{"Number":500,"Name":"delete persistence target missing in source","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[graph].[Index_S]","log_target_object":"[graph].[Index]","log_flag_InsertUpdateDelete":"D"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',22,';',500,';',NULL);

DELETE T
FROM [graph].[Index] AS T
WHERE
NOT EXISTS
(SELECT 1 FROM [graph].[Index_S] AS S
WHERE
T.[Index_guid] = S.[Index_guid]
)
 

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'delete persistence target missing in source'
SET @source_object = '[graph].[Index_S]'
SET @target_object = '[graph].[Index]'

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

/*{"ReportUspStep":[{"Number":600,"Name":"update changed","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[graph].[Index_S]","log_target_object":"[graph].[Index]","log_flag_InsertUpdateDelete":"U"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',22,';',600,';',NULL);

UPDATE T
SET
  T.[Index_guid] = S.[Index_guid]
, T.[Index_name] = S.[Index_name]
, T.[index_type] = S.[index_type]
, T.[IndexPatternColumnDatatype] = S.[IndexPatternColumnDatatype]
, T.[IndexPatternColumnName] = S.[IndexPatternColumnName]
, T.[IndexSemanticGroup] = S.[IndexSemanticGroup]
, T.[is_index_disabled] = S.[is_index_disabled]
, T.[is_index_primary_key] = S.[is_index_primary_key]
, T.[is_index_real] = S.[is_index_real]
, T.[is_index_unique] = S.[is_index_unique]
, T.[RepoObject_fullname] = S.[RepoObject_fullname]
, T.[RepoObject_fullname2] = S.[RepoObject_fullname2]
, T.[RepoObject_guid] = S.[RepoObject_guid]

FROM [graph].[Index] AS T
INNER JOIN [graph].[Index_S] AS S
ON
T.[Index_guid] = S.[Index_guid]

WHERE
   T.[Index_guid] <> S.[Index_guid]
OR T.[Index_name] <> S.[Index_name] OR (S.[Index_name] IS NULL AND NOT T.[Index_name] IS NULL) OR (NOT S.[Index_name] IS NULL AND T.[Index_name] IS NULL)
OR T.[index_type] <> S.[index_type]
OR T.[IndexPatternColumnDatatype] <> S.[IndexPatternColumnDatatype] OR (S.[IndexPatternColumnDatatype] IS NULL AND NOT T.[IndexPatternColumnDatatype] IS NULL) OR (NOT S.[IndexPatternColumnDatatype] IS NULL AND T.[IndexPatternColumnDatatype] IS NULL)
OR T.[IndexPatternColumnName] <> S.[IndexPatternColumnName] OR (S.[IndexPatternColumnName] IS NULL AND NOT T.[IndexPatternColumnName] IS NULL) OR (NOT S.[IndexPatternColumnName] IS NULL AND T.[IndexPatternColumnName] IS NULL)
OR T.[IndexSemanticGroup] <> S.[IndexSemanticGroup] OR (S.[IndexSemanticGroup] IS NULL AND NOT T.[IndexSemanticGroup] IS NULL) OR (NOT S.[IndexSemanticGroup] IS NULL AND T.[IndexSemanticGroup] IS NULL)
OR T.[is_index_disabled] <> S.[is_index_disabled] OR (S.[is_index_disabled] IS NULL AND NOT T.[is_index_disabled] IS NULL) OR (NOT S.[is_index_disabled] IS NULL AND T.[is_index_disabled] IS NULL)
OR T.[is_index_primary_key] <> S.[is_index_primary_key] OR (S.[is_index_primary_key] IS NULL AND NOT T.[is_index_primary_key] IS NULL) OR (NOT S.[is_index_primary_key] IS NULL AND T.[is_index_primary_key] IS NULL)
OR T.[is_index_real] <> S.[is_index_real] OR (S.[is_index_real] IS NULL AND NOT T.[is_index_real] IS NULL) OR (NOT S.[is_index_real] IS NULL AND T.[is_index_real] IS NULL)
OR T.[is_index_unique] <> S.[is_index_unique] OR (S.[is_index_unique] IS NULL AND NOT T.[is_index_unique] IS NULL) OR (NOT S.[is_index_unique] IS NULL AND T.[is_index_unique] IS NULL)
OR T.[RepoObject_fullname] <> S.[RepoObject_fullname]
OR T.[RepoObject_fullname2] <> S.[RepoObject_fullname2]
OR T.[RepoObject_guid] <> S.[RepoObject_guid] OR (S.[RepoObject_guid] IS NULL AND NOT T.[RepoObject_guid] IS NULL) OR (NOT S.[RepoObject_guid] IS NULL AND T.[RepoObject_guid] IS NULL)


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'update changed'
SET @source_object = '[graph].[Index_S]'
SET @target_object = '[graph].[Index]'

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

/*{"ReportUspStep":[{"Number":700,"Name":"insert missing","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[graph].[Index_S]","log_target_object":"[graph].[Index]","log_flag_InsertUpdateDelete":"I"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',22,';',700,';',NULL);

INSERT INTO 
 [graph].[Index]
 (
  [Index_guid]
, [Index_name]
, [index_type]
, [IndexPatternColumnDatatype]
, [IndexPatternColumnName]
, [IndexSemanticGroup]
, [is_index_disabled]
, [is_index_primary_key]
, [is_index_real]
, [is_index_unique]
, [RepoObject_fullname]
, [RepoObject_fullname2]
, [RepoObject_guid]
)
SELECT
  [Index_guid]
, [Index_name]
, [index_type]
, [IndexPatternColumnDatatype]
, [IndexPatternColumnName]
, [IndexSemanticGroup]
, [is_index_disabled]
, [is_index_primary_key]
, [is_index_real]
, [is_index_unique]
, [RepoObject_fullname]
, [RepoObject_fullname2]
, [RepoObject_guid]

FROM [graph].[Index_S] AS S
WHERE
NOT EXISTS
(SELECT 1
FROM [graph].[Index] AS T
WHERE
T.[Index_guid] = S.[Index_guid]
)

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'insert missing'
SET @source_object = '[graph].[Index_S]'
SET @target_object = '[graph].[Index]'

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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '26e90a1e-7495-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'PROCEDURE', @level1name = N'usp_PERSIST_Index';

