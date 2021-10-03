CREATE TABLE [ssas].[RepoObjectColumn_translation_T] (
    [RepoObjectColumn_guid]                           UNIQUEIDENTIFIER NOT NULL,
    [cultures_name]                                   NVARCHAR (10)    NOT NULL,
    [Column_name]                                     NVARCHAR (128)   NOT NULL,
    [RepoObjectColumn_translation]                    NVARCHAR (128)   NULL,
    [RepoObjectColumn_DisplayName]                    NVARCHAR (128)   NULL,
    [databasename]                                    NVARCHAR (128)   NULL,
    [tables_name]                                     NVARCHAR (128)   NULL,
    [tables_columns_name]                             NVARCHAR (128)   NULL,
    [cultures_translations_model_name]                NVARCHAR (500)   NULL,
    [cultures_translations_model_tables_name]         NVARCHAR (128)   NULL,
    [cultures_translations_model_tables_columns_name] NVARCHAR (128)   NULL,
    CONSTRAINT [PK_RepoObjectColumn_translation_T] PRIMARY KEY CLUSTERED ([RepoObjectColumn_guid] ASC, [cultures_name] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '1d8b3c65-6124-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_translation_T', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObjectColumn_translation_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '74ab2b6f-6124-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_translation_T', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_tables_columns_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '73ab2b6f-6124-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_translation_T', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '72ab2b6f-6124-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_translation_T', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '71ab2b6f-6124-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_translation_T', @level2type = N'COLUMN', @level2name = N'tables_columns_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '70ab2b6f-6124-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_translation_T', @level2type = N'COLUMN', @level2name = N'tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6fab2b6f-6124-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_translation_T', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6eab2b6f-6124-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_translation_T', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_DisplayName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6dab2b6f-6124-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_translation_T', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_translation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6cab2b6f-6124-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_translation_T', @level2type = N'COLUMN', @level2name = N'Column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6bab2b6f-6124-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_translation_T', @level2type = N'COLUMN', @level2name = N'cultures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6aab2b6f-6124-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_translation_T', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '1e8b3c65-6124-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_translation_T';

