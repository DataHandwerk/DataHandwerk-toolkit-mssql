
-- Alter View RepoObjectColumn_reference__sql_expression_dependencies
CREATE VIEW [repo].[RepoObjectColumn_reference_SqlExpressionDependencies]
AS
--
SELECT
       [sed].[referencing_id]
     , [sed].[referencing_minor_id]
     , CAST([sed].[referencing_id] AS BIGINT) * 10000 + [sed].[referencing_minor_id] AS [referencing_node_id]
     , [sed].[referenced_id]
     , [sed].[referenced_minor_id]
     , CAST([sed].[referenced_id] AS BIGINT) * 10000 + [sed].[referenced_minor_id] AS   [referenced_node_id]
     , [sed].[referencing_RepoObject_guid]
     , [sed].[referencing_RepoObjectColumn_guid]
     , [sed].[referenced_RepoObject_guid]
     , [sed].[referenced_RepoObjectColumn_guid]
     , [sed].[referencing_type]
     , [sed].[referencing_schema_name]
     , [sed].[referencing_entity_name]
     , [sed].[referencing_column_name]
     , [sed].[referenced_schema_name]
     , [sed].[referenced_entity_name]
     , [sed].[referenced_column_name]
     , [sed].[referenced_type]
     , [InformationSource] = 'sys.sql_expression_dependencies'
     , [sed].[is_computed]
     , [sed].[definition]
     , [is_referencing_object_equal_referenced_object] = CAST(CASE
                                                                 WHEN [sed].[referencing_RepoObject_guid] = [sed].[referenced_RepoObject_guid]
                                                                 THEN 1
                                                                 ELSE 0
                                                             END AS BIT)
       --Flag, if the [referenced_RepoObject_guid] is a referenced object in [repo].[RepoObject_reference__union]
     , [is_referenced_object] =
(
    SELECT TOP 1
           CAST(1 AS BIT)
    FROM
         [repo].[RepoObject_reference_union] AS [ro_r]
    WHERE  [ro_r].[referencing_RepoObject_guid] = [sed].[referencing_RepoObject_guid]
           AND [ro_r].[referenced_RepoObject_guid] = [sed].[referenced_RepoObject_guid]
)
--, [sed].[referenced_server_name]
--, [sed].[referenced_database_name]
--, [sed].[referenced_class]
--, [sed].[referencing_class]
--, [sed].[referencing_class_desc]
--, [sed].[referenced_class_desc]
--, [sed].[referencing_type_desciption]
--, [sed].[referenced_type_desciption]
--, [sed].[is_schema_bound_reference]
--, [sed].[is_caller_dependent]
--, [sed].[is_ambiguous]
FROM
     repo_sys.sql_expression_dependencies AS sed
WHERE
--column level
[sed].[referencing_minor_id] <> 0
AND [sed].[referenced_minor_id] <> 0
--exclude virtual objects (like expressions used in procedures)
--or objects without extended properties (like triggers)
--currently:
--[RepoObject_guid] = [sed].[referencing_RepoObject_guid]
--and [sed].[referencing_RepoObject_guid] = SysObject_RepoObject_guid
--these are RepoObject_guid storred in extended properties
AND NOT [sed].[referencing_RepoObject_guid] IS NULL
AND NOT [sed].[referenced_RepoObject_guid] IS NULL
GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO


