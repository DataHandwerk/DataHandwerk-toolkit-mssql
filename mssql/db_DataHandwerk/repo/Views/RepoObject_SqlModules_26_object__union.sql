--Objects, containing the keywords ('UNION', 'UNION ALL')
--We assume that it is UNION.
CREATE VIEW [repo].[RepoObject_SqlModules_26_object__union]
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
