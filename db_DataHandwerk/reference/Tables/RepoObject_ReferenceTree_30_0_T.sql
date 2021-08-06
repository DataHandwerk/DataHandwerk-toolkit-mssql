CREATE TABLE [reference].[RepoObject_ReferenceTree_30_0_T] (
    [RepoObject_guid]       UNIQUEIDENTIFIER NOT NULL,
    [Referencing_guid]      UNIQUEIDENTIFIER NOT NULL,
    [Referenced_guid]       UNIQUEIDENTIFIER NOT NULL,
    [Referenced_Depth]      INT              NULL,
    [Referenced_fullname]   NVARCHAR (261)   NULL,
    [Referenced_fullname2]  NVARCHAR (257)   NULL,
    [Referenced_type]       CHAR (2)         NULL,
    [Referencing_Depth]     INT              NULL,
    [Referencing_fullname]  NVARCHAR (261)   NULL,
    [Referencing_fullname2] NVARCHAR (257)   NULL,
    [Referencing_type]      VARCHAR (2)      NULL,
    CONSTRAINT [uq_RepoObject_ReferenceTree_30_0_T] UNIQUE NONCLUSTERED ([RepoObject_guid] ASC, [Referencing_guid] ASC, [Referenced_guid] ASC)
);




GO
CREATE CLUSTERED COLUMNSTORE INDEX [CSI_reference_RepoObject_ReferenceTree_30_0_T]
    ON [reference].[RepoObject_ReferenceTree_30_0_T];


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7e07068d-19f6-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_30_0_T', @level2type = N'CONSTRAINT', @level2name = N'uq_RepoObject_ReferenceTree_30_0_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a5e916da-fef5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_30_0_T', @level2type = N'COLUMN', @level2name = N'Referencing_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a8e916da-fef5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_30_0_T', @level2type = N'COLUMN', @level2name = N'Referencing_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a7e916da-fef5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_30_0_T', @level2type = N'COLUMN', @level2name = N'Referencing_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aae916da-fef5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_30_0_T', @level2type = N'COLUMN', @level2name = N'Referencing_Depth';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ade916da-fef5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_30_0_T', @level2type = N'COLUMN', @level2name = N'Referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a4e916da-fef5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_30_0_T', @level2type = N'COLUMN', @level2name = N'Referenced_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aee916da-fef5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_30_0_T', @level2type = N'COLUMN', @level2name = N'Referenced_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a6e916da-fef5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_30_0_T', @level2type = N'COLUMN', @level2name = N'Referenced_Depth';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a9e916da-fef5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_30_0_T', @level2type = N'COLUMN', @level2name = N'Referenced_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ace916da-fef5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_30_0_T', @level2type = N'COLUMN', @level2name = N'Referencing_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'abe916da-fef5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_30_0_T', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'c611eece-fef5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_30_0_T';


GO
EXECUTE sp_addextendedproperty @name = N'usp_persistence_RepoObject_guid', @value = '7a07068d-19f6-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_30_0_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_xref', @value = N'xref:reference.RepoObject_ReferenceTree_30_0.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_30_0_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_guid', @value = 'd5e2805c-fdf5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_30_0_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_fullname2', @value = N'reference.RepoObject_ReferenceTree_30_0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_30_0_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_fullname', @value = N'[reference].[RepoObject_ReferenceTree_30_0]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_30_0_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = 1, @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_30_0_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_update_changed', @value = 1, @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_30_0_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_truncate', @value = 0, @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_30_0_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_insert', @value = 1, @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_30_0_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_missing', @value = 1, @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_30_0_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_changed', @value = 0, @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_30_0_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_for_empty_source', @value = 0, @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_30_0_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_duplicate_per_pk', @value = 0, @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_30_0_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence', @value = 1, @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_30_0_T';


GO
EXECUTE sp_addextendedproperty @name = N'has_history_columns', @value = 0, @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_30_0_T';


GO
EXECUTE sp_addextendedproperty @name = N'has_history', @value = 0, @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_30_0_T';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.ftv_RepoObject_Reference_PlantUml_EntityRefList.adoc[]
* xref:docs.RepoObject_Plantuml_ObjectRefList_30_0.adoc[]
* xref:reference.usp_PERSIST_RepoObject_ReferenceTree_30_0_T.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_30_0_T';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:reference.RepoObject_ReferenceTree_30_0.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_30_0_T';

