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



GO



GO



GO


