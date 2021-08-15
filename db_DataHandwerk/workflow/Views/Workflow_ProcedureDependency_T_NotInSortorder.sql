

/*
workflow.Workflow_ProcedureDependency_T not redundant entries not yet processed into workflow.WorkflowStep_Sortorder
*/
CREATE View [workflow].[Workflow_ProcedureDependency_T_NotInSortorder]
As
Select
    Workflow_id
  , referenced_Procedure_RepoObject_guid
  , referencing_Procedure_RepoObject_guid
--, is_redundant
From
    workflow.Workflow_ProcedureDependency_T_active As T1
Where
    T1.is_redundant = 0
    And Not Exists
(
    Select
        1 As Expr1
    From
        workflow.WorkflowStep_Sortorder As T2
    Where
        ( Workflow_id                   = T1.Workflow_id )
        And ( Procedure_RepoObject_guid = T1.referencing_Procedure_RepoObject_guid )
)

    --
    And Not Exists
(
    Select
        1 As Expr1
    From
        workflow.WorkflowStep_Sortorder As T2
    Where
        ( Workflow_id                   = T1.Workflow_id )
        And ( Procedure_RepoObject_guid = T1.referenced_Procedure_RepoObject_guid )
);
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '80e72f09-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_NotInSortorder';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a86d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_NotInSortorder', @level2type = N'COLUMN', @level2name = N'Workflow_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aa6d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_NotInSortorder', @level2type = N'COLUMN', @level2name = N'referencing_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a96d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_NotInSortorder', @level2type = N'COLUMN', @level2name = N'referenced_Procedure_RepoObject_guid';

