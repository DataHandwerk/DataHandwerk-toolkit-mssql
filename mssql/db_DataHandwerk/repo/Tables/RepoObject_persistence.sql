CREATE TABLE [repo].[RepoObject_persistence] (
    [target_RepoObject_guid]                UNIQUEIDENTIFIER NOT NULL,
    [has_history]                           BIT              DEFAULT ((0)) NOT NULL,
    [has_history_columns]                   BIT              DEFAULT ((0)) NOT NULL,
    [history_schema_name]                   NVARCHAR (128)   NULL,
    [history_table_name]                    NVARCHAR (128)   NULL,
    [is_persistence_check_for_empty_source] BIT              DEFAULT ((1)) NOT NULL,
    [is_persistence]                        AS               (CONVERT([bit],(1))),
    [is_persistence_delete_changed]         BIT              DEFAULT ((0)) NOT NULL,
    [is_persistence_delete_missing]         BIT              DEFAULT ((0)) NOT NULL,
    [is_persistence_insert]                 BIT              DEFAULT ((1)) NOT NULL,
    [is_persistence_truncate]               BIT              DEFAULT ((1)) NOT NULL,
    [is_persistence_update_changed]         BIT              DEFAULT ((0)) NOT NULL,
    [source_RepoObject_guid]                UNIQUEIDENTIFIER NULL,
    [temporal_type]                         AS               (CONVERT([tinyint],case [has_history] when (1) then (2) else (0) end)),
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

