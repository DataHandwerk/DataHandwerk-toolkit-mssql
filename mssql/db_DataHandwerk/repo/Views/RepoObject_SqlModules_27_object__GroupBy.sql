CREATE VIEW [repo].[RepoObject_SqlModules_27_object__GroupBy]
AS
--
SELECT [RepoObject_guid]
 , [has_GroupBy] = 1
FROM repo.[RepoObject_SqlModules_20_statement_children]
WHERE [is_keyword] = 1
 AND [normalized] = 'GROUP BY'
GROUP BY [RepoObject_guid]
