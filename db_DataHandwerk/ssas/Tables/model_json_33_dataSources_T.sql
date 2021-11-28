CREATE TABLE [ssas].[model_json_33_dataSources_T] (
    [databasename]                  NVARCHAR (128)  NOT NULL,
    [dataSources_name]              NVARCHAR (500)  NOT NULL,
    [dataSources_account]           NVARCHAR (500)  NULL,
    [dataSources_annotations_ja]    NVARCHAR (MAX)  NULL,
    [dataSources_connectionString]  NVARCHAR (4000) NULL,
    [dataSources_impersonationMode] NVARCHAR (500)  NULL,
    [dataSources_provider]          NVARCHAR (500)  NULL,
    [referenced_AntoraComponent]    NVARCHAR (128)  NULL,
    [referenced_AntoraModule]       NVARCHAR (128)  NULL
)
WITH (DATA_COMPRESSION = PAGE);




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd396c746-7c20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_33_dataSources_T', @level2type = N'COLUMN', @level2name = N'referenced_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd296c746-7c20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_33_dataSources_T', @level2type = N'COLUMN', @level2name = N'referenced_AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f786717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_33_dataSources_T', @level2type = N'COLUMN', @level2name = N'dataSources_provider';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fb86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_33_dataSources_T', @level2type = N'COLUMN', @level2name = N'dataSources_impersonationMode';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fd86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_33_dataSources_T', @level2type = N'COLUMN', @level2name = N'dataSources_connectionString';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f986717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_33_dataSources_T', @level2type = N'COLUMN', @level2name = N'dataSources_annotations_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fc86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_33_dataSources_T', @level2type = N'COLUMN', @level2name = N'dataSources_account';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f886717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_33_dataSources_T', @level2type = N'COLUMN', @level2name = N'dataSources_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fa86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_33_dataSources_T', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b008a66b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_33_dataSources_T';

