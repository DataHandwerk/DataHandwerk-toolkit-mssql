CREATE TABLE [repo].[Index_Settings] (
    [index_guid]                 UNIQUEIDENTIFIER NOT NULL,
    [IndexPatternColumnDatatype] NVARCHAR (4000)  NULL,
    [IndexPatternColumnName]     NVARCHAR (4000)  NULL,
    [IndexSemanticGroup]         NVARCHAR (512)   NULL,
    [is_create_constraint]       BIT              CONSTRAINT [DF__Index_Set__is_cr__1209AD79] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Index_Settings] PRIMARY KEY CLUSTERED ([index_guid] ASC)
);






GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '2290291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_Settings', @level2type = N'CONSTRAINT', @level2name = N'PK_Index_Settings';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '2090291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_Settings';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '62cbc49c-3862-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_Settings', @level2type = N'CONSTRAINT', @level2name = N'DF__Index_Set__is_cr__1209AD79';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '10f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_Settings', @level2type = N'COLUMN', @level2name = N'is_create_constraint';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0ff37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_Settings', @level2type = N'COLUMN', @level2name = N'IndexSemanticGroup';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0ef37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_Settings', @level2type = N'COLUMN', @level2name = N'IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0df37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_Settings', @level2type = N'COLUMN', @level2name = N'IndexPatternColumnDatatype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0cf37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_Settings', @level2type = N'COLUMN', @level2name = N'index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'index_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_Settings';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'index_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_Settings';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_Settings';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'2290291C-9D61-EB11-84DC-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_Settings';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.Index_gross.adoc[]
* xref:repo.Index_Settings_ForUpdate.adoc[]
* xref:repo.Index_SqlConstraint_PkUq.adoc[]
* xref:repo.Index_virtual_ForUpdate.adoc[]
* xref:repo.Index_virtual_SysObject.adoc[]
* xref:repo.IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check.adoc[]
* xref:repo.RepoObject_gross.adoc[]
* xref:repo.usp_Index_finish.adoc[]
* xref:repo.usp_Index_Settings.adoc[]
* xref:repo.usp_Index_virtual_set.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_Settings';

