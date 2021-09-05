

CREATE View workflow.Biml_Package
As
Select
    T1.id
  , Package_Name        = Max ( T1.Name )
  , Package_Description = Max ( T1.Description )
  , Package_Biml        =
  --
  Coalesce (
               Max ( T1.Package_Biml )
             , Concat (
                          '<Package Name="'
                        , Max ( T1.Name )
                        , '" Language="None">'
                        , Char ( 13 ) + Char ( 10 )
                        , '<Tasks>'
                        , Char ( 13 ) + Char ( 10 )
                        , String_Agg ( T2.TaskBiml, Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                T2.TaskBiml)
                        , Char ( 13 ) + Char ( 10 )
                        , '</Tasks>'
                        , Char ( 13 ) + Char ( 10 )
                        , '</Package>'
                      )
           )
From
    workflow.Workflow      As T1
    Left Join
        workflow.Biml_Task As T2
            On
            T2.Workflow_id = T1.id
Where
    T1.is_active = 1
Group By
    T1.id
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a6bcd983-91fa-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Package';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '69448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Package', @level2type = N'COLUMN', @level2name = N'Package_Name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6a448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Package', @level2type = N'COLUMN', @level2name = N'Package_Description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6b448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Package', @level2type = N'COLUMN', @level2name = N'Package_Biml';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '68448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Package', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [workflow].[Biml_Task]
* [workflow].[Workflow]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Package';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Package';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Package';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:workflow.Biml_Project.adoc[]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Package';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:workflow.Biml_Task.adoc[]
* xref:workflow.Workflow.adoc[]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Package';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [workflow].[Workflow].[id]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Package', @level2type = N'COLUMN', @level2name = N'id';

