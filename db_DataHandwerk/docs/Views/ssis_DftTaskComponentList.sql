CREATE View [docs].[ssis_DftTaskComponentList]
As
Select
    T1.AntoraModule
  , T1.PackageName
  , T1.TaskPath
  , DftTaskComponentList =
  --
  String_Agg (
                 Concat (
                            Cast(N'' As NVarchar(Max))
                          , '[#dftcomponent-'
                          , docs.fs_cleanStringForAnchorId ( T1.Component_refId )
                          , ']'
                          , Char ( 13 ) + Char ( 10 )
                          , '==== '
                          , docs.fs_cleanStringForHeader ( T1.Component_name )
                          , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )

                          ----begin collapsible
                          --, '.' + docs.fs_cleanStringForHeader ( T1.Component_name ) + Char ( 13 ) + Char ( 10 )
                          --, '[%collapsible]' + Char ( 13 ) + Char ( 10 )
                          --, '======' + Char ( 13 ) + Char ( 10 )

                          --table start
                          , '[cols="1,4l"]' + Char ( 13 ) + Char ( 10 )
                          , '|===' + Char ( 13 ) + Char ( 10 )
                          , Char ( 13 ) + Char ( 10 )

                          --table content
                          , '|' + 'Component refId' + Char ( 13 ) + Char ( 10 ) + '|' + T1.Component_refId
                            + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , '|' + 'componentClassID' + Char ( 13 ) + Char ( 10 ) + '|' + T1.Component_componentClassID
                            + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , '|' + 'description' + Char ( 13 ) + Char ( 10 ) + '|' + T1.Component_description
                            + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , '|' + 'ContactInfo' + Char ( 13 ) + Char ( 10 ) + '|' + T1.Component_ContactInfo
                            + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , '|' + 'CommandTimeout' + Char ( 13 ) + Char ( 10 ) + '|'
                            + Cast(T1.Component_CommandTimeout As NVarchar(50)) + Char ( 13 ) + Char ( 10 )
                            + Char ( 13 ) + Char ( 10 )
                          , Iif(T1.Component_OpenRowset <> ''
                              , '|' + 'OpenRowset' + Char ( 13 ) + Char ( 10 ) + '|' + T1.Component_OpenRowset
                                + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                              , '')
                          , Iif(T1.Component_OpenRowsetVariable <> ''
                              , '|' + 'OpenRowsetVariable' + Char ( 13 ) + Char ( 10 ) + '|'
                                + T1.Component_OpenRowsetVariable + Char ( 13 ) + Char ( 10 ) + Char ( 13 )
                                + Char ( 10 )
                              , '')
                          , Iif(T1.Component_SqlCommand <> ''
                              , '|' + 'SqlCommand' + Char ( 13 ) + Char ( 10 ) + '|' + T1.Component_SqlCommand
                                + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                              , '')
                          , Iif(T1.Component_SqlCommandVariable <> ''
                              , '|' + 'SqlCommandVariable' + Char ( 13 ) + Char ( 10 ) + '|'
                                + T1.Component_SqlCommandVariable + Char ( 13 ) + Char ( 10 ) + Char ( 13 )
                                + Char ( 10 )
                              , '')
                          , Iif(T1.Component_DefaultCodePage <> 0
                              , '|' + 'DefaultCodePage' + Char ( 13 ) + Char ( 10 ) + '|'
                                + Cast(T1.Component_DefaultCodePage As Varchar(10)) + Char ( 13 ) + Char ( 10 )
                                + Char ( 13 ) + Char ( 10 )
                              , '')
                          , Iif(T1.Component_AlwaysUseDefaultCodePage <> ''
                              , '|' + 'AlwaysUseDefaultCodePage' + Char ( 13 ) + Char ( 10 ) + '|'
                                + T1.Component_AlwaysUseDefaultCodePage + Char ( 13 ) + Char ( 10 ) + Char ( 13 )
                                + Char ( 10 )
                              , '')
                          , Iif(T1.Component_ParameterMapping <> ''
                              , '|' + 'ParameterMapping' + Char ( 13 ) + Char ( 10 ) + '|'
                                + T1.Component_ParameterMapping + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                              , '')
                          , Iif(Not T1.Component_FastLoadKeepIdentity Is Null
                              , '|' + 'FastLoadKeepIdentity' + Char ( 13 ) + Char ( 10 ) + '|'
                                + Cast(T1.Component_FastLoadKeepIdentity As Varchar(10)) + Char ( 13 ) + Char ( 10 )
                                + Char ( 13 ) + Char ( 10 )
                              , '')
                          , Iif(Not T1.Component_FastLoadKeepNulls Is Null
                              , '|' + 'FastLoadKeepNulls' + Char ( 13 ) + Char ( 10 ) + '|'
                                + Cast(T1.Component_FastLoadKeepNulls As Varchar(10)) + Char ( 13 ) + Char ( 10 )
                                + Char ( 13 ) + Char ( 10 )
                              , '')
                          , Iif(T1.Component_FastLoadOptions <> ''
                              , '|' + 'FastLoadOptions' + Char ( 13 ) + Char ( 10 ) + '|'
                                + T1.Component_FastLoadOptions + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                              , '')
                          , Iif(Not T1.Component_FastLoadMaxInsertCommitSize Is Null
                              , '|' + 'FastLoadMaxInsertCommitSize' + Char ( 13 ) + Char ( 10 ) + '|'
                                + Cast(T1.Component_FastLoadMaxInsertCommitSize As Varchar(10)) + Char ( 13 )
                                + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                              , '')
                          , Iif(T1.Component_VariableName <> ''
                              , '|' + 'VariableName' + Char ( 13 ) + Char ( 10 ) + '|' + T1.Component_VariableName
                                + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                              , '')
                          , Iif(T1.Component_Connection_refId <> ''
                              , '|' + 'Connection_refId' + Char ( 13 ) + Char ( 10 ) + '|'
                                + T1.Component_Connection_refId + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                              , '')
                          , Iif(T1.Component_connectionManagerID <> ''
                              , '|' + 'connectionManagerID' + Char ( 13 ) + Char ( 10 ) + '|'
                                + T1.Component_connectionManagerID + Char ( 13 ) + Char ( 10 ) + Char ( 13 )
                                + Char ( 10 )
                              , '')
                          , Iif(T1.Component_connectionManagerRefId <> ''
                              , '|' + 'connectionManagerRefId +' + Char ( 13 ) + Char ( 10 ) + ' <<connection-'
                                + docs.fs_cleanStringForAnchorId ( T1.Component_ConnectionManagerName ) + '>>'
                                + Char ( 13 ) + Char ( 10 ) + '|' + T1.Component_connectionManagerRefId + Char ( 13 )
                                + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                              , '')
                          , Iif(T1.Component_Connection_name <> ''
                              , '|' + 'Connection_name' + Char ( 13 ) + Char ( 10 ) + '|'
                                + T1.Component_Connection_name + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                              , '')
                          , Iif(T1.Component_IsSortedProperty <> ''
                              , '|' + 'IsSortedProperty' + Char ( 13 ) + Char ( 10 ) + '|'
                                + T1.Component_IsSortedProperty + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                              , '')

                          --table end
                          , '|===' + Char ( 13 ) + Char ( 10 )
                          , Char ( 13 ) + Char ( 10 ) + T3.DftTaskComponentInputList + Char ( 13 ) + Char ( 10 )
                          , Char ( 13 ) + Char ( 10 ) + T4.DftTaskComponentOutputList + Char ( 13 ) + Char ( 10 )

                          ----end collapsible
                          --, '======' + Char ( 13 ) + Char ( 10 )
                        )
               , Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                T1.Component_refId)
