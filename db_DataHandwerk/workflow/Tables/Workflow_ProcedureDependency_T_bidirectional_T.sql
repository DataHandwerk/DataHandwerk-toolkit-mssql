CREATE TABLE [workflow].[Workflow_ProcedureDependency_T_bidirectional_T] (
    [Workflow_id]                           INT              NOT NULL,
    [referenced_Procedure_RepoObject_guid]  UNIQUEIDENTIFIER NOT NULL,
    [referencing_Procedure_RepoObject_guid] UNIQUEIDENTIFIER NOT NULL,
    [referenced_RepoObject_fullname]        NVARCHAR (261)   NOT NULL,
    [referencing_RepoObject_fullname]       NVARCHAR (261)   NOT NULL,
    [is_inactive]                           BIT              CONSTRAINT [DF_Workflow_ProcedureDependency_T_bidirectional_T_is_active] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Workflow_ProcedureDependency_T_bidirectional_T] PRIMARY KEY CLUSTERED ([Workflow_id] ASC, [referenced_Procedure_RepoObject_guid] ASC, [referencing_Procedure_RepoObject_guid] ASC)
);








GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '78e72f09-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T', @level2type = N'CONSTRAINT', @level2name = N'PK_Workflow_ProcedureDependency_T_bidirectional_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7be72f09-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T', @level2type = N'CONSTRAINT', @level2name = N'DF_Workflow_ProcedureDependency_T_bidirectional_T_is_active';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '77e72f09-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '796d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T', @level2type = N'COLUMN', @level2name = N'Workflow_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7d6d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7b6d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T', @level2type = N'COLUMN', @level2name = N'referencing_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7c6d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7a6d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T', @level2type = N'COLUMN', @level2name = N'referenced_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7e6d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T', @level2type = N'COLUMN', @level2name = N'is_inactive';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T', @level2type = N'CONSTRAINT', @level2name = N'PK_Workflow_ProcedureDependency_T_bidirectional_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T', @level2type = N'CONSTRAINT', @level2name = N'PK_Workflow_ProcedureDependency_T_bidirectional_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T', @level2type = N'CONSTRAINT', @level2name = N'DF_Workflow_ProcedureDependency_T_bidirectional_T_is_active';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T', @level2type = N'CONSTRAINT', @level2name = N'DF_Workflow_ProcedureDependency_T_bidirectional_T_is_active';


GO
EXECUTE sp_addextendedproperty @name = N'usp_persistence_RepoObject_guid', @value = N'62C3E5CB-C6FD-EB11-850F-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [workflow].[Workflow_ProcedureDependency_T_bidirectional]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'Workflow_id,referenced_Procedure_RepoObject_guid,referencing_Procedure_RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'int,uniqueidentifier,uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'78E72F09-C5FD-EB11-850F-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_xref', @value = N'xref:workflow.Workflow_ProcedureDependency_T_bidirectional.adoc[]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_guid', @value = N'7FE72F09-C5FD-EB11-850F-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_fullname2', @value = N'workflow.Workflow_ProcedureDependency_T_bidirectional', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_fullname', @value = N'[workflow].[Workflow_ProcedureDependency_T_bidirectional]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'1', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_update_changed', @value = N'1', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_truncate', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_insert', @value = N'1', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_missing', @value = N'1', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_changed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_for_empty_source', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_duplicate_per_pk', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence', @value = N'1', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T';


GO
EXECUTE sp_addextendedproperty @name = N'has_history_columns', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T';


GO
EXECUTE sp_addextendedproperty @name = N'has_history', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T';


GO



GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:workflow.Workflow_ProcedureDependency_T_bidirectional.adoc[]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [workflow].[Workflow_ProcedureDependency_T_bidirectional].[Workflow_id]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T', @level2type = N'COLUMN', @level2name = N'Workflow_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [workflow].[Workflow_ProcedureDependency_T_bidirectional].[referencing_RepoObject_fullname]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname';


GO



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [workflow].[Workflow_ProcedureDependency_T_bidirectional].[referencing_Procedure_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T', @level2type = N'COLUMN', @level2name = N'referencing_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [workflow].[Workflow_ProcedureDependency_T_bidirectional].[referenced_RepoObject_fullname]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_fullname';


GO



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [workflow].[Workflow_ProcedureDependency_T_bidirectional].[referenced_Procedure_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T', @level2type = N'COLUMN', @level2name = N'referenced_Procedure_RepoObject_guid';

