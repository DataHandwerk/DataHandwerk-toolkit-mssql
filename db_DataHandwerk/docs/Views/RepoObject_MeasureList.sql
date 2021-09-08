
CREATE View docs.RepoObject_MeasureList
As
Select
    rom.RepoObject_guid
  , AntoraMeasureDetails =
  --
  String_Agg (
                 Concat (
                            --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                            Cast('' As NVarchar(Max))
                          , '[#measure-'
                          , docs.fs_cleanStringForAnchorId ( rom.measures_name )
                          , ']'
                          , Char ( 13 ) + Char ( 10 )
                          , '=== '
                          , docs.fs_cleanStringForLabel ( rom.measures_name )
                          , Char ( 13 ) + Char ( 10 )
                          , Char ( 13 ) + Char ( 10 )
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
                          , Case
                                When rom.measures_displayFolder <> ''
                                    Then
                                    Concat (
                                               '.DisplayFolder: '
                                             , Char ( 13 ) + Char ( 10 )
                                             , '--'
                                             , Char ( 13 ) + Char ( 10 )
                                             , rom.measures_displayFolder
                                             , Char ( 13 ) + Char ( 10 )
                                             , '--'
                                             , Char ( 13 ) + Char ( 10 )
                                             , Char ( 13 ) + Char ( 10 )
                                           )
                            End
                        )
               , Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                rom.measures_name)
  , PlantumlMeasures     =
  --
  String_Agg (
                 Concat (
                            Cast('' As NVarchar(Max))
                          , Concat (
                                       '  ~ '
                                     , docs.fs_cleanStringForPuml ( rom.measures_name )
                                     , Iif(rom.measures_isHidden = 1, ' (hidden)', Null)
                                     , Char ( 13 ) + Char ( 10 )
                                   )
                        )
               , ''
             ) Within Group(Order By
                                rom.measures_name)
From
    repo.Measures As rom
Group By
    rom.RepoObject_guid