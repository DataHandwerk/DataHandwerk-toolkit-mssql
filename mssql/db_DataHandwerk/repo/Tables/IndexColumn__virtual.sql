CREATE TABLE [repo].[IndexColumn__virtual] (
    [Index_guid]            UNIQUEIDENTIFIER NOT NULL,
    [index_column_id]       INT              NOT NULL,
    [RepoObjectColumn_guid] UNIQUEIDENTIFIER NOT NULL,
    [is_descending_key]     BIT              CONSTRAINT [DF_IndexColumn__virtual_is_descending_key] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_IndexColumn__unique] PRIMARY KEY CLUSTERED ([Index_guid] ASC, [index_column_id] ASC),
    CONSTRAINT [FK_IndexColumn__virtual_Index__virtual] FOREIGN KEY ([Index_guid]) REFERENCES [repo].[Index__virtual] ([index_guid]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b3cffd4a-a94e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn__virtual', @level2type = N'CONSTRAINT', @level2name = N'FK_IndexColumn__virtual_Index__virtual';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = N'09e10f86-474d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn__virtual', @level2type = N'CONSTRAINT', @level2name = N'PK_IndexColumn__unique';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'afa4188b-0352-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn__virtual', @level2type = N'COLUMN', @level2name = N'is_descending_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'0ee10f86-474d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn__virtual', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'0be10f86-474d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn__virtual', @level2type = N'COLUMN', @level2name = N'index_column_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'consecutive number of the column within the index.
sys.index_columns.index_column_id: "ID of the index column. index_column_id is unique only within index_id."
', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn__virtual', @level2type = N'COLUMN', @level2name = N'index_column_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'0de10f86-474d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn__virtual', @level2type = N'COLUMN', @level2name = N'Index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = N'08e10f86-474d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn__virtual';

