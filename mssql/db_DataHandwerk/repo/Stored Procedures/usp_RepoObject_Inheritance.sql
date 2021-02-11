﻿
CREATE PROCEDURE [repo].[usp_RepoObject_Inheritance]
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
 , @proc_name NVARCHAR(128) = OBJECT_NAME(@@procid) --schema ande name of the current procedure should be automatically logged
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
DECLARE inheritance_cursor CURSOR READ_ONLY
FOR
SELECT [resulting_InheritanceDefinition]
FROM repo.RepoObject_InheritanceType_resulting_InheritanceDefinition
GROUP BY [resulting_InheritanceDefinition]
HAVING (NOT (resulting_InheritanceDefinition IS NULL))

DECLARE @resulting_InheritanceDefinition NVARCHAR(4000)
 , @resulting_InheritanceDefinition_ForSql NVARCHAR(4000)
DECLARE @stmt NVARCHAR(MAX)

OPEN inheritance_cursor

FETCH NEXT
FROM inheritance_cursor
INTO @resulting_InheritanceDefinition

WHILE (@@fetch_status <> - 1)
BEGIN
 IF (@@fetch_status <> - 2)
 BEGIN
  PRINT @resulting_InheritanceDefinition

  --replace "'" by "''" to be used in a string
  SET @resulting_InheritanceDefinition_ForSql = REPLACE(@resulting_InheritanceDefinition, '''', '''''')

  --PRINT @resulting_InheritanceDefinition_ForSql
  TRUNCATE TABLE repo.[RepoObject_Inheritance_temp]

  /*
INSERT INTO [repo].[RepoObject_Inheritance_temp] (
 [RepoObject_guid]
 , [property_name]
 , [property_value]
 , [property_value_new]
 , [InheritanceType]
 , [Inheritance_StringAggSeparatorSql]
 , [is_force_inherit_empty_source]
 , [is_StringAggAllSources]
 , [resulting_InheritanceDefinition]
 , [RowNumberSource]
 , [referenced_RepoObject_guid]
 , [referenced_RepoObject_fullname]
 , [referenced_RepoObject_name]
 , [referencing_RepoObject_fullname]
 , [referencing_RepoObject_name]
 )
SELECT
 --
 [T1].[RepoObject_guid]
 , [T1].[property_name]
 , [T1].[property_value]
 , [property_value_new] = COALESCE([referencing].[Repo_definition], [repo].[fs_get_RepoObjectProperty_nvarchar]([referenced].[RepoObject_guid], 'MS_Description'))
 , [T1].[InheritanceType]
 , [T1].[Inheritance_StringAggSeparatorSql]
 , [T1].[is_force_inherit_empty_source]
 , [T1].[is_StringAggAllSources]
 , [T1].[resulting_InheritanceDefinition]
 , [RowNumberSource] = ROW_NUMBER() OVER (
  PARTITION BY [T1].[RepoObject_guid] ORDER BY [referenced].[RepoObject_fullname]
   , [referenced].[RepoObject_name]
  )
 , [T2].[referenced_RepoObject_guid]
 , [referenced_RepoObject_fullname] = [referenced].[RepoObject_fullname]
 , [referenced_RepoObject_name] = [referenced].[RepoObject_name]
 , [referencing_RepoObject_fullname] = [referencing].[RepoObject_fullname]
 , [referencing_RepoObject_name] = [referencing].[RepoObject_name]
FROM [repo].[RepoObject_InheritanceType_resulting_InheritanceDefinition] AS T1
INNER JOIN [repo].[RepoObject_reference_union] AS T2
 ON T2.[referencing_RepoObject_guid] = T1.[RepoObject_guid]
INNER JOIN [repo].[RepoObject_gross] AS referencing
 ON referencing.[RepoObject_guid] = T1.[RepoObject_guid]
INNER JOIN [repo].[RepoObject_gross] AS referenced
 ON referenced.[RepoObject_guid] = T2.[referenced_RepoObject_guid]
WHERE [T1].[resulting_InheritanceDefinition] = 'COALESCE(referencing.[Repo_definition], repo.fs_get_RepoObjectProperty_nvarchar(referenced.[RepoObject_guid], ''MS_Description''))'

*/
  SET @stmt = '
INSERT INTO [repo].[RepoObject_Inheritance_temp] (
 [RepoObject_guid]
 , [property_name]
 , [property_value]
 , [property_value_new]
 , [InheritanceType]
 , [Inheritance_StringAggSeparatorSql]
 , [is_force_inherit_empty_source]
 , [is_StringAggAllSources]
 , [resulting_InheritanceDefinition]
 , [RowNumberSource]
 , [referenced_RepoObject_guid]
 , [referenced_RepoObject_fullname]
 , [referenced_RepoObject_name]
 , [referencing_RepoObject_fullname]
 , [referencing_RepoObject_name]
 )
SELECT
 --
 [T1].[RepoObject_guid]
 , [T1].[property_name]
 , [T1].[property_value]
 , [property_value_new] = ' + @resulting_InheritanceDefinition + 
   ' 
 , [T1].[InheritanceType]
 , [T1].[Inheritance_StringAggSeparatorSql]
 , [T1].[is_force_inherit_empty_source]
 , [T1].[is_StringAggAllSources]
 , [T1].[resulting_InheritanceDefinition]
 , [RowNumberSource] = ROW_NUMBER() OVER (
  PARTITION BY [T1].[RepoObject_guid] ORDER BY [referenced].[RepoObject_fullname]
  )
 , [T2].[referenced_RepoObject_guid]
 , [referenced_RepoObject_fullname] = [referenced].[RepoObject_fullname]
 , [referenced_RepoObject_name] = [referenced].[RepoObject_name]
 , [referencing_RepoObject_fullname] = [referencing].[RepoObject_fullname]
 , [referencing_RepoObject_name] = [referencing].[RepoObject_name]
FROM [repo].[RepoObject_InheritanceType_resulting_InheritanceDefinition] AS T1
INNER JOIN [repo].[RepoObject_reference_union] AS T2
 ON T2.[referencing_RepoObject_guid] = T1.[RepoObject_guid]
INNER JOIN [repo].[RepoObject_gross] AS referencing
 ON referencing.[RepoObject_guid] = T1.[RepoObject_guid]
INNER JOIN [repo].[RepoObject_gross] AS referenced
 ON referenced.[RepoObject_guid] = T2.[referenced_RepoObject_guid]
WHERE [T1].[resulting_InheritanceDefinition] = ''' 
   + @resulting_InheritanceDefinition_ForSql + '''
'

  PRINT @stmt

  EXECUTE sp_executesql @stmt = @stmt

  DECLARE separator_cursor CURSOR READ_ONLY
  FOR
  SELECT [Inheritance_StringAggSeparatorSql]
  FROM [repo].[RepoObject_Inheritance_temp]
  GROUP BY [Inheritance_StringAggSeparatorSql]

  DECLARE @Inheritance_StringAggSeparatorSql NVARCHAR(4000)

  OPEN separator_cursor

  FETCH NEXT
  FROM separator_cursor
  INTO @Inheritance_StringAggSeparatorSql

  WHILE (@@fetch_status <> - 1)
  BEGIN
   IF (@@fetch_status <> - 2)
   BEGIN
    --PRINT @Inheritance_StringAggSeparatorSql
    IF @Inheritance_StringAggSeparatorSql IS NULL
    BEGIN
     --[is_StringAggAllSources] = 0
     --T.[property_value] can't be NULL
     --not [property_value_new] IS NULL 
     --we need to delete, when S.[property_value_new] IS NULL
     MERGE INTO [repo].[RepoObjectProperty] AS T
     USING (
      SELECT [RepoObject_guid]
       , [property_name]
       , [property_value]
       , [property_value_new]
      --, [InheritanceType]
      --, [Inheritance_StringAggSeparatorSql]
      --, [is_force_inherit_empty_source]
      --, [is_StringAggAllSources]
      --, [resulting_InheritanceDefinition]
      --, [RowNumberSource]
      --, [referenced_RepoObject_guid]
      --, [referenced_RepoObject_fullname]
      --, [referenced_RepoObject_name]
      --, [referencing_RepoObject_fullname]
      --, [referencing_RepoObject_name]
      FROM [repo].[RepoObject_Inheritance_temp]
      WHERE
       --
       [is_StringAggAllSources] = 0
       --only the first source
       AND [RowNumberSource] = 1
       AND (
        [is_force_inherit_empty_source] = 1
        OR NOT [property_value_new] IS NULL
        )
       AND (
        [property_value] IS NULL
        OR [property_value] <> [property_value_new]
        OR (
         NOT [property_value] IS NULL
         AND [is_force_inherit_empty_source] = 1
         AND [property_value_new] IS NULL
         )
        )
      ) AS S
      ON S.[RepoObject_guid] = T.[RepoObject_guid]
       AND S.[property_name] = T.[property_name]
     WHEN MATCHED
      AND NOT S.[property_value_new] IS NULL
      THEN
       UPDATE
       SET [property_value] = [S].[property_value_new]
     WHEN MATCHED
      AND S.[property_value_new] IS NULL
      THEN
       DELETE
     WHEN NOT MATCHED BY TARGET
      AND NOT S.[property_value_new] IS NULL
      THEN
       INSERT (
        [RepoObject_guid]
        , [property_name]
        , [property_value]
        )
       VALUES (
        S.[RepoObject_guid]
        , S.[property_name]
        , S.[property_value_new]
        )
     OUTPUT [deleted].*
      , $ACTION
      , [inserted].*;
    END
    ELSE
    BEGIN
     MERGE INTO [repo].[RepoObjectProperty] AS T
     USING (
      SELECT [RepoObject_guid]
       , [property_name]
       , [property_value]
       , [property_value_new]
      --, [is_force_inherit_empty_source]
      --, [RowNumberSource]
      FROM (
       SELECT [RepoObject_guid]
        , [property_name]
        , [property_value] = MAX([property_value])
        , [property_value_new] = CAST(STRING_AGG(CAST([property_value_new] AS NVARCHAR(MAX)), @Inheritance_StringAggSeparatorSql) WITHIN GROUP (
          ORDER BY [RowNumberSource]
          ) AS NVARCHAR(4000))
        --, [property_value_new] = CAST(STRING_AGG(CAST([property_value_new] as NVARCHAR(MAX)), CHAR(13)+CHAR(10)) WITHIN GROUP ( ORDER BY [RowNumberSource]) as NVARCHAR(4000))
        --, [property_value_new] = CAST(STRING_AGG(CAST([property_value_new] as NVARCHAR(MAX)), ';') WITHIN GROUP ( ORDER BY [RowNumberSource]) as NVARCHAR(4000))
        --, [Inheritance_StringAggSeparatorSql]
        , [is_force_inherit_empty_source] = MAX([is_force_inherit_empty_source])
        --, [is_StringAggAllSources]
        --, [resulting_InheritanceDefinition]
        , [RowNumberSource] = MAX([RowNumberSource])
       --, [referenced_RepoObject_guid]
       --, [referenced_RepoObject_fullname]
       --, [referenced_RepoObject_name]
       --, [referencing_RepoObject_fullname]
       --, [referencing_RepoObject_name]
       FROM [repo].[RepoObject_Inheritance_temp]
       WHERE
        --
        [is_StringAggAllSources] = 1
       GROUP BY [RepoObject_guid]
        , [property_name]
       ) T1
      WHERE (
        [is_force_inherit_empty_source] = 1
        OR NOT [property_value_new] IS NULL
        )
       AND (
        [property_value] IS NULL
        OR [property_value] <> [property_value_new]
        OR (
         NOT [property_value] IS NULL
         AND [is_force_inherit_empty_source] = 1
         AND [property_value_new] IS NULL
         )
        )
      ) AS S
      ON S.[RepoObject_guid] = T.[RepoObject_guid]
       AND S.[property_name] = T.[property_name]
     WHEN MATCHED
      AND NOT S.[property_value_new] IS NULL
      THEN
       UPDATE
       SET [property_value] = [S].[property_value_new]
     WHEN MATCHED
      AND S.[property_value_new] IS NULL
      THEN
       DELETE
     WHEN NOT MATCHED BY TARGET
      AND NOT S.[property_value_new] IS NULL
      THEN
       INSERT (
        [RepoObject_guid]
        , [property_name]
        , [property_value]
        )
       VALUES (
        S.[RepoObject_guid]
        , S.[property_name]
        , S.[property_value_new]
        )
     OUTPUT [deleted].*
      , $ACTION
      , [inserted].*;
    END
   END

   FETCH NEXT
   FROM separator_cursor
   INTO @Inheritance_StringAggSeparatorSql
  END

  CLOSE separator_cursor

  DEALLOCATE separator_cursor
 END

 FETCH NEXT
 FROM inheritance_cursor
 INTO @resulting_InheritanceDefinition
END

CLOSE inheritance_cursor

DEALLOCATE inheritance_cursor

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

EXEC repo.usp_ExecutionLog_insert @execution_instance_guid = @execution_instance_guid
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