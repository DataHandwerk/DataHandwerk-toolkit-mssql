CREATE TABLE [repo].[RepoObject__sql_modules] (
    [RepoObject_guid]          UNIQUEIDENTIFIER NOT NULL,
    [sql_modules_dt]           DATETIME         CONSTRAINT [DF_RepoObject__sql_modules_sql_modules_dt] DEFAULT (getdate()) NOT NULL,
    [sql_modules_formatted]    NVARCHAR (MAX)   NULL,
    [sql_modules_formatted2]   NVARCHAR (MAX)   NULL,
    [sql_modules_json]         NVARCHAR (MAX)   NULL,
    [is_json_sql_modules_json] AS               (isjson([sql_modules_json])) PERSISTED,
    CONSTRAINT [PK_RepoObject__sql_modules] PRIMARY KEY CLUSTERED ([RepoObject_guid] ASC),
    CONSTRAINT [FK_RepoObject__sql_modules__RepoObject] FOREIGN KEY ([RepoObject_guid]) REFERENCES [repo].[RepoObject] ([RepoObject_guid]) ON DELETE CASCADE ON UPDATE CASCADE
);

