CREATE TABLE [repo].[RepoObject_persistence] (
    [target_RepoObject_guid]        UNIQUEIDENTIFIER NOT NULL,
    [has_history]                   BIT              CONSTRAINT [DF__RepoObjec__is_te__32767D0B] DEFAULT ((0)) NOT NULL,
    [has_history_columns]           BIT              CONSTRAINT [DF__RepoObjec__has_t__2DB1C7EE] DEFAULT ((0)) NOT NULL,
    [history_schema_name]           NVARCHAR (128)   NULL,
    [history_table_name]            NVARCHAR (128)   NULL,
    [is_history_table_same_schema]  BIT              CONSTRAINT [DF_RepoObject_persistence_is_history_table_same_schema] DEFAULT ((1)) NOT NULL,
    [is_persistence]                AS               (CONVERT([bit],(1))),
    [is_persistence_delete_changed] BIT              CONSTRAINT [DF_RepoObject_persistence_is_persistence_delete_missing1] DEFAULT ((0)) NOT NULL,
    [is_persistence_delete_missing] BIT              CONSTRAINT [DF__RepoObjec__is_pe__2F9A1060] DEFAULT ((0)) NOT NULL,
    [is_persistence_insert]         BIT              CONSTRAINT [DF_RepoObject_persistence_is_persistence_insert] DEFAULT ((1)) NOT NULL,
    [is_persistence_truncate]       BIT              CONSTRAINT [DF__RepoObjec__is_pe__308E3499] DEFAULT ((1)) NOT NULL,
    [is_persistence_update_changed] BIT              CONSTRAINT [DF__RepoObjec__is_pe__318258D2] DEFAULT ((0)) NOT NULL,
    [source_RepoObject_guid]        UNIQUEIDENTIFIER NULL,
    CONSTRAINT [PK_RepoObject_table] PRIMARY KEY CLUSTERED ([target_RepoObject_guid] ASC),
    CONSTRAINT [FK_RepoObject_persistence__RepoObject__target] FOREIGN KEY ([target_RepoObject_guid]) REFERENCES [repo].[RepoObject] ([RepoObject_guid]) ON DELETE CASCADE ON UPDATE CASCADE
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



GO



GO



GO



GO



GO



GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'extra table is required to allow FK with
ON UPDATE CASCADE
ON DELETE CASCADE', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence';

