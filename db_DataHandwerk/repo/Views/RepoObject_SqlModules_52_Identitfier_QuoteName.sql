
CREATE VIEW [repo].[RepoObject_SqlModules_52_Identitfier_QuoteName]
AS
SELECT
 --
 [RepoObject_guid]
 , [json_key]
 , [SysObject_fullname]
 , [RowNumber_per_Object]
 , [class]
 , [normalized]
 , [is_group]
 , [is_keyword]
 , [is_whitespace]
 , [source_table]
 , [source_column]
 , [source_table_QuoteName] = CASE 
  WHEN LEFT([source_table], 1) = '['
   AND RIGHT([source_table], 1) = ']'
   THEN [source_table]
  ELSE QUOTENAME([source_table])
  END
 , [source_column_QuoteName] = CASE 
  WHEN LEFT([source_column], 1) = '['
   AND RIGHT([source_column], 1) = ']'
   THEN [source_column]
  ELSE QUOTENAME([source_column])
  END
 , [children]
 , [child0_class]
FROM [repo].[RepoObject_SqlModules_51_Identitfier]
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1bb3c709-8364-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_52_Identitfier_QuoteName', @level2type = N'COLUMN', @level2name = N'child0_class';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1ab3c709-8364-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_52_Identitfier_QuoteName', @level2type = N'COLUMN', @level2name = N'children';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '19b3c709-8364-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_52_Identitfier_QuoteName', @level2type = N'COLUMN', @level2name = N'source_column_QuoteName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '18b3c709-8364-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_52_Identitfier_QuoteName', @level2type = N'COLUMN', @level2name = N'source_table_QuoteName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '17b3c709-8364-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_52_Identitfier_QuoteName', @level2type = N'COLUMN', @level2name = N'source_column';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '16b3c709-8364-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_52_Identitfier_QuoteName', @level2type = N'COLUMN', @level2name = N'source_table';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '15b3c709-8364-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_52_Identitfier_QuoteName', @level2type = N'COLUMN', @level2name = N'is_whitespace';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '14b3c709-8364-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_52_Identitfier_QuoteName', @level2type = N'COLUMN', @level2name = N'is_keyword';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '13b3c709-8364-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_52_Identitfier_QuoteName', @level2type = N'COLUMN', @level2name = N'is_group';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '12b3c709-8364-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_52_Identitfier_QuoteName', @level2type = N'COLUMN', @level2name = N'normalized';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '11b3c709-8364-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_52_Identitfier_QuoteName', @level2type = N'COLUMN', @level2name = N'class';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '10b3c709-8364-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_52_Identitfier_QuoteName', @level2type = N'COLUMN', @level2name = N'RowNumber_per_Object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0fb3c709-8364-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_52_Identitfier_QuoteName', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0eb3c709-8364-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_52_Identitfier_QuoteName', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '2e454a02-8364-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_52_Identitfier_QuoteName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9aa0a6c2-f781-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_52_Identitfier_QuoteName', @level2type = N'COLUMN', @level2name = N'json_key';

