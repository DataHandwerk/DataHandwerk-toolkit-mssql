CREATE TABLE [ssas].[model_json_32_relationships_T] (
    [databasename]                         NVARCHAR (128)   NOT NULL,
    [relationships_name]                   NVARCHAR (500)   NULL,
    [relationships_crossFilteringBehavior] NVARCHAR (500)   NULL,
    [relationships_fromCardinality]        NVARCHAR (500)   NULL,
    [relationships_fromColumn]             NVARCHAR (500)   NULL,
    [relationships_fromTable]              NVARCHAR (500)   NULL,
    [relationships_isActive]               BIT              NULL,
    [relationships_toCardinality]          NVARCHAR (500)   NULL,
    [relationships_toColumn]               NVARCHAR (500)   NULL,
    [relationships_toTable]                NVARCHAR (500)   NULL,
    [ForeignKey_guid]                      UNIQUEIDENTIFIER CONSTRAINT [DF_model_json_32_relationships_T_ForeignKey_guid] DEFAULT (newsequentialid()) NOT NULL,
    CONSTRAINT [PK_model_json_32_relationships_T] PRIMARY KEY CLUSTERED ([ForeignKey_guid] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '626ec1cc-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T', @level2type = N'CONSTRAINT', @level2name = N'DF_model_json_32_relationships_T_ForeignKey_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '686ec1cc-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T', @level2type = N'CONSTRAINT', @level2name = N'PK_model_json_32_relationships_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '971fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T', @level2type = N'COLUMN', @level2name = N'ForeignKey_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '961fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T', @level2type = N'COLUMN', @level2name = N'relationships_toTable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '951fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T', @level2type = N'COLUMN', @level2name = N'relationships_toColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '941fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T', @level2type = N'COLUMN', @level2name = N'relationships_toCardinality';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '931fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T', @level2type = N'COLUMN', @level2name = N'relationships_isActive';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '921fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T', @level2type = N'COLUMN', @level2name = N'relationships_fromTable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '911fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T', @level2type = N'COLUMN', @level2name = N'relationships_fromColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '901fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T', @level2type = N'COLUMN', @level2name = N'relationships_fromCardinality';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8f1fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T', @level2type = N'COLUMN', @level2name = N'relationships_crossFilteringBehavior';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8e1fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T', @level2type = N'COLUMN', @level2name = N'relationships_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8d1fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '656ec1cc-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T';

