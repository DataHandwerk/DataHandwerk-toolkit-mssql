/*
check

SELECT
       [referencing_id]
     , [referencing_minor_id]
     , [InformationSource]
     , [referencing_schema_name]
     , [referencing_entity_name]
     , [referencing_column_name]
     , [referencing_type]
     , [referenced_schema_name]
     , [referenced_entity_name]
     , [referenced_column_name]
     , [referenced_type]
     , [referencing_RepoObject_guid]
     , [referencing_RepoObjectColumn_guid]
     , [referenced_RepoObject_guid]
     , [referenced_RepoObjectColumn_guid]
--, [referencing_node_id]
--, [referenced_id]
--, [referenced_minor_id]
--, [referenced_node_id]
FROM
     [repo].[RepoObjectColumn_reference__union]
ORDER BY
         [referencing_id]
       , [referencing_minor_id]
       , [referenced_id]
       , [referenced_minor_id]
       , [InformationSource]


*/
CREATE VIEW [repo].[RepoObjectColumn_reference_union]
AS
--
--repo.RepoObjectColumn_reference__sql_expression_dependencies
--contains calculated columns
--maybe colums in case of SCHEMA_BINDING (not tested)
SELECT [referencing_id]
 , [referencing_minor_id]
 , [referencing_node_id]
 , [referenced_id]
 , [referenced_minor_id]
 , [referenced_node_id]
 , [referencing_RepoObject_guid]
 , [referencing_RepoObjectColumn_guid]
 , [referenced_RepoObject_guid]
 , [referenced_RepoObjectColumn_guid]
 , [referencing_type]
 , [referencing_schema_name]
 , [referencing_entity_name]
 , [referencing_column_name]
 , [referenced_schema_name]
 , [referenced_entity_name]
 , [referenced_column_name]
 , [referenced_type]
 , [InformationSource]
 , [is_computed]
 , [definition]
 , [is_referencing_object_equal_referenced_object]
 , [is_referenced_object]
FROM repo.[RepoObjectColumn_reference_SqlExpressionDependencies]
--[repo].[RepoObjectColumn_reference__persistence]
--contains virtual references for persistence tables
--these references can't exist in the real database but only in the repository

UNION ALL

SELECT [referencing_id]
 , [referencing_minor_id]
 , [referencing_node_id]
 , [referenced_id]
 , [referenced_minor_id]
 , [referenced_node_id]
 , [referencing_RepoObject_guid]
 , [referencing_RepoObjectColumn_guid]
 , [referenced_RepoObject_guid]
 , [referenced_RepoObjectColumn_guid]
 , [referencing_type]
 , [referencing_schema_name]
 , [referencing_entity_name]
 , [referencing_column_name]
 , [referenced_schema_name]
 , [referenced_entity_name]
 , [referenced_column_name]
 , [referenced_type]
 , [InformationSource]
 , [is_computed]
 , [definition]
 , [is_referencing_object_equal_referenced_object]
 , [is_referenced_object]
FROM [repo].[RepoObjectColumn_reference_Persistence]
--repo.RepoObjectColumn_reference__first_result_set
--"common" references
--these should be "common" columns in views, not containing expressions
--Attention: views on views are "resolved" like views on the underlaying tables!
--it looks like we don't get references between views here!
--we filter by [is_referenced_object] = 1
--to get only referenced columns from referenced objects

UNION ALL

SELECT [referencing_id]
 , [referencing_minor_id]
 , [referencing_node_id]
 , [referenced_id]
 , [referenced_minor_id]
 , [referenced_node_id]
 , [referencing_RepoObject_guid]
 , [referencing_RepoObjectColumn_guid]
 , [referenced_RepoObject_guid]
 , [referenced_RepoObjectColumn_guid]
 , [referencing_type]
 , [referencing_schema_name]
 , [referencing_entity_name]
 , [referencing_column_name]
 , [referenced_schema_name]
 , [referenced_entity_name]
 , [referenced_column_name]
 , [referenced_type]
 , [InformationSource]
 , [is_computed] = CAST(0 AS BIT)
 , [definition] = NULL
 , [is_referencing_object_equal_referenced_object]
 , [is_referenced_object]
FROM repo.[RepoObjectColumn_reference_FirstResultSet]
WHERE [is_referenced_object] = 1

UNION ALL

SELECT [referencing_id]
 , [referencing_minor_id]
 , [referencing_node_id]
 , [referenced_id]
 , [referenced_minor_id]
 , [referenced_node_id]
 , [referencing_RepoObject_guid]
 , [referencing_RepoObjectColumn_guid]
 , [referenced_RepoObject_guid]
 , [referenced_RepoObjectColumn_guid]
 , [referencing_type]
 , [referencing_schema_name]
 , [referencing_entity_name]
 , [referencing_column_name]
 , [referenced_schema_name]
 , [referenced_entity_name]
 , [referenced_column_name]
 , [referenced_type]
 , [InformationSource]
 , [is_computed] = CAST(0 AS BIT)
 , [definition] = NULL
 , [is_referencing_object_equal_referenced_object]
 , [is_referenced_object]
