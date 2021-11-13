CREATE View [docs].[ssis_DftTaskComponentOutputList]
As
Select
    T1.AntoraModule
  , T1.PackageName
  , T1.TaskPath
  , T1.Component_refId
  , DftTaskComponentOutputList =
  --
  String_Agg (
                 Concat (
                            Cast(N'' As NVarchar(Max))
                          , '[#dftcomponentOutput-'
                          , docs.fs_cleanStringForAnchorId ( T1.output_refId )
                          , ']' + Char ( 13 ) + Char ( 10 )
                          , '[discrete]' + Char ( 13 ) + Char ( 10 )
                          , '===== Output: '
                          , docs.fs_cleanStringForHeader ( T1.Output_name )
                          , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )

                          ----begin collapsible
                          --, '.Output: ' + docs.fs_cleanStringForHeader ( T1.output_name ) + Char ( 13 ) + Char ( 10 )
                          --, '[%collapsible]' + Char ( 13 ) + Char ( 10 )
                          --, '=======' + Char ( 13 ) + Char ( 10 )

                          --table start
                          , '.' + T1.output_refId + Char ( 13 ) + Char ( 10 )
                          , '[cols="1,4l"]' + Char ( 13 ) + Char ( 10 )
                          , '|===' + Char ( 13 ) + Char ( 10 )
                          , Char ( 13 ) + Char ( 10 )

                          --table content
                          , '|' + 'output_isErrorOut' + Char ( 13 ) + Char ( 10 ) + '|'
                            + Cast(IsNull ( T1.output_isErrorOut, 0 ) As Varchar(10)) + Char ( 13 ) + Char ( 10 )
                            + Char ( 13 ) + Char ( 10 )

                          --table end
                          , '|===' + Char ( 13 ) + Char ( 10 )
                          , Char ( 13 ) + Char ( 10 ) + T2.DftTaskComponentOutputColumnList + Char ( 13 ) + Char ( 10 )

                          ----end collapsible
                          --, '=======' + Char ( 13 ) + Char ( 10 )
                        )
               , Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                T1.output_refId)
From
    ssis.PackageTask_Dft_Component_output          As T1
    Left Join
        docs.ssis_DftTaskComponentOutputColumnList As T2
            On
            T2.AntoraModule        = T1.AntoraModule
            And T2.PackageName     = T1.PackageName
            And T2.TaskPath        = T1.TaskPath
            And T2.Component_refId = T1.Component_refId
            And T2.output_refId    = T1.output_refId
Group By
    T1.AntoraModule
  , T1.PackageName
  , T1.TaskPath
  , T1.Component_refId
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ab251c51-9f41-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_DftTaskComponentOutputList', @level2type = N'COLUMN', @level2name = N'DftTaskComponentOutputList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aa251c51-9f41-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_DftTaskComponentOutputList', @level2type = N'COLUMN', @level2name = N'Component_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a9251c51-9f41-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_DftTaskComponentOutputList', @level2type = N'COLUMN', @level2name = N'TaskPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a8251c51-9f41-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_DftTaskComponentOutputList', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a7251c51-9f41-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_DftTaskComponentOutputList', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'd1246838-9f41-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_DftTaskComponentOutputList';

