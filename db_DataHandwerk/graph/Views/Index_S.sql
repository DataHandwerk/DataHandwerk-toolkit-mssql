CREATE VIEW [graph].[Index_S]
AS
SELECT [Index_guid]
 , [Index_name]
 , [index_type]
 , [IndexPatternColumnDatatype]
 , [IndexPatternColumnName]
 , [IndexSemanticGroup]
 , [is_index_disabled]
 , [is_index_primary_key]
 , [is_index_real]
 , [is_index_unique]
 , [RepoObject_fullname]
 , [RepoObject_fullname2]
 , [RepoObject_guid] = [parent_RepoObject_guid]
FROM [repo].[Index_gross]
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ded49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'Index_S', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ddd49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'Index_S', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dcd49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'Index_S', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dbd49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'Index_S', @level2type = N'COLUMN', @level2name = N'is_index_unique';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dad49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'Index_S', @level2type = N'COLUMN', @level2name = N'is_index_real';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd9d49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'Index_S', @level2type = N'COLUMN', @level2name = N'is_index_primary_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd8d49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'Index_S', @level2type = N'COLUMN', @level2name = N'is_index_disabled';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd7d49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'Index_S', @level2type = N'COLUMN', @level2name = N'IndexSemanticGroup';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd6d49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'Index_S', @level2type = N'COLUMN', @level2name = N'IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd5d49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'Index_S', @level2type = N'COLUMN', @level2name = N'IndexPatternColumnDatatype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd4d49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'Index_S', @level2type = N'COLUMN', @level2name = N'index_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd3d49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'Index_S', @level2type = N'COLUMN', @level2name = N'Index_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd2d49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'Index_S', @level2type = N'COLUMN', @level2name = N'Index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'bfd49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'Index_S';

