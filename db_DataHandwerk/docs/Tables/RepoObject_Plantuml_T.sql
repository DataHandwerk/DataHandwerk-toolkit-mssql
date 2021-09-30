CREATE TABLE [docs].[RepoObject_Plantuml_T] (
    [RepoObject_guid]               UNIQUEIDENTIFIER NOT NULL,
    [cultures_name]                 NVARCHAR (10)    CONSTRAINT [DF_RepoObject_Plantuml_T_cultures_name] DEFAULT ('') NOT NULL,
    [ColRefList]                    NVARCHAR (MAX)   NULL,
    [ObjectRefList]                 NVARCHAR (MAX)   NULL,
    [ObjectRefList_0_30]            NVARCHAR (MAX)   NULL,
    [ObjectRefList_30_0]            NVARCHAR (MAX)   NULL,
    [PlantumlEntity_0_30_ObjectRef] NVARCHAR (MAX)   NOT NULL,
    [PlantumlEntity_1_1_ColRef]     NVARCHAR (MAX)   NOT NULL,
    [PlantumlEntity_1_1_FkRef]      NVARCHAR (MAX)   NOT NULL,
    [PlantumlEntity_1_1_ObjectRef]  NVARCHAR (MAX)   NOT NULL,
    [PlantumlEntity_30_0_ObjectRef] NVARCHAR (MAX)   NOT NULL,
    [PumlEntityList]                NVARCHAR (MAX)   NULL,
    [PumlEntityList_0_30]           NVARCHAR (MAX)   NULL,
    [PumlEntityList_30_0]           NVARCHAR (MAX)   NULL,
    [RepoObject_fullname2]          NVARCHAR (257)   NOT NULL,
    CONSTRAINT [PK_RepoObject_Plantuml_T] PRIMARY KEY CLUSTERED ([RepoObject_guid] ASC, [cultures_name] ASC) WITH (DATA_COMPRESSION = PAGE)
);
















GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a76b2118-b19a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a66b2118-b19a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'PumlEntityList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a56b2118-b19a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'PlantumlEntity_1_1_ObjectRef';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a46b2118-b19a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'PlantumlEntity_1_1_FkRef';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a36b2118-b19a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'PlantumlEntity_1_1_ColRef';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a26b2118-b19a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'ObjectRefList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a16b2118-b19a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'ColRefList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a06b2118-b19a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9e6b2118-b19a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '148e62ad-4a9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'PumlEntityList_30_0';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '118e62ad-4a9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'PumlEntityList_0_30';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '168e62ad-4a9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'PlantumlEntity_30_0_ObjectRef';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '198e62ad-4a9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'PlantumlEntity_0_30_ObjectRef';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ee26ab1d-619d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'ObjectRefList_30_0';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ec26ab1d-619d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'ObjectRefList_0_30';


GO



GO
EXECUTE sp_addextendedproperty @name = N'usp_persistence_RepoObject_guid', @value = N'9F6B2118-B19A-EB11-84F5-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [docs].[RepoObject_Plantuml]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'D3028A96-A69B-EB11-84F6-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_xref', @value = N'xref:docs.RepoObject_Plantuml.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_guid', @value = N'F20B29C2-E595-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_fullname2', @value = N'docs.RepoObject_Plantuml', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_fullname', @value = N'[docs].[RepoObject_Plantuml]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'1', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_update_changed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_truncate', @value = N'1', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_insert', @value = N'1', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_missing', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_changed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_for_empty_source', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_duplicate_per_pk', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence', @value = N'1', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T';


GO
EXECUTE sp_addextendedproperty @name = N'has_history_columns', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T';


GO
EXECUTE sp_addextendedproperty @name = N'has_history', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.usp_PERSIST_RepoObject_Plantuml_T.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:docs.RepoObject_Plantuml.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Plantuml].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Plantuml].[RepoObject_fullname2]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat([RepoObject_schema_name],''.'',[RepoObject_name]))', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Plantuml].[PumlEntityList_30_0]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'PumlEntityList_30_0';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Plantuml].[PumlEntityList_0_30]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'PumlEntityList_0_30';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Plantuml].[PumlEntityList]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'PumlEntityList';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Plantuml].[PlantumlEntity_30_0_ObjectRef]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'PlantumlEntity_30_0_ObjectRef';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Plantuml].[PlantumlEntity_1_1_ObjectRef]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'PlantumlEntity_1_1_ObjectRef';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Plantuml].[PlantumlEntity_1_1_FkRef]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'PlantumlEntity_1_1_FkRef';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Plantuml].[PlantumlEntity_1_1_ColRef]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'PlantumlEntity_1_1_ColRef';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Plantuml].[PlantumlEntity_0_30_ObjectRef]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'PlantumlEntity_0_30_ObjectRef';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Plantuml].[ObjectRefList_30_0]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'ObjectRefList_30_0';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Plantuml].[ObjectRefList_0_30]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'ObjectRefList_0_30';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Plantuml].[ObjectRefList]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'ObjectRefList';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Plantuml].[ColRefList]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'ColRefList';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'aba507d5-0622-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObject_Plantuml_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a6a507d5-0622-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_Plantuml_T_cultures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '540389e1-0622-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'cultures_name';

