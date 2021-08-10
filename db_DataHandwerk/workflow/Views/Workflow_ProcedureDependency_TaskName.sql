Create View workflow.Workflow_ProcedureDependency_TaskName
As
Select
    T1.Workflow_id
  , T1.referenced_Procedure_RepoObject_guid
  , T1.referencing_Procedure_RepoObject_guid
  , ro1.RepoObject_fullname2                       As referenced_RepoObject_fullname2
  , ro2.RepoObject_fullname2                       As referencing_RepoObject_fullname2
  , Replace ( ro1.RepoObject_fullname2, '.', '_' ) As referenced_TaskName
  , Replace ( ro2.RepoObject_fullname2, '.', '_' ) As referencing_TaskName
From
    workflow.Workflow_ProcedureDependency_wo_redundant As T1
    Inner Join
        repo.RepoObject                                As ro1
            On
            T1.referenced_Procedure_RepoObject_guid  = ro1.RepoObject_guid

    Inner Join
        repo.RepoObject                                As ro2
            On
            T1.referencing_Procedure_RepoObject_guid = ro2.RepoObject_guid;