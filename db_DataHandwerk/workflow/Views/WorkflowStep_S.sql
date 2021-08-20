
/*potential workflow steps, based on all usp_persistence_RepoObject_guid*/
CREATE View workflow.WorkflowStep_S
As
Select
    Distinct
    Workflow_id               = T1.id
  , Procedure_RepoObject_guid = T2.usp_persistence_RepoObject_guid
From
    workflow.Workflow As T1
  , repo.RepoObject_gross As T2
Where
    T1.is_active = 1
    And Not T2.usp_persistence_RepoObject_guid Is Null
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '4db8c8a5-cef9-eb11-850d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_S';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '85448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_S', @level2type = N'COLUMN', @level2name = N'Workflow_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '86448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_S', @level2type = N'COLUMN', @level2name = N'Procedure_RepoObject_guid';

