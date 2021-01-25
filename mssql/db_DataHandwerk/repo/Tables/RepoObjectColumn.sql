CREATE TABLE [repo].[RepoObjectColumn] (
    [RepoObjectColumn_guid]                     UNIQUEIDENTIFIER CONSTRAINT [DF_RepoObjectColumn_RepoObjectColumn_guid] DEFAULT (newsequentialid()) NOT NULL,
    [is_persistence_no_check]                   BIT              NULL,
    [is_persistence_no_update]                  BIT              NULL,
    [is_query_plan_expression]                  BIT              NULL,
    [is_SysObjectColumn_missing]                BIT              NULL,
    [persistence_source_RepoObjectColumn_guid]  UNIQUEIDENTIFIER NULL,
    [Referencing_Count]                         INT              NULL,
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
    [RepoObjectColumn_column_id]                INT              NULL,
    [RepoObjectColumn_name]                     NVARCHAR (128)   CONSTRAINT [DF_RepoObjectColumn_RepoObjectColumn_name] DEFAULT (newid()) NOT NULL,
    [RepoObject_guid]                           UNIQUEIDENTIFIER NOT NULL,
    [SysObjectColumn_column_id]                 INT              NULL,
    [SysObjectColumn_name]                      NVARCHAR (128)   CONSTRAINT [DF_RepoObjectColumn_SysObjectColumn_name] DEFAULT (newid()) NOT NULL,
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
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of the column. Is unique within the object.
if it not exists in the database, the RepoObject_guid or any other guid is used, because this column should not be empty', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'SysObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of the column. Is unique within the object.
Column IDs might not be sequential.', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'SysObjectColumn_column_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of the column. Is unique within the object.', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'https://docs.microsoft.com/en-us/sql/relational-databases/graphs/sql-graph-architecture

The sys.columns view contains additional columns graph_type and graph_type_desc, that indicate the type of the column in node and edge tables.

graph_type
int
Internal column with a set of values. The values are between 1-8 for graph columns and NULL for others.

graph_type_desc
nvarchar(60)
internal column with a set of values

Column Value	Description
1	GRAPH_ID
2	GRAPH_ID_COMPUTED
3	GRAPH_FROM_ID
4	GRAPH_FROM_OBJ_ID
5	GRAPH_FROM_ID_COMPUTED
6	GRAPH_TO_ID
7	GRAPH_TO_OBJ_ID
8	GRAPH_TO_ID_COMPUTED', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'Repo_graph_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Applies to: SQL Server 2016 (13.x) and later, SQL Database.
Identifies when the column value is generated (will always be 0 for columns in system tables):
0 = NOT_APPLICABLE
1 = AS_ROW_START
2 = AS_ROW_END
For more information, see Temporal Tables (Relational databases).', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'Repo_generated_always_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of the column. Is unique within the object.
Column IDs might not be sequential.', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_column_id';

