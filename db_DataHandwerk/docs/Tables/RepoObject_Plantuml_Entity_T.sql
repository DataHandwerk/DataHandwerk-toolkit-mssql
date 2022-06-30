CREATE TABLE [docs].[RepoObject_Plantuml_Entity_T] (
    [RepoObject_guid]                       UNIQUEIDENTIFIER NOT NULL,
    [cultures_name]                         NVARCHAR (10)    CONSTRAINT [DF_RepoObject_Plantuml_Entity_T_cultures_name] DEFAULT ('') NOT NULL,
    [RepoObject_Puml]                       NVARCHAR (MAX)   NOT NULL,
    [RepoObject_PumlOnlyIndex]              NVARCHAR (MAX)   NOT NULL,
    [RepoObject_PumlOnlyPK]                 NVARCHAR (MAX)   NOT NULL,
    [RepoObject_PumlOnlyPkOrNotHidden]      NVARCHAR (MAX)   CONSTRAINT [DF_RepoObject_Plantuml_Entity_T_RepoObject_PumlOnlyPkOrNotHidden] DEFAULT ('') NOT NULL,
    [RepoObject_PumlOnlyPkOrIndex]          NVARCHAR (MAX)   CONSTRAINT [DF_RepoObject_Plantuml_Entity_T_RepoObject_PumlOnlyPkOrNotHidden1] DEFAULT ('') NOT NULL,
    [RepoObject_PumlOnlyPkOrIndexOrMeasure] NVARCHAR (MAX)   CONSTRAINT [DF_RepoObject_Plantuml_Entity_T_RepoObject_PumlOnlyPkOrIndex1] DEFAULT ('') NULL,
    [RepoObject_fullname2]                  NVARCHAR (257)   CONSTRAINT [DF_RepoObject_Plantuml_Entity_T_RepoObject_fullname2] DEFAULT ('') NOT NULL,
    [RepoObject_schema_name]                NVARCHAR (128)   CONSTRAINT [DF_RepoObject_Plantuml_Entity_T_RepoObject_fullname21] DEFAULT ('') NOT NULL,
    CONSTRAINT [PK_RepoObject_Plantuml_Entity_T] PRIMARY KEY NONCLUSTERED ([RepoObject_guid] ASC, [cultures_name] ASC)
);





























GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2ce63abf-9395-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '29e63abf-9395-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fc15e189-7698-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'COLUMN', @level2name = N'RepoObject_PumlOnlyPK';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fb15e189-7698-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'COLUMN', @level2name = N'RepoObject_PumlOnlyIndex';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fa15e189-7698-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'COLUMN', @level2name = N'RepoObject_Puml';


GO
EXECUTE sp_addextendedproperty @name = N'usp_persistence_RepoObject_guid', @value = N'2AE63ABF-9395-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [docs].[RepoObject_Plantuml_Entity]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T';


GO



GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'B4686D3C-6598-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_xref', @value = N'xref:docs.RepoObject_Plantuml_Entity.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_guid', @value = N'BCD49D8D-4595-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_fullname2', @value = N'docs.RepoObject_Plantuml_Entity', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_fullname', @value = N'[docs].[RepoObject_Plantuml_Entity]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'1', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_update_changed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_truncate', @value = N'1', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_insert', @value = N'1', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_missing', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_changed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_for_empty_source', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_duplicate_per_pk', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence', @value = N'1', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T';


GO
EXECUTE sp_addextendedproperty @name = N'has_history_columns', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T';


GO
EXECUTE sp_addextendedproperty @name = N'has_history', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.ftv_RepoObject_Reference_PlantUml_EntityRefList.adoc[]
* xref:docs.ObjectRefCyclic_EntityList.adoc[]
* xref:docs.RepoObject_PlantUml_PumlEntityFkList.adoc[]
* xref:docs.Schema_EntityList.adoc[]
* xref:docs.usp_PERSIST_RepoObject_Plantuml_Entity_T.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T';




GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:docs.RepoObject_Plantuml_Entity.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Plantuml_Entity].[RepoObject_PumlOnlyPK]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'COLUMN', @level2name = N'RepoObject_PumlOnlyPK';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Plantuml_Entity].[RepoObject_PumlOnlyIndex]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'COLUMN', @level2name = N'RepoObject_PumlOnlyIndex';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Plantuml_Entity].[RepoObject_Puml]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'COLUMN', @level2name = N'RepoObject_Puml';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Plantuml_Entity].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '70e72f09-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_Plantuml_Entity_T_RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '786d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '44ecd625-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_Plantuml_Entity_T_RepoObject_PumlOnlyPkOrNotHidden';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '946d05d0-0b08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'COLUMN', @level2name = N'RepoObject_PumlOnlyPkOrNotHidden';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '6a6e8dee-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_Plantuml_Entity_T_RepoObject_PumlOnlyPkOrNotHidden1';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cb4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'COLUMN', @level2name = N'RepoObject_PumlOnlyPkOrIndex';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'eb5fd8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_Plantuml_Entity_T_RepoObject_fullname21';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '746ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_Plantuml_Entity_T_RepoObject_PumlOnlyPkOrNotHidden1';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_Plantuml_Entity_T_RepoObject_PumlOnlyPkOrNotHidden1';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_Plantuml_Entity_T_RepoObject_PumlOnlyPkOrNotHidden';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_Plantuml_Entity_T_RepoObject_PumlOnlyPkOrNotHidden';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_Plantuml_Entity_T_RepoObject_fullname21';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_Plantuml_Entity_T_RepoObject_fullname21';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_Plantuml_Entity_T_RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_Plantuml_Entity_T_RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Plantuml_Entity].[RepoObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Plantuml_Entity].[RepoObject_PumlOnlyPkOrNotHidden]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'COLUMN', @level2name = N'RepoObject_PumlOnlyPkOrNotHidden';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Plantuml_Entity].[RepoObject_PumlOnlyPkOrIndex]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'COLUMN', @level2name = N'RepoObject_PumlOnlyPkOrIndex';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Plantuml_Entity].[RepoObject_fullname2]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ea216c32-5c1d-ec11-8522-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_Plantuml_Entity_T_RepoObject_PumlOnlyPkOrIndex1';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9c83d451-5c1d-ec11-8522-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'COLUMN', @level2name = N'RepoObject_PumlOnlyPkOrIndexOrMeasure';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'aaa507d5-0622-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObject_Plantuml_Entity_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a5a507d5-0622-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_Plantuml_Entity_T_cultures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '520389e1-0622-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'COLUMN', @level2name = N'cultures_name';


GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_RepoObject_Plantuml_Entity_T]
    ON [docs].[RepoObject_Plantuml_Entity_T];

