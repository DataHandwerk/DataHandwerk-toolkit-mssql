
/*
This view must be empty after calling [workflow].[usp_workflow], +
because all entries from workflow.Workflow_ProcedureDependency_T_NotInSortorder must be transferred to workflow.WorkflowStep_Sortorder.

If there are still entries here, then 

* the content of [workflow].[Workflow_ProcedureDependency_T_bidirectional] must be checked.
* Entries in [workflow].[WorkflowStep] should then be marked with [is_PossibleReferenced] = 1.

*/
CREATE View workflow.Workflow_ProcedureDependency_T_NotInSortorder_check
As
Select
    T1.Workflow_id
  , T1.referenced_Procedure_RepoObject_guid
  , T1.referencing_Procedure_RepoObject_guid
  , RepoObject_fullname_1 = ro1.RepoObject_fullname
  , RepoObject_fullname_2 = ro2.RepoObject_fullname
From
    workflow.Workflow_ProcedureDependency_T_NotInSortorder As T1
    Inner Join
        repo.RepoObject                                    As ro1
            On
            T1.referenced_Procedure_RepoObject_guid  = ro1.RepoObject_guid

    Inner Join
        repo.RepoObject                                    As ro2
            On
            T1.referencing_Procedure_RepoObject_guid = ro2.RepoObject_guid
--Order By
--    T1.Workflow_id
--  , ro2.RepoObject_fullname
--  , ro1.RepoObject_fullname;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ba0bc0eb-b301-ec11-8510-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_NotInSortorder_check';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd32861f5-b301-ec11-8510-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_NotInSortorder_check', @level2type = N'COLUMN', @level2name = N'Workflow_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd72861f5-b301-ec11-8510-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_NotInSortorder_check', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname_2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd62861f5-b301-ec11-8510-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_NotInSortorder_check', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname_1';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd52861f5-b301-ec11-8510-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_NotInSortorder_check', @level2type = N'COLUMN', @level2name = N'referencing_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd42861f5-b301-ec11-8510-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_NotInSortorder_check', @level2type = N'COLUMN', @level2name = N'referenced_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[RepoObject]
* [workflow].[Workflow_ProcedureDependency_T_NotInSortorder]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_NotInSortorder_check';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_NotInSortorder_check';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_NotInSortorder_check';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.RepoObject.adoc[]
* xref:workflow.Workflow_ProcedureDependency_T_NotInSortorder.adoc[]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_NotInSortorder_check';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [workflow].[Workflow_ProcedureDependency_T_NotInSortorder].[Workflow_id]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_NotInSortorder_check', @level2type = N'COLUMN', @level2name = N'Workflow_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_fullname]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_NotInSortorder_check', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname_2';


GO



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_fullname]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_NotInSortorder_check', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname_1';


GO



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [workflow].[Workflow_ProcedureDependency_T_NotInSortorder].[referencing_Procedure_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_NotInSortorder_check', @level2type = N'COLUMN', @level2name = N'referencing_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [workflow].[Workflow_ProcedureDependency_T_NotInSortorder].[referenced_Procedure_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_NotInSortorder_check', @level2type = N'COLUMN', @level2name = N'referenced_Procedure_RepoObject_guid';

