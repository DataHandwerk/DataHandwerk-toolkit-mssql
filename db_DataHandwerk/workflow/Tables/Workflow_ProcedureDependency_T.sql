CREATE TABLE [workflow].[Workflow_ProcedureDependency_T] (
    [Workflow_id]                           INT              NOT NULL,
    [referenced_Procedure_RepoObject_guid]  UNIQUEIDENTIFIER NOT NULL,
    [referencing_Procedure_RepoObject_guid] UNIQUEIDENTIFIER NOT NULL,
    [is_redundant]                          BIT              CONSTRAINT [DF_Workflow_ProcedureDependency_T_is_redundant] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Workflow_ProcedureDependency_T] PRIMARY KEY CLUSTERED ([Workflow_id] ASC, [referenced_Procedure_RepoObject_guid] ASC, [referencing_Procedure_RepoObject_guid] ASC) WITH (DATA_COMPRESSION = PAGE)
);












GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'fc228d9f-0bfb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T', @level2type = N'CONSTRAINT', @level2name = N'DF_Workflow_ProcedureDependency_T_is_redundant';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bd5ee3ac-0bfb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T', @level2type = N'COLUMN', @level2name = N'is_redundant';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'caa67203-eafa-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T', @level2type = N'COLUMN', @level2name = N'referenced_Procedure_RepoObject_guid';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c8a67203-eafa-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T', @level2type = N'COLUMN', @level2name = N'referencing_Procedure_RepoObject_guid';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c5a67203-eafa-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T', @level2type = N'COLUMN', @level2name = N'Workflow_id';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '84a67203-eafa-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'fd228d9f-0bfb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T', @level2type = N'CONSTRAINT', @level2name = N'PK_Workflow_ProcedureDependency_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T', @level2type = N'CONSTRAINT', @level2name = N'PK_Workflow_ProcedureDependency_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T', @level2type = N'CONSTRAINT', @level2name = N'PK_Workflow_ProcedureDependency_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T', @level2type = N'CONSTRAINT', @level2name = N'DF_Workflow_ProcedureDependency_T_is_redundant';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T', @level2type = N'CONSTRAINT', @level2name = N'DF_Workflow_ProcedureDependency_T_is_redundant';


GO
EXECUTE sp_addextendedproperty @name = N'usp_persistence_RepoObject_guid', @value = N'FE228D9F-0BFB-EB11-850E-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [workflow].[Workflow_ProcedureDependency]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'Workflow_id,referenced_Procedure_RepoObject_guid,referencing_Procedure_RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'int,uniqueidentifier,uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'FD228D9F-0BFB-EB11-850E-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_xref', @value = N'xref:workflow.Workflow_ProcedureDependency.adoc[]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_guid', @value = N'AC66A0A8-E3FA-EB11-850E-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_fullname2', @value = N'workflow.Workflow_ProcedureDependency', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_fullname', @value = N'[workflow].[Workflow_ProcedureDependency]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'1', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_update_changed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_truncate', @value = N'1', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_insert', @value = N'1', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_missing', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_changed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_for_empty_source', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_duplicate_per_pk', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence', @value = N'1', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T';


GO
EXECUTE sp_addextendedproperty @name = N'has_history_columns', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T';


GO
EXECUTE sp_addextendedproperty @name = N'has_history', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:workflow.usp_PERSIST_Workflow_ProcedureDependency_T.adoc[]
* xref:workflow.usp_workflow.adoc[]
* xref:workflow.Workflow_ProcedureDependency_T_active.adoc[]
* xref:workflow.Workflow_ProcedureDependency_T_bidirectional.adoc[]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:workflow.Workflow_ProcedureDependency.adoc[]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [workflow].[Workflow_ProcedureDependency].[Workflow_id]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T', @level2type = N'COLUMN', @level2name = N'Workflow_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [workflow].[Workflow_ProcedureDependency].[referencing_Procedure_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T', @level2type = N'COLUMN', @level2name = N'referencing_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [workflow].[Workflow_ProcedureDependency].[referenced_Procedure_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T', @level2type = N'COLUMN', @level2name = N'referenced_Procedure_RepoObject_guid';

