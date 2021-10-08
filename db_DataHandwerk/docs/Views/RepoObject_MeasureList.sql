

CREATE View [docs].[RepoObject_MeasureList]
As
Select
    rom.RepoObject_guid
  , rof.cultures_name
  , is_external          = Max ( Cast(rof.is_external As TinyInt))
  , AntoraMeasureDetails =
  --
  String_Agg (
                 Concat (
                            --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                            Cast('' As NVarchar(Max))
                          , Iif(transl.is_displayfolder = 1
                              , Concat (
                                           '[discrete]'
                                         , Char ( 13 ) + Char ( 10 )
                                         , '== '
                                         , docs.fs_cleanStringForLabel ( IsNull ( transl.displayfolder_DisplayName, '_' ))
                                         , Char ( 13 ) + Char ( 10 )
                                         , Char ( 13 ) + Char ( 10 )
                                       )
                              , Concat (
                                           '[#measure-'
                                         , docs.fs_cleanStringForAnchorId ( transl.Measure_DisplayName )
                                         , ']'
                                         , Char ( 13 ) + Char ( 10 )
                                         , '=== '
                                         , docs.fs_cleanStringForLabel ( transl.Measure_DisplayName )
                                         , Char ( 13 ) + Char ( 10 )
                                         , Char ( 13 ) + Char ( 10 )
                                         --, Case
                                         --      When transl.displayfolder_DisplayName <> ''
                                         --          Then
                                         --          Concat (
                                         --                     '.DisplayFolder: '
                                         --                   , Char ( 13 ) + Char ( 10 )
                                         --                   , '--'
                                         --                   , Char ( 13 ) + Char ( 10 )
                                         --                   , transl.displayfolder_DisplayName
                                         --                   , Char ( 13 ) + Char ( 10 )
                                         --                   , '--'
                                         --                   , Char ( 13 ) + Char ( 10 )
                                         --                   , Char ( 13 ) + Char ( 10 )
                                         --                 )
                                         --  End
                                         , Case
                                               When rom.Description <> ''
                                                   Then
                                                   Concat (
                                                              '.Description'
                                                            , Char ( 13 ) + Char ( 10 )
                                                            , '--'
                                                            , Char ( 13 ) + Char ( 10 )
                                                            , rom.Description
                                                            , Char ( 13 ) + Char ( 10 )
                                                            , '--'
                                                            , Char ( 13 ) + Char ( 10 )
                                                            --add additional line to get more space
                                                            , '{empty} +'
                                                            , Char ( 13 ) + Char ( 10 )
                                                            , Char ( 13 ) + Char ( 10 )
                                                          )
                                           End
                                         , Case
                                               When rom.Expression <> ''
                                                   Then
                                                   Concat (
                                                              '.Expression'
                                                            , Char ( 13 ) + Char ( 10 )
                                                            , '....'
                                                            , Char ( 13 ) + Char ( 10 )
                                                            , rom.Expression
                                                            , Char ( 13 ) + Char ( 10 )
                                                            , '....'
                                                            , Char ( 13 ) + Char ( 10 )
                                                            , Char ( 13 ) + Char ( 10 )
                                                          )
                                           End
                                       )
                          --
                          )
                        )
               , Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                transl.displayfolder_DisplayName
                              , transl.is_displayfolder Desc
                              , transl.Measure_DisplayName)
  , PlantumlMeasures     =
  --
  String_Agg (
                 Concat (
                            Cast('' As NVarchar(Max))
                          , Iif(transl.is_displayfolder = 1
                              , Iif(transl.displayfolder_DisplayName <> ''
                                  , Concat (
                                               '  **'
                                             , docs.fs_cleanStringForPuml ( transl.displayfolder_DisplayName )
                                             , '**'
                                             , Char ( 13 ) + Char ( 10 )
                                           )
                                  , Null)
                              , Concat (
                                           '  ~ '
                                         , Iif(rom.measures_isHidden = 1, '<color:gray>', Null)
                                         , docs.fs_cleanStringForPuml ( transl.Measure_DisplayName )
                                         , Iif(rom.measures_isHidden = 1, ' (hidden)', Null)
                                         , Iif(rom.measures_isHidden = 1, '</color>', Null)
                                         , Char ( 13 ) + Char ( 10 )
                                       )
                          --
                          )
                        )
               , ''
             ) Within Group(Order By
                                transl.displayfolder_DisplayName
                              , transl.is_displayfolder Desc
                              , transl.Measure_DisplayName)
From
    repo.Measures_union                               As rom
    Left Outer Join
        docs.RepoObject_OutputFilter_T                As rof
            On
            rom.RepoObject_guid        = rof.RepoObject_guid

    Left Join
        ssas.Measures_translation_displayfolder_union As transl
            On
            transl.Measure_guid        = rom.Measure_guid
            And transl.cultures_name   = rof.cultures_name
            And transl.RepoObject_name = rof.RepoObject_name
Group By
    rom.RepoObject_guid
  , rof.cultures_name
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '72e1c56a-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_MeasureList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c12c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_MeasureList', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c32c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_MeasureList', @level2type = N'COLUMN', @level2name = N'PlantumlMeasures';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c22c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_MeasureList', @level2type = N'COLUMN', @level2name = N'AntoraMeasureDetails';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '530389e1-0622-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_MeasureList', @level2type = N'COLUMN', @level2name = N'cultures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '75f9eb01-da25-ec11-8528-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_MeasureList', @level2type = N'COLUMN', @level2name = N'is_external';

