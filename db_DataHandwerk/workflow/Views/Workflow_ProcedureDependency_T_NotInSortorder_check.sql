
/*
This view must be empty after calling [workflow].[usp_workflow], +
because all entries from workflow.Workflow_ProcedureDependency_T_NotInSortorder must be transferred to workflow.WorkflowStep_Sortorder.

If there are still entries here, then 

* the content of [workflow].[Workflow_ProcedureDependency_T_bidirectional] must be checked.
* Entries in [workflow].[WorkflowStep] should then be marked with [is_PossibleReferenced] = 1.

*/
CREATE View workflow.Workflow_ProcedureDependency_T_NotInSortorder_check
As
Select
    T1.Workflow_id
  , T1.referenced_Procedure_RepoObject_guid
  , T1.referencing_Procedure_RepoObject_guid
  , RepoObject_fullname_1 = ro1.RepoObject_fullname
  , RepoObject_fullname_2 = ro2.RepoObject_fullname
From
    workflow.Workflow_ProcedureDependency_T_NotInSortorder As T1
    Inner Join
        repo.RepoObject                                    As ro1
            On
            T1.referenced_Procedure_RepoObject_guid  = ro1.RepoObject_guid

    Inner Join
        repo.RepoObject                                    As ro2
            On
            T1.referencing_Procedure_RepoObject_guid = ro2.RepoObject_guid
--Order By
--    T1.Workflow_id
--  , ro2.RepoObject_fullname
--  , ro1.RepoObject_fullname;