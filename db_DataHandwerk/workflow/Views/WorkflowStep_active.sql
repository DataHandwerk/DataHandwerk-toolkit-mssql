

/*active workflows and active steps*/
CREATE View workflow.WorkflowStep_active
As
Select
    T1.Workflow_id
  , Workflow_Name = T2.Name
  , T1.Procedure_RepoObject_guid
  , T1.is_PossibleReferenced
From
    workflow.WorkflowStep As T1
    Inner Join
        workflow.Workflow As T2
            On
            T1.Workflow_id = T2.id
Where
    ( T1.is_active     = 1 )
    And ( T2.is_active = 1 )
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '4cb8c8a5-cef9-eb11-850d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_active';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6d448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_active', @level2type = N'COLUMN', @level2name = N'Workflow_Name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6c448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_active', @level2type = N'COLUMN', @level2name = N'Workflow_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6e448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_active', @level2type = N'COLUMN', @level2name = N'Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'df1c2361-86fe-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_active', @level2type = N'COLUMN', @level2name = N'is_PossibleReferenced';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [workflow].[Workflow]
* [workflow].[WorkflowStep]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_active';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_active';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_active';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:workflow.Biml_Task.adoc[]
* xref:workflow.usp_workflow.adoc[]
* xref:workflow.Workflow_ProcedureDependency.adoc[]
* xref:workflow.Workflow_ProcedureDependency_all.adoc[]
* xref:workflow.Workflow_ProcedureDependency_T_active.adoc[]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_active';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:workflow.Workflow.adoc[]
* xref:workflow.WorkflowStep.adoc[]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_active';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [workflow].[Workflow].[Name]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_active', @level2type = N'COLUMN', @level2name = N'Workflow_Name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [workflow].[WorkflowStep].[Workflow_id]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_active', @level2type = N'COLUMN', @level2name = N'Workflow_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [workflow].[WorkflowStep].[Procedure_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_active', @level2type = N'COLUMN', @level2name = N'Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [workflow].[WorkflowStep].[is_PossibleReferenced]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_active', @level2type = N'COLUMN', @level2name = N'is_PossibleReferenced';

