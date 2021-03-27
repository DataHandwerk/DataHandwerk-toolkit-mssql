
--in case of an simple identifier like [T1].[aaa]
--get the table part [Identifier_source_table] (before dot) and the column part [Identifier_source_column] (after dot)
CREATE VIEW [repo].[RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit]
AS
--
SELECT [t1].[RepoObject_guid]
 , [t1].[json_key]
 , [t1].[T2_json_key]
 , [t1].[SysObject_fullname]
 , [t1].[RowNumber_per_Object]
 , [t1].[class]
 , [t1].[normalized]
 , [t1].[T2_class]
 , [t1].[Identifier_alias]
 , [t1].[Identifier_source]
 , [t1].[Identifier_source_class]
 , [t1].[Identifier_source_children]
 --in case of an simple identifier like [T1].[aaa] get the table part (before dot) and the column part (after dot)
 , [Identifier_source_table] = CASE [Identifier_source_class]
  WHEN 'Identifier'
   THEN CASE 
     WHEN [T3].[child1_normalized] = '.'
      AND NOT [T3].[child2_normalized] IS NULL
      THEN [T3].[child0_normalized]
     WHEN [T3].[child1_normalized] IS NULL
      THEN NULL
     END
  END
 , [Identifier_source_column] = CASE [Identifier_source_class]
  WHEN 'Identifier'
   THEN CASE 
     WHEN [T3].[child1_normalized] = '.'
      AND NOT [T3].[child2_normalized] IS NULL
      THEN [T3].[child2_normalized]
     WHEN [T3].[child1_normalized] IS NULL
      THEN [T3].[child0_normalized]
     END
  END
--, [T3].[child0_class]
--, [T3].[child0_is_group]
--, [T3].[child0_is_keyword]
--, [T3].[child0_normalized]
--, [T3].[child0_children]
--, [T3].[child1_class]
--, [T3].[child1_is_group]
--, [T3].[child1_is_keyword]
--, [T3].[child1_normalized]
--, [T3].[child1_children]
--, [T3].[child2_class]
--, [T3].[child2_is_group]
--, [T3].[child2_is_keyword]
--, [T3].[child2_normalized]
--, [T3].[child2_children]
--, [T3].[child3_class]
--, [T3].[child3_is_group]
--, [T3].[child3_is_keyword]
--, [T3].[child3_normalized]
--, [T3].[child3_children]
--, [T3].[child4_class]
--, [T3].[child4_is_group]
--, [T3].[child4_is_keyword]
--, [T3].[child4_normalized]
--, [T3].[child4_children]
FROM [repo].[RepoObject_SqlModules_24_IdentifierList_children] AS T1
CROSS APPLY [repo].[ftv_sqlparse_children_pivot](T1.[Identifier_source_children]) AS T3

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '3d90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd3f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit', @level2type = N'COLUMN', @level2name = N'T2_class';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cff37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd0f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit', @level2type = N'COLUMN', @level2name = N'RowNumber_per_Object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cdf37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd2f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit', @level2type = N'COLUMN', @level2name = N'normalized';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd8f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit', @level2type = N'COLUMN', @level2name = N'Identifier_source_table';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd9f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit', @level2type = N'COLUMN', @level2name = N'Identifier_source_column';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd6f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit', @level2type = N'COLUMN', @level2name = N'Identifier_source_class';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd7f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit', @level2type = N'COLUMN', @level2name = N'Identifier_source_children';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd5f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit', @level2type = N'COLUMN', @level2name = N'Identifier_source';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd4f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit', @level2type = N'COLUMN', @level2name = N'Identifier_alias';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd1f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit', @level2type = N'COLUMN', @level2name = N'class';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '36813ebd-7764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit', @level2type = N'COLUMN', @level2name = N'json_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3301113c-f581-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit', @level2type = N'COLUMN', @level2name = N'T2_json_key';

