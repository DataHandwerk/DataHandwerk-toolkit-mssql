CREATE TABLE [workflow].[WorkflowStep_Sortorder] (
    [Workflow_id]               INT              NOT NULL,
    [Procedure_RepoObject_guid] UNIQUEIDENTIFIER NOT NULL,
    [Sortorder]                 INT              IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_WorkflowStep_Sortorder] PRIMARY KEY CLUSTERED ([Workflow_id] ASC, [Procedure_RepoObject_guid] ASC) WITH (DATA_COMPRESSION = PAGE)
);








GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7ae72f09-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'WorkflowStep_Sortorder', @level2type = N'CONSTRAINT', @level2name = N'PK_WorkflowStep_Sortorder';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '79e72f09-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'WorkflowStep_Sortorder';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7f6d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'WorkflowStep_Sortorder', @level2type = N'COLUMN', @level2name = N'Workflow_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '816d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'WorkflowStep_Sortorder', @level2type = N'COLUMN', @level2name = N'Sortorder';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '806d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'WorkflowStep_Sortorder', @level2type = N'COLUMN', @level2name = N'Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'WorkflowStep_Sortorder', @level2type = N'CONSTRAINT', @level2name = N'PK_WorkflowStep_Sortorder';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'WorkflowStep_Sortorder', @level2type = N'CONSTRAINT', @level2name = N'PK_WorkflowStep_Sortorder';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'Workflow_id,Procedure_RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'WorkflowStep_Sortorder';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'int,uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'WorkflowStep_Sortorder';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'7AE72F09-C5FD-EB11-850F-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'WorkflowStep_Sortorder';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'WorkflowStep_Sortorder';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'WorkflowStep_Sortorder';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:workflow.usp_workflow.adoc[]
* xref:workflow.Workflow_ProcedureDependency_T_NotInSortorder.adoc[]
* xref:workflow.Workflow_UspList.adoc[]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'WorkflowStep_Sortorder';

