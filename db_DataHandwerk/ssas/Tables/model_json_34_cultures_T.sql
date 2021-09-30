CREATE TABLE [ssas].[model_json_34_cultures_T] (
    [databasename]            NVARCHAR (128) NOT NULL,
    [cultures_name]           NVARCHAR (10)  NOT NULL,
    [cultures_translations_j] NVARCHAR (MAX) NULL,
    [is_CultureDocsOutput]    BIT            CONSTRAINT [DF_model_json_34_cultures_T_is_CultureDocsOutput] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_model_json_34_cultures_T] PRIMARY KEY CLUSTERED ([databasename] ASC, [cultures_name] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'd24e94f4-0222-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_34_cultures_T', @level2type = N'CONSTRAINT', @level2name = N'DF_model_json_34_cultures_T_is_CultureDocsOutput';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a7a507d5-0622-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_34_cultures_T', @level2type = N'CONSTRAINT', @level2name = N'PK_model_json_34_cultures_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5c2157fe-0222-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_34_cultures_T', @level2type = N'COLUMN', @level2name = N'is_CultureDocsOutput';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e6dcf21e-0222-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_34_cultures_T', @level2type = N'COLUMN', @level2name = N'cultures_translations_j';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e4dcf21e-0222-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_34_cultures_T', @level2type = N'COLUMN', @level2name = N'cultures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e5dcf21e-0222-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_34_cultures_T', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '843efd10-0222-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_34_cultures_T';

