CREATE TABLE [repo].[IndexColumn_virtual] (
    [index_guid]            UNIQUEIDENTIFIER NOT NULL,
    [index_column_id]       INT              NOT NULL,
    [RepoObjectColumn_guid] UNIQUEIDENTIFIER NOT NULL,
    [is_descending_key]     BIT              CONSTRAINT [DF__IndexColu__is_de__17C286CF] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_IndexColumn_unique] PRIMARY KEY CLUSTERED ([index_guid] ASC, [index_column_id] ASC),
    CONSTRAINT [FK_IndexColumn_virtual__Index_virtual] FOREIGN KEY ([index_guid]) REFERENCES [repo].[Index_virtual] ([index_guid]) ON DELETE CASCADE ON UPDATE CASCADE
);






GO



GO



GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'consecutive number of the column within the index.
sys.index_columns.index_column_id: "ID of the index column. index_column_id is unique only within index_id."
', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_virtual', @level2type = N'COLUMN', @level2name = N'index_column_id';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '4c90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_virtual', @level2type = N'CONSTRAINT', @level2name = N'PK_IndexColumn_unique';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b190291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_virtual', @level2type = N'CONSTRAINT', @level2name = N'FK_IndexColumn_virtual__Index_virtual';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '4a90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_virtual';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '68cbc49c-3862-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF__IndexColu__is_de__17C286CF';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3ff47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_virtual', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '40f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_virtual', @level2type = N'COLUMN', @level2name = N'is_descending_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3df47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_virtual', @level2type = N'COLUMN', @level2name = N'index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3ef47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_virtual', @level2type = N'COLUMN', @level2name = N'index_column_id';

