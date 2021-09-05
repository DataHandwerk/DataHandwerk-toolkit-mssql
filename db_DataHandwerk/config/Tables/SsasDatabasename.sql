CREATE TABLE [config].[SsasDatabasename] (
    [databasename]    NVARCHAR (128) CONSTRAINT [DF_databasename_databasename] DEFAULT (N'mydatabase') NOT NULL,
    [LinkedServer]    NVARCHAR (128) CONSTRAINT [DF_databasename_LinkedServer] DEFAULT ('') NOT NULL,
    [isActive]        BIT            CONSTRAINT [DF_databasename_isActive] DEFAULT ((1)) NOT NULL,
    [isCurrentImport] BIT            CONSTRAINT [DF_databasename_isCurrentImport] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_SsasDatabasename] PRIMARY KEY CLUSTERED ([databasename] ASC)
);




GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'd8e6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'SsasDatabasename', @level2type = N'CONSTRAINT', @level2name = N'DF_databasename_isCurrentImport';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'd7e6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'SsasDatabasename', @level2type = N'CONSTRAINT', @level2name = N'DF_databasename_isActive';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'd6e6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'SsasDatabasename', @level2type = N'CONSTRAINT', @level2name = N'DF_databasename_LinkedServer';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'd5e6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'SsasDatabasename', @level2type = N'CONSTRAINT', @level2name = N'DF_databasename_databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'd9e6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'SsasDatabasename', @level2type = N'CONSTRAINT', @level2name = N'PK_SsasDatabasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '19c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'SsasDatabasename', @level2type = N'COLUMN', @level2name = N'isCurrentImport';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '18c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'SsasDatabasename', @level2type = N'COLUMN', @level2name = N'isActive';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '17c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'SsasDatabasename', @level2type = N'COLUMN', @level2name = N'LinkedServer';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '16c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'SsasDatabasename', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'd4e6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'SsasDatabasename';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'SsasDatabasename', @level2type = N'CONSTRAINT', @level2name = N'PK_SsasDatabasename';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'SsasDatabasename', @level2type = N'CONSTRAINT', @level2name = N'PK_SsasDatabasename';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'SsasDatabasename', @level2type = N'CONSTRAINT', @level2name = N'DF_databasename_LinkedServer';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'SsasDatabasename', @level2type = N'CONSTRAINT', @level2name = N'DF_databasename_LinkedServer';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'SsasDatabasename', @level2type = N'CONSTRAINT', @level2name = N'DF_databasename_isCurrentImport';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'SsasDatabasename', @level2type = N'CONSTRAINT', @level2name = N'DF_databasename_isCurrentImport';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'SsasDatabasename', @level2type = N'CONSTRAINT', @level2name = N'DF_databasename_isActive';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'SsasDatabasename', @level2type = N'CONSTRAINT', @level2name = N'DF_databasename_isActive';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'SsasDatabasename', @level2type = N'CONSTRAINT', @level2name = N'DF_databasename_databasename';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'SsasDatabasename', @level2type = N'CONSTRAINT', @level2name = N'DF_databasename_databasename';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'databasename', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'SsasDatabasename';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'nvarchar(128)', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'SsasDatabasename';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'D9E6A70A-8A06-EC11-8515-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'SsasDatabasename';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'SsasDatabasename';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'SsasDatabasename';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:configT.SsasDmvTableImport_ImportSql.adoc[]', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'SsasDatabasename';