From
    ssis.PackageTask_Dft_Component           As T1
    Left Join
        docs.ssis_PumlPartialDftComponent    As T2
            On
            T2.AntoraModule        = T1.AntoraModule
            And T2.PackageName     = T1.PackageName
            And T2.TaskPath        = T1.TaskPath
            And T2.Component_refId = T1.Component_refId

    Left Join
        docs.ssis_DftTaskComponentInputList  As T3
            On
            T3.AntoraModule        = T1.AntoraModule
            And T3.PackageName     = T1.PackageName
            And T3.TaskPath        = T1.TaskPath
            And T3.Component_refId = T1.Component_refId

    Left Join
        docs.ssis_DftTaskComponentOutputList As T4
            On
            T4.AntoraModule        = T1.AntoraModule
            And T4.PackageName     = T1.PackageName
            And T4.TaskPath        = T1.TaskPath
            And T4.Component_refId = T1.Component_refId
Group By
    T1.AntoraModule
  , T1.PackageName
  , T1.TaskPath
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd5d0d060-fc3e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_DftTaskComponentList', @level2type = N'COLUMN', @level2name = N'DftTaskComponentList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd3d0d060-fc3e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_DftTaskComponentList', @level2type = N'COLUMN', @level2name = N'TaskPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd2d0d060-fc3e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_DftTaskComponentList', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd1d0d060-fc3e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_DftTaskComponentList', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '6addd159-fc3e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_DftTaskComponentList';

