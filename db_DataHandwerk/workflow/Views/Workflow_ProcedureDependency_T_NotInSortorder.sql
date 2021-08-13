
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
    workflow.Workflow_ProcedureDependency_T As T1
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