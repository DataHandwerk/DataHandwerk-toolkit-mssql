


/*
missing table alias:

T1.source_table_QuoteName is NULL and can't be linked to an exsisting T44.alias_QuoteName
we try mapping only by T1.source_column_QuoteName

for example

aaa
from
table as T1

aaa
from
table
*/
CREATE VIEW [repo].[RepoObject_SqlModules_72_reference_NoTableAlias]
AS
SELECT T1.RepoObject_guid
 , T1.SysObject_fullname
 , roc.RepoObjectColumn_guid
 , roc.RepoObjectColumn_name
 , source_RepoObject_guid = ro_source.RepoObject_guid
 , source_SysObject_fullname = ro_source.[SysObject_fullname]
 , source_RepoObjectColumn_guid = roc_source.RepoObjectColumn_guid
 , source_RepoObjectColumn_name = roc_source.RepoObjectColumn_name
 , T1.source_table_QuoteName
 , T1.source_column_QuoteName
 , T1.alias_QuoteName
 , T1.[normalized]
FROM [repo].[RepoObject_SqlModules_61_SelectIdentifier_Union_T] AS T1
INNER JOIN [repo].[RepoObject_SqlModules_44_from_Identifier_QuoteName] AS T44
 ON T44.RepoObject_guid = T1.RepoObject_guid
-- T1.source_table_QuoteName is NULL and can't be linked to an exsisting T44.alias_QuoteName
--AND T44.alias_QuoteName = T1.source_table_QuoteName
INNER JOIN [repo].[RepoObjectColumn] roc
 ON QUOTENAME(roc.SysObjectColumn_name) = T1.alias_QuoteName
  AND roc.RepoObject_guid = T1.RepoObject_guid
INNER JOIN [repo].[RepoObject] ro_source
 ON quotename(ro_source.[SysObject_schema_name]) = T44.name_PreDot_QuoteName
  AND quotename(ro_source.[SysObject_name]) = T44.name_PostDot_QuoteName
INNER JOIN [repo].[RepoObjectColumn] roc_source
 ON QUOTENAME(roc_source.SysObjectColumn_name) = T1.source_column_QuoteName
  AND roc_source.RepoObject_guid = ro_source.RepoObject_guid
WHERE
 --can't be linked to an exsisting T44.alias_QuoteName
 T1.source_table_QuoteName IS NULL
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '297e4be1-8f64-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias', @level2type = N'COLUMN', @level2name = N'alias_QuoteName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '287e4be1-8f64-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias', @level2type = N'COLUMN', @level2name = N'source_column_QuoteName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '277e4be1-8f64-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias', @level2type = N'COLUMN', @level2name = N'source_table_QuoteName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '267e4be1-8f64-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias', @level2type = N'COLUMN', @level2name = N'source_RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '257e4be1-8f64-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias', @level2type = N'COLUMN', @level2name = N'source_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '247e4be1-8f64-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias', @level2type = N'COLUMN', @level2name = N'source_SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '237e4be1-8f64-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias', @level2type = N'COLUMN', @level2name = N'source_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '227e4be1-8f64-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '217e4be1-8f64-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '207e4be1-8f64-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1f7e4be1-8f64-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '137e4be1-8f64-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd48f8f21-4265-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias', @level2type = N'COLUMN', @level2name = N'normalized';

