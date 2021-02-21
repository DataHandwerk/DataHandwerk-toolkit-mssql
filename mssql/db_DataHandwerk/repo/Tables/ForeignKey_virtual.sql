CREATE TABLE [repo].[ForeignKey_virtual] (
    [ForeignKey_guid]        UNIQUEIDENTIFIER CONSTRAINT [DF__ForeignKe__Forei__62AFA012] DEFAULT (newsequentialid()) NOT NULL,
    [is_ForeignKey_disabled] BIT              CONSTRAINT [DF__ForeignKe__is_Fo__63A3C44B] DEFAULT ((0)) NOT NULL,
    [ForeignKey_name]        NVARCHAR (128)   NULL,
    [referencing_index_guid] UNIQUEIDENTIFIER NULL,
    [referenced_index_guid]  UNIQUEIDENTIFIER NULL,
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

