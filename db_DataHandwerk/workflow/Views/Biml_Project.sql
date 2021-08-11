
create View [workflow].[Biml_Project]
As
Select
    Project_Biml = Concat (
                              '<Biml xmlns="http://schemas.varigence.com/biml.xsd">
    <Projects>
        <PackageProject Name="SSIS_EventAnalytics_v2">
            <Packages>
'
                            , String_Agg (
                                             '<Package PackageName="' + T2.[Package_Name] + '" />'
                                           , Char ( 13 ) + Char ( 10 )
                                         ) Within Group(Order By
                                                            T2.[Package_Name])
                            , '
            </Packages>
            <Connections>
'
                            , Max ( T1.[ConnectionName_Biml] )
                            , '
            </Connections>
        </PackageProject>
    </Projects>
    <Connections>
'
                            , Max ( T1.[ConnectionString_Biml] )
                            , '
    </Connections>
    <Packages>
'
                            , String_Agg ( T2.[Package_Biml], Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                          T2.[Package_Name])
                            , '    

    </Packages>
</Biml>
'
                          )
From
    [workflow].[Biml_Connection] T1
  , [workflow].[Biml_Package] T2;