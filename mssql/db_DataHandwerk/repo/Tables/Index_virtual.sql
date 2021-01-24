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


