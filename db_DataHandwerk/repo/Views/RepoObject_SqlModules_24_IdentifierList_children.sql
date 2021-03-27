
CREATE VIEW [repo].[RepoObject_SqlModules_24_IdentifierList_children]
AS
--
SELECT [T1].[RepoObject_guid]
 , [T1].[json_key]
 , [T2].[json_key] AS T2_json_key
 , [T1].[SysObject_fullname]
 , [T1].[RowNumber_per_Object]
 , [T1].[class]
 --, [T1].[is_group]
 --, [T1].[is_keyword]
 --, [T1].[is_whitespace]
 , [T1].[normalized]
 --, [T1].[children]
 , [T2_class] = [T2].[class]
 , [Identifier_alias] = CASE [T2].[class]
  WHEN 'Identifier'
   THEN CASE 
     WHEN [T2].[child1_normalized] IS NULL
      THEN [T2].[child0_normalized]
     WHEN [T2].[child1_normalized] = 'AS'
      THEN [T2].[child2_normalized]
     WHEN [T2].[child1_normalized] = '.'
      THEN [T2].[child2_normalized]
     WHEN [T2].[child3_normalized] = 'AS'
      THEN [T2].[child4_normalized]
     END
  WHEN 'Comparison'
   THEN CASE 
     WHEN [T2].[child1_normalized] = '='
      THEN [T2].[child0_normalized]
     END
  END
 , [Identifier_source] = CASE [T2].[class]
  WHEN 'Identifier'
   THEN CASE [T2].[child0_class]
     WHEN 'Token'
      THEN [T2].[normalized]
     WHEN 'Function'
      THEN [T2].[child0_normalized]
     END
  WHEN 'Comparison'
   THEN CASE 
     WHEN [T2].[child1_normalized] = '='
      THEN [T2].[child2_normalized]
     END
  END
 , [Identifier_source_class] = CASE [T2].[class]
  WHEN 'Identifier'
   THEN CASE [T2].[child0_class]
     WHEN 'Token'
      THEN [T2].[class]
     WHEN 'Function'
      THEN [T2].[child0_class]
     END
  WHEN 'Comparison'
   THEN CASE 
     WHEN [T2].[child1_normalized] = '='
      THEN [T2].[child2_class]
     END
  END
 , [Identifier_source_children] = CASE [T2].[class]
  WHEN 'Identifier'
   THEN CASE [T2].[child0_class]
     WHEN 'Token'
      THEN [T2].[children]
     WHEN 'Function'
      THEN [T2].[child0_children]
     END
  WHEN 'Comparison'
   THEN CASE 
     WHEN [T2].[child1_normalized] = '='
      THEN [T2].[child2_children]
     END
  END
--, [T2].[is_group]
--, [T2].[is_keyword]
--, [T2].[is_whitespace]
--, [T2].[normalized]
--, [T2].[children]
--, [T2].[child0_class]
--, [T2].[child0_is_group]
--, [T2].[child0_is_keyword]
--, [T2].[child0_is_whitespace]
--, [T2].[child0_normalized]
--, [T2].[child0_children]
--, [T2].[child1_class]
--, [T2].[child1_is_group]
--, [T2].[child1_is_keyword]
--, [T2].[child1_is_whitespace]
--, [T2].[child1_normalized]
--, [T2].[child1_children]
--, [T2].[child2_class]
--, [T2].[child2_is_group]
--, [T2].[child2_is_keyword]
--, [T2].[child2_is_whitespace]
--, [T2].[child2_normalized]
--, [T2].[child2_children]
--, [T2].[child3_class]
--, [T2].[child3_is_group]
--, [T2].[child3_is_keyword]
--, [T2].[child3_is_whitespace]
--, [T2].[child3_normalized]
--, [T2].[child3_children]
--, [T2].[child4_class]
--, [T2].[child4_is_group]
--, [T2].[child4_is_keyword]
--, [T2].[child4_is_whitespace]
--, [T2].[child4_normalized]
--, [T2].[child4_children]
FROM [repo].[RepoObject_SqlModules_20_statement_children] AS T1
CROSS APPLY [repo].[ftv_sqlparse_with_some_children](T1.children) AS T2
WHERE [T1].[class] = 'IdentifierList'
 AND [T2].[class] IN (
  'Identifier'
  , 'Comparison'
  )
 ----there was any reason for this filter
 ----now we remove it, but we need to check the case of 'Identifier'
 -- AND [T2].[class] = 'Comparison'

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '3b90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c8f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'T2_class';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c4f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c5f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'RowNumber_per_Object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c2f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c7f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'normalized';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cbf37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'Identifier_source_class';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ccf37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'Identifier_source_children';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'caf37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'Identifier_source';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c9f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'Identifier_alias';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c6f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'class';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '35813ebd-7764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'json_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2f377e23-f381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'T2_json_key';

