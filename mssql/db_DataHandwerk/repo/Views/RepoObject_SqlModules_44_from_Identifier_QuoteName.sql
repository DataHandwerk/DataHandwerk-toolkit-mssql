
CREATE VIEW [repo].[RepoObject_SqlModules_44_from_Identifier_QuoteName]
AS
SELECT [T1].[RepoObject_guid]
 , [T1].[SysObject_fullname]
 , [T1].[class]
 , [T1].[json_key]
 , [T1].[RowNumber_per_Object]
 , [T1].[name]
 , [T1].[name_charindex_dot]
 , [T1].[name_PreDot]
 , [T1].[name_PostDot]
 , [T1].[alias]
 , [T1].[T1_identifier_alias]
 , [T1].[lag_normalized_wo_nolock]
 , [alias_QuoteName] = CASE 
  WHEN LEFT([alias], 1) = '['
   AND RIGHT([alias], 1) = ']'
   THEN [alias]
  ELSE QUOTENAME([alias])
  END
 , [name_PreDot_QuoteName] = CASE 
  WHEN LEFT([name_PreDot], 1) = '['
   AND RIGHT([name_PreDot], 1) = ']'
   THEN [name_PreDot]
  ELSE QUOTENAME([name_PreDot])
  END
 , [name_PostDot_QuoteName] = CASE 
  WHEN LEFT([name_PostDot], 1) = '['
   AND RIGHT([name_PostDot], 1) = ']'
   THEN [name_PostDot]
  ELSE QUOTENAME([name_PostDot])
  END
FROM [repo].[RepoObject_SqlModules_43_from_Identifier] AS T1
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6e4241cb-fb63-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_44_from_Identifier_QuoteName', @level2type = N'COLUMN', @level2name = N'name_PostDot_QuoteName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6d4241cb-fb63-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_44_from_Identifier_QuoteName', @level2type = N'COLUMN', @level2name = N'name_PreDot_QuoteName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6c4241cb-fb63-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_44_from_Identifier_QuoteName', @level2type = N'COLUMN', @level2name = N'alias_QuoteName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6b4241cb-fb63-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_44_from_Identifier_QuoteName', @level2type = N'COLUMN', @level2name = N'lag_normalized_wo_nolock';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6a4241cb-fb63-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_44_from_Identifier_QuoteName', @level2type = N'COLUMN', @level2name = N'T1_identifier_alias';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '694241cb-fb63-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_44_from_Identifier_QuoteName', @level2type = N'COLUMN', @level2name = N'alias';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '684241cb-fb63-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_44_from_Identifier_QuoteName', @level2type = N'COLUMN', @level2name = N'name_PostDot';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '674241cb-fb63-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_44_from_Identifier_QuoteName', @level2type = N'COLUMN', @level2name = N'name_PreDot';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '664241cb-fb63-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_44_from_Identifier_QuoteName', @level2type = N'COLUMN', @level2name = N'name_charindex_dot';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '654241cb-fb63-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_44_from_Identifier_QuoteName', @level2type = N'COLUMN', @level2name = N'name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '644241cb-fb63-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_44_from_Identifier_QuoteName', @level2type = N'COLUMN', @level2name = N'RowNumber_per_Object';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '624241cb-fb63-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_44_from_Identifier_QuoteName', @level2type = N'COLUMN', @level2name = N'class';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '614241cb-fb63-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_44_from_Identifier_QuoteName', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '604241cb-fb63-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_44_from_Identifier_QuoteName', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5c4241cb-fb63-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_44_from_Identifier_QuoteName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3a813ebd-7764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_44_from_Identifier_QuoteName', @level2type = N'COLUMN', @level2name = N'json_key';

