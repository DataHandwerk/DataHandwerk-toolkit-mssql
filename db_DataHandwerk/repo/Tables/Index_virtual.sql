CREATE TABLE [repo].[Index_virtual] (
    [index_guid]             UNIQUEIDENTIFIER CONSTRAINT [DF__Index_vir__index__12FDD1B2] DEFAULT (newsequentialid()) NOT NULL,
    [has_managedName]        BIT              CONSTRAINT [DF_Index_virtual_has_managedName] DEFAULT ((1)) NOT NULL,
    [index_name]             NVARCHAR (128)   NULL,
    [index_type]             TINYINT          CONSTRAINT [DF__Index_vir__index__13F1F5EB] DEFAULT ((0)) NOT NULL,
    [is_index_disabled]      BIT              CONSTRAINT [DF__Index_vir__is_in__14E61A24] DEFAULT ((0)) NOT NULL,
    [is_index_primary_key]   BIT              CONSTRAINT [DF__Index_vir__is_in__15DA3E5D] DEFAULT ((0)) NOT NULL,
    [is_index_unique]        BIT              CONSTRAINT [DF__Index_vir__is_in__16CE6296] DEFAULT ((0)) NOT NULL,
    [parent_RepoObject_guid] UNIQUEIDENTIFIER NOT NULL,
    [referenced_index_guid]  UNIQUEIDENTIFIER NULL,
    [RowNumberInReferencing] INT              NULL,
    CONSTRAINT [PK_Index_virtual] PRIMARY KEY NONCLUSTERED ([index_guid] ASC),
    CONSTRAINT [FK_Index_virtual__RepoObject] FOREIGN KEY ([parent_RepoObject_guid]) REFERENCES [repo].[RepoObject] ([RepoObject_guid]) ON DELETE CASCADE ON UPDATE CASCADE
);
























GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '3690291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'CONSTRAINT', @level2name = N'PK_Index_virtual';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0f90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'CONSTRAINT', @level2name = N'FK_Index_virtual__RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '3490291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '67cbc49c-3862-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF__Index_vir__is_in__16CE6296';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '66cbc49c-3862-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF__Index_vir__is_in__15DA3E5D';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '65cbc49c-3862-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF__Index_vir__is_in__14E61A24';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '64cbc49c-3862-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF__Index_vir__index__13F1F5EB';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '63cbc49c-3862-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF__Index_vir__index__12FDD1B2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'adf37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'COLUMN', @level2name = N'RowNumberInReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'acf37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'COLUMN', @level2name = N'referenced_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'abf37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'COLUMN', @level2name = N'parent_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aaf37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'COLUMN', @level2name = N'is_index_unique';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a9f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'COLUMN', @level2name = N'is_index_primary_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a8f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'COLUMN', @level2name = N'is_index_disabled';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a7f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'COLUMN', @level2name = N'index_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a6f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'COLUMN', @level2name = N'index_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a5f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'COLUMN', @level2name = N'index_guid';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '92d69880-2874-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF_Index_virtual_has_managedName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9cd69880-2874-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'COLUMN', @level2name = N'has_managedName';


GO



GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'index_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'3690291C-9D61-EB11-84DC-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.Index_union.adoc[]
* xref:repo.Index_virtual_ForUpdate.adoc[]
* xref:repo.Index_virtual_IndexPatternColumnGuid.adoc[]
* xref:repo.Index_virtual_SysObject.adoc[]
* xref:repo.IndexColumn_virtual_gross.adoc[]
* xref:repo.IndexColumn_virtual_referenced_setpoint.adoc[]
* xref:repo.IndexReferencedReferencing.adoc[]
* xref:repo.usp_Index_finish.adoc[]
* xref:repo.usp_index_inheritance.adoc[]
* xref:repo.usp_Index_virtual_set.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'CONSTRAINT', @level2name = N'PK_Index_virtual';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'CONSTRAINT', @level2name = N'PK_Index_virtual';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'CONSTRAINT', @level2name = N'FK_Index_virtual__RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'CONSTRAINT', @level2name = N'FK_Index_virtual__RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF_Index_virtual_has_managedName';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF_Index_virtual_has_managedName';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF__Index_vir__is_in__16CE6296';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF__Index_vir__is_in__16CE6296';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF__Index_vir__is_in__15DA3E5D';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF__Index_vir__is_in__15DA3E5D';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF__Index_vir__is_in__14E61A24';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF__Index_vir__is_in__14E61A24';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF__Index_vir__index__13F1F5EB';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF__Index_vir__index__13F1F5EB';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF__Index_vir__index__12FDD1B2';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF__Index_vir__index__12FDD1B2';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual';


GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_Index_virtual]
    ON [repo].[Index_virtual];

