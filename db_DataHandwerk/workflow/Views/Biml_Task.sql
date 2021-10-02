
CREATE View workflow.Biml_Task
As
Select
    T1.Workflow_id
  , T1.Workflow_Name
  , T1.Procedure_RepoObject_guid
  , ro1.RepoObject_fullname2
  , TaskName = Replace ( ro1.RepoObject_fullname2, '.', '_' )
  , TaskBiml =
  /*
                  <ExecuteSQL Name="usp_PERSIST_ModellRessource_T" ConnectionName="target">
                    <PrecedenceConstraints>
                        <Inputs>
                            <Input OutputPathName="mod_ModellRessource.Output" />
                        </Inputs>
                    </PrecedenceConstraints>
                    <DirectInput>EXEC [modT].[usp_PERSIST_ModellRessource_T]
					</DirectInput>
                </ExecuteSQL>
*/
  Concat ( --
             Cast('  <ExecuteSQL Name="' As NVarchar(Max))
           , Replace ( ro1.RepoObject_fullname2, '.', '_' )
           , '" ConnectionName="target">'
           , Char ( 13 ) + Char ( 10 )
           , pc.PrecedenceConstraints
           , '    <DirectInput>EXEC '
           , ro1.RepoObject_fullname
           , Char ( 13 ) + Char ( 10 )
           , '    </DirectInput>'
           , Char ( 13 ) + Char ( 10 )
           , '  </ExecuteSQL>'
         )
From
    workflow.WorkflowStep_active            As T1
    Inner Join
        repo.RepoObject                     As ro1
            On
            T1.Procedure_RepoObject_guid                 = ro1.RepoObject_guid

    Left Join
        workflow.Biml_PrecedenceConstraints As pc
            On
            pc.Workflow_id                               = T1.Workflow_id
            And pc.referencing_Procedure_RepoObject_guid = T1.Procedure_RepoObject_guid
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a5bcd983-91fa-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Task';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '63448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Task', @level2type = N'COLUMN', @level2name = N'Workflow_Name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '62448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Task', @level2type = N'COLUMN', @level2name = N'Workflow_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '66448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Task', @level2type = N'COLUMN', @level2name = N'TaskName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '67448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Task', @level2type = N'COLUMN', @level2name = N'TaskBiml';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '65448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Task', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '64448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Task', @level2type = N'COLUMN', @level2name = N'Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[RepoObject]
* [workflow].[Biml_PrecedenceConstraints]
* [workflow].[WorkflowStep_active]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Task';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Task';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Task';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:workflow.Biml_Package.adoc[]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Task';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.RepoObject.adoc[]
* xref:workflow.Biml_PrecedenceConstraints.adoc[]
* xref:workflow.WorkflowStep_active.adoc[]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Task';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [workflow].[WorkflowStep_active].[Workflow_Name]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Task', @level2type = N'COLUMN', @level2name = N'Workflow_Name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [workflow].[WorkflowStep_active].[Workflow_id]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Task', @level2type = N'COLUMN', @level2name = N'Workflow_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_fullname2]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Task', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [workflow].[WorkflowStep_active].[Procedure_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Task', @level2type = N'COLUMN', @level2name = N'Procedure_RepoObject_guid';

