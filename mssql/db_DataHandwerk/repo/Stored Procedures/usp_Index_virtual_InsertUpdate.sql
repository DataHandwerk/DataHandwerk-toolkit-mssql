/*
Index will be inserted (updated) into repo.[Index_virtual]
but it will not be visible in [repo].[Index_gross]
until it was also included into [repo].[Index_Settings]

run
EXEC [repo].[usp_Index_finish]

--test:
EXEC repo.usp_Index_insert 
 @RepoObject_fullname = '[dbo].[view_1]'
 , @IndexPatternColumnName = 'aaa_id,bbb'

EXEC repo.usp_Index_insert 
 @RepoObject_fullname = '[dbo].[view_1]'
 , @IndexPatternColumnName = 'aaa_id'
 , @is_index_primary_key = 1

EXEC repo.usp_Index_insert 
 @RepoObject_fullname = '[repo].[RepoObjectColumn_gross]'
 , @IndexPatternColumnName = 'RepoObjectColumn_guid'
 , @is_index_primary_key = 1

EXEC repo.usp_Index_insert 
 @RepoObject_fullname = '[graph].[RepoObjectColumn_S]'
 , @IndexPatternColumnName = 'RepoObjectColumn_guid'
 , @is_index_primary_key = 1

EXEC [repo].[usp_Index_finish]



index_type

Type of index:
0 = Heap
1 = Clustered
2 = Nonclustered
3 = XML
4 = Spatial
5 = Clustered columnstore index. Applies to: SQL Server 2014 (12.x) and later.
6 = Nonclustered columnstore index. Applies to: SQL Server 2012 (11.x) and later.
7 = Nonclustered hash index. Applies to: SQL Server 2014 (12.x) and later.
*/
CREATE
 

 PROCEDURE [repo].[usp_Index_virtual_InsertUpdate] @RepoObject_guid UNIQUEIDENTIFIER = NULL --if @RepoObject_guid is NULL, then @RepoObject_fullname is used
 , @RepoObject_fullname NVARCHAR(261) = NULL --will be used to find matching @RepoObject_guid, if @RepoObject_guid is NULL; use [schema].[TableOrView]
 , @IndexPatternColumnName NVARCHAR(4000) = NULL --a semicolon separated list to define the Index, for example 'aaa;bbb;ccc'
 , @index_name NVARCHAR(128) = NULL
 , @index_type TINYINT = 2 --1 Clustered, 2 Nonclustered
 , @is_index_disabled BIT = 0
 , @is_index_primary_key BIT = 0
 , @is_index_unique BIT = 0
 -- some optional parameters, used for logging
 , @execution_instance_guid UNIQUEIDENTIFIER = NULL --SSIS system variable ExecutionInstanceGUID could be used, but other any other guid
 , @ssis_execution_id BIGINT = NULL --only SSIS system variable ServerExecutionID should be used, or any other consistent number system, do not mix
 , @sub_execution_id INT = NULL
 , @parent_execution_log_id BIGINT = NULL
AS
DECLARE @current_execution_log_id BIGINT
 , @current_execution_guid UNIQUEIDENTIFIER = NEWID()
 , @source_object NVARCHAR(261) = NULL
 , @target_object NVARCHAR(261) = NULL
 , @proc_id INT = @@procid
 , @proc_schema_name NVARCHAR(128) = OBJECT_SCHEMA_NAME(@@procid)
 , @proc_name NVARCHAR(128) = OBJECT_NAME(@@procid)
 , @event_info NVARCHAR(MAX)
 , @step_id INT = 0
 , @step_name NVARCHAR(1000) = NULL
 , @rows INT

SET @event_info = (
  SELECT [event_info]
  FROM sys.dm_exec_input_buffer(@@spid, CURRENT_REQUEST_ID())
  )

IF @execution_instance_guid IS NULL
 SET @execution_instance_guid = NEWID();
--SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1
SET @step_name = 'start'
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
 , @inserted = NULL
 , @updated = NULL
 , @deleted = NULL
 , @info_01 = NULL
 , @info_02 = NULL
 , @info_03 = NULL
 , @info_04 = NULL
 , @info_05 = NULL
 , @info_06 = NULL
 , @info_07 = NULL
 , @info_08 = NULL
 , @info_09 = NULL
 , @execution_log_id = @current_execution_log_id OUTPUT
 , @parameter_01 = @RepoObject_guid
 , @parameter_02 = @RepoObject_fullname
 , @parameter_03 = @IndexPatternColumnName
 , @parameter_04 = @index_name
 , @parameter_05 = @index_type
 , @parameter_06 = @is_index_disabled
 , @parameter_07 = @is_index_primary_key
 , @parameter_08 = @is_index_unique
 , @parameter_09 = NULL
 , @parameter_10 = NULL
 , @parameter_11 = NULL
 , @parameter_12 = NULL
 , @parameter_13 = NULL

