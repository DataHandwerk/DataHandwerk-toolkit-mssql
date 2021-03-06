﻿CREATE TABLE [repo].[RepoSchema] (
    [RepoSchema_guid]                     UNIQUEIDENTIFIER CONSTRAINT [DF_RepoSchema_RepoSchema_guid] DEFAULT (newsequentialid()) NOT NULL,
    [has_different_sys_names]             AS               (CONVERT([bit],case when [RepoSchema_name]<>[SysSchema_name] then (1) else (0) end)),
    [is_SysSchema_missing]                BIT              NULL,
    [RepoSchema_ms_description]           NVARCHAR (4000)  NULL,
    [RepoSchema_name]                     NVARCHAR (128)   CONSTRAINT [DF_RepoSchema_RepoSchema_name] DEFAULT (newid()) NOT NULL,
    [SysSchema_id]                        INT              NULL,
    [SysSchema_name]                      NVARCHAR (128)   CONSTRAINT [DF_RepoSchema_SysSchema_name] DEFAULT (newid()) NOT NULL,
    [is_RepoSchema_name_uniqueidentifier] AS               (case when TRY_CAST([RepoSchema_name] AS [uniqueidentifier]) IS NULL then (0) else (1) end) PERSISTED NOT NULL,
    [is_SysSchema_name_uniqueidentifier]  AS               (case when TRY_CAST([SysSchema_name] AS [uniqueidentifier]) IS NULL then (0) else (1) end) PERSISTED NOT NULL,
    CONSTRAINT [PK_RepoSchema] PRIMARY KEY CLUSTERED ([RepoSchema_guid] ASC),
    CONSTRAINT [UK_RepoSchema] UNIQUE NONCLUSTERED ([RepoSchema_name] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ae0747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoSchema', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoSchema_SysSchema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ad0747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoSchema', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoSchema_RepoSchema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ac0747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoSchema', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoSchema_RepoSchema_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ab0747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoSchema', @level2type = N'CONSTRAINT', @level2name = N'UK_RepoSchema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'aa0747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoSchema', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoSchema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bf0747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoSchema', @level2type = N'COLUMN', @level2name = N'is_SysSchema_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'be0747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoSchema', @level2type = N'COLUMN', @level2name = N'is_RepoSchema_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bd0747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoSchema', @level2type = N'COLUMN', @level2name = N'SysSchema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bc0747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoSchema', @level2type = N'COLUMN', @level2name = N'SysSchema_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bb0747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoSchema', @level2type = N'COLUMN', @level2name = N'RepoSchema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ba0747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoSchema', @level2type = N'COLUMN', @level2name = N'RepoSchema_ms_description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b90747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoSchema', @level2type = N'COLUMN', @level2name = N'is_SysSchema_missing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b80747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoSchema', @level2type = N'COLUMN', @level2name = N'has_different_sys_names';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b70747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoSchema', @level2type = N'COLUMN', @level2name = N'RepoSchema_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a90747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoSchema';

