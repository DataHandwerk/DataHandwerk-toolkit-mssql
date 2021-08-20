


CREATE View workflow.Workflow_UspList
As
Select
    ws.Workflow_id
  , Workflow_Name = Max ( w.Name )
  , UspList       = String_Agg (
                                   Cast('EXECUTE ' As NVarchar(Max)) + ro.RepoObject_fullname + ' @execution_instance_guid;'
                                 , Char ( 13 ) + Char ( 10 )
                               ) Within Group(Order By
                                                  ws.Sortorder)
From
    workflow.WorkflowStep_Sortorder As ws
    Inner Join
        workflow.Workflow           As w
            On
            ws.Workflow_id               = w.id

    Inner Join
        repo.RepoObject             As ro
            On
            ws.Procedure_RepoObject_guid = ro.RepoObject_guid
Group By
    ws.Workflow_id