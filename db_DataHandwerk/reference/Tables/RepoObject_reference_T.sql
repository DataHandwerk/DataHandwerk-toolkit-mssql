CREATE TABLE [reference].[RepoObject_reference_T] (
    [referenced_RepoObject_guid]  UNIQUEIDENTIFIER NOT NULL,
    [referencing_RepoObject_guid] UNIQUEIDENTIFIER NOT NULL,
    [referenced_entity_name]      NVARCHAR (128)   NULL,
    [referenced_schema_name]      NVARCHAR (128)   NULL,
    [referenced_type]             CHAR (2)         NULL,
    [referencing_entity_name]     NVARCHAR (128)   NULL,
    [referencing_schema_name]     NVARCHAR (128)   NULL,
    [referencing_type]            VARCHAR (2)      NULL,
    [referenced_fullname]         AS               (concat('[',[referenced_schema_name],'].[',[referenced_entity_name],']')) PERSISTED NOT NULL,
    [referenced_fullname2]        AS               (concat([referenced_schema_name],'.',[referenced_entity_name])) PERSISTED NOT NULL,
    [referencing_fullname]        AS               (concat('[',[referencing_schema_name],'].[',[referencing_entity_name],']')) PERSISTED NOT NULL,
    [referencing_fullname2]       AS               (concat([referencing_schema_name],'.',[referencing_entity_name])) PERSISTED NOT NULL,
    CONSTRAINT [PK_RepoObject_reference_T] PRIMARY KEY CLUSTERED ([referenced_RepoObject_guid] ASC, [referencing_RepoObject_guid] ASC) WITH (DATA_COMPRESSION = PAGE)
);




GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'e37c5574-89f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObject_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ea7c5574-89f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e97c5574-89f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e87c5574-89f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e77c5574-89f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0f481475-58f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0e481475-58f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '10481475-58f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '11481475-58f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '13481475-58f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '12481475-58f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '15481475-58f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '14481475-58f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0d481475-58f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';


GO
CREATE NONCLUSTERED INDEX [idx_RepoObject_reference_2]
    ON [reference].[RepoObject_reference_T]([referencing_RepoObject_guid] ASC, [referencing_type] ASC, [referenced_RepoObject_guid] ASC, [referenced_type] ASC)
    INCLUDE([referenced_fullname], [referenced_fullname2], [referencing_fullname], [referencing_fullname2]);


GO
CREATE NONCLUSTERED INDEX [idx_RepoObject_reference_1]
    ON [reference].[RepoObject_reference_T]([referenced_RepoObject_guid] ASC, [referencing_RepoObject_guid] ASC, [referencing_type] ASC, [referenced_type] ASC)
    INCLUDE([referenced_fullname], [referenced_fullname2], [referencing_fullname], [referencing_fullname2]);


GO
EXECUTE sp_addextendedproperty @name = N'usp_persistence_RepoObject_guid', @value = 'da0785a9-5df5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'referenced_RepoObject_guid,referencing_RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier,uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = 'e37c5574-89f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_xref', @value = N'xref:reference.RepoObject_reference.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_guid', @value = '62a279f1-54f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_fullname2', @value = N'reference.RepoObject_reference', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_fullname', @value = N'[reference].[RepoObject_reference]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = 1, @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_update_changed', @value = 1, @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_truncate', @value = 0, @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_insert', @value = 1, @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_missing', @value = 1, @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_changed', @value = 0, @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_for_empty_source', @value = 0, @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_duplicate_per_pk', @value = 0, @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence', @value = 1, @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'has_history_columns', @value = 0, @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'has_history', @value = 0, @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.RepoObject_Plantuml_ObjectRefList.adoc[]
* xref:docs.RepoObject_Plantuml_ObjectRefList_0_30.adoc[]
* xref:docs.RepoObject_Plantuml_ObjectRefList_30_0.adoc[]
* xref:reference.RepoObject_ReferencingReferenced.adoc[]
* xref:reference.RepoObjectColumn_reference_BySamePredecessors.adoc[]
* xref:reference.RepoObjectColumn_reference_FirstResultSet.adoc[]
* xref:reference.RepoObjectColumn_reference_QueryPlan.adoc[]
* xref:reference.RepoObjectColumn_reference_SqlExpressionDependencies.adoc[]
* xref:reference.RepoObjectColumn_reference_virtual.adoc[]
* xref:reference.usp_PERSIST_RepoObject_reference_T.adoc[]
* xref:repo.IndexReferencedReferencing.adoc[]
* xref:repo.usp_main.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:reference.RepoObject_reference.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';

