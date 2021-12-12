

/*potential workflow steps, based on all usp_persistence_RepoObject_guid*/
CREATE View workflow.WorkflowStep_src
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
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '86448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_src', @level2type = N'COLUMN', @level2name = N'Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '85448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_src', @level2type = N'COLUMN', @level2name = N'Workflow_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = N'4db8c8a5-cef9-eb11-850d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_src';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[RepoObject_gross]
* [workflow].[Workflow]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_src';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'Workflow_id,Procedure_RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_src';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'int,uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_src';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'1D20D677-40FB-EB11-850E-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_src';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_src';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_src';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:workflow.usp_PERSIST_WorkflowStep.adoc[]
* xref:workflow.WorkflowStep.adoc[]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_src';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.RepoObject_gross.adoc[]
* xref:workflow.Workflow.adoc[]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'WorkflowStep_src';

