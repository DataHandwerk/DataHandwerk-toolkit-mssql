
CREATE VIEW [repo].[RepoObject_SqlModules_43_from_Identifier]
AS
SELECT [RepoObject_guid]
 , [SysObject_fullname]
 , [class]
 , [json_key]
 , [RowNumber_per_Object]
 , [name]
 , [name_charindex_dot]
 , [name_PreDot] = CASE 
  WHEN [name_charindex_dot] > 1
   THEN LEFT([name], [name_charindex_dot] - 1)
  END
 , [name_PostDot] = CASE 
  WHEN [name_charindex_dot] > 1
   THEN SUBSTRING([name], [name_charindex_dot] + 1, LEN([name]))
  END
 , [alias]
 , [T1_identifier_alias]
 , [lag_normalized_wo_nolock]
FROM [repo].[RepoObject_SqlModules_42_from_Identifier]
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0d5cfbad-f063-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_43_from_Identifier', @level2type = N'COLUMN', @level2name = N'lag_normalized_wo_nolock';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0c5cfbad-f063-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_43_from_Identifier', @level2type = N'COLUMN', @level2name = N'T1_identifier_alias';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0a5cfbad-f063-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_43_from_Identifier', @level2type = N'COLUMN', @level2name = N'alias';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5f4241cb-fb63-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_43_from_Identifier', @level2type = N'COLUMN', @level2name = N'name_PostDot';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5e4241cb-fb63-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_43_from_Identifier', @level2type = N'COLUMN', @level2name = N'name_PreDot';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '095cfbad-f063-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_43_from_Identifier', @level2type = N'COLUMN', @level2name = N'name_charindex_dot';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '085cfbad-f063-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_43_from_Identifier', @level2type = N'COLUMN', @level2name = N'name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '075cfbad-f063-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_43_from_Identifier', @level2type = N'COLUMN', @level2name = N'RowNumber_per_Object';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '055cfbad-f063-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_43_from_Identifier', @level2type = N'COLUMN', @level2name = N'class';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '045cfbad-f063-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_43_from_Identifier', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '035cfbad-f063-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_43_from_Identifier', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'fe5bfbad-f063-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_43_from_Identifier';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '39813ebd-7764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_43_from_Identifier', @level2type = N'COLUMN', @level2name = N'json_key';

