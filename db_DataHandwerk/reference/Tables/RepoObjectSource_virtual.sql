CREATE TABLE [reference].[RepoObjectSource_virtual] (
    [RepoObject_guid]        UNIQUEIDENTIFIER CONSTRAINT [DF_RepoObjectSource_virtual_RepoObject_guid] DEFAULT (newsequentialid()) NOT NULL,
    [Source_RepoObject_guid] UNIQUEIDENTIFIER CONSTRAINT [DF_RepoObjectSource_virtual_RepoObject_guid1] DEFAULT (newsequentialid()) NOT NULL,
    CONSTRAINT [PK_RepoObjectSource_virtual] PRIMARY KEY CLUSTERED ([RepoObject_guid] ASC, [Source_RepoObject_guid] ASC),
    CONSTRAINT [FK_RepoObjectSource_virtual_RepoObject] FOREIGN KEY ([RepoObject_guid]) REFERENCES [repo].[RepoObject] ([RepoObject_guid]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_RepoObjectSource_virtual_RepoObject_source] FOREIGN KEY ([Source_RepoObject_guid]) REFERENCES [repo].[RepoObject] ([RepoObject_guid])
);


GO
ALTER TABLE [reference].[RepoObjectSource_virtual] NOCHECK CONSTRAINT [FK_RepoObjectSource_virtual_RepoObject_source];




GO





GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '3c77342a-21a5-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObjectSource_virtual_RepoObject_guid1';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '3b77342a-21a5-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObjectSource_virtual_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '3f77342a-21a5-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_virtual', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObjectSource_virtual_RepoObject_source';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '3e77342a-21a5-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_virtual', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObjectSource_virtual_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '3d77342a-21a5-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_virtual', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObjectSource_virtual';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4977342a-21a5-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_virtual', @level2type = N'COLUMN', @level2name = N'Source_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4877342a-21a5-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_virtual', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '3a77342a-21a5-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_virtual';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObject_guid,Source_RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_virtual';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier,uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_virtual';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = '3d77342a-21a5-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_virtual';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:reference.RepoObject_reference_virtual.adoc[]
* xref:reference.usp_RepoObjectSource_virtual_set.adoc[]
* xref:repo.usp_sync_guid_RepoObject.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_virtual';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_virtual', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObjectSource_virtual';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_virtual', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObjectSource_virtual';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_virtual', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObjectSource_virtual_RepoObject_source';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_virtual', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObjectSource_virtual_RepoObject_source';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_virtual', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObjectSource_virtual_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_virtual', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObjectSource_virtual_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObjectSource_virtual_RepoObject_guid1';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObjectSource_virtual_RepoObject_guid1';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObjectSource_virtual_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObjectSource_virtual_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_virtual';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_virtual';

