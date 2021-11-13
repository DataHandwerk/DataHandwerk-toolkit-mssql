CREATE View docs.ssis_DftTaskComponentInputList
As
Select
    T1.AntoraModule
  , T1.PackageName
  , T1.TaskPath
  , T1.Component_refId
  , DftTaskComponentInputList =
  --
  String_Agg (
                 Concat (
                            Cast(N'' As NVarchar(Max))
                          , '[#dftcomponentinput-'
                          , docs.fs_cleanStringForAnchorId ( T1.input_refId )
                          , ']' + Char ( 13 ) + Char ( 10 )
                          --
                          , '[discrete]' + Char ( 13 ) + Char ( 10 )
                          , '===== Input: '
                          , docs.fs_cleanStringForHeader ( T1.input_name )
                          , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )

                          ----begin collapsible
                          --, '.Input: ' + docs.fs_cleanStringForHeader ( T1.input_name ) + Char ( 13 ) + Char ( 10 )
                          --, '[%collapsible]' + Char ( 13 ) + Char ( 10 )
                          --, '=======' + Char ( 13 ) + Char ( 10 )

                          --table start
                          , '.' + T1.input_refId + Char ( 13 ) + Char ( 10 )
                          , '[cols="1,4l"]' + Char ( 13 ) + Char ( 10 )
                          , '|===' + Char ( 13 ) + Char ( 10 )
                          , Char ( 13 ) + Char ( 10 )

                          --table content
                          --, '|' + 'input_refId' + Char ( 13 ) + Char ( 10 ) + '|' + T1.input_refId + Char ( 13 )
                          --  + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , Iif(T1.input_errorOrTruncationOperation <> ''
                              , '|' + 'input_errorOrTruncationOperation' + Char ( 13 ) + Char ( 10 ) + '|'
                                + T1.input_errorOrTruncationOperation + Char ( 13 ) + Char ( 10 ) + Char ( 13 )
                                + Char ( 10 )
                              , '')
                          , Iif(T1.input_errorOrTruncationOperation <> ''
                              , '|' + 'input_errorRowDisposition' + Char ( 13 ) + Char ( 10 ) + '|'
                                + T1.input_errorRowDisposition + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                              , '')
                          , Iif(Not T1.input_hasSideEffects Is Null
                              , '|' + 'input_hasSideEffects' + Char ( 13 ) + Char ( 10 ) + '|'
                                + Cast(T1.input_hasSideEffects As Varchar(10)) + Char ( 13 ) + Char ( 10 )
                                + Char ( 13 ) + Char ( 10 )
                              , '')

                          --table end
                          , '|===' + Char ( 13 ) + Char ( 10 )
                          , Char ( 13 ) + Char ( 10 ) + T2.DftTaskComponentInputColumnList + Char ( 13 ) + Char ( 10 )

                        ----end collapsible
                        --, '=======' + Char ( 13 ) + Char ( 10 )
                        )
               , Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                T1.input_refId)
From
    ssis.PackageTask_Dft_Component_input          As T1
    Left Join
        docs.ssis_DftTaskComponentInputColumnList As T2
            On
            T2.AntoraModule        = T1.AntoraModule
            And T2.PackageName     = T1.PackageName
            And T2.TaskPath        = T1.TaskPath
            And T2.Component_refId = T1.Component_refId
            And T2.input_refId     = T1.input_refId
Group By
    T1.AntoraModule
  , T1.PackageName
  , T1.TaskPath
  , T1.Component_refId
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9a251c51-9f41-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_DftTaskComponentInputList', @level2type = N'COLUMN', @level2name = N'DftTaskComponentInputList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '99251c51-9f41-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_DftTaskComponentInputList', @level2type = N'COLUMN', @level2name = N'Component_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '98251c51-9f41-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_DftTaskComponentInputList', @level2type = N'COLUMN', @level2name = N'TaskPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '97251c51-9f41-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_DftTaskComponentInputList', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '96251c51-9f41-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_DftTaskComponentInputList', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ce246838-9f41-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_DftTaskComponentInputList';

