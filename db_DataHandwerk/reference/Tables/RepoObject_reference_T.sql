CREATE TABLE [reference].[RepoObject_reference_T] (
    [referenced_RepoObject_guid]             UNIQUEIDENTIFIER NOT NULL,
    [referencing_RepoObject_guid]            UNIQUEIDENTIFIER NOT NULL,
    [referenced_entity_name]                 NVARCHAR (128)   NULL,
    [referenced_schema_name]                 NVARCHAR (128)   NULL,
    [referenced_type]                        CHAR (2)         NULL,
    [referenced_external_AntoraComponent]    NVARCHAR (128)   NULL,
    [referenced_external_AntoraModule]       NVARCHAR (128)   NULL,
    [referenced_is_external]                 BIT              CONSTRAINT [DF_RepoObject_reference_T_referenced_is_external] DEFAULT ((0)) NOT NULL,
    [referenced_fullname]                    AS               (concat('[',[referenced_schema_name],'].[',[referenced_entity_name],']')) PERSISTED NOT NULL,
    [referenced_fullname2]                   AS               (concat([referenced_schema_name],'.',[referenced_entity_name])) PERSISTED NOT NULL,
    [referenced_is_PersistenceSource]        BIT              CONSTRAINT [DF_RepoObject_reference_T_is_referenced_persistence] DEFAULT ((0)) NOT NULL,
    [referenced_is_PersistenceTarget]        BIT              CONSTRAINT [DF_RepoObject_reference_T_referenced_is_PersistenceSource1_1] DEFAULT ((0)) NOT NULL,
    [referencing_entity_name]                NVARCHAR (128)   NULL,
    [referencing_schema_name]                NVARCHAR (128)   NULL,
    [referencing_type]                       VARCHAR (2)      NULL,
    [referencing_external_AntoraComponent]   NVARCHAR (128)   NULL,
    [referencing_external_AntoraModule]      NVARCHAR (128)   NULL,
    [referencing_is_external]                BIT              CONSTRAINT [DF_RepoObject_reference_T_referencing_is_external] DEFAULT ((0)) NOT NULL,
    [referencing_fullname]                   AS               (concat('[',[referencing_schema_name],'].[',[referencing_entity_name],']')) PERSISTED NOT NULL,
    [referencing_fullname2]                  AS               (concat([referencing_schema_name],'.',[referencing_entity_name])) PERSISTED NOT NULL,
    [referencing_is_PersistenceTarget]       BIT              CONSTRAINT [DF_RepoObject_reference_T_referenced_is_PersistenceSource1] DEFAULT ((0)) NOT NULL,
    [referencing_is_PersistenceUspSourceRef] BIT              CONSTRAINT [DF_RepoObject_reference_T_referencing_is_PersistenceTarget1] DEFAULT ((0)) NOT NULL,
    [referencing_is_PersistenceUspTargetRef] BIT              CONSTRAINT [DF_RepoObject_reference_T_referencing_is_PersistenceUspSourceRef1] DEFAULT ((0)) NULL,
    [is_ReversePersistenceViaView]           BIT              CONSTRAINT [DF_RepoObject_reference_T_is_ReversePersistenceViaView] DEFAULT ((0)) NOT NULL,
    [referenced_puml_entity]                 AS               (case when [referenced_is_external]=(1) then (([referenced_external_AntoraComponent]+'.')+[referenced_external_AntoraModule])+'.' else '' end+[docs].[fs_cleanStringForPuml](concat([referenced_schema_name],'.',[referenced_entity_name]))),
    [referencing_puml_entity]                AS               (case when [referencing_is_external]=(1) then (([referencing_external_AntoraComponent]+'.')+[referencing_external_AntoraModule])+'.' else '' end+[docs].[fs_cleanStringForPuml](concat([referencing_schema_name],'.',[referencing_entity_name]))),
    [referenced_AntoraComponent]             AS               (coalesce([referenced_external_AntoraComponent],[config].[fs_get_parameter_value]('AntoraComponent',''))),
    [referenced_AntoraModule]                AS               (coalesce([referenced_external_AntoraModule],[config].[fs_get_parameter_value]('AntoraModule',''))),
    [referencing_AntoraComponent]            AS               (coalesce([referencing_external_AntoraComponent],[config].[fs_get_parameter_value]('AntoraComponent',''))),
    [referencing_AntoraModule]               AS               (coalesce([referencing_external_AntoraModule],[config].[fs_get_parameter_value]('AntoraModule',''))),
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
    ON [reference].[RepoObject_reference_T]([referencing_RepoObject_guid] ASC, [referencing_type] ASC, [referenced_RepoObject_guid] ASC, [referenced_type] ASC);




GO
CREATE NONCLUSTERED INDEX [idx_RepoObject_reference_1]
    ON [reference].[RepoObject_reference_T]([referenced_RepoObject_guid] ASC, [referencing_RepoObject_guid] ASC, [referencing_type] ASC, [referenced_type] ASC);




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
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'1', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';




GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_update_changed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';






GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_truncate', @value = N'1', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';






GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_insert', @value = N'1', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';




GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_missing', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';






GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_changed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';




GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_for_empty_source', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';




GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_duplicate_per_pk', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';




GO
EXECUTE sp_addextendedproperty @name = N'is_persistence', @value = N'1', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';




GO
EXECUTE sp_addextendedproperty @name = N'has_history_columns', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';




GO
EXECUTE sp_addextendedproperty @name = N'has_history', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';




GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.RepoObject_Plantuml_ObjectRefList_0_30.adoc[]
* xref:docs.RepoObject_Plantuml_ObjectRefList_1_1.adoc[]
* xref:docs.RepoObject_Plantuml_ObjectRefList_30_0.adoc[]
* xref:reference.ReferenceTree_cyclic_ref_PersistenceUsp.adoc[]
* xref:reference.RepoObject_reference_T_bidirectional.adoc[]
* xref:reference.RepoObject_ReferencingReferenced.adoc[]
* xref:reference.RepoObjectColumn_reference_additional_internal.adoc[]
* xref:reference.RepoObjectColumn_reference_BySamePredecessors.adoc[]
* xref:reference.RepoObjectColumn_reference_FirstResultSet.adoc[]
* xref:reference.RepoObjectColumn_reference_QueryPlan.adoc[]
* xref:reference.RepoObjectColumn_reference_SqlExpressionDependencies.adoc[]
* xref:reference.RepoObjectColumn_reference_virtual.adoc[]
* xref:reference.usp_PERSIST_RepoObject_reference_T.adoc[]
* xref:repo.IndexReferencedReferencing.adoc[]
* xref:repo.RepoObject_wo_referencing.adoc[]
* xref:repo.usp_main.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';






GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:reference.RepoObject_reference.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '75e72f09-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_reference_T_referencing_is_PersistenceUspSourceRef1';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '74e72f09-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_reference_T_referencing_is_PersistenceTarget1';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '72e72f09-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_reference_T_referenced_is_PersistenceSource1_1';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '73e72f09-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_reference_T_referenced_is_PersistenceSource1';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '76e72f09-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_reference_T_is_ReversePersistenceViaView';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '71e72f09-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_reference_T_is_referenced_persistence';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd76d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_is_PersistenceUspTargetRef';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd66d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_is_PersistenceUspSourceRef';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd56d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_is_PersistenceTarget';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd46d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_is_PersistenceTarget';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd36d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_is_PersistenceSource';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd86d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'is_ReversePersistenceViaView';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObject_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObject_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_reference_T_referencing_is_PersistenceUspSourceRef1';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_reference_T_referencing_is_PersistenceUspSourceRef1';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_reference_T_referencing_is_PersistenceTarget1';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_reference_T_referencing_is_PersistenceTarget1';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_reference_T_referenced_is_PersistenceSource1_1';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_reference_T_referenced_is_PersistenceSource1_1';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_reference_T_referenced_is_PersistenceSource1';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_reference_T_referenced_is_PersistenceSource1';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_reference_T_is_ReversePersistenceViaView';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_reference_T_is_ReversePersistenceViaView';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_reference_T_is_referenced_persistence';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_reference_T_is_referenced_persistence';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [reference].[RepoObject_reference]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObject_reference].[referencing_type]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObject_reference].[referencing_schema_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObject_reference].[referencing_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObject_reference].[referencing_entity_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObject_reference].[referenced_type]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObject_reference].[referenced_schema_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObject_reference].[referenced_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObject_reference].[referenced_entity_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObject_reference_T].[referencing_entity_name]
* [reference].[RepoObject_reference_T].[referencing_schema_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_fullname2';


GO



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObject_reference_T].[referencing_entity_name]
* [reference].[RepoObject_reference_T].[referencing_schema_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_fullname';


GO



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObject_reference_T].[referenced_entity_name]
* [reference].[RepoObject_reference_T].[referenced_schema_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_fullname2';


GO



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObject_reference_T].[referenced_entity_name]
* [reference].[RepoObject_reference_T].[referenced_schema_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_fullname';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '78daaa1b-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_reference_T_referencing_is_external';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '77daaa1b-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_reference_T_referenced_is_external';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6b320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_is_external';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6a320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_external_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '69320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_external_AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '68320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_is_external';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '67320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_external_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '66320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_external_AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6d320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_puml_entity';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6c320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_puml_entity';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '847f7d5a-464d-ec11-8531-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '837f7d5a-464d-ec11-8531-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referencing_AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '827f7d5a-464d-ec11-8531-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '817f7d5a-464d-ec11-8531-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_reference_T', @level2type = N'COLUMN', @level2name = N'referenced_AntoraComponent';

