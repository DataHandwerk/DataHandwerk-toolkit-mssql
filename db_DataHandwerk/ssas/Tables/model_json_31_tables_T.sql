CREATE TABLE [ssas].[model_json_31_tables_T] (
    [databasename]          NVARCHAR (128)   NOT NULL,
    [tables_name]           NVARCHAR (128)   NOT NULL,
    [tables_annotations_ja] NVARCHAR (MAX)   NULL,
    [tables_columns_ja]     NVARCHAR (MAX)   NULL,
    [tables_dataCategory]   NVARCHAR (500)   NULL,
    [tables_description]    NVARCHAR (MAX)   NULL,
    [tables_description_ja] NVARCHAR (MAX)   NULL,
    [tables_hierarchies_ja] NVARCHAR (MAX)   NULL,
    [tables_isHidden]       BIT              NULL,
    [tables_measures_ja]    NVARCHAR (MAX)   NULL,
    [tables_partitions_ja]  NVARCHAR (MAX)   NULL,
    [RepoObject_guid]       UNIQUEIDENTIFIER CONSTRAINT [DF_model_json_31_tables_T_RepoObject_guid] DEFAULT (newsequentialid()) NOT NULL,
    CONSTRAINT [PK_model_json_31_tables_T] PRIMARY KEY CLUSTERED ([databasename] ASC, [tables_name] ASC) WITH (DATA_COMPRESSION = PAGE)
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


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T', @level2type = N'CONSTRAINT', @level2name = N'PK_model_json_31_tables_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T', @level2type = N'CONSTRAINT', @level2name = N'PK_model_json_31_tables_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T', @level2type = N'CONSTRAINT', @level2name = N'DF_model_json_31_tables_T_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T', @level2type = N'CONSTRAINT', @level2name = N'DF_model_json_31_tables_T_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'usp_persistence_RepoObject_guid', @value = N'25064FC7-110B-EC11-8516-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [ssas].[model_json_31_tables]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'databasename,tables_name', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'nvarchar(128),nvarchar(128)', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'666EC1CC-F00A-EC11-8516-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_xref', @value = N'xref:ssas.model_json_31_tables.adoc[]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_guid', @value = N'F15FD8EE-E90A-EC11-8516-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_fullname2', @value = N'ssas.model_json_31_tables', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_fullname', @value = N'[ssas].[model_json_31_tables]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'1', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_update_changed', @value = N'1', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_truncate', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_insert', @value = N'1', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_missing', @value = N'1', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_changed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_for_empty_source', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_duplicate_per_pk', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence', @value = N'1', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T';


GO
EXECUTE sp_addextendedproperty @name = N'has_history_columns', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T';


GO
EXECUTE sp_addextendedproperty @name = N'has_history', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.ForeignKey_ssas_IndexPattern.adoc[]
* xref:repo.RepoObject_gross.adoc[]
* xref:repo.RepoObject_SSAS_src.adoc[]
* xref:ssas.model_json_311_tables_columns.adoc[]
* xref:ssas.model_json_312_tables_measures.adoc[]
* xref:ssas.model_json_313_tables_partitions.adoc[]
* xref:ssas.model_json_314_tables_hierarchies.adoc[]
* xref:ssas.model_json_315_tables_annotations.adoc[]
* xref:ssas.model_json_316_tables_descriptions_multiline.adoc[]
* xref:ssas.usp_PERSIST_model_json_31_tables_T.adoc[]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:ssas.model_json_31_tables.adoc[]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_31_tables].[tables_partitions_ja]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T', @level2type = N'COLUMN', @level2name = N'tables_partitions_ja';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_31_tables].[tables_name]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T', @level2type = N'COLUMN', @level2name = N'tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_31_tables].[tables_measures_ja]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T', @level2type = N'COLUMN', @level2name = N'tables_measures_ja';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_31_tables].[tables_isHidden]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T', @level2type = N'COLUMN', @level2name = N'tables_isHidden';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_31_tables].[tables_hierarchies_ja]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T', @level2type = N'COLUMN', @level2name = N'tables_hierarchies_ja';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_31_tables].[tables_description_ja]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T', @level2type = N'COLUMN', @level2name = N'tables_description_ja';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_31_tables].[tables_description]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T', @level2type = N'COLUMN', @level2name = N'tables_description';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_31_tables].[tables_dataCategory]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T', @level2type = N'COLUMN', @level2name = N'tables_dataCategory';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_31_tables].[tables_columns_ja]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T', @level2type = N'COLUMN', @level2name = N'tables_columns_ja';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_31_tables].[tables_annotations_ja]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T', @level2type = N'COLUMN', @level2name = N'tables_annotations_ja';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_31_tables].[databasename]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_31_tables_T', @level2type = N'COLUMN', @level2name = N'databasename';

