
/*active workflows and active steps*/
CREATE View [workflow].[WorkflowStep_active]
As
Select
    T1.Workflow_id
  , T2.Name As Workflow_Name
  , T1.Procedure_RepoObject_guid
  , T1.[is_PossibleReferenced]
From
    workflow.WorkflowStep As T1
    Inner Join
        workflow.Workflow As T2
            On
            T1.Workflow_id = T2.id
Where
    ( T1.is_active     = 1 )
    And ( T2.is_active = 1 );
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '4cb8c8a5-cef9-eb11-850d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_active';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6d448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_active', @level2type = N'COLUMN', @level2name = N'Workflow_Name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6c448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_active', @level2type = N'COLUMN', @level2name = N'Workflow_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6e448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_active', @level2type = N'COLUMN', @level2name = N'Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'df1c2361-86fe-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_active', @level2type = N'COLUMN', @level2name = N'is_PossibleReferenced';

