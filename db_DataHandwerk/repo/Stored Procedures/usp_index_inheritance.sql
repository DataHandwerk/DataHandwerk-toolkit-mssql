CREATE   PROCEDURE [repo].[usp_index_inheritance]
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
PRINT '[repo].[usp_Index_inheritance]'
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
--
/*{"ReportUspStep":[{"Number":200,"Name":"[repo].[usp_PERSIST_IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [repo].[usp_PERSIST_IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":310,"Name":"DELETE (if it is a referencing index (NOT [referenced_index_guid] IS NULL), but referenced index is missing)","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[IndexReferencedReferencing_HasFullColumnsInReferencing]","log_target_object":"[repo].[Index_virtual]","log_flag_InsertUpdateDelete":"d"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',17,';',310,';',NULL);

DELETE
FROM repo.[Index_virtual]
WHERE NOT [referenced_index_guid] IS NULL
 AND (
  [RowNumberInReferencing] IS NULL
  OR [referenced_index_guid] NOT IN (
   SELECT [source_index_guid] AS [index_guid]
   FROM [repo].[IndexReferencedReferencing_HasFullColumnsInReferencing] AS [T1]
   )
  )

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'DELETE (if it is a referencing index (NOT [referenced_index_guid] IS NULL), but referenced index is missing)'
SET @source_object = '[repo].[IndexReferencedReferencing_HasFullColumnsInReferencing]'
SET @target_object = '[repo].[Index_virtual]'

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

/*{"ReportUspStep":[{"Number":410,"Name":"INSERT (Index which should be inherited in referenced, but not yet referenced)","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[IndexReferencedReferencing_HasFullColumnsInReferencing]","log_target_object":"[repo].[Index_virtual]","log_flag_InsertUpdateDelete":"i"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',17,';',410,';',NULL);

INSERT INTO repo.[Index_virtual] (
 [parent_RepoObject_guid]
 , [referenced_index_guid]
 , [RowNumberInReferencing]
 , [index_type]
 )
SELECT [referencing_RepoObject_guid]
 , [source_index_guid] AS [index_guid]
 , [RowNumberInReferencing]
 , [source_index_type]
FROM repo.IndexReferencedReferencing_HasFullColumnsInReferencing AS T1
WHERE (
  [referenced_index_guid] IS NULL
  OR [RowNumberInReferencing_Target] IS NULL
  )
 --avoid duplicate index per [IndexPatternColumnGuid] and RepoObject
 AND NOT EXISTS (
  SELECT 1
  FROM [repo].[Index_virtual_IndexPatternColumnGuid] AS [T2]
  WHERE [T2].[parent_RepoObject_guid] = [T1].[referencing_RepoObject_guid]
   AND [T2].[IndexPatternColumnGuid] = [T1].[referencing_IndexPatternColumnGuid]
  )


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'INSERT (Index which should be inherited in referenced, but not yet referenced)'
SET @source_object = '[repo].[IndexReferencedReferencing_HasFullColumnsInReferencing]'
SET @target_object = '[repo].[Index_virtual]'

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

/*{"ReportUspStep":[{"Number":420,"Name":"UPDATE [referenced_index_guid], if NULL but should be inherited","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[IndexReferencedReferencing_HasFullColumnsInReferencing]","log_target_object":"[repo].[Index_virtual]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',17,';',420,';',NULL);

UPDATE iv
SET [referenced_index_guid] = T1.[source_index_guid]
 , [RowNumberInReferencing] = T1.[RowNumberInReferencing]
FROM repo.[Index_virtual] iv
INNER JOIN [repo].[Index_virtual_IndexPatternColumnGuid] AS [T2]
 ON T2.index_guid = iv.index_guid
INNER JOIN repo.IndexReferencedReferencing_HasFullColumnsInReferencing AS T1
 ON [T1].[referencing_RepoObject_guid] = iv.[parent_RepoObject_guid]
  AND [T1].[referencing_IndexPatternColumnGuid] = T2.[IndexPatternColumnGuid]
WHERE iv.[referenced_index_guid] IS NULL

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'UPDATE [referenced_index_guid], if NULL but should be inherited'
SET @source_object = '[repo].[IndexReferencedReferencing_HasFullColumnsInReferencing]'
SET @target_object = '[repo].[Index_virtual]'

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

/*{"ReportUspStep":[{"Number":510,"Name":"DELETE (referenced index, where entries are missing in setpoint)","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[IndexColumn_virtual_referenced_setpoint]","log_target_object":"[repo].[IndexColumn_virtual]","log_flag_InsertUpdateDelete":"d"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',17,';',510,';',NULL);

DELETE
FROM repo.[IndexColumn_virtual]
FROM [repo].[IndexColumn_virtual]
INNER JOIN [repo].[Index_virtual] AS [i]
 ON [repo].[IndexColumn_virtual].[index_guid] = [i].[index_guid]
LEFT OUTER JOIN [repo].[IndexColumn_virtual_referenced_setpoint] AS [setpoint]
 ON [repo].[IndexColumn_virtual].[index_column_id] = [setpoint].[index_column_id]
  AND [repo].[IndexColumn_virtual].[index_guid] = [setpoint].[index_guid]
WHERE
 --only referenced_index_guid
 NOT [i].[referenced_index_guid] IS NULL
 --where entries are missing in setpoint
 AND [setpoint].[index_column_id] IS NULL

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'DELETE (referenced index, where entries are missing in setpoint)'
SET @source_object = '[repo].[IndexColumn_virtual_referenced_setpoint]'
SET @target_object = '[repo].[IndexColumn_virtual]'

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

/*{"ReportUspStep":[{"Number":610,"Name":"INSERT missing","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[IndexColumn_virtual_referenced_setpoint]","log_target_object":"[repo].[Index_virtual]","log_flag_InsertUpdateDelete":"i"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',17,';',610,';',NULL);

INSERT INTO repo.[IndexColumn_virtual] (
 [index_guid]
 , [index_column_id]
 , [is_descending_key]
 , [RepoObjectColumn_guid]
 )
SELECT [index_guid]
 , [index_column_id]
 , [is_descending_key]
 , [referencing_RepoObjectColumn_guid]
FROM repo.IndexColumn_virtual_referenced_setpoint AS setpoint
WHERE NOT EXISTS (
  SELECT [ic].[index_guid]
  FROM [repo].[IndexColumn_virtual] AS [ic]
  WHERE [ic].[index_guid] = [setpoint].[index_guid]
   AND [ic].[index_column_id] = [setpoint].[index_column_id]
  )

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'INSERT missing'
SET @source_object = '[repo].[IndexColumn_virtual_referenced_setpoint]'
SET @target_object = '[repo].[Index_virtual]'

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

/*{"ReportUspStep":[{"Number":710,"Name":"DELETE duplicates by pattern","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[Index_gross]","log_target_object":"[repo].[Index_virtual]","log_flag_InsertUpdateDelete":"d"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',17,';',710,';',NULL);

DELETE iv
FROM [repo].[Index_virtual] [iv]
WHERE EXISTS (
  SELECT 1
  FROM [repo].[Index_gross] AS [ig]
  WHERE [ig].[index_guid] = [iv].[index_guid]
   AND [ig].[RowNumber_PatternPerParentObject] > 1
  )

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'DELETE duplicates by pattern'
SET @source_object = '[repo].[Index_gross]'
SET @target_object = '[repo].[Index_virtual]'

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

/*{"ReportUspStep":[{"Number":810,"Name":"SET [RepoObjectColumn_guid] = [setpoint].[referencing_RepoObjectColumn_guid], [is_descending_key] = [setpoint].[is_descending_key]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[IndexColumn_virtual_referenced_setpoint]","log_target_object":"[repo].[IndexColumn_virtual]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',17,';',810,';',NULL);

UPDATE icv
SET [RepoObjectColumn_guid] = [setpoint].[referencing_RepoObjectColumn_guid]
 , [is_descending_key] = [setpoint].[is_descending_key]
FROM [repo].[IndexColumn_virtual] [icv]
INNER JOIN [repo].[IndexColumn_virtual_referenced_setpoint] AS [setpoint]
 ON [icv].[index_column_id] = [setpoint].[index_column_id]
  AND [icv].[index_guid] = [setpoint].[index_guid]
  AND --
  (
   [icv].[RepoObjectColumn_guid] <> [setpoint].[referencing_RepoObjectColumn_guid]
   OR [icv].[is_descending_key] <> [setpoint].[is_descending_key]
   )

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'SET [RepoObjectColumn_guid] = [setpoint].[referencing_RepoObjectColumn_guid], [is_descending_key] = [setpoint].[is_descending_key]'
SET @source_object = '[repo].[IndexColumn_virtual_referenced_setpoint]'
SET @target_object = '[repo].[IndexColumn_virtual]'

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

/*{"ReportUspStep":[{"Number":900,"Name":"[repo].[usp_Index_finish]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":1,"log_source_object":"[repo].[IndexColumn_virtual_referenced_setpoint]","log_target_object":"[repo].[Index_virtual]","log_flag_InsertUpdateDelete":"u"}]}*/
EXEC [repo].[usp_Index_finish]
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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9f90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_index_inheritance';


