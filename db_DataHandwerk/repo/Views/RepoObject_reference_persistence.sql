﻿
CREATE VIEW [repo].[RepoObject_reference_persistence]
AS
--
SELECT
 --
 [referenced_RepoObject_guid] = [rop].[source_RepoObject_guid]
 , [referencing_RepoObject_guid] = [rop].[target_RepoObject_guid]
 , [referenced_entity_name] = [ro_s].[SysObject_name]
 , [referenced_fullname] = [ro_s].[RepoObject_fullname]
 , [referenced_id] = [ro_s].[SysObject_id]
 , [referenced_node_id] = [ro_s].[node_id]
 , [referenced_schema_name] = [ro_s].[SysObject_schema_name]
 , [referenced_type] = [ro_s].[SysObject_type]
 , [referencing_entity_name] = [ro_t].[SysObject_name]
 , [referencing_fullname] = [ro_t].[RepoObject_fullname]
 , [referencing_id] = [ro_t].[SysObject_id]
 , [referencing_node_id] = [ro_t].[node_id]
 , [referencing_schema_name] = [ro_t].[SysObject_schema_name]
 , [referencing_type] = COALESCE([ro_t].[SysObject_type], [ro_t].[RepoObject_type], 'U')
 , [InformationSource] = 'repo.RepoObject_persistence'
FROM repo.RepoObject_persistence AS rop
INNER JOIN repo.RepoObject AS ro_t
 ON ro_t.RepoObject_guid = rop.target_RepoObject_guid
INNER JOIN repo.RepoObject AS ro_s
 ON ro_s.RepoObject_guid = rop.source_RepoObject_guid

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f38f291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd2f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence', @level2type = N'COLUMN', @level2name = N'referencing_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd3f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence', @level2type = N'COLUMN', @level2name = N'referencing_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd0f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cdf17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence', @level2type = N'COLUMN', @level2name = N'referencing_node_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ccf17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence', @level2type = N'COLUMN', @level2name = N'referencing_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd4f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence', @level2type = N'COLUMN', @level2name = N'referencing_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd7f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence', @level2type = N'COLUMN', @level2name = N'referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd5f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence', @level2type = N'COLUMN', @level2name = N'referenced_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd1f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cff17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence', @level2type = N'COLUMN', @level2name = N'referenced_node_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cef17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence', @level2type = N'COLUMN', @level2name = N'referenced_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd6f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence', @level2type = N'COLUMN', @level2name = N'referenced_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd8f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence', @level2type = N'COLUMN', @level2name = N'InformationSource';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '10df2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence', @level2type = N'COLUMN', @level2name = N'referencing_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0fdf2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence', @level2type = N'COLUMN', @level2name = N'referenced_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'[repo].[RepoObject]
[repo].[RepoObject_persistence]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject].[SysObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence', @level2type = N'COLUMN', @level2name = N'referencing_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject_persistence].[target_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject].[node_id]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence', @level2type = N'COLUMN', @level2name = N'referencing_node_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(CONVERT([bigint],[SysObject_id])*(10000))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence', @level2type = N'COLUMN', @level2name = N'referencing_node_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject].[SysObject_id]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence', @level2type = N'COLUMN', @level2name = N'referencing_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject].[SysObject_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence', @level2type = N'COLUMN', @level2name = N'referencing_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject].[SysObject_type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence', @level2type = N'COLUMN', @level2name = N'referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'reference in [repo_sys].[type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence', @level2type = N'COLUMN', @level2name = N'referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject].[SysObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence', @level2type = N'COLUMN', @level2name = N'referenced_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject_persistence].[source_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject].[node_id]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence', @level2type = N'COLUMN', @level2name = N'referenced_node_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(CONVERT([bigint],[SysObject_id])*(10000))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence', @level2type = N'COLUMN', @level2name = N'referenced_node_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject].[SysObject_id]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence', @level2type = N'COLUMN', @level2name = N'referenced_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject].[SysObject_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence', @level2type = N'COLUMN', @level2name = N'referenced_entity_name';

