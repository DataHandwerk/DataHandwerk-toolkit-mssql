CREATE TABLE [repo].[RepoObject_SqlModules_61_SelectIdentifier_Union_T] (
    [alias_QuoteName]         NVARCHAR (MAX)   NULL,
    [class]                   NVARCHAR (500)   NULL,
    [normalized]              NVARCHAR (MAX)   NULL,
    [RepoObject_guid]         UNIQUEIDENTIFIER NOT NULL,
    [RowNumber_per_Object]    BIGINT           NULL,
    [source_column_QuoteName] NVARCHAR (MAX)   NULL,
    [source_table_QuoteName]  NVARCHAR (MAX)   NULL,
    [SysObject_fullname]      NVARCHAR (261)   NULL
);




GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '86efc212-b764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '99efc212-b764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '98efc212-b764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T', @level2type = N'COLUMN', @level2name = N'source_table_QuoteName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '97efc212-b764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T', @level2type = N'COLUMN', @level2name = N'source_column_QuoteName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '96efc212-b764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T', @level2type = N'COLUMN', @level2name = N'RowNumber_per_Object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '95efc212-b764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '94efc212-b764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T', @level2type = N'COLUMN', @level2name = N'normalized';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '93efc212-b764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T', @level2type = N'COLUMN', @level2name = N'class';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '92efc212-b764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T', @level2type = N'COLUMN', @level2name = N'alias_QuoteName';

