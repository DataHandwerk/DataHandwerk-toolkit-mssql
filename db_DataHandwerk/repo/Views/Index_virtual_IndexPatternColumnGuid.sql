

CREATE VIEW [repo].[Index_virtual_IndexPatternColumnGuid]
AS
SELECT i.[index_guid]
 --only one [parent_RepoObject_guid] per index_guid is possible
 , [parent_RepoObject_guid] = MAX(i.[parent_RepoObject_guid])
 , [IndexPatternColumnGuid] = STRING_AGG(CAST([ic].[RepoObjectColumn_guid] AS CHAR(36)), ',') WITHIN
GROUP (
  ORDER BY CAST([ic].[RepoObjectColumn_guid] AS CHAR(36))
  )
FROM [repo].[Index_virtual] i
INNER JOIN [repo].[IndexColumn_virtual] ic
 ON i.[index_guid] = ic.[index_guid]
GROUP BY [i].[index_guid]
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '75ce8eb8-5f62-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_IndexPatternColumnGuid', @level2type = N'COLUMN', @level2name = N'IndexPatternColumnGuid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '74ce8eb8-5f62-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_IndexPatternColumnGuid', @level2type = N'COLUMN', @level2name = N'parent_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '73ce8eb8-5f62-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_IndexPatternColumnGuid', @level2type = N'COLUMN', @level2name = N'index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '60ce8eb8-5f62-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_IndexPatternColumnGuid';


GO


