CREATE TABLE [ssas].[RepoObjectColumn_translation_T] (
    [RepoObjectColumn_guid]                           UNIQUEIDENTIFIER NOT NULL,
    [cultures_name]                                   NVARCHAR (10)    NOT NULL,
    [Column_name]                                     NVARCHAR (128)   NOT NULL,
    [RepoObject_schema_name]                          NVARCHAR (128)   CONSTRAINT [DF_RepoObjectColumn_translation_T_RepoObject_schema_name] DEFAULT ('') NOT NULL,
    [RepoObject_name]                                 NVARCHAR (128)   CONSTRAINT [DF_RepoObjectColumn_translation_T_RepoObject_name] DEFAULT ('') NOT NULL,
    [RepoObjectColumn_translation]                    NVARCHAR (128)   NULL,
    [RepoObjectColumn_DisplayName]                    NVARCHAR (128)   NULL,
    [databasename]                                    NVARCHAR (128)   NULL,
    [tables_name]                                     NVARCHAR (128)   NULL,
    [tables_columns_name]                             NVARCHAR (128)   NULL,
    [cultures_translations_model_name]                NVARCHAR (500)   NULL,
    [cultures_translations_model_tables_name]         NVARCHAR (128)   NULL,
    [cultures_translations_model_tables_columns_name] NVARCHAR (128)   NULL,
    [tables_columns_displayFolder]                    NVARCHAR (500)   NULL,
    [displayfolder_translation]                       NVARCHAR (512)   NULL,
    [displayfolder_DisplayName]                       NVARCHAR (512)   NULL,
    [pk_index_guid]                                   UNIQUEIDENTIFIER NULL,
    [tabcol_IsHidden]                                 TINYINT          NULL,
    CONSTRAINT [PK_RepoObjectColumn_translation_T] PRIMARY KEY NONCLUSTERED ([RepoObjectColumn_guid] ASC, [cultures_name] ASC)
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


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'dfc10221-5527-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_translation_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObjectColumn_translation_T_RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'dec10221-5527-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_translation_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObjectColumn_translation_T_RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '06a715de-5027-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_translation_T', @level2type = N'COLUMN', @level2name = N'tables_columns_displayFolder';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b0a84540-6d27-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_translation_T', @level2type = N'COLUMN', @level2name = N'tabcol_IsHidden';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3ff04c29-5527-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_translation_T', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '40f04c29-5527-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_translation_T', @level2type = N'COLUMN', @level2name = N'RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'afa84540-6d27-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_translation_T', @level2type = N'COLUMN', @level2name = N'pk_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '04a715de-5027-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_translation_T', @level2type = N'COLUMN', @level2name = N'displayfolder_translation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '05a715de-5027-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_translation_T', @level2type = N'COLUMN', @level2name = N'displayfolder_DisplayName';


GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_RepoObjectColumn_translation_T]
    ON [ssas].[RepoObjectColumn_translation_T];

