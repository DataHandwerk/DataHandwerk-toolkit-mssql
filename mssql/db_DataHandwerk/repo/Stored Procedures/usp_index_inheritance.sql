
-- Create Procedure usp_index_inheritance
-- Create Procedure usp_index_inheritance
-- Create Procedure usp_index_inheritance
-- Create Procedure usp_index_inheritance

-- Create Procedure usp_index_inheritance
CREATE PROCEDURE [repo].[usp_index_inheritance]
--by default the source schema is used and the source name with prefix '_T' for table
--todo: use general parameters to define this
-- some optional parameters, used for logging
     @execution_instance_guid UNIQUEIDENTIFIER = NULL --SSIS system variable ExecutionInstanceGUID could be used, but other any other guid
   , @ssis_execution_id       BIGINT           = NULL --only SSIS system variable ServerExecutionID should be used, or any other consistent number system, do not mix
   , @sub_execution_id        INT              = NULL
   , @parent_execution_log_id BIGINT           = NULL
--, @debug                   BIT              = 0
AS
DECLARE
     @current_execution_log_id BIGINT
   , @current_execution_guid   UNIQUEIDENTIFIER = NEWID()
   , @source_object            NVARCHAR(261)    = NULL
   , @target_object            NVARCHAR(261)    = NULL
   , @proc_id                  INT              = @@procid
   , @proc_schema_name         NVARCHAR(128)    = OBJECT_SCHEMA_NAME(@@procid)
   , @proc_name                NVARCHAR(128)    = OBJECT_NAME(@@PROCID)
   , @event_info               NVARCHAR(MAX)
   , @step_id                  INT              = 0
   , @step_name                NVARCHAR(1000)   = NULL
   , @rows                     INT

SET @event_info =
(
    SELECT
           [event_info]
    FROM
         sys.dm_exec_input_buffer(@@spid , CURRENT_REQUEST_ID())
)

IF @execution_instance_guid IS NULL
    SET @execution_instance_guid = NEWID();

--SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1
SET @step_name = 'start'
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
   , @execution_log_id = @current_execution_log_id OUTPUT;
--
----START
--
--delete Index which are marked as referenced_index_guid, but the referenced index is missing 
DELETE FROM repo.[Index_virtual]
WHERE
      NOT [referenced_index_guid] IS NULL
      AND ([RowNumberInReferencing] IS NULL
           OR [referenced_index_guid] NOT IN
(
    SELECT
           [source_index_guid] AS [index_guid]
    FROM
         [repo].[IndexReferencedReferencing_HasFullColumnsInReferencing] AS [T1]
) )

SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1
SET @step_name = 'DELETE (referenced index is missing)'
SET @source_object = '[repo].[IndexReferencedReferencing_HasFullColumnsInReferencing]'
SET @target_object = '[repo].[Index__virtual]'

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
   , @inserted = NULL
   , @updated = NULL
   , @deleted = @rows
   , @info_01 = NULL
   , @info_02 = NULL
   , @info_03 = NULL
   , @info_04 = NULL
   , @info_05 = NULL
   , @info_06 = NULL
   , @info_07 = NULL
   , @info_08 = NULL
   , @info_09 = NULL

--insert Index which should be inherited in referenced, but not yet referenced
--todo WHERE Bedingung ist noch falsch, oder Quellsicht ändern
INSERT INTO repo.[Index_virtual]
(
       [parent_RepoObject_guid]
     , [referenced_index_guid]
     , [RowNumberInReferencing]
)
SELECT
       [referencing_RepoObject_guid]
     , [source_index_guid] AS [index_guid]
     , [RowNumberInReferencing]
FROM
     repo.IndexReferencedReferencing_HasFullColumnsInReferencing AS T1
WHERE  [referenced_index_guid] IS NULL
       OR [RowNumberInReferencing_Target] IS NULL

SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1
SET @step_name = 'INSERT (Index which should be inherited in referenced, but not yet referenced)'
SET @source_object = '[repo].[IndexReferencedReferencing_HasFullColumnsInReferencing]'
SET @target_object = '[repo].[Index__virtual]'

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

DELETE FROM repo.[IndexColumn_virtual]
FROM [repo].[IndexColumn_virtual]
     INNER JOIN
     [repo].[Index_virtual] AS [i]
     ON [repo].[IndexColumn_virtual].[Index_guid] = [i].[index_guid]
     LEFT OUTER JOIN
     [repo].[IndexColumn_virtual_referenced_setpoint] AS [setpoint]
     ON [repo].[IndexColumn_virtual].[index_column_id] = [setpoint].[index_column_id]
        AND [repo].[IndexColumn_virtual].[Index_guid] = [setpoint].[index_guid]
