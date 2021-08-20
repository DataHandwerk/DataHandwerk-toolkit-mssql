

CREATE View workflow.WorkflowStep_ForUpdate
As
Select
    ws.id
  , ws.Workflow_id
  , ws.Procedure_RepoObject_guid
  , ws.is_active
  , ws.is_PossibleReferenced
  , Workflow_Name = w.Name
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
            ws.Procedure_RepoObject_guid = ro.RepoObject_guid
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a0bcd983-91fa-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_ForUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '98448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_ForUpdate', @level2type = N'COLUMN', @level2name = N'Workflow_Name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '95448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_ForUpdate', @level2type = N'COLUMN', @level2name = N'Workflow_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '99448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_ForUpdate', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '96448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_ForUpdate', @level2type = N'COLUMN', @level2name = N'Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '97448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_ForUpdate', @level2type = N'COLUMN', @level2name = N'is_active';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '94448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_ForUpdate', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e01c2361-86fe-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_ForUpdate', @level2type = N'COLUMN', @level2name = N'is_PossibleReferenced';

