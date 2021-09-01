CREATE TABLE [ssas].[model_json_311_tables_columns_T] (
    [databasename]                      NVARCHAR (128)   NOT NULL,
    [tables_name]                       NVARCHAR (128)   NOT NULL,
    [tables_columns_name]               NVARCHAR (128)   NOT NULL,
    [tables_columns_dataType]           NVARCHAR (500)   NULL,
    [tables_columns_description]        NVARCHAR (MAX)   NULL,
    [tables_columns_description_ja]     NVARCHAR (MAX)   NULL,
    [tables_columns_displayFolder]      NVARCHAR (500)   NULL,
    [tables_columns_expression]         NVARCHAR (MAX)   NULL,
    [tables_columns_expression_ja]      NVARCHAR (MAX)   NULL,
    [tables_columns_formatString]       NVARCHAR (500)   NULL,
    [tables_columns_isDataTypeInferred] BIT              NULL,
    [tables_columns_isHidden]           BIT              NULL,
    [tables_columns_isKey]              BIT              NULL,
    [tables_columns_isNameInferred]     BIT              NULL,
    [tables_columns_isNullable]         BIT              NULL,
    [tables_columns_isUnique]           BIT              NULL,
    [tables_columns_keepUniqueRows]     BIT              NULL,
    [tables_columns_sortByColumn]       NVARCHAR (500)   NULL,
    [tables_columns_sourceColumn]       NVARCHAR (500)   NULL,
    [tables_columns_sourceProviderType] NVARCHAR (500)   NULL,
    [tables_columns_summarizeBy]        NVARCHAR (500)   NULL,
    [tables_columns_type]               NVARCHAR (500)   NULL,
    [RepoObject_guid]                   UNIQUEIDENTIFIER NOT NULL,
    [RepoObjectColumn_guid]             UNIQUEIDENTIFIER CONSTRAINT [DF_model_json_311_tables_columns_T_RepoObjectColumn_guid] DEFAULT (newsequentialid()) NOT NULL,
    CONSTRAINT [PK_model_json_311_tables_columns_T] PRIMARY KEY CLUSTERED ([databasename] ASC, [tables_name] ASC, [tables_columns_name] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '616ec1cc-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_311_tables_columns_T', @level2type = N'CONSTRAINT', @level2name = N'DF_model_json_311_tables_columns_T_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '676ec1cc-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_311_tables_columns_T', @level2type = N'CONSTRAINT', @level2name = N'PK_model_json_311_tables_columns_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8c1fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_311_tables_columns_T', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8b1fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_311_tables_columns_T', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8a1fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_311_tables_columns_T', @level2type = N'COLUMN', @level2name = N'tables_columns_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '891fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_311_tables_columns_T', @level2type = N'COLUMN', @level2name = N'tables_columns_summarizeBy';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '881fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_311_tables_columns_T', @level2type = N'COLUMN', @level2name = N'tables_columns_sourceProviderType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '871fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_311_tables_columns_T', @level2type = N'COLUMN', @level2name = N'tables_columns_sourceColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '861fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_311_tables_columns_T', @level2type = N'COLUMN', @level2name = N'tables_columns_sortByColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '851fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_311_tables_columns_T', @level2type = N'COLUMN', @level2name = N'tables_columns_keepUniqueRows';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '841fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_311_tables_columns_T', @level2type = N'COLUMN', @level2name = N'tables_columns_isUnique';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '831fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_311_tables_columns_T', @level2type = N'COLUMN', @level2name = N'tables_columns_isNullable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '821fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_311_tables_columns_T', @level2type = N'COLUMN', @level2name = N'tables_columns_isNameInferred';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '811fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_311_tables_columns_T', @level2type = N'COLUMN', @level2name = N'tables_columns_isKey';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '801fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_311_tables_columns_T', @level2type = N'COLUMN', @level2name = N'tables_columns_isHidden';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7f1fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_311_tables_columns_T', @level2type = N'COLUMN', @level2name = N'tables_columns_isDataTypeInferred';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7e1fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_311_tables_columns_T', @level2type = N'COLUMN', @level2name = N'tables_columns_formatString';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7d1fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_311_tables_columns_T', @level2type = N'COLUMN', @level2name = N'tables_columns_expression_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7c1fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_311_tables_columns_T', @level2type = N'COLUMN', @level2name = N'tables_columns_expression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7b1fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_311_tables_columns_T', @level2type = N'COLUMN', @level2name = N'tables_columns_displayFolder';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7a1fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_311_tables_columns_T', @level2type = N'COLUMN', @level2name = N'tables_columns_description_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '791fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_311_tables_columns_T', @level2type = N'COLUMN', @level2name = N'tables_columns_description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '781fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_311_tables_columns_T', @level2type = N'COLUMN', @level2name = N'tables_columns_dataType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '771fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_311_tables_columns_T', @level2type = N'COLUMN', @level2name = N'tables_columns_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '761fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_311_tables_columns_T', @level2type = N'COLUMN', @level2name = N'tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '751fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_311_tables_columns_T', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '646ec1cc-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_311_tables_columns_T';

