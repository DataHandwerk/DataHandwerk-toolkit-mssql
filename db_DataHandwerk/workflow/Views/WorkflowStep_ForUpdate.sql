Create View workflow.WorkflowStep_ForUpdate
As
Select
    ws.id
  , ws.Workflow_id
  , ws.Procedure_RepoObject_guid
  , ws.is_active
  , w.Name As Workflow_Name
  , ro.RepoObject_fullname
From
    workflow.WorkflowStep As ws
    Inner Join
        workflow.Workflow As w
            On
            ws.Workflow_id               = w.id

    Inner Join
        repo.RepoObject   As ro
            On
            ws.Procedure_RepoObject_guid = ro.RepoObject_guid;