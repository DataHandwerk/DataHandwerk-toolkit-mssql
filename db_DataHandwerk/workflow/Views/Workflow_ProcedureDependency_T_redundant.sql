



/*
possible redundant references

we must not remove all of them at the same time, because some of them recognize each other as redundant. +
Therefore marking as `is_redundant` happens one by one for always only one reference by referencing_Procedure_RepoObject_guid

*/
CREATE View workflow.Workflow_ProcedureDependency_T_redundant
As
Select
    T1.Workflow_id
  , T1.referenced_Procedure_RepoObject_guid
  , T1.referencing_Procedure_RepoObject_guid
  , RownrPerReferencing = Row_Number () Over ( Partition By
                                                   T1.Workflow_id
                                                 , T1.referencing_Procedure_RepoObject_guid
                                               Order By
                                                   T1.referenced_Procedure_RepoObject_guid
                                             )
From
    workflow.Workflow_ProcedureDependency_T_active     As T1
    Inner Join
        workflow.Workflow_ProcedureDependency_T_active As T2
            On
            T1.Workflow_id                               = T2.Workflow_id
            And T1.referenced_Procedure_RepoObject_guid  = T2.referenced_Procedure_RepoObject_guid

    Inner Join
        workflow.Workflow_ProcedureDependency_T_active As T3
            On
            T1.Workflow_id                               = T3.Workflow_id
            And T1.referencing_Procedure_RepoObject_guid = T3.referencing_Procedure_RepoObject_guid
            And T2.referencing_Procedure_RepoObject_guid = T3.referenced_Procedure_RepoObject_guid
Where
    T1.is_redundant     = 0
    And T2.is_redundant = 0
    And T3.is_redundant = 0
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a1bcd983-91fa-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_redundant';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '72448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_redundant', @level2type = N'COLUMN', @level2name = N'Workflow_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '74448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_redundant', @level2type = N'COLUMN', @level2name = N'referencing_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '73448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_redundant', @level2type = N'COLUMN', @level2name = N'referenced_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e3adfba7-40fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_redundant', @level2type = N'COLUMN', @level2name = N'RownrPerReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [workflow].[Workflow_ProcedureDependency_T_active]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_redundant';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_redundant';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_redundant';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:workflow.usp_workflow.adoc[]
* xref:workflow.Workflow_ProcedureDependency_wo_redundant.adoc[]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_redundant';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:workflow.Workflow_ProcedureDependency_T_active.adoc[]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_redundant';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [workflow].[Workflow_ProcedureDependency_T_active].[Workflow_id]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_redundant', @level2type = N'COLUMN', @level2name = N'Workflow_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [workflow].[Workflow_ProcedureDependency_T_active].[referencing_Procedure_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_redundant', @level2type = N'COLUMN', @level2name = N'referencing_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [workflow].[Workflow_ProcedureDependency_T_active].[referenced_Procedure_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_redundant', @level2type = N'COLUMN', @level2name = N'referenced_Procedure_RepoObject_guid';

