CREATE
 

 VIEW [repo].[GeneratorUsp_filter_persistence]
AS
SELECT [u].[id]
 , [u].[usp_schema]
 , [u].[usp_name]
 , [u].[has_logging]
 , [u].[usp_Description]
 , [u].[usp_fullname]
FROM [repo].[GeneratorUsp] AS [u]
WHERE LEFT([u].[usp_name], 12) = 'usp_PERSIST_'
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'df8f291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_filter_persistence';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '87f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_filter_persistence', @level2type = N'COLUMN', @level2name = N'usp_schema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '88f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_filter_persistence', @level2type = N'COLUMN', @level2name = N'usp_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8bf17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_filter_persistence', @level2type = N'COLUMN', @level2name = N'usp_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8af17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_filter_persistence', @level2type = N'COLUMN', @level2name = N'usp_Description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '86f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_filter_persistence', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '89f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_filter_persistence', @level2type = N'COLUMN', @level2name = N'has_logging';


GO



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[GeneratorUsp].[usp_schema]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_filter_persistence', @level2type = N'COLUMN', @level2name = N'usp_schema';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[GeneratorUsp].[usp_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_filter_persistence', @level2type = N'COLUMN', @level2name = N'usp_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[GeneratorUsp].[usp_fullname]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_filter_persistence', @level2type = N'COLUMN', @level2name = N'usp_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[usp_schema],''].['',[usp_name],'']''))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_filter_persistence', @level2type = N'COLUMN', @level2name = N'usp_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[GeneratorUsp].[usp_Description]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_filter_persistence', @level2type = N'COLUMN', @level2name = N'usp_Description';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[GeneratorUsp].[id]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_filter_persistence', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[GeneratorUsp].[has_logging]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_filter_persistence', @level2type = N'COLUMN', @level2name = N'has_logging';

