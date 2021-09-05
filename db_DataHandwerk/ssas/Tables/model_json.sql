CREATE TABLE [ssas].[model_json] (
    [databasename]   NVARCHAR (128)  CONSTRAINT [DF_model_json_databasename] DEFAULT (N'mydatabase') NOT NULL,
    [model_filename] NVARCHAR (4000) CONSTRAINT [DF_model_json_model_filename] DEFAULT ('') NOT NULL,
    [model_utf8]     VARCHAR (MAX)   COLLATE Latin1_General_100_CI_AS_SC_UTF8 NULL,
    [isModelJson]    AS              (isjson([model_utf8])) PERSISTED,
    CONSTRAINT [PK_model_json] PRIMARY KEY CLUSTERED ([databasename] ASC) WITH (DATA_COMPRESSION = PAGE)
);




GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ea5fd8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json', @level2type = N'CONSTRAINT', @level2name = N'DF_model_json_model_filename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'e95fd8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json', @level2type = N'CONSTRAINT', @level2name = N'DF_model_json_databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0860d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json', @level2type = N'CONSTRAINT', @level2name = N'PK_model_json';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2160d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json', @level2type = N'COLUMN', @level2name = N'isModelJson';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2b064fc7-110b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json', @level2type = N'COLUMN', @level2name = N'model_utf8';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1f60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json', @level2type = N'COLUMN', @level2name = N'model_filename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1e60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ee5fd8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json', @level2type = N'CONSTRAINT', @level2name = N'PK_model_json';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json', @level2type = N'CONSTRAINT', @level2name = N'PK_model_json';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json', @level2type = N'CONSTRAINT', @level2name = N'DF_model_json_model_filename';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json', @level2type = N'CONSTRAINT', @level2name = N'DF_model_json_model_filename';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json', @level2type = N'CONSTRAINT', @level2name = N'DF_model_json_databasename';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json', @level2type = N'CONSTRAINT', @level2name = N'DF_model_json_databasename';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'databasename', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'nvarchar(128)', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'0860D8EE-E90A-EC11-8516-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:ssas.model_json_10.adoc[]
* xref:ssas.model_json_ImportModelSql.adoc[]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json].[model_utf8]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json', @level2type = N'COLUMN', @level2name = N'isModelJson';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(isjson([model_json]))', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json', @level2type = N'COLUMN', @level2name = N'isModelJson';

