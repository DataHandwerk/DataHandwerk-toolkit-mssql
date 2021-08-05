CREATE TABLE [repo].[ForeignKey_virtual] (
    [ForeignKey_guid]           UNIQUEIDENTIFIER CONSTRAINT [DF__ForeignKe__Forei__62AFA012] DEFAULT (newsequentialid()) NOT NULL,
    [is_ForeignKey_disabled]    BIT              CONSTRAINT [DF__ForeignKe__is_Fo__63A3C44B] DEFAULT ((0)) NOT NULL,
    [ForeignKey_name]           NVARCHAR (128)   NULL,
    [referencing_index_guid]    UNIQUEIDENTIFIER NULL,
    [referenced_index_guid]     UNIQUEIDENTIFIER NULL,
    [delete_referential_action] TINYINT          CONSTRAINT [DF_ForeignKey_virtual_delete_referential_action] DEFAULT ((0)) NOT NULL,
    [update_referential_action] TINYINT          CONSTRAINT [DF_ForeignKey_virtual_update_referential_action] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_ForeignKey_virtual] PRIMARY KEY CLUSTERED ([ForeignKey_guid] ASC),
    CONSTRAINT [FK_ForeignKey_virtual__Index_Settings__ForeignKey_index] FOREIGN KEY ([referencing_index_guid]) REFERENCES [repo].[Index_Settings] ([index_guid]),
    CONSTRAINT [FK_ForeignKey_virtual__Index_Settings__referenced_index] FOREIGN KEY ([referenced_index_guid]) REFERENCES [repo].[Index_Settings] ([index_guid])
);










GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a756741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_virtual', @level2type = N'CONSTRAINT', @level2name = N'PK_ForeignKey_virtual';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'aa56741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_virtual', @level2type = N'CONSTRAINT', @level2name = N'FK_ForeignKey_virtual__Index_Settings__referenced_index';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a956741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_virtual', @level2type = N'CONSTRAINT', @level2name = N'FK_ForeignKey_virtual__Index_Settings__ForeignKey_index';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a456741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_virtual';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a656741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF__ForeignKe__is_Fo__63A3C44B';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a556741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF__ForeignKe__Forei__62AFA012';


GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cc56741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_virtual', @level2type = N'COLUMN', @level2name = N'is_ForeignKey_disabled';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ca56741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_virtual', @level2type = N'COLUMN', @level2name = N'ForeignKey_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c956741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_virtual', @level2type = N'COLUMN', @level2name = N'ForeignKey_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cf56741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_virtual', @level2type = N'COLUMN', @level2name = N'referenced_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cb56741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_virtual', @level2type = N'COLUMN', @level2name = N'referencing_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '04df2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF_ForeignKey_virtual_update_referential_action';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '03df2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF_ForeignKey_virtual_delete_referential_action';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '48df2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_virtual', @level2type = N'COLUMN', @level2name = N'update_referential_action';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '47df2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_virtual', @level2type = N'COLUMN', @level2name = N'delete_referential_action';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'ForeignKey_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_virtual';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'ForeignKey_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_virtual';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_virtual';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'A756741B-6373-EB11-84E3-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_virtual';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.ForeignKey_virtual_Indexes.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_virtual';

