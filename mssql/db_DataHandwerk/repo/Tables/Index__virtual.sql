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


