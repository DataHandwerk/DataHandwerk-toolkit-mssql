CREATE TABLE [repo].[RepoObjectSource__first_result_set] (
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
    CONSTRAINT [PK_RepoObjectSource] PRIMARY KEY CLUSTERED ([RepoObject_guid] ASC, [column_ordinal] ASC),
    CONSTRAINT [FK_RepoObjectSource_RepoObject] FOREIGN KEY ([RepoObject_guid]) REFERENCES [repo].[RepoObject] ([RepoObject_guid]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = N'9a1cb308-944b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectSource__first_result_set', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObjectSource_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = N'9b1cb308-944b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectSource__first_result_set', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObjectSource';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'e127abe2-c74d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectSource__first_result_set', @level2type = N'COLUMN', @level2name = N'is_hidden';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'ea1cb308-944b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectSource__first_result_set', @level2type = N'COLUMN', @level2name = N'created_dt';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'f21cb308-944b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectSource__first_result_set', @level2type = N'COLUMN', @level2name = N'system_type_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'f11cb308-944b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectSource__first_result_set', @level2type = N'COLUMN', @level2name = N'system_type_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'ec1cb308-944b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectSource__first_result_set', @level2type = N'COLUMN', @level2name = N'source_column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'f01cb308-944b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectSource__first_result_set', @level2type = N'COLUMN', @level2name = N'source_table_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'ee1cb308-944b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectSource__first_result_set', @level2type = N'COLUMN', @level2name = N'source_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'ed1cb308-944b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectSource__first_result_set', @level2type = N'COLUMN', @level2name = N'source_database_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'ef1cb308-944b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectSource__first_result_set', @level2type = N'COLUMN', @level2name = N'source_server_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'f31cb308-944b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectSource__first_result_set', @level2type = N'COLUMN', @level2name = N'target_column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'e91cb308-944b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectSource__first_result_set', @level2type = N'COLUMN', @level2name = N'column_ordinal';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'eb1cb308-944b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectSource__first_result_set', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = N'9e1cb308-944b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectSource__first_result_set';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'references on column level
target: repo.RepoObjectSource
source: sys.dm_exec_describe_first_result_set', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectSource__first_result_set';

