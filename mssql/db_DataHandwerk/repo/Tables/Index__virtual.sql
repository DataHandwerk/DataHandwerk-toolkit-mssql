CREATE TABLE [repo].[Index__virtual] (
    [index_guid]             UNIQUEIDENTIFIER CONSTRAINT [DF_IndexUnique__virtual_RepoObject_guid] DEFAULT (newsequentialid()) NOT NULL,
    [parent_RepoObject_guid] UNIQUEIDENTIFIER NOT NULL,
    [index_name]             NVARCHAR (128)   NULL,
    [is_index_disabled]      BIT              CONSTRAINT [DF_Index__virtual_is_active] DEFAULT ((0)) NOT NULL,
    [is_index_unique]        BIT              CONSTRAINT [DF_Index__virtual_is_index_unique] DEFAULT ((0)) NOT NULL,
    [is_index_primary_key]   BIT              CONSTRAINT [DF_Index__virtual_is_index_primary_key] DEFAULT ((0)) NOT NULL,
    [referenced_index_guid]  UNIQUEIDENTIFIER NULL,
    [RowNumberInReferencing] INT              NULL,
    CONSTRAINT [PK_Index__virtual] PRIMARY KEY CLUSTERED ([index_guid] ASC),
    CONSTRAINT [FK_Index__virtual_RepoObject] FOREIGN KEY ([parent_RepoObject_guid]) REFERENCES [repo].[RepoObject] ([RepoObject_guid]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b1cffd4a-a94e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index__virtual', @level2type = N'CONSTRAINT', @level2name = N'DF_IndexUnique__virtual_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '15ed08c3-304f-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index__virtual', @level2type = N'CONSTRAINT', @level2name = N'DF_Index__virtual_is_active';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b0cffd4a-a94e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index__virtual', @level2type = N'CONSTRAINT', @level2name = N'DF_Index__virtual_is_index_unique';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'afcffd4a-a94e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index__virtual', @level2type = N'CONSTRAINT', @level2name = N'DF_Index__virtual_is_index_primary_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b2cffd4a-a94e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index__virtual', @level2type = N'CONSTRAINT', @level2name = N'FK_Index__virtual_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b6cffd4a-a94e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index__virtual', @level2type = N'CONSTRAINT', @level2name = N'PK_Index__virtual';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b18563d4-1b51-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index__virtual', @level2type = N'COLUMN', @level2name = N'RowNumberInReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2eb3cf2f-e54e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index__virtual', @level2type = N'COLUMN', @level2name = N'referenced_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b9cffd4a-a94e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index__virtual', @level2type = N'COLUMN', @level2name = N'is_index_primary_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bacffd4a-a94e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index__virtual', @level2type = N'COLUMN', @level2name = N'is_index_unique';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'17ed08c3-304f-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index__virtual', @level2type = N'COLUMN', @level2name = N'is_index_disabled';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b8cffd4a-a94e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index__virtual', @level2type = N'COLUMN', @level2name = N'index_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bbcffd4a-a94e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index__virtual', @level2type = N'COLUMN', @level2name = N'parent_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b7cffd4a-a94e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index__virtual', @level2type = N'COLUMN', @level2name = N'index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b4cffd4a-a94e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index__virtual';

