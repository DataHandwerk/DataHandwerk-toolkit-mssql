Create View workflow.Biml_Package
As
Select
    T1.[id]
  , Package_Name        = Max ( T1.[Name] )
  , Package_Description = Max ( T1.[Description] )
  , Package_Biml        = Concat (
                                     '<Package Name="'
                                   , Max ( T1.[Name] )
                                   , '" Language="None">'
                                   , Char ( 13 ) + Char ( 10 )
                                   , '<Tasks>'
                                   , Char ( 13 ) + Char ( 10 )
                                   , String_Agg ( T2.TaskBiml, Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                           TaskBiml)
                                   , Char ( 13 ) + Char ( 10 )
                                   , '</Tasks>'
                                   , Char ( 13 ) + Char ( 10 )
                                   , '</Package>'
                                 )
From
    [workflow].[Workflow]          T1
    Left Join
        workflow.Biml_Task T2
            On
            T2.[Workflow_id] = T1.[id]
Where
    T1.[is_active] = 1
Group By
    T1.[id];