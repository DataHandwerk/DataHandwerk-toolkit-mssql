/*potential workflow steps, based on all usp_persistence_RepoObject_guid*/
Create View [workflow].[WorkflowStep_S]
As
Select
    Distinct
    [Workflow_id]               = T1.id
  , [Procedure_RepoObject_guid] = T2.usp_persistence_RepoObject_guid
From
    [workflow].[Workflow] T1
  , [repo].[RepoObject_gross] T2
Where
    T1.is_active = 1
    And Not usp_persistence_RepoObject_guid Is Null;