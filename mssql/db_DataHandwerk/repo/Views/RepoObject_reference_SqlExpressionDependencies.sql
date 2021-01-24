CREATE VIEW [repo].[RepoObject_reference_SqlExpressionDependencies]
AS
--
SELECT [sed].[referencing_id]
 --, [sed].[referencing_minor_id]
 , CAST([sed].[referencing_id] AS BIGINT) * 10000 AS [referencing_node_id]
 , [sed].[referenced_id]
 --, [sed].[referenced_minor_id]
 , CAST([sed].[referenced_id] AS BIGINT) * 10000 AS [referenced_node_id]
 , [sed].[referencing_RepoObject_guid]
 --, [sed].[referencing_RepoObjectColumn_guid]
 , [sed].[referenced_RepoObject_guid]
 --, [sed].[referenced_RepoObjectColumn_guid]
 , [sed].[referencing_type]
 , [sed].[referencing_schema_name]
 , [sed].[referencing_entity_name]
 --, [sed].[referencing_column_name]
 , [sed].[referenced_schema_name]
 , [sed].[referenced_entity_name]
 --, [sed].[referenced_column_name]
 , [sed].[referenced_type]
 , [InformationSource] = 'sys.sql_expression_dependencies'
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
FROM repo_sys.sql_expression_dependencies AS sed
WHERE
 --object level
 [sed].[referencing_minor_id] = 0
 AND [sed].[referenced_minor_id] = 0
 --exclude virtual objects (like expressions used in procedures)
 --or objects without extended properties (like triggers)
 --currently:
 --[RepoObject_guid] = [sed].[referencing_RepoObject_guid]
 --and [sed].[referencing_RepoObject_guid] = SysObject_RepoObject_guid
 --these are RepoObject_guid storred in extended properties
 AND NOT [sed].[referencing_RepoObject_guid] IS NULL
 AND NOT [sed].[referenced_RepoObject_guid] IS NULL
