CREATE TABLE [ssas].[model_json_3411_cultures_translations_model_T] (
    [databasename]                                      NVARCHAR (128) NOT NULL,
    [cultures_name]                                     NVARCHAR (10)  NOT NULL,
    [cultures_translations_model_name]                  NVARCHAR (500) NOT NULL,
    [cultures_translations_model_perspectives_ja]       NVARCHAR (MAX) NULL,
    [cultures_translations_model_tables_ja]             NVARCHAR (MAX) NULL,
    [cultures_translations_model_translatedDescription] NVARCHAR (MAX) NULL,
    [is_CultureDocsOutput]                              BIT            CONSTRAINT [DF_model_json_3411_cultures_translations_model_T_is_CultureDocsOutput] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_model_json_3411_cultures_translations_model_T] PRIMARY KEY CLUSTERED ([databasename] ASC, [cultures_name] ASC)
);




GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ce8f586e-7b22-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_3411_cultures_translations_model_T', @level2type = N'CONSTRAINT', @level2name = N'DF_model_json_3411_cultures_translations_model_T_is_CultureDocsOutput';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'd08f586e-7b22-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_3411_cultures_translations_model_T', @level2type = N'CONSTRAINT', @level2name = N'PK_model_json_3411_cultures_translations_model_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '38415ec3-7a22-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_3411_cultures_translations_model_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2e31147a-7b22-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_3411_cultures_translations_model_T', @level2type = N'COLUMN', @level2name = N'is_CultureDocsOutput';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '88e7a6ce-7a22-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_3411_cultures_translations_model_T', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '83e7a6ce-7a22-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_3411_cultures_translations_model_T', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_translatedDescription';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '85e7a6ce-7a22-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_3411_cultures_translations_model_T', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_tables_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '84e7a6ce-7a22-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_3411_cultures_translations_model_T', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_perspectives_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '86e7a6ce-7a22-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_3411_cultures_translations_model_T', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '87e7a6ce-7a22-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_3411_cultures_translations_model_T', @level2type = N'COLUMN', @level2name = N'cultures_name';

