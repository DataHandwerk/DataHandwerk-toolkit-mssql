

CREATE VIEW [graph].[RepoObjectColumn_S]
AS
SELECT
 --
 [RepoObjectColumn_guid]
 , [RepoObjectColumn_fullname]
 , [RepoObjectColumn_name]
 , [Repo_user_type_fullname] AS [RepoObjectColumn_type]
 , [RepoObject_guid]
 , [RepoObject_fullname]
 , [RepoObject_type]
FROM [repo].[RepoObjectColumn_gross]
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a99fcdb3-3265-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ae9fcdb3-3265-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ad9fcdb3-3265-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b19fcdb3-3265-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'af9fcdb3-3265-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b09fcdb3-3265-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a32c2611-ba7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '774679b8-147c-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'[repo].[RepoObjectColumn_gross]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObjectColumn_gross].[RepoObjectColumn_name]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of the column. Is unique within the object.', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObjectColumn_gross].[RepoObjectColumn_guid]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObjectColumn_gross].[RepoObject_type]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'reference in [repo_sys].[type]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObjectColumn_gross].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObjectColumn_gross].[RepoObject_fullname]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';

