
CREATE VIEW [repo].[Index_unique_IndexPatternColumnGuid]
AS
SELECT [index_guid]
 , [IndexPatternColumnGuid] = STRING_AGG(CAST([ic].[RepoObjectColumn_guid] AS CHAR(36)), ',') WITHIN
GROUP (
  ORDER BY CAST([ic].[RepoObjectColumn_guid] AS CHAR(36))
  )
FROM [repo_sys].[IndexColumn_unique] ic
GROUP BY [ic].[index_guid]
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '72ce8eb8-5f62-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_unique_IndexPatternColumnGuid', @level2type = N'COLUMN', @level2name = N'IndexPatternColumnGuid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '71ce8eb8-5f62-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_unique_IndexPatternColumnGuid', @level2type = N'COLUMN', @level2name = N'index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5fce8eb8-5f62-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_unique_IndexPatternColumnGuid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'[repo_sys].[IndexColumn_real_unique]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_unique_IndexPatternColumnGuid';

