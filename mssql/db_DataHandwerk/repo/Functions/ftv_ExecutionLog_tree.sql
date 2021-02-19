
/*

resulting PlantUML

@startsalt
{
{T
'Procedure
+ [repo].[usp_main]
++ [repo].[usp_sync_guid]
+++ [repo].[usp_sync_guid_RepoObject]
++++ [graph].[usp_PERSIST_RepoObject]
++++ [graph].[usp_PERSIST_ProcedureInstance]
+++ [repo].[usp_sync_guid_RepoObjectColumn]
++++ [graph].[usp_PERSIST_RepoObjectColumn]
++ [repo].[usp_update_Referencing_Count]
++ [repo].[usp_index_inheritance]
+++ [repo].[usp_PERSIST_IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T]
+++ [repo].[usp_Index_Settings]
++ [repo].[usp_RepoObjectColumn_update_RepoObjectColumn_column_id]
++ [repo].[usp_GeneratorUsp_insert_update_persistence]
}
}
@endsalt

or as table with duration

@startsalt
{
{T
Procedure  |  Duration
+ [repo].[usp_main]  |  62
++ [repo].[usp_sync_guid]  |  10
+++ [repo].[usp_sync_guid_RepoObject]  |  1
++++ [graph].[usp_PERSIST_RepoObject]  |  0
++++ [graph].[usp_PERSIST_ProcedureInstance]  |  0
+++ [repo].[usp_sync_guid_RepoObjectColumn]  |  5
++++ [graph].[usp_PERSIST_RepoObjectColumn]  |  0
++ [repo].[usp_update_Referencing_Count]  |  6
++ [repo].[usp_index_inheritance]  |  8
+++ [repo].[usp_PERSIST_IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T]  |  2
+++ [repo].[usp_Index_Settings]  |  1
++ [repo].[usp_RepoObjectColumn_update_RepoObjectColumn_column_id]  |  1
++ [repo].[usp_GeneratorUsp_insert_update_persistence]  |  4
}
}
@endsalt


select
*
from
[repo].[ftv_ExecutionLog_tree] (DEFAULT, DEFAULT)
order by 
id

*/
CREATE FUNCTION [repo].[ftv_ExecutionLog_tree] (
 @execution_instance_guid UNIQUEIDENTIFIER = NULL
 , @parent_execution_log_id INT = NULL
 )
RETURNS TABLE
AS
RETURN (
  WITH tree AS
   --tree is recursive to solve parent child hierarchies
   (
    SELECT [execution_instance_guid]
     , [id]
     , [parent_execution_log_id]
     , 1 AS [Depth]
     , [proc_schema_name]
     , [proc_name]
     , [step_id]
     , [duration__current_execution_guid]
    FROM [repo].[ExecutionLog_gross]
    WHERE (
      [id] = @parent_execution_log_id
      OR @parent_execution_log_id IS NULL
      AND [parent_execution_log_id] IS NULL
      )
     AND (
      [execution_instance_guid] = @execution_instance_guid
      OR @execution_instance_guid IS NULL
      )
     AND [step_id] = 1
    
    UNION ALL
    
    SELECT [child].[execution_instance_guid]
     , [child].[id]
     , [child].[parent_execution_log_id]
     , [parent].[Depth] + 1
     , [child].[proc_schema_name]
     , [child].[proc_name]
     , [child].[step_id]
     , [child].[duration__current_execution_guid]
    FROM [repo].[ExecutionLog_gross] AS child
    INNER JOIN tree AS parent
     ON child.[parent_execution_log_id] = parent.[id]
    WHERE
     --
     [child].[execution_instance_guid] = [parent].[execution_instance_guid]
     AND [child].[step_id] = 1
    )
  SELECT
   --
   *
   , PlantUmlTree = CONCAT (
    REPLICATE('+', Depth)
    , ' '
    , QUOTENAME([proc_schema_name])
    , '.'
    , QUOTENAME([proc_name])
    )
   , PlantUmlTreeTable = CONCAT (
    REPLICATE('+', Depth)
    , ' '
    , QUOTENAME([proc_schema_name])
    , '.'
    , QUOTENAME([proc_name])
    , '  |  '
    , [duration__current_execution_guid]
    )
  FROM tree
  )