--
----START
--
DECLARE @table TABLE ([guid] UNIQUEIDENTIFIER)
DECLARE @index_guid UNIQUEIDENTIFIER

IF @RepoObject_guid IS NULL
 SET @RepoObject_guid = (
   SELECT RepoObject_guid
   FROM [repo].[RepoObject]
   WHERE [RepoObject_fullname] = @RepoObject_fullname
   )

--check existence of @RepoObject_guid
IF NOT EXISTS (
  SELECT 1
  FROM [repo].[RepoObject]
  WHERE [RepoObject_guid] = @RepoObject_guid
  )
BEGIN
 SET @step_name = CONCAT (
   'RepoObject_guid does not exist;'
   , @RepoObject_guid
   , ';'
   , @RepoObject_fullname
   );

 THROW 51001
  , @step_name
  , 1;
END

--make sure the @table table is empty
DELETE @table

INSERT INTO repo.[Index_virtual] (
 [parent_RepoObject_guid]
 , [index_name]
 , [index_type]
 , [is_index_disabled]
 , [is_index_primary_key]
 , [is_index_unique]
 )
OUTPUT [INSERTED].[index_guid]
INTO @table
SELECT @RepoObject_guid
 , @index_name
 , @index_type
 , @is_index_disabled
 , @is_index_primary_key
 , IIF(@is_index_primary_key = 1, 1, @is_index_unique)

SET @index_guid = (
  SELECT [guid]
  FROM @table
  )

/*
--test to get the string_split in the right order:

DECLARE @IndexPatternColumnName NVARCHAR(max) = 'z; y; aaa;bbb;ccc ddd; eee;fff ;ggg'

--there is no garantee to get the strings in the right order, but "normally" it works
--the result for ASC or DESC is the same
--https://feedback.azure.com/forums/908035-sql-server/suggestions/32902852-add-row-position-column-to-string-split
SELECT TRIM(value) AS index_column_name
 , row_number() OVER (
  ORDER BY (
    SELECT NULL
    )
  ) AS [index_column_id]
FROM STRING_SPLIT(@IndexPatternColumnName, ',')

*/
--todo: concept to insert [is_descending_key]
--or update manually if required
INSERT INTO [repo].[IndexColumn_virtual] (
 [index_guid]
 , [index_column_id]
 , [RepoObjectColumn_guid]
 , [is_descending_key]
 )
SELECT @index_guid
 , ColTable.index_column_id
 , roc.RepoObjectColumn_guid
 , 0
FROM (
 SELECT TRIM(value) AS index_column_name
  , row_number() OVER (
   ORDER BY (
     SELECT NULL
     )
   ) AS [index_column_id]
 FROM STRING_SPLIT(@IndexPatternColumnName, ',')
 ) ColTable
LEFT JOIN [repo].[RepoObjectColumn] roc
 ON roc.RepoObject_guid = @RepoObject_guid
  AND roc.RepoObjectColumn_name = index_column_name

SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1;
SET @step_name = 'INSERT Index Columns'
SET @source_object = '[repo].[RepoObjectColumn]'
SET @target_object = '[repo].[IndexColumn_virtual]'

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
 , @inserted = @rows
 , @updated = NULL
 , @deleted = NULL
 , @info_01 = NULL
 , @info_02 = NULL
 , @info_03 = NULL
 , @info_04 = NULL
 , @info_05 = NULL
 , @info_06 = NULL
 , @info_07 = NULL
 , @info_08 = NULL
 , @info_09 = NULL

--
--
--END
--
--SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1;
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
 , @inserted = NULL
 , @updated = NULL
 , @deleted = NULL
 , @info_01 = NULL
 , @info_02 = NULL
 , @info_03 = NULL
 , @info_04 = NULL
 , @info_05 = NULL
 , @info_06 = NULL
 , @info_07 = NULL
 , @info_08 = NULL
 , @info_09 = NULL
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a190291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_Index_virtual_InsertUpdate';

