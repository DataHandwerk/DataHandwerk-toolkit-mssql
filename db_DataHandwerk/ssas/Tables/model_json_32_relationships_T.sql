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
    CONSTRAINT [PK_model_json_32_relationships_T] PRIMARY KEY CLUSTERED ([ForeignKey_guid] ASC) WITH (DATA_COMPRESSION = PAGE)
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


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T', @level2type = N'CONSTRAINT', @level2name = N'PK_model_json_32_relationships_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T', @level2type = N'CONSTRAINT', @level2name = N'PK_model_json_32_relationships_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T', @level2type = N'CONSTRAINT', @level2name = N'DF_model_json_32_relationships_T_ForeignKey_guid';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T', @level2type = N'CONSTRAINT', @level2name = N'DF_model_json_32_relationships_T_ForeignKey_guid';


GO
EXECUTE sp_addextendedproperty @name = N'usp_persistence_RepoObject_guid', @value = N'27064FC7-110B-EC11-8516-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [ssas].[model_json_32_relationships]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'ForeignKey_guid', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'686EC1CC-F00A-EC11-8516-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_xref', @value = N'xref:ssas.model_json_32_relationships.adoc[]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_guid', @value = N'F95FD8EE-E90A-EC11-8516-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_fullname2', @value = N'ssas.model_json_32_relationships', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_fullname', @value = N'[ssas].[model_json_32_relationships]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'1', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_update_changed', @value = N'1', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_truncate', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_insert', @value = N'1', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_missing', @value = N'1', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_changed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_for_empty_source', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_duplicate_per_pk', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence', @value = N'1', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T';


GO
EXECUTE sp_addextendedproperty @name = N'has_history_columns', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T';


GO
EXECUTE sp_addextendedproperty @name = N'has_history', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.ForeignKey_ssas_IndexPattern.adoc[]
* xref:ssas.IndexColumn_from_Relationship.adoc[]
* xref:ssas.usp_PERSIST_model_json_32_relationships_T.adoc[]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:ssas.model_json_32_relationships.adoc[]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_32_relationships].[relationships_toTable]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T', @level2type = N'COLUMN', @level2name = N'relationships_toTable';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_32_relationships].[relationships_toColumn]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T', @level2type = N'COLUMN', @level2name = N'relationships_toColumn';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_32_relationships].[relationships_toCardinality]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T', @level2type = N'COLUMN', @level2name = N'relationships_toCardinality';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_32_relationships].[relationships_name]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T', @level2type = N'COLUMN', @level2name = N'relationships_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_32_relationships].[relationships_isActive]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T', @level2type = N'COLUMN', @level2name = N'relationships_isActive';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_32_relationships].[relationships_fromTable]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T', @level2type = N'COLUMN', @level2name = N'relationships_fromTable';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_32_relationships].[relationships_fromColumn]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T', @level2type = N'COLUMN', @level2name = N'relationships_fromColumn';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_32_relationships].[relationships_fromCardinality]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T', @level2type = N'COLUMN', @level2name = N'relationships_fromCardinality';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_32_relationships].[relationships_crossFilteringBehavior]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T', @level2type = N'COLUMN', @level2name = N'relationships_crossFilteringBehavior';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_32_relationships].[databasename]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_32_relationships_T', @level2type = N'COLUMN', @level2name = N'databasename';

