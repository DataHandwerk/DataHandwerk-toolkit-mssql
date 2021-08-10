/*active workflows and active steps*/
Create View workflow.WorkflowStep_active
As
Select
    T1.Workflow_id
  , T2.Name As Workflow_Name
  , T1.Procedure_RepoObject_guid
From
    workflow.WorkflowStep As T1
    Inner Join
        workflow.Workflow As T2
            On
            T1.Workflow_id = T2.id
Where
    ( T1.is_active     = 1 )
    And ( T2.is_active = 1 );