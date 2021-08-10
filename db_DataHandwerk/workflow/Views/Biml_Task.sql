Create   View workflow.Biml_Task
As
Select
    T1.[Workflow_id]
  , T1.[Workflow_Name]
  , T1.[Procedure_RepoObject_guid]
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
    [workflow].[WorkflowStep_active]                        T1
    Inner Join
        repo.RepoObject                                     As ro1
            On
            T1.[Procedure_RepoObject_guid]               = ro1.RepoObject_guid

    Left Join
        workflow.Biml_PrecedenceConstraints pc
            On
            pc.Workflow_id                               = T1.[Workflow_id]
            And pc.referencing_Procedure_RepoObject_guid = T1.[Procedure_RepoObject_guid];