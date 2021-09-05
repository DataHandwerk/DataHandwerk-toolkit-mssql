


CREATE View workflow.Workflow_UspList
As
Select
    ws.Workflow_id
  , Workflow_Name = Max ( w.Name )
  , UspList       = String_Agg (
                                   Cast('EXECUTE ' As NVarchar(Max)) + ro.RepoObject_fullname + ' @execution_instance_guid;'
                                 , Char ( 13 ) + Char ( 10 )
                               ) Within Group(Order By
                                                  ws.Sortorder)
From
    workflow.WorkflowStep_Sortorder As ws
    Inner Join
        workflow.Workflow           As w
            On
            ws.Workflow_id               = w.id

    Inner Join
        repo.RepoObject             As ro
            On
            ws.Procedure_RepoObject_guid = ro.RepoObject_guid
Group By
    ws.Workflow_id
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'bb0bc0eb-b301-ec11-8510-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_UspList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd92861f5-b301-ec11-8510-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_UspList', @level2type = N'COLUMN', @level2name = N'Workflow_Name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd82861f5-b301-ec11-8510-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_UspList', @level2type = N'COLUMN', @level2name = N'Workflow_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'da2861f5-b301-ec11-8510-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_UspList', @level2type = N'COLUMN', @level2name = N'UspList';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[RepoObject]
* [workflow].[Workflow]
* [workflow].[WorkflowStep_Sortorder]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_UspList';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_UspList';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_UspList';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:workflow.Workflow_SqlUsp.adoc[]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_UspList';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.RepoObject.adoc[]
* xref:workflow.Workflow.adoc[]
* xref:workflow.WorkflowStep_Sortorder.adoc[]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_UspList';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [workflow].[WorkflowStep_Sortorder].[Workflow_id]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_UspList', @level2type = N'COLUMN', @level2name = N'Workflow_id';

