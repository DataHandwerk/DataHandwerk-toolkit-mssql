



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
CREATE View workflow.Workflow_ProcedureDependency
As
Select
    Workflow_id = T1.id
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
    ( T1.is_active                              = 1 )
    And ( T5.is_active                          = 1 )
    And T5.referenced_Procedure_RepoObject_guid <> T5.referencing_Procedure_RepoObject_guid
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '61448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency', @level2type = N'COLUMN', @level2name = N'referencing_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '60448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency', @level2type = N'COLUMN', @level2name = N'referenced_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5f448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency', @level2type = N'COLUMN', @level2name = N'Workflow_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ac66a0a8-e3fa-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency';

