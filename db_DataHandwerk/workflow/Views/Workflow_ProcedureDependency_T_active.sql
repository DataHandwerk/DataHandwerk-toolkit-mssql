
/*
in case of cyclic references it is possible to set [workflow].[WorkflowStep].[is_PossibleReferenced] = 0 to avoid the usage as referenced procedure in worklow sortorder definition


--alt
Select
    T1.Workflow_id
  , T1.referenced_Procedure_RepoObject_guid
  , T1.referencing_Procedure_RepoObject_guid
  , T1.is_redundant
From
    workflow.Workflow_ProcedureDependency_T                     As T1
    Left Outer Join
        workflow.Workflow_ProcedureDependency_T_bidirectional_T As T2
            On
            T1.Workflow_id                               = T2.Workflow_id
            And T1.referenced_Procedure_RepoObject_guid  = T2.referenced_Procedure_RepoObject_guid
            And T1.referencing_Procedure_RepoObject_guid = T2.referencing_Procedure_RepoObject_guid
Where
    IsNull ( T2.is_inactive, 0 ) = 0;

*/
CREATE View workflow.Workflow_ProcedureDependency_T_active
As
Select
    T1.Workflow_id
  , T1.referenced_Procedure_RepoObject_guid
  , T1.referencing_Procedure_RepoObject_guid
  , T1.is_redundant
From
    workflow.Workflow_ProcedureDependency_T As T1
    Left Outer Join
        workflow.WorkflowStep_active        As T2
            On
            T1.Workflow_id                              = T2.Workflow_id
            And T1.referenced_Procedure_RepoObject_guid = T2.Procedure_RepoObject_guid
Where
    T2.is_PossibleReferenced = 1
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7ee72f09-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_active';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9f6d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_active', @level2type = N'COLUMN', @level2name = N'Workflow_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a16d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_active', @level2type = N'COLUMN', @level2name = N'referencing_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a06d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_active', @level2type = N'COLUMN', @level2name = N'referenced_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a26d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_active', @level2type = N'COLUMN', @level2name = N'is_redundant';

