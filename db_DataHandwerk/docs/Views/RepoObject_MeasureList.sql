
CREATE View docs.RepoObject_MeasureList
As
Select
    rom.RepoObject_guid
  , cultures_name        = Cast('' As NVarchar(10))
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
                                     , Iif(rom.measures_isHidden = 1, '<color:gray>', Null)
                                     , docs.fs_cleanStringForPuml ( rom.measures_name )
                                     , Iif(rom.measures_isHidden = 1, ' (hidden)', Null)
                                     , Iif(rom.measures_isHidden = 1, '</color>', Null)
                                     , Char ( 13 ) + Char ( 10 )
                                   )
                        )
               , ''
             ) Within Group(Order By
                                rom.measures_name)
From
    repo.Measures_union As rom
Group By
    rom.RepoObject_guid
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

