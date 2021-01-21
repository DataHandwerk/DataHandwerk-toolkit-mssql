CREATE TABLE [repo].[RepoObjectColumn] (
    [RepoObjectColumn_guid]                     UNIQUEIDENTIFIER CONSTRAINT [DF_RepoObjectColumn_RepoObjectColumn_guid] DEFAULT (newsequentialid()) NOT NULL,
    [RepoObject_guid]                           UNIQUEIDENTIFIER NOT NULL,
    [RepoObjectColumn_name]                     NVARCHAR (128)   CONSTRAINT [DF_RepoObjectColumn_RepoObjectColumn_name] DEFAULT (newid()) NOT NULL,
    [SysObjectColumn_name]                      NVARCHAR (128)   CONSTRAINT [DF_RepoObjectColumn_SysObjectColumn_name] DEFAULT (newid()) NOT NULL,
    [SysObjectColumn_column_id]                 INT              NULL,
    [Repo_default_definition]                   NVARCHAR (MAX)   NULL,
    [Repo_default_is_system_named]              BIT              NULL,
    [Repo_default_name]                         NVARCHAR (128)   NULL,
    [Repo_definition]                           NVARCHAR (MAX)   NULL,
    [Repo_generated_always_type]                TINYINT          NULL,
    [Repo_graph_type]                           INT              NULL,
    [Repo_is_computed]                          BIT              NULL,
    [Repo_is_identity]                          BIT              NULL,
    [Repo_is_nullable]                          BIT              NULL,
    [Repo_is_persisted]                         BIT              NULL,
    [Repo_seed_value]                           SQL_VARIANT      NULL,
    [Repo_increment_value]                      SQL_VARIANT      NULL,
    [Repo_user_type_name]                       NVARCHAR (128)   NULL,
    [Repo_user_type_fullname]                   NVARCHAR (128)   NULL,
    [Repo_uses_database_collation]              BIT              NULL,
    [is_SysObjectColumn_missing]                BIT              NULL,
    [persistence_source_RepoObjectColumn_guid]  UNIQUEIDENTIFIER NULL,
    [Referencing_Count]                         INT              NULL,
    [is_query_plan_expression]                  BIT              NULL,
    [has_different_sys_names]                   AS               (CONVERT([bit],case when [RepoObjectColumn_name]<>[SysObjectColumn_name] then (1) else (0) end)),
    [is_RepoObjectColumn_name_uniqueidentifier] AS               (case when TRY_CAST([RepoObjectColumn_name] AS [uniqueidentifier]) IS NULL then (0) else (1) end),
    [is_SysObjectColumn_name_uniqueidentifier]  AS               (case when TRY_CAST([SysObjectColumn_name] AS [uniqueidentifier]) IS NULL then (0) else (1) end),
    CONSTRAINT [PK_RepoObjectColumn] PRIMARY KEY CLUSTERED ([RepoObjectColumn_guid] ASC),
    CONSTRAINT [FK_RepoObjectColumn_RepoObject] FOREIGN KEY ([RepoObject_guid]) REFERENCES [repo].[RepoObject] ([RepoObject_guid]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [UK_RepoObjectColumn__RepoNames] UNIQUE NONCLUSTERED ([RepoObject_guid] ASC, [RepoObjectColumn_name] ASC),
    CONSTRAINT [UK_RepoObjectColumn__SysNames] UNIQUE NONCLUSTERED ([RepoObjectColumn_guid] ASC, [SysObjectColumn_name] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'fe9808a2-534d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObjectColumn_SysObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'fd9808a2-534d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObjectColumn_RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ea968530-e846-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObjectColumn_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'd7938381-4f47-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObjectColumn_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '95d1e122-cb4c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'UK_RepoObjectColumn__SysNames';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '94d1e122-cb4c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'UK_RepoObjectColumn__RepoNames';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'e8968530-e846-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '30ea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'is_SysObjectColumn_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2eea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'is_RepoObjectColumn_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'40c30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'has_different_sys_names';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'50164adb-524d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'is_query_plan_expression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6fe4634c-304c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'Referencing_Count';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f6638bfc-7948-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'persistence_source_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2fea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'is_SysObjectColumn_missing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '78771e59-d051-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'Repo_uses_database_collation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '62bc3bb1-a451-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'Repo_user_type_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '61bc3bb1-a451-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'Repo_user_type_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '74771e59-d051-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'Repo_is_persisted';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a9a4188b-0352-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'Repo_is_nullable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '70771e59-d051-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'Repo_graph_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6d771e59-d051-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'Repo_definition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '64771e59-d051-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'Repo_default_is_system_named';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6b771e59-d051-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'Repo_default_definition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0a29ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'SysObjectColumn_column_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0b29ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'SysObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0929ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0729ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0829ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'e7968530-e846-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn';

