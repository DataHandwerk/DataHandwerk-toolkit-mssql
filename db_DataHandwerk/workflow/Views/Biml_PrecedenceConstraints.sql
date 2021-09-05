
CREATE View workflow.Biml_PrecedenceConstraints
As
Select
    Workflow_id
  , referencing_Procedure_RepoObject_guid
  , referencing_TaskName  = Max ( referencing_TaskName )
  , PrecedenceConstraints =
  --
  '    <PrecedenceConstraints>' + Char ( 13 ) + Char ( 10 ) + '      <Inputs>' + Char ( 13 ) + Char ( 10 )
  + String_Agg ( '        <Input OutputPathName="' + referenced_TaskName + '.Output" />', Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                                                      referenced_TaskName)
  + Char ( 13 ) + Char ( 10 ) + '      </Inputs>' + Char ( 13 ) + Char ( 10 ) + '    </PrecedenceConstraints>'
  + Char ( 13 ) + Char ( 10 )
From
    workflow.Workflow_ProcedureDependency_T_TaskName
Group By
    Workflow_id
  , referencing_Procedure_RepoObject_guid
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a4bcd983-91fa-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_PrecedenceConstraints';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5b448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_PrecedenceConstraints', @level2type = N'COLUMN', @level2name = N'Workflow_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5d448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_PrecedenceConstraints', @level2type = N'COLUMN', @level2name = N'referencing_TaskName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5c448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_PrecedenceConstraints', @level2type = N'COLUMN', @level2name = N'referencing_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5e448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_PrecedenceConstraints', @level2type = N'COLUMN', @level2name = N'PrecedenceConstraints';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [workflow].[Workflow_ProcedureDependency_T_TaskName]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_PrecedenceConstraints';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_PrecedenceConstraints';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_PrecedenceConstraints';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:workflow.Biml_Task.adoc[]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_PrecedenceConstraints';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:workflow.Workflow_ProcedureDependency_T_TaskName.adoc[]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_PrecedenceConstraints';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [workflow].[Workflow_ProcedureDependency_T_TaskName].[Workflow_id]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_PrecedenceConstraints', @level2type = N'COLUMN', @level2name = N'Workflow_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [workflow].[Workflow_ProcedureDependency_T_TaskName].[referencing_TaskName]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_PrecedenceConstraints', @level2type = N'COLUMN', @level2name = N'referencing_TaskName';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [workflow].[Workflow_ProcedureDependency_T_TaskName].[referencing_Procedure_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_PrecedenceConstraints', @level2type = N'COLUMN', @level2name = N'referencing_Procedure_RepoObject_guid';

