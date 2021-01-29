CREATE VIEW [repo].[Index_virtual_SysObject]
AS
--
SELECT [iv].[index_guid]
 , [iv].[parent_RepoObject_guid]
 , [iv].[index_name]
 , [iv].[is_index_disabled]
 , [iv].[is_index_unique]
 , [iv].[is_index_primary_key]
 , [iv].[referenced_index_guid]
 , [isg].[IndexPatternColumnDatatype]
 , [isg].[IndexPatternColumnName]
 , [isg].[IndexSemanticGroup]
 , [ro].[SysObject_id]
 , [ro].[SysObject_schema_name]
 , [ro].[SysObject_name]
 , [ro].[SysObject_type]
 , [ro].[pk_index_guid]
FROM repo.[Index_virtual] AS iv
INNER JOIN repo.RepoObject AS ro
 ON iv.parent_RepoObject_guid = ro.RepoObject_guid
INNER JOIN [repo].[Index_Settings] AS isg
 ON isg.[index_guid] = [iv].[index_guid]

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0790291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_SysObject';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8bf27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_SysObject', @level2type = N'COLUMN', @level2name = N'SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '89f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_SysObject', @level2type = N'COLUMN', @level2name = N'SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8af27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_SysObject', @level2type = N'COLUMN', @level2name = N'SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '88f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_SysObject', @level2type = N'COLUMN', @level2name = N'SysObject_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '84f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_SysObject', @level2type = N'COLUMN', @level2name = N'referenced_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8cf27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_SysObject', @level2type = N'COLUMN', @level2name = N'pk_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7ff27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_SysObject', @level2type = N'COLUMN', @level2name = N'parent_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '82f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_SysObject', @level2type = N'COLUMN', @level2name = N'is_index_unique';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '83f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_SysObject', @level2type = N'COLUMN', @level2name = N'is_index_primary_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '81f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_SysObject', @level2type = N'COLUMN', @level2name = N'is_index_disabled';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '87f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_SysObject', @level2type = N'COLUMN', @level2name = N'IndexSemanticGroup';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '86f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_SysObject', @level2type = N'COLUMN', @level2name = N'IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '85f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_SysObject', @level2type = N'COLUMN', @level2name = N'IndexPatternColumnDatatype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '80f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_SysObject', @level2type = N'COLUMN', @level2name = N'index_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7ef27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_SysObject', @level2type = N'COLUMN', @level2name = N'index_guid';

