Create View workflow.Workflow_ProcedureDependency_wo_redundant
As
Select
    T1.Workflow_id
  , T1.referenced_Procedure_RepoObject_guid
  , T1.referencing_Procedure_RepoObject_guid
From
    workflow.Workflow_ProcedureDependency_all T1
Except
(Select
     T1.Workflow_id
   , T1.referenced_Procedure_RepoObject_guid
   , T1.referencing_Procedure_RepoObject_guid
 From
     workflow.Workflow_ProcedureDependency_redundant T1);