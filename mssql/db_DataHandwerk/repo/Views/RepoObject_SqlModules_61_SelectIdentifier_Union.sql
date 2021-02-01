create   view repo.[RepoObject_SqlModules_61_SelectIdentifier_Union]
as
SELECT [T1].[RepoObject_guid]
 , [T1].[SysObject_fullname]
 --can be empty, this is fine in case of only one source table in FROM, but it could be also OK in case of unique name within multiple source tables
 , [T1].[source_table_QuoteName]
 , [T1].[source_column_QuoteName]
 , alias_QuoteName = [T1].[source_column_QuoteName]
 , [T1].[RowNumber_per_Object]
 , [T1].[class]
 , [T1].[normalized]
FROM repo.[RepoObject_SqlModules_52_Identitfier_QuoteName] AS T1
--only SELECT Identifier before FROM
INNER JOIN repo.RepoObject_SqlModules_39_object AS T39
 ON T39.RepoObject_guid = T1.RepoObject_guid
  AND T39.Min_RowNumber_From = T1.RowNumber_per_Object + 1
WHERE NOT T1.[source_column_QuoteName] IS NULL

UNION ALL

SELECT T26.RepoObject_guid
 , T26.SysObject_fullname
 --can be empty, this is fine in case of only one source table in FROM, but it could be also OK in case of unique name within multiple source tables
 , source_table_QuoteName = T26.Identifier_source_table_QuoteName
 , source_column_QuoteName = T26.Identifier_source_column_QuoteName
 , alias_QuoteName = T26.Identifier_alias_QuoteName
 , T26.RowNumber_per_Object
 , T26.class
 , T26.normalized
FROM repo.RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName AS T26
INNER JOIN repo.RepoObject_SqlModules_39_object AS T39
 ON T26.RepoObject_guid = T39.RepoObject_guid
  --only SELECT IdentifierList before FROM
  AND T39.Min_RowNumber_From = T26.RowNumber_per_Object + 1
--source column should exist (it will not exist in case of calculations, functions, ...)
WHERE NOT T26.Identifier_source_column_QuoteName IS NULL
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '127e4be1-8f64-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '187e4be1-8f64-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '197e4be1-8f64-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union', @level2type = N'COLUMN', @level2name = N'source_table_QuoteName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1a7e4be1-8f64-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union', @level2type = N'COLUMN', @level2name = N'source_column_QuoteName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1c7e4be1-8f64-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union', @level2type = N'COLUMN', @level2name = N'RowNumber_per_Object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '177e4be1-8f64-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1e7e4be1-8f64-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union', @level2type = N'COLUMN', @level2name = N'normalized';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1d7e4be1-8f64-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union', @level2type = N'COLUMN', @level2name = N'class';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1b7e4be1-8f64-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union', @level2type = N'COLUMN', @level2name = N'alias_QuoteName';

