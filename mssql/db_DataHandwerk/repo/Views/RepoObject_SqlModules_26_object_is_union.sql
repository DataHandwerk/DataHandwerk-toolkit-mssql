--Objects, containing the keywords ('UNION', 'UNION ALL')
--We assume that it is UNION.
CREATE VIEW [repo].[RepoObject_SqlModules_26_object_is_union]
AS
--
SELECT [RepoObject_guid]
 , [is_union] = 1
FROM repo.[RepoObject_SqlModules_20_statement_children]
WHERE ([is_keyword] = 1)
 AND (
  [normalized] IN (
   'UNION'
   , 'UNION ALL'
   )
  )
GROUP BY [RepoObject_guid]

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'fb8f291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_26_object_is_union';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fff17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_26_object_is_union', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '00f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_26_object_is_union', @level2type = N'COLUMN', @level2name = N'is_union';

