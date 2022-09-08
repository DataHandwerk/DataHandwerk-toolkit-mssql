
CREATE View workflow.Biml_Project
As
Select
    Project_Biml = Concat (
                              '<Biml xmlns="http://schemas.varigence.com/biml.xsd">
    <Projects>
        <PackageProject Name="SSIS_EventAnalytics_v2">
            <Packages>
'
                            , String_Agg (
                                             Cast('<Package PackageName="' As NVarchar(Max)) + T2.Package_Name + '" />'
                                           , Char ( 13 ) + Char ( 10 )
                                         ) Within Group(Order By
                                                            T2.Package_Name)
                            , '
            </Packages>
            <Connections>
'
                            , Max ( T1.ConnectionName_Biml )
                            , '
            </Connections>
        </PackageProject>
    </Projects>
    <Connections>
'
                            , Max ( T1.ConnectionString_Biml )
                            , '
    </Connections>
    <Packages>
'
                            , String_Agg ( Cast(T2.Package_Biml As NVarchar(Max)), Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                                               T2.Package_Name)
                            , '    

    </Packages>
</Biml>
'
                          )
From
    workflow.Biml_Connection As T1
  , workflow.Biml_Package As T2
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b166a0a8-e3fa-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Project';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8c448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Project', @level2type = N'COLUMN', @level2name = N'Project_Biml';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [workflow].[Biml_Connection]
* [workflow].[Biml_Package]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Project';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Project';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Project';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:workflow.Biml_Connection.adoc[]
* xref:workflow.Biml_Package.adoc[]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Project';

