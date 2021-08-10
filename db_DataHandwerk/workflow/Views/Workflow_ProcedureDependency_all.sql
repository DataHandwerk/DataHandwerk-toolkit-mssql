
/*
<<property_start>>MS_Description
per active Workflow all active ProcedureDependency, including redundant references

.redundant references
====
are to be preserved:

* A <= B
* B <= C
* C <= D

redundant:

* A <= C
* A <= D
* B <= C
====
<<property_end>>
*/
CREATE VIEW [workflow].[Workflow_ProcedureDependency_all]
As
Select
    T1.id As Workflow_id
  , T5.referenced_Procedure_RepoObject_guid
  , T5.referencing_Procedure_RepoObject_guid
From
    workflow.Workflow                As T1
    Inner Join
        workflow.WorkflowStep_active As T3
            On
            T1.id                            = T3.Workflow_id

    Inner Join
        workflow.WorkflowStep_active As T4
            On
            T1.id                            = T4.Workflow_id

    Inner Join
        workflow.ProcedureDependency As T5
            On
            T3.Procedure_RepoObject_guid     = T5.referenced_Procedure_RepoObject_guid
            And T4.Procedure_RepoObject_guid = T5.referencing_Procedure_RepoObject_guid
Where
    ( T1.is_active     = 1 )
    And ( T5.is_active = 1 );