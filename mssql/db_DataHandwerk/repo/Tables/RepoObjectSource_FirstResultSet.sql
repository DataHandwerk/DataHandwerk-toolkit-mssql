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

