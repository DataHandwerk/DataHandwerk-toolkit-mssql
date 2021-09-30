CREATE TABLE [reference].[RepoObjectColumn_reference_T] (
    [referenced_RepoObjectColumn_guid]              UNIQUEIDENTIFIER NOT NULL,
    [referencing_RepoObjectColumn_guid]             UNIQUEIDENTIFIER NOT NULL,
    [referenced_column_name]                        NVARCHAR (128)   NULL,
    [referenced_entity_name]                        NVARCHAR (128)   NULL,
    [referenced_RepoObject_guid]                    UNIQUEIDENTIFIER NULL,
    [referenced_schema_name]                        NVARCHAR (128)   NULL,
    [referenced_type]                               CHAR (2)         NULL,
    [referenced_external_AntoraComponent]           NVARCHAR (128)   NULL,
    [referenced_external_AntoraModule]              NVARCHAR (128)   NULL,
    [referenced_is_external]                        BIT              CONSTRAINT [DF_RepoObjectColumn_reference_T_referenced_is_external] DEFAULT ((0)) NOT NULL,
    [referencing_column_name]                       NVARCHAR (128)   NULL,
    [referencing_entity_name]                       NVARCHAR (128)   NULL,
    [referencing_RepoObject_guid]                   UNIQUEIDENTIFIER NULL,
    [referencing_schema_name]                       NVARCHAR (128)   NULL,
    [referencing_type]                              CHAR (2)         NULL,
    [referencing_external_AntoraComponent]          NVARCHAR (128)   NULL,
    [referencing_external_AntoraModule]             NVARCHAR (128)   NULL,
    [referencing_is_external]                       BIT              CONSTRAINT [DF_RepoObjectColumn_reference_T_referencing_is_external] DEFAULT ((0)) NOT NULL,
    [is_referencing_object_equal_referenced_object] TINYINT          NULL,
    [is_referenced_object]                          TINYINT          NULL,
    [referenced_ro_fullname]                        AS               (concat('[',[referenced_schema_name],'].[',[referenced_entity_name],']')) PERSISTED NOT NULL,
    [referenced_ro_fullname2]                       AS               (concat([referenced_schema_name],'.',[referenced_entity_name])) PERSISTED NOT NULL,
    [referenced_roc_fullname]                       AS               (concat('[',[referenced_schema_name],'].[',[referenced_entity_name],'].[',[referenced_column_name],']')) PERSISTED NOT NULL,
    [referenced_roc_fullname2]                      AS               (concat([referenced_schema_name],'.',[referenced_entity_name],'.',[referenced_column_name])) PERSISTED NOT NULL,
    [referencing_ro_fullname]                       AS               (concat('[',[referencing_schema_name],'].[',[referencing_entity_name],']')) PERSISTED NOT NULL,
    [referencing_ro_fullname2]                      AS               (concat([referencing_schema_name],'.',[referencing_entity_name])) PERSISTED NOT NULL,
    [referencing_roc_fullname]                      AS               (concat('[',[referencing_schema_name],'].[',[referencing_entity_name],'].[',[referencing_column_name],']')) PERSISTED NOT NULL,
    [referencing_roc_fullname2]                     AS               (concat([referencing_schema_name],'.',[referencing_entity_name],'.',[referencing_column_name])) PERSISTED NOT NULL,
    CONSTRAINT [PK_RepoObjectColumn_reference_T] PRIMARY KEY CLUSTERED ([referenced_RepoObjectColumn_guid] ASC, [referencing_RepoObjectColumn_guid] ASC) WITH (DATA_COMPRESSION = PAGE)
);
















GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'e47c5574-89f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObjectColumn_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ee7c5574-89f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'is_referenced_object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ed7c5574-89f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'is_referencing_object_equal_referenced_object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '21481475-58f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1f481475-58f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1d481475-58f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '20481475-58f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1e481475-58f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1a481475-58f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '19481475-58f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '17481475-58f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1c481475-58f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1b481475-58f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '18481475-58f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '22481475-58f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '16481475-58f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'usp_persistence_RepoObject_guid', @value = 'db0785a9-5df5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'referenced_RepoObjectColumn_guid,referencing_RepoObjectColumn_guid', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier,uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = 'e47c5574-89f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_xref', @value = N'xref:reference.RepoObjectColumn_reference.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_guid', @value = '2cd81bf9-57f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_fullname2', @value = N'reference.RepoObjectColumn_reference', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_fullname', @value = N'[reference].[RepoObjectColumn_reference]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'1', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T';




GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_update_changed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T';






GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_truncate', @value = N'1', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T';






GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_insert', @value = N'1', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T';




GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_missing', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T';






GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_changed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T';




GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_for_empty_source', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T';




GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_duplicate_per_pk', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T';




GO
EXECUTE sp_addextendedproperty @name = N'is_persistence', @value = N'1', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T';




GO
EXECUTE sp_addextendedproperty @name = N'has_history_columns', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T';




GO
EXECUTE sp_addextendedproperty @name = N'has_history', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T';




GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.RepoObject_Plantuml_ColRefList_1_1.adoc[]
* xref:reference.RepoObjectColumn_ReferencingReferenced.adoc[]
* xref:reference.RepoObjectColumn_RelationScript.adoc[]
* xref:reference.usp_PERSIST_RepoObjectColumn_reference_T.adoc[]
* xref:repo.IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing.adoc[]
* xref:repo.RepoObjectColumn_MissingSource_TypeV.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T';








GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:reference.RepoObjectColumn_reference.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '54ae410c-d3f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_roc_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '53ae410c-d3f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_roc_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '52ae410c-d3f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_ro_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '51ae410c-d3f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_ro_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '50ae410c-d3f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_roc_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4fae410c-d3f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_roc_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4eae410c-d3f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_ro_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4dae410c-d3f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_ro_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObjectColumn_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObjectColumn_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [reference].[RepoObjectColumn_reference]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference].[referencing_type]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference].[referencing_schema_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference].[referencing_RepoObjectColumn_guid]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference].[referencing_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference].[referencing_entity_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference].[referencing_column_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_column_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference].[referenced_type]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference].[referenced_schema_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference].[referenced_RepoObjectColumn_guid]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference].[referenced_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference].[referenced_entity_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference].[referenced_column_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_column_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference].[is_referencing_object_equal_referenced_object]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'is_referencing_object_equal_referenced_object';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference].[is_referenced_object]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'is_referenced_object';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference_T].[referencing_column_name]
* [reference].[RepoObjectColumn_reference_T].[referencing_entity_name]
* [reference].[RepoObjectColumn_reference_T].[referencing_schema_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_roc_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat([referencing_schema_name],''.'',[referencing_entity_name],''.'',[referencing_column_name]))', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_roc_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference_T].[referencing_column_name]
* [reference].[RepoObjectColumn_reference_T].[referencing_entity_name]
* [reference].[RepoObjectColumn_reference_T].[referencing_schema_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_roc_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[referencing_schema_name],''].['',[referencing_entity_name],''].['',[referencing_column_name],'']''))', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_roc_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference_T].[referencing_entity_name]
* [reference].[RepoObjectColumn_reference_T].[referencing_schema_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_ro_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat([referencing_schema_name],''.'',[referencing_entity_name]))', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_ro_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference_T].[referencing_entity_name]
* [reference].[RepoObjectColumn_reference_T].[referencing_schema_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_ro_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[referencing_schema_name],''].['',[referencing_entity_name],'']''))', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_ro_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference_T].[referenced_column_name]
* [reference].[RepoObjectColumn_reference_T].[referenced_entity_name]
* [reference].[RepoObjectColumn_reference_T].[referenced_schema_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_roc_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat([referenced_schema_name],''.'',[referenced_entity_name],''.'',[referenced_column_name]))', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_roc_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference_T].[referenced_column_name]
* [reference].[RepoObjectColumn_reference_T].[referenced_entity_name]
* [reference].[RepoObjectColumn_reference_T].[referenced_schema_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_roc_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[referenced_schema_name],''].['',[referenced_entity_name],''].['',[referenced_column_name],'']''))', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_roc_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference_T].[referenced_entity_name]
* [reference].[RepoObjectColumn_reference_T].[referenced_schema_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_ro_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat([referenced_schema_name],''.'',[referenced_entity_name]))', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_ro_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference_T].[referenced_entity_name]
* [reference].[RepoObjectColumn_reference_T].[referenced_schema_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_ro_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[referenced_schema_name],''].['',[referenced_entity_name],'']''))', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_ro_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7adaaa1b-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObjectColumn_reference_T_referencing_is_external';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '79daaa1b-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObjectColumn_reference_T_referenced_is_external';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '81320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_is_external';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '80320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_external_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7f320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_external_AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7e320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_is_external';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7d320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_external_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7c320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_external_AntoraComponent';

