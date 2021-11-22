
CREATE View docs.ssis_PumlPackage
As
Select
    pt.AntoraModule
  , pt.PackageName
  , PumlPackageControlFlows =
  --
  Concat (
             '@startuml'
           , Char ( 13 ) + Char ( 10 )
           , '
package "'
             --
             +          pt.PackageName + '" {
'
           --
           , String_Agg ( Cast(N'' As NVarchar(Max)) + pt.PumlPartialTaskComponent, Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                                                pt.TaskPath)
           , '
}
'
           -- relations
           , Char ( 13 ) + Char ( 10 )
           , Max ( pf.PumlPartialControlFlows )
           --
           , Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
             + Max ( puml_skinparam_component.Parameter_value_result ) + Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 ) + Max ( puml_footer.Parameter_value_result )
             + Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 ) + '@enduml' + Char ( 13 ) + Char ( 10 )
         )
From
    docs.ssis_PumlPartialTaskComponent                                         As pt
    Left Join
        docs.ssis_PumlPartialControlFlows                                      As pf
            On
            pf.AntoraModule = pt.AntoraModule
            And pf.PackageName = pt.PackageName
    Cross Join config.ftv_get_parameter_value ( 'puml_footer', 'interactive' ) As puml_footer
    Cross Join config.ftv_get_parameter_value ( 'puml_skinparam_component', 'ssis_task' ) As puml_skinparam_component
Group By
    pt.AntoraModule
  , pt.PackageName
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '999c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlPackage', @level2type = N'COLUMN', @level2name = N'PumlPackageControlFlows';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '989c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlPackage', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '979c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlPackage', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'bedcad7f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlPackage';