FROM repo.[RepoObjectColumn_reference_BySamePredecessors]
-- additional references for view columns, which are not common columns
--the result is not yet OK

UNION ALL

SELECT [referencing_id]
 , [referencing_minor_id]
 , [referencing_node_id]
 , [referenced_id]
 , [referenced_minor_id]
 , [referenced_node_id]
 , [referencing_RepoObject_guid]
 , [referencing_RepoObjectColumn_guid]
 , [referenced_RepoObject_guid]
 , [referenced_RepoObjectColumn_guid]
 , [referencing_type]
 , [referencing_schema_name]
 , [referencing_entity_name]
 , [referencing_column_name]
 , [referenced_schema_name]
 , [referenced_entity_name]
 , [referenced_column_name]
 , [referenced_type]
 , [InformationSource]
 , [is_computed]
 , [definition]
 , [is_referencing_object_equal_referenced_object]
 , [is_referenced_object]
FROM [repo].[RepoObjectColumn_reference_QueryPlan] AS roc_r
WHERE
 --only views
 [referencing_type] = 'V'
 --not common, they should be an expresssion or based on an expression
 AND [is_computed] = 1
 AND (
  --these are expressions, which belongs to columns in an referenced object
  --we want to include view_1.aaa -> table_1.aaa
  --but this should be excluded: view_2.aaa -> table_1.aaa
  [is_referenced_object] = 1
  --expressions can reference a predecessor of a referenced object
  --but how to handle these columns?
  --for example:
  --dbo.view_2.Expr2005 -> dbo.table_1.bbb
  --but the direct expression should be dbo.view_2.bbb -> dbo.view_1.bbb
  --we could try to use same-predecessor-logic
  OR [is_target_column_name_expression] = 1
  --these are references to expressions, and by definition they are virtually created in the referenced object
  OR is_referencing_object_equal_referenced_object = 1
  --
  )
 --exclude references from the query above
 --if referenced columns exists there we will not use any possible expression
 --because an expression sometimes is also used in case the table column is some special, for example if it is an Auto ID
 AND NOT EXISTS (
  SELECT 1
  FROM [repo].[RepoObjectColumn_reference_FirstResultSet] AS [roc_r_common]
  WHERE [is_referenced_object] = 1
   AND [roc_r_common].[referencing_RepoObject_guid] = [roc_r].[referencing_RepoObject_guid]
   AND [roc_r_common].[referencing_RepoObjectColumn_guid] = [roc_r].[referencing_RepoObjectColumn_guid]
  )
 --exclude references from the another query above
 AND NOT EXISTS (
  SELECT 1
  FROM [repo].[RepoObjectColumn_reference_BySamePredecessors] AS [roc_r_derived]
  WHERE [roc_r_derived].[referencing_RepoObject_guid] = [roc_r].[referencing_RepoObject_guid]
   AND [roc_r_derived].[referencing_RepoObjectColumn_guid] = [roc_r].[referencing_RepoObjectColumn_guid]
  )


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7590291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_union';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aaf67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_union', @level2type = N'COLUMN', @level2name = N'referencing_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'abf67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_union', @level2type = N'COLUMN', @level2name = N'referencing_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a7f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_union', @level2type = N'COLUMN', @level2name = N'referencing_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a6f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_union', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a2f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_union', @level2type = N'COLUMN', @level2name = N'referencing_node_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a1f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_union', @level2type = N'COLUMN', @level2name = N'referencing_minor_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a0f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_union', @level2type = N'COLUMN', @level2name = N'referencing_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'acf67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_union', @level2type = N'COLUMN', @level2name = N'referencing_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'adf67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_union', @level2type = N'COLUMN', @level2name = N'referencing_column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b1f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_union', @level2type = N'COLUMN', @level2name = N'referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aef67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_union', @level2type = N'COLUMN', @level2name = N'referenced_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a9f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_union', @level2type = N'COLUMN', @level2name = N'referenced_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a8f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_union', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a5f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_union', @level2type = N'COLUMN', @level2name = N'referenced_node_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a4f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_union', @level2type = N'COLUMN', @level2name = N'referenced_minor_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a3f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_union', @level2type = N'COLUMN', @level2name = N'referenced_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aff67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_union', @level2type = N'COLUMN', @level2name = N'referenced_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b0f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_union', @level2type = N'COLUMN', @level2name = N'referenced_column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b5f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_union', @level2type = N'COLUMN', @level2name = N'is_referencing_object_equal_referenced_object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b6f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_union', @level2type = N'COLUMN', @level2name = N'is_referenced_object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b3f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_union', @level2type = N'COLUMN', @level2name = N'is_computed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b2f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_union', @level2type = N'COLUMN', @level2name = N'InformationSource';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b4f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_union', @level2type = N'COLUMN', @level2name = N'definition';

