
CREATE View workflow.Workflow_ProcedureDependency_wo_redundant
As
Select
    T1.Workflow_id
  , T1.referenced_Procedure_RepoObject_guid
  , T1.referencing_Procedure_RepoObject_guid
From
    workflow.Workflow_ProcedureDependency_all As T1
Except
(Select
     T1.Workflow_id
   , T1.referenced_Procedure_RepoObject_guid
   , T1.referencing_Procedure_RepoObject_guid
 From
     workflow.Workflow_ProcedureDependency_T_redundant As T1)
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a2bcd983-91fa-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_wo_redundant';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '75448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_wo_redundant', @level2type = N'COLUMN', @level2name = N'Workflow_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '77448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_wo_redundant', @level2type = N'COLUMN', @level2name = N'referencing_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '76448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_wo_redundant', @level2type = N'COLUMN', @level2name = N'referenced_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [workflow].[Workflow_ProcedureDependency_all]
* [workflow].[Workflow_ProcedureDependency_T_redundant]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_wo_redundant';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_wo_redundant';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_wo_redundant';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:workflow.Workflow_ProcedureDependency_all.adoc[]
* xref:workflow.Workflow_ProcedureDependency_T_redundant.adoc[]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_wo_redundant';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [workflow].[Workflow_ProcedureDependency_all].[Workflow_id]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_wo_redundant', @level2type = N'COLUMN', @level2name = N'Workflow_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [workflow].[Workflow_ProcedureDependency_all].[referencing_Procedure_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_wo_redundant', @level2type = N'COLUMN', @level2name = N'referencing_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [workflow].[Workflow_ProcedureDependency_all].[referenced_Procedure_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_wo_redundant', @level2type = N'COLUMN', @level2name = N'referenced_Procedure_RepoObject_guid';