GO
EXECUTE sp_addextendedproperty @name = N'UspParameters', @value = NULL, @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_index_inheritance';


GO
EXECUTE sp_addextendedproperty @name = N'UspExamples', @value = NULL, @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_index_inheritance';


GO



GO
EXECUTE sp_addextendedproperty @name = N'AdocUspSteps', @value = N'.Steps in [repo].[usp_Index_inheritance]
[cols="5,200,1,100,100,1"]
|===
|Number
|Name
|Condition
|Source
|Target
|Action

|200
|[repo].[usp_PERSIST_IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T]
|0
|
|
|

|310
|DELETE (if it is a referencing index (NOT [referenced_index_guid] IS NULL), but referenced index is missing)
|0
|[repo].[IndexReferencedReferencing_HasFullColumnsInReferencing]
|[repo].[Index_virtual]
|d

|410
|INSERT (Index which should be inherited in referenced, but not yet referenced)
|0
|[repo].[IndexReferencedReferencing_HasFullColumnsInReferencing]
|[repo].[Index_virtual]
|i

|420
|UPDATE [referenced_index_guid], if NULL but should be inherited
|0
|[repo].[IndexReferencedReferencing_HasFullColumnsInReferencing]
|[repo].[Index_virtual]
|u

|510
|DELETE (referenced index, where entries are missing in setpoint)
|0
|[repo].[IndexColumn_virtual_referenced_setpoint]
|[repo].[IndexColumn_virtual]
|d

|610
|INSERT missing
|0
|[repo].[IndexColumn_virtual_referenced_setpoint]
|[repo].[Index_virtual]
|i

|710
|DELETE duplicates by pattern
|0
|[repo].[Index_gross]
|[repo].[Index_virtual]
|d

|810
|SET [RepoObjectColumn_guid] = [setpoint].[referencing_RepoObjectColumn_guid], [is_descending_key] = [setpoint].[is_descending_key]
|0
|[repo].[IndexColumn_virtual_referenced_setpoint]
|[repo].[IndexColumn_virtual]
|u

|900
|[repo].[usp_Index_finish]
|0
|[repo].[IndexColumn_virtual_referenced_setpoint]
|[repo].[Index_virtual]
|u
|===
', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_index_inheritance';

