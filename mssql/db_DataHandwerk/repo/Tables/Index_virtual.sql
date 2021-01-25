CREATE TABLE [repo].[Index_virtual] (
    [index_guid]             UNIQUEIDENTIFIER DEFAULT (newsequentialid()) NOT NULL,
    [index_name]             NVARCHAR (128)   NULL,
    [index_type]             TINYINT          DEFAULT ((0)) NOT NULL,
    [is_index_disabled]      BIT              DEFAULT ((0)) NOT NULL,
    [is_index_primary_key]   BIT              DEFAULT ((0)) NOT NULL,
    [is_index_unique]        BIT              DEFAULT ((0)) NOT NULL,
    [parent_RepoObject_guid] UNIQUEIDENTIFIER NOT NULL,
    [referenced_index_guid]  UNIQUEIDENTIFIER NULL,
    [RowNumberInReferencing] INT              NULL,
    CONSTRAINT [PK_Index_virtual] PRIMARY KEY CLUSTERED ([index_guid] ASC),
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
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Type of index:
0 = Heap
1 = Clustered
2 = Nonclustered
3 = XML
4 = Spatial
5 = Clustered columnstore index. Applies to: SQL Server 2014 (12.x) and later.
6 = Nonclustered columnstore index. Applies to: SQL Server 2012 (11.x) and later.
7 = Nonclustered hash index. Applies to: SQL Server 2014 (12.x) and later.', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'COLUMN', @level2name = N'index_type';

