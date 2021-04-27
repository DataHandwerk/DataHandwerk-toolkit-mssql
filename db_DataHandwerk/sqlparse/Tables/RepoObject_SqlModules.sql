CREATE TABLE [sqlparse].[RepoObject_SqlModules] (
    [RepoObject_guid]          UNIQUEIDENTIFIER NOT NULL,
    [sql_modules_dt]           DATETIME         CONSTRAINT [DF__RepoObjec__sql_m__19AACF41] DEFAULT (getdate()) NOT NULL,
    [sql_modules_formatted]    NVARCHAR (MAX)   NULL,
    [sql_modules_formatted2]   NVARCHAR (MAX)   NULL,
    [sql_modules_json]         NVARCHAR (MAX)   NULL,
    [is_json_sql_modules_json] AS               (isjson([sql_modules_json])) PERSISTED,
    CONSTRAINT [PK_RepoObject_SqlModules] PRIMARY KEY CLUSTERED ([RepoObject_guid] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_RepoObject_SqlModules__RepoObject1] FOREIGN KEY ([RepoObject_guid]) REFERENCES [repo].[RepoObject] ([RepoObject_guid]) ON DELETE CASCADE ON UPDATE CASCADE
);








GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '2a90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObject_SqlModules';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0c90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObject_SqlModules__RepoObject1';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '2890291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '6acbc49c-3862-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules', @level2type = N'CONSTRAINT', @level2name = N'DF__RepoObjec__sql_m__19AACF41';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '26f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules', @level2type = N'COLUMN', @level2name = N'sql_modules_json';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '25f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules', @level2type = N'COLUMN', @level2name = N'sql_modules_formatted2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '24f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules', @level2type = N'COLUMN', @level2name = N'sql_modules_formatted';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '23f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules', @level2type = N'COLUMN', @level2name = N'sql_modules_dt';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '22f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '27f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules', @level2type = N'COLUMN', @level2name = N'is_json_sql_modules_json';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject_SqlModules].[sql_modules_json]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules', @level2type = N'COLUMN', @level2name = N'is_json_sql_modules_json';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(isjson([sql_modules_json]))', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules', @level2type = N'COLUMN', @level2name = N'is_json_sql_modules_json';

