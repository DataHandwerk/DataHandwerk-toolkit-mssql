Create View workflow.Workflow_ProcedureDependency_redundant
As
Select
    Distinct
    T1.Workflow_id
  , T1.referenced_Procedure_RepoObject_guid
  , T1.referencing_Procedure_RepoObject_guid
From
    workflow.Workflow_ProcedureDependency_all     As T1
    Inner Join
        workflow.Workflow_ProcedureDependency_all As T2
            On
            T1.Workflow_id                               = T2.Workflow_id
            And T1.referenced_Procedure_RepoObject_guid  = T2.referenced_Procedure_RepoObject_guid

    Inner Join
        workflow.Workflow_ProcedureDependency_all As T3
            On
            T1.Workflow_id                               = T3.Workflow_id
            And T1.referencing_Procedure_RepoObject_guid = T3.referencing_Procedure_RepoObject_guid
            And T2.referencing_Procedure_RepoObject_guid = T3.referenced_Procedure_RepoObject_guid;