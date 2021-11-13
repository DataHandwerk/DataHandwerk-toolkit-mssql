CREATE View [docs].[ssis_DftTaskComponentOutputColumnList]
As
Select
    T1.AntoraModule
  , T1.PackageName
  , T1.TaskPath
  , T1.Component_refId
  , T1.output_refId
  , DftTaskComponentOutputColumnList =
  --
  Concat (
             N''
           --table start
           , '.Columns of ' + T1.output_refId + Char ( 13 ) + Char ( 10 )
           , '[cols="2,1l,2l"]' + Char ( 13 ) + Char ( 10 )
           , '|===' + Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           --
           --table content
           , String_Agg (
                            Concat (
                                       Cast(N'' As NVarchar(Max))
                                     --inline Anchor ID sysntax:
                                     --[[bookmark-a]]Inline anchors make arbitrary content referenceable.
                                     --not working:
                                     --[#bookmark-b]#Inline anchors can be applied to a phrase like this one.#
                                     , '|' + '[[dftcomponentcolumn-'
                                       + docs.fs_cleanStringForAnchorId ( T1.Column_refId ) + ']]'
                                     , docs.fs_cleanStringForHeader ( T1.Column_Name )
                                     , Iif(T2.Column_name <> T1.Column_name, ' (' + T2.Column_name + ')', '')
                                     , Char ( 13 ) + Char ( 10 )
                                     , '|' + T1.Column_dataType
                                     , '(' + Cast(T1.Column_length As Varchar(10)) + ')'
                                     , '(' + Cast(T1.Column_precision As Varchar(10)) + ','
                                     , Cast(T1.Column_scale As Varchar(10)) + ')'
                                     , Iif(
                                           T2.Column_dataType <> T1.Column_dataType
                                           Or T2.Column_length <> T1.Column_length
                                           Or T2.Column_precision <> T1.Column_precision
                                           Or T2.Column_scale <> T1.Column_scale
                                         , Concat (
                                                      ' - '
                                                    , T2.Column_dataType
                                                    , '(' + Cast(T2.Column_length As Varchar(10)) + ')'
                                                    , '(' + Cast(T2.Column_precision As Varchar(10)) + ','
                                                    , Cast(T2.Column_scale As Varchar(10)) + ')'
                                                  )
                                         , '')
                                     , Char ( 13 ) + Char ( 10 )
                                     , '|'
                                     , T1.Column_errorOrTruncationOperation + ', '
                                     , T1.Column_errorRowDisposition + ', '
                                     , T1.Column_truncationRowDisposition + ', '
                                     , Char ( 13 ) + Char ( 10 )
                                   --, '|'
                                   --, ' <<dftcomponentcolumn-'
                                   --  + docs.fs_cleanStringForAnchorId ( T1.Column_externalMetadataColumnId ) + '>>'
                                   --, Char ( 13 ) + Char ( 10 )
                                   )
                          , Char ( 13 ) + Char ( 10 )
                        ) Within Group(Order By
                                           T1.Column_refId)

           --table end
           , '|===' + Char ( 13 ) + Char ( 10 )
         )
From
    ssis.PackageTask_Dft_Component_output_outputcolumn              As T1
    Left Join
        ssis.PackageTask_Dft_Component_input_externalMetadataColumn As T2
            On
            T2.AntoraModule     = T1.AntoraModule
            And T2.PackageName  = T1.PackageName
            And T2.Column_refId = T1.Column_externalMetadataColumnId
Group By
    T1.AntoraModule
  , T1.PackageName
  , T1.TaskPath
  , T1.Component_refId
  , T1.output_refId
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a6251c51-9f41-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_DftTaskComponentOutputColumnList', @level2type = N'COLUMN', @level2name = N'DftTaskComponentOutputColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a5251c51-9f41-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_DftTaskComponentOutputColumnList', @level2type = N'COLUMN', @level2name = N'output_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a4251c51-9f41-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_DftTaskComponentOutputColumnList', @level2type = N'COLUMN', @level2name = N'Component_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a3251c51-9f41-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_DftTaskComponentOutputColumnList', @level2type = N'COLUMN', @level2name = N'TaskPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a2251c51-9f41-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_DftTaskComponentOutputColumnList', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a1251c51-9f41-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_DftTaskComponentOutputColumnList', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'd0246838-9f41-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_DftTaskComponentOutputColumnList';

