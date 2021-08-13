/*
bi-directional relations between procedures
they needs to be excluded to avoid circular references in SSIS packages or in procedure calls
we need to exclude one of them in earlier steps to make this view here empty
*/
Create View workflow.[Workflow_ProcedureDependency_T_bidirectional]
As
Select
    T1.Workflow_id
  , T1.referencing_Procedure_RepoObject_guid
  , T1.referenced_Procedure_RepoObject_guid
  , ro1.RepoObject_fullname As referencing_RepoObject_fullname
  , ro2.RepoObject_fullname As referenced_RepoObject_fullname
From
    workflow.Workflow_ProcedureDependency_T     As T1
    Inner Join
        workflow.Workflow_ProcedureDependency_T As T2
            On
            T1.Workflow_id                               = T2.Workflow_id
            And T1.referencing_Procedure_RepoObject_guid = T2.referenced_Procedure_RepoObject_guid
            And T1.referenced_Procedure_RepoObject_guid  = T2.referencing_Procedure_RepoObject_guid

    Inner Join
        repo.RepoObject                         As ro1
            On
            T1.referencing_Procedure_RepoObject_guid     = ro1.RepoObject_guid

    Inner Join
        repo.RepoObject                         As ro2
            On
            T1.referenced_Procedure_RepoObject_guid      = ro2.RepoObject_guid;