﻿CREATE TABLE [repo].[RepoObject_persistence] (
    [target_RepoObject_guid]                UNIQUEIDENTIFIER NOT NULL,
    [has_history]                           BIT              CONSTRAINT [DF__RepoObjec__has_h__29AC2CE0] DEFAULT ((0)) NOT NULL,
    [has_history_columns]                   BIT              CONSTRAINT [DF__RepoObjec__has_h__2AA05119] DEFAULT ((0)) NOT NULL,
    [history_schema_name]                   NVARCHAR (128)   NULL,
    [history_table_name]                    NVARCHAR (128)   NULL,
    [is_persistence_check_for_empty_source] BIT              CONSTRAINT [DF__RepoObjec__is_hi__2B947552] DEFAULT ((1)) NOT NULL,
    [is_persistence_delete_changed]         BIT              CONSTRAINT [DF__RepoObjec__is_pe__2C88998B] DEFAULT ((0)) NOT NULL,
    [is_persistence_delete_missing]         BIT              CONSTRAINT [DF__RepoObjec__is_pe__2D7CBDC4] DEFAULT ((0)) NOT NULL,
    [is_persistence_insert]                 BIT              CONSTRAINT [DF__RepoObjec__is_pe__2E70E1FD] DEFAULT ((1)) NOT NULL,
    [is_persistence_truncate]               BIT              CONSTRAINT [DF__RepoObjec__is_pe__2F650636] DEFAULT ((1)) NOT NULL,
    [is_persistence_update_changed]         BIT              CONSTRAINT [DF__RepoObjec__is_pe__30592A6F] DEFAULT ((0)) NOT NULL,
    [source_RepoObject_guid]                UNIQUEIDENTIFIER NULL,
    [is_persistence]                        AS               (CONVERT([bit],(1))),
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

