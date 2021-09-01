CREATE TABLE [ssas].[model_json_31_tables_T] (
    [databasename]          NVARCHAR (128)   NOT NULL,
    [tables_name]           NVARCHAR (128)   NOT NULL,
    [tables_annotations_ja] NVARCHAR (MAX)   NULL,
    [tables_columns_ja]     NVARCHAR (MAX)   NULL,
    [tables_dataCategory]   NVARCHAR (500)   NULL,
    [tables_description]    NVARCHAR (MAX)   NULL,
    [tables_description_ja] NVARCHAR (MAX)   NULL,
    [tables_hierarchies_ja] NVARCHAR (MAX)   NULL,
    [tables_isHidden]       NVARCHAR (500)   NULL,
    [tables_measures_ja]    NVARCHAR (MAX)   NULL,
    [tables_partitions_ja]  NVARCHAR (MAX)   NULL,
    [RepoObject_guid]       UNIQUEIDENTIFIER CONSTRAINT [DF_model_json_31_tables_T_RepoObject_guid] DEFAULT (newsequentialid()) NOT NULL,
    CONSTRAINT [PK_model_json_31_tables_T] PRIMARY KEY CLUSTERED ([databasename] ASC, [tables_name] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '606ec1cc-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T', @level2type = N'CONSTRAINT', @level2name = N'DF_model_json_31_tables_T_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '666ec1cc-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T', @level2type = N'CONSTRAINT', @level2name = N'PK_model_json_31_tables_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '741fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '731fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T', @level2type = N'COLUMN', @level2name = N'tables_partitions_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '721fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T', @level2type = N'COLUMN', @level2name = N'tables_measures_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '711fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T', @level2type = N'COLUMN', @level2name = N'tables_isHidden';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '701fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T', @level2type = N'COLUMN', @level2name = N'tables_hierarchies_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6f1fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T', @level2type = N'COLUMN', @level2name = N'tables_description_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6e1fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T', @level2type = N'COLUMN', @level2name = N'tables_description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6d1fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T', @level2type = N'COLUMN', @level2name = N'tables_dataCategory';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6c1fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T', @level2type = N'COLUMN', @level2name = N'tables_columns_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6b1fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T', @level2type = N'COLUMN', @level2name = N'tables_annotations_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6a1fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T', @level2type = N'COLUMN', @level2name = N'tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '691fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5f6ec1cc-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T';

