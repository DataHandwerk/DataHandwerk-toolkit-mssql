CREATE VIEW [repo].[RepoObject_SqlModules_29_2_object_is_GroupBy]
AS
--
SELECT [RepoObject_guid]
 , [has_GroupBy] = 1
FROM repo.[RepoObject_SqlModules_20_statement_children]
WHERE [is_keyword] = 1
 AND [normalized] = 'GROUP BY'
GROUP BY [RepoObject_guid]

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'fd8f291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_29_2_object_is_GroupBy';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '01f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_29_2_object_is_GroupBy', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '02f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_29_2_object_is_GroupBy', @level2type = N'COLUMN', @level2name = N'has_GroupBy';


GO



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject_SqlModules_20_statement_children].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_29_2_object_is_GroupBy', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';

