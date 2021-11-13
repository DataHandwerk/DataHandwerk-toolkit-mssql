
CREATE View docs.ssis_PumlDftTask
As
Select
    T1.AntoraModule
  , T1.PackageName
  , T1.TaskPath
  , PumlDftTask =
  --
  Concat (
             Cast(N'' As NVarchar(Max))
           , '@startuml
'
           , 'frame "' + T1.TaskPath + '" {
'
           , String_Agg ( Cast(T2.PumlPartialDftComponent As NVarchar(Max)), Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                                         T1.Component_refId)
           , '
}

'
           , Max ( T3.PumlPartialDataFlow )
           --
           , Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 ) + Max ( puml_footer.Parameter_value_result )
             + Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 ) + '@enduml' + Char ( 13 ) + Char ( 10 )
         )
From
    ssis.PackageTask_Dft_Component                                             As T1
    Left Join
        docs.ssis_PumlPartialDftComponent                                      As T2
            On
            T2.AntoraModule = T1.AntoraModule
            And T2.PackageName = T1.PackageName
            And T2.TaskPath = T1.TaskPath
            And T2.Component_refId = T1.Component_refId

    Left Join
        docs.ssis_PumlPartialDataFlow                                          As T3
            On
            T3.AntoraModule = T1.AntoraModule
            And T3.PackageName = T1.PackageName
            And T3.TaskFromParent = T1.TaskPath
    Cross Join config.ftv_get_parameter_value ( 'puml_footer', 'interactive' ) As puml_footer
Group By
    T1.AntoraModule
  , T1.PackageName
  , T1.TaskPath
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0cc6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlDftTask', @level2type = N'COLUMN', @level2name = N'PumlDftTask';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0bc6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlDftTask', @level2type = N'COLUMN', @level2name = N'TaskPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0ac6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlDftTask', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '09c6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlDftTask', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '73cc7fc6-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlDftTask';

