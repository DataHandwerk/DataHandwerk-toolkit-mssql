CREATE TABLE [repo].[RepoObject_persistence] (
    [target_RepoObject_guid]        UNIQUEIDENTIFIER NOT NULL,
    [source_RepoObject_guid]        UNIQUEIDENTIFIER NULL,
    [is_persistence_truncate]       BIT              CONSTRAINT [DF__RepoObjec__is_pe__308E3499] DEFAULT ((1)) NOT NULL,
    [is_persistence_delete_missing] BIT              CONSTRAINT [DF__RepoObjec__is_pe__2F9A1060] DEFAULT ((0)) NOT NULL,
    [is_persistence_delete_changed] BIT              CONSTRAINT [DF_RepoObject_persistence_is_persistence_delete_missing1] DEFAULT ((0)) NOT NULL,
    [is_persistence_update_changed] BIT              CONSTRAINT [DF__RepoObjec__is_pe__318258D2] DEFAULT ((0)) NOT NULL,
    [is_persistence_insert]         BIT              CONSTRAINT [DF_RepoObject_persistence_is_persistence_insert] DEFAULT ((1)) NOT NULL,
    [has_history_columns]           BIT              CONSTRAINT [DF__RepoObjec__has_t__2DB1C7EE] DEFAULT ((0)) NOT NULL,
    [has_history]                   BIT              CONSTRAINT [DF__RepoObjec__is_te__32767D0B] DEFAULT ((0)) NOT NULL,
    [is_history_table_same_schema]  BIT              CONSTRAINT [DF_RepoObject_persistence_is_history_table_same_schema] DEFAULT ((1)) NOT NULL,
    [history_schema_name]           NVARCHAR (128)   NULL,
    [history_table_name]            NVARCHAR (128)   NULL,
    [is_persistence]                AS               (CONVERT([bit],(1))),
    CONSTRAINT [PK_RepoObject_table] PRIMARY KEY CLUSTERED ([target_RepoObject_guid] ASC),
    CONSTRAINT [FK_RepoObject_persistence__RepoObject__target] FOREIGN KEY ([target_RepoObject_guid]) REFERENCES [repo].[RepoObject] ([RepoObject_guid]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '1aea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_persistence_is_history_table_same_schema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b33dfec8-3849-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF__RepoObjec__is_te__32767D0B';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ae3dfec8-3849-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF__RepoObjec__has_t__2DB1C7EE';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '1bea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_persistence_is_persistence_insert';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b23dfec8-3849-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF__RepoObjec__is_pe__318258D2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '4be4634c-304c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_persistence_is_persistence_delete_missing1';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b03dfec8-3849-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF__RepoObjec__is_pe__2F9A1060';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b13dfec8-3849-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF__RepoObjec__is_pe__308E3499';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7c068223-174d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObject_persistence__RepoObject__target';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'c8638bfc-7948-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObject_table';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e0638bfc-7948-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'13c30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'history_table_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'12c30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'history_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '29ea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'is_history_table_same_schema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'11c30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'has_history';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'10c30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'has_history_columns';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2aea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_insert';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e3638bfc-7948-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_update_changed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '51e4634c-304c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_delete_changed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e1638bfc-7948-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_delete_missing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e2638bfc-7948-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_truncate';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'e4638bfc-7948-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'source_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'e5638bfc-7948-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'target_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'c9638bfc-7948-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'extra table is required to allow FK with
ON UPDATE CASCADE
ON DELETE CASCADE', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence';

