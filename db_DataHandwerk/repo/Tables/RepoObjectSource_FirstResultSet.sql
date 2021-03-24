CREATE TABLE [repo].[RepoObjectSource_FirstResultSet] (
    [RepoObject_guid]      UNIQUEIDENTIFIER NOT NULL,
    [column_ordinal]       INT              NOT NULL,
    [target_column_name]   NVARCHAR (128)   NULL,
    [source_server_name]   NVARCHAR (128)   NULL,
    [source_database_name] NVARCHAR (128)   NULL,
    [source_schema_name]   NVARCHAR (128)   NULL,
    [source_table_name]    NVARCHAR (128)   NULL,
    [source_column_name]   NVARCHAR (128)   NULL,
    [system_type_id]       INT              NULL,
    [system_type_name]     NVARCHAR (128)   NULL,
    [created_dt]           DATETIME         NOT NULL,
    [is_hidden]            BIT              NULL,
    CONSTRAINT [PK_RepoObjectSource_FirstResultSet] PRIMARY KEY CLUSTERED ([RepoObject_guid] ASC, [column_ordinal] ASC),
    CONSTRAINT [FK_RepoObjectSource_FirstResultSet__RepoObject] FOREIGN KEY ([RepoObject_guid]) REFERENCES [repo].[RepoObject] ([RepoObject_guid]) ON DELETE CASCADE ON UPDATE CASCADE
);




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'references on column level
target: repo.RepoObjectSource
source: sys.dm_exec_describe_first_result_set', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '2e90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObjectSource_FirstResultSet';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0d90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObjectSource_FirstResultSet__RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '2c90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3bf37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet', @level2type = N'COLUMN', @level2name = N'target_column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '42f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet', @level2type = N'COLUMN', @level2name = N'system_type_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '41f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet', @level2type = N'COLUMN', @level2name = N'system_type_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3ff37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet', @level2type = N'COLUMN', @level2name = N'source_table_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3cf37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet', @level2type = N'COLUMN', @level2name = N'source_server_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3ef37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet', @level2type = N'COLUMN', @level2name = N'source_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3df37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet', @level2type = N'COLUMN', @level2name = N'source_database_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '40f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet', @level2type = N'COLUMN', @level2name = N'source_column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '39f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '44f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet', @level2type = N'COLUMN', @level2name = N'is_hidden';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '43f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet', @level2type = N'COLUMN', @level2name = N'created_dt';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3af37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet', @level2type = N'COLUMN', @level2name = N'column_ordinal';