WHERE
--only referenced_index_guid
      NOT [i].[referenced_index_guid] IS NULL
      --where entries are missing in setpoint
      AND [setpoint].[index_column_id] IS NULL

SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1
SET @step_name = 'DELETE (where entries are missing in setpoint)'
SET @source_object = '[repo].[IndexColumn__virtual_referenced_setpoint]'
SET @target_object = '[repo].[IndexColumn__virtual]'

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
   , @inserted = NULL
   , @updated = NULL
   , @deleted = @rows
   , @info_01 = NULL
   , @info_02 = NULL
   , @info_03 = NULL
   , @info_04 = NULL
   , @info_05 = NULL
   , @info_06 = NULL
   , @info_07 = NULL
   , @info_08 = NULL
   , @info_09 = NULL

--some combinations of ([Index_guid], [index_column_id]) are not unique
--correct this in repo.IndexColumn__virtual_referenced_setpoint
INSERT INTO repo.[IndexColumn_virtual]
(
       [Index_guid]
     , [index_column_id]
     , [is_descending_key]
     , [RepoObjectColumn_guid]
)
SELECT
       [index_guid]
     , [index_column_id]
     , [is_descending_key]
     , [referencing_RepoObjectColumn_guid]
FROM
     repo.IndexColumn_virtual_referenced_setpoint AS setpoint
WHERE  NOT EXISTS
(
    SELECT
           [ic].[index_guid]
    FROM
         [repo].[IndexColumn_virtual] AS [ic]
    WHERE  [ic].[index_guid] = [setpoint].[index_guid]
           AND [ic].[index_column_id] = [setpoint].[index_column_id]
)

SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1
SET @step_name = 'INSERT missing'
SET @source_object = '[repo].[IndexColumn__virtual_referenced_setpoint]'
SET @target_object = '[repo].[IndexColumn__virtual]'

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

UPDATE icv
  SET
      [RepoObjectColumn_guid] = [setpoint].[referencing_RepoObjectColumn_guid]
    , [is_descending_key] = [setpoint].[is_descending_key]
FROM   [repo].[IndexColumn_virtual] [icv]
       INNER JOIN
       [repo].[IndexColumn_virtual_referenced_setpoint] AS [setpoint]
       ON [icv].[index_column_id] = [setpoint].[index_column_id]
          AND [icv].[Index_guid] = [setpoint].[index_guid]
          AND --
          ([icv].[RepoObjectColumn_guid] <> [setpoint].[referencing_RepoObjectColumn_guid]
           OR [icv].[is_descending_key] <> [setpoint].[is_descending_key]
          --
          )

SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1
SET @step_name = 'SET [RepoObjectColumn_guid] = [setpoint].[referencing_RepoObjectColumn_guid], [is_descending_key] = [setpoint].[is_descending_key]'
SET @source_object = '[repo].[IndexColumn__virtual_referenced_setpoint]'
SET @target_object = '[repo].[IndexColumn__virtual]'

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
   , @inserted = NULL
   , @updated = @rows
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

EXEC repo.usp_Index_IndexSemanticGroup
     @execution_instance_guid = @execution_instance_guid
   , @ssis_execution_id = @ssis_execution_id
   , @sub_execution_id = @sub_execution_id
   , @parent_execution_log_id = @current_execution_log_id

--inherit IndexSemanticGroup
--ATTENTION:
--repo.Index_IndexSemanticGroup.[IndexSemanticGroup] could also be set to NULL where it was assigned before
--maybe this should be avoided?
--but the strict inheritance is consequent
UPDATE repo.Index_IndexSemanticGroup
  SET
      [IndexSemanticGroup] = [TSource].[IndexSemanticGroup]
FROM   [repo].[Index_virtual] AS [T1]
       INNER JOIN
       [repo].[Index_IndexSemanticGroup] AS [TSource]
       ON [T1].[referenced_index_guid] = [TSource].[index_guid]
       INNER JOIN
       [repo].[Index_IndexSemanticGroup]
       ON [T1].[index_guid] = [repo].[Index_IndexSemanticGroup].[index_guid]
          AND [TSource].[IndexPatternColumnDatatype] = [repo].[Index_IndexSemanticGroup].[IndexPatternColumnDatatype]
WHERE
      ISNULL([repo].[Index_IndexSemanticGroup].[IndexSemanticGroup] , '') <> ISNULL([TSource].[IndexSemanticGroup] , '')

SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1
SET @step_name = 'SET [IndexSemanticGroup] = [TSource].[IndexSemanticGroup]'
SET @source_object = '[repo].[Index_IndexSemanticGroup]'
SET @target_object = '[repo].[Index_IndexSemanticGroup]'

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
   , @inserted = NULL
   , @updated = @rows
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
--PK synchronizing between [repo].[RepoObject].[pk_index_guid] and [repo].[Index__virtual]
--
--PK can be defined in several ways:
---real PK for tables in database
---index can be marked as PK in [repo].[Index__virtual]
---index can be marked as PK by using it in [repo].[RepoObject].[pk_index_guid]
--
--PK could be defined in [repo].[RepoObject].[pk_index_guid] by using an index_guid in an manual process
--first we need to propagate this PK into [repo].[Index__virtual]
--now there could have two or more PK defined in [repo].[Index__virtual]
UPDATE iv
  SET
      [is_index_primary_key] = 1
    , [is_index_unique] = 1
FROM   [repo].[Index_virtual] [iv]
WHERE
      [iv].[is_index_primary_key] = 0
      AND EXISTS
(
    SELECT
           [pk_index_guid]
    FROM
         [repo].[RepoObject] AS [ro]
    WHERE  [ro].[RepoObject_guid] = [iv].[parent_RepoObject_guid]
           AND [ro].[pk_index_guid] = [iv].[index_guid]
)

SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1
SET @step_name = 'SET [is_index_primary_key] = 1, , [is_index_unique] = 1 (propagate PK from [repo].[RepoObject] into [repo].[Index__virtual])'
SET @source_object = '[repo].[RepoObject]'
SET @target_object = '[repo].[Index__virtual]'

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
   , @inserted = NULL
   , @updated = @rows
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

--each PK is also [is_index_unique]
UPDATE iv
  SET
      [is_index_unique] = 1
FROM   [repo].[Index_virtual] [iv]
WHERE
      [iv].[is_index_primary_key] = 1
      AND [iv].[is_index_unique] = 0

SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1
SET @step_name = 'SET [is_index_unique] = 1 (each PK is also [is_index_unique])'
SET @source_object = '[repo].[Index__virtual]'
SET @target_object = '[repo].[Index__virtual]'

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
   , @inserted = NULL
   , @updated = @rows
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

-- UPDATE [repo].[RepoObject].[pk_index_guid]
--only one PK per RepoObject is possible
--we use some priority in [RowNumber_PkPerParentObject] in case that several PK are defined per RepoObject
--noch mal prüfen, wann werden die nicht-PK auf Null gesetzt?
UPDATE    ro
  SET
      [pk_index_guid] = [pk].[index_guid]
FROM      [repo].[RepoObject] [ro]
          LEFT JOIN
(
    SELECT
           [index_guid]
         , [parent_RepoObject_guid]
    FROM
         [repo].[Index_gross] AS [T1]
    WHERE  [is_index_primary_key] = 1
           AND [RowNumber_PkPerParentObject] = 1
) [pk]
          ON [ro].[RepoObject_guid] = [pk].[parent_RepoObject_guid]
WHERE
      [ro].[pk_index_guid] <> [pk].[index_guid]
      OR ([ro].[pk_index_guid] IS NULL
          AND NOT [pk].[index_guid] IS NULL)
      OR (NOT [ro].[pk_index_guid] IS NULL
          AND [pk].[index_guid] IS NULL)

SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1
SET @step_name = 'SET [pk_index_guid] = [pk].[index_guid] (WHERE [is_index_primary_key] = 1 and [RowNumber_PkPerParentObject] = 1)'
SET @source_object = '[repo].[Index__gross]'
SET @target_object = '[repo].[RepoObject]'

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
   , @inserted = NULL
   , @updated = @rows
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

--because there could be several PK defined per [parent_RepoObject_guid], this should be corrected
--only [repo].[Index__virtual] needs to be corrected because the real PK consistence should be controled by mssql
UPDATE iv
  SET
      [is_index_primary_key] = 0
FROM   [repo].[Index_virtual] [iv]
WHERE
      [iv].[is_index_primary_key] = 1
      AND NOT EXISTS
(
    SELECT
           [pk_index_guid]
    FROM
         [repo].[RepoObject] AS [ro]
    WHERE  [ro].[RepoObject_guid] = [iv].[parent_RepoObject_guid]
           AND [ro].[pk_index_guid] = [iv].[index_guid]
)

SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1
SET @step_name = 'SET [is_index_primary_key] = 0 (where it is not a PK in [repo].[RepoObject])'
SET @source_object = '[repo].[RepoObject]'
SET @target_object = '[repo].[Index__virtual]'

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
   , @inserted = NULL
   , @updated = @rows
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
--END
--
--SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1;
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


