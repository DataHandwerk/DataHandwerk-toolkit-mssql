﻿

CREATE VIEW [repo].[RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName]
AS
SELECT [RepoObject_guid]
 , [json_key]
 , [SysObject_fullname]
 , [RowNumber_per_Object]
 , [class]
 , [normalized]
 , [T2_class]
 , [Identifier_alias]
 , [Identifier_source]
 , [Identifier_source_class]
 , [Identifier_source_children]
 , [Identifier_source_table]
 , [Identifier_source_column]
 , [Identifier_alias_QuoteName] = CASE 
  WHEN LEFT([Identifier_alias], 1) = '['
   AND RIGHT([Identifier_alias], 1) = ']'
   THEN [Identifier_alias]
  ELSE QUOTENAME([Identifier_alias])
  END
 , [Identifier_source_table_QuoteName] = CASE 
  WHEN LEFT([Identifier_source_table], 1) = '['
   AND RIGHT([Identifier_source_table], 1) = ']'
   THEN [Identifier_source_table]
  ELSE QUOTENAME([Identifier_source_table])
  END
 , [Identifier_source_column_QuoteName] = CASE 
  WHEN LEFT([Identifier_source_column], 1) = '['
   AND RIGHT([Identifier_source_column], 1) = ']'
   THEN [Identifier_source_column]
  ELSE QUOTENAME([Identifier_source_column])
  END
FROM [repo].[RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit]
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0c813ebd-7764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '41813ebd-7764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName', @level2type = N'COLUMN', @level2name = N'T2_class';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3d813ebd-7764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3e813ebd-7764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName', @level2type = N'COLUMN', @level2name = N'RowNumber_per_Object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3b813ebd-7764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '40813ebd-7764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName', @level2type = N'COLUMN', @level2name = N'normalized';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3c813ebd-7764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName', @level2type = N'COLUMN', @level2name = N'json_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '49813ebd-7764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName', @level2type = N'COLUMN', @level2name = N'Identifier_source_table_QuoteName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '46813ebd-7764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName', @level2type = N'COLUMN', @level2name = N'Identifier_source_table';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4a813ebd-7764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName', @level2type = N'COLUMN', @level2name = N'Identifier_source_column_QuoteName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '47813ebd-7764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName', @level2type = N'COLUMN', @level2name = N'Identifier_source_column';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '44813ebd-7764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName', @level2type = N'COLUMN', @level2name = N'Identifier_source_class';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '45813ebd-7764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName', @level2type = N'COLUMN', @level2name = N'Identifier_source_children';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '43813ebd-7764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName', @level2type = N'COLUMN', @level2name = N'Identifier_source';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '48813ebd-7764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName', @level2type = N'COLUMN', @level2name = N'Identifier_alias_QuoteName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '42813ebd-7764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName', @level2type = N'COLUMN', @level2name = N'Identifier_alias';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3f813ebd-7764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName', @level2type = N'COLUMN', @level2name = N'class';
