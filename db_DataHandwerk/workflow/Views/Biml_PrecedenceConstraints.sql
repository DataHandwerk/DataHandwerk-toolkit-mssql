Create   View workflow.Biml_PrecedenceConstraints
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
    workflow.Workflow_ProcedureDependency_TaskName
Group By
    Workflow_id
  , referencing_Procedure_RepoObject_guid;