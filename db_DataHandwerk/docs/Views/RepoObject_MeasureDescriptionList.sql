
/*
descriptions for measures are only entered once, in the RepoObject '_measures', containing all measures +
it should be also used by all other tables of tht ssas model
*/
CREATE View docs.RepoObject_MeasureDescriptionList
As
Select
    --PK: (FilenameRelatedMeasures, cultures_name)
    rof.FilenameRelatedMeasures
  , rof.cultures_name
  , rom.RepoObject_guid
  , rof.RepoObject_DisplayName
  , AntoraMeasureDescriptions          =
  --
  String_Agg (
                 Concat (
                            --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                            Cast(N'' As NVarchar(Max))
                          , Char ( 13 ) + Char ( 10 )
                          , '=== '
                          , docs.fs_cleanStringForHeader ( transl.Measure_DisplayName )
                          , ' - description'
                          , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , '// tag::description-measure-'
                            + docs.fs_cleanStringForAnchorId ( transl.Measure_DisplayName ) + '[]'
                          , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , rom.Description
                          , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , '// end::description-measure-'
                            + docs.fs_cleanStringForAnchorId ( transl.Measure_DisplayName ) + '[]'
                        )
               , Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                transl.Measure_DisplayName)
  , AntoraMeasureDescriptionTagContent =
  --
  String_Agg (
                 Concat (
                            --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                            Cast(N'' As NVarchar(Max))
                          , Char ( 13 ) + Char ( 10 )
                          , '=== '
                          , docs.fs_cleanStringForHeader ( transl.Measure_DisplayName )
                          , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , '// tag::description-measure-'
                            + docs.fs_cleanStringForAnchorId ( transl.Measure_DisplayName ) + '[]'
                          , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , '// uncomment the following attribute, to hide exported (by AntoraExport) descriptions. Keep the empty line on top of the attribute!'
                            + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , '//:hide-exported-description-measure-'
                            + docs.fs_cleanStringForAnchorId ( transl.Measure_DisplayName ) + ':'
                          , Char ( 13 ) + Char ( 10 )
                          , '// end::description-measure-'
                            + docs.fs_cleanStringForAnchorId ( transl.Measure_DisplayName ) + '[]'
                        )
               , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                transl.Measure_DisplayName)
From
    repo.Measure_union                       As rom
    Inner Join
        docs.RepoObject_OutputFilter_T_gross As rof
            On
            rom.RepoObject_guid        = rof.RepoObject_guid

    Inner Join
        ssas.Measure_translation_T           As transl
            On
            transl.Measure_guid        = rom.Measure_guid
            And transl.cultures_name   = rof.cultures_name
            And transl.RepoObject_name = rof.RepoObject_name
Group By
    rom.RepoObject_guid
  , rof.cultures_name
  , rof.RepoObject_DisplayName
  , rof.FilenameRelatedMeasures
Having
    rof.RepoObject_DisplayName = '_measures'
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '84dc9176-b547-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_MeasureDescriptionList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ed675087-b547-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_MeasureDescriptionList', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ef675087-b547-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_MeasureDescriptionList', @level2type = N'COLUMN', @level2name = N'RepoObject_DisplayName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f0675087-b547-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_MeasureDescriptionList', @level2type = N'COLUMN', @level2name = N'FilenameRelatedMeasures';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ee675087-b547-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_MeasureDescriptionList', @level2type = N'COLUMN', @level2name = N'cultures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f2675087-b547-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_MeasureDescriptionList', @level2type = N'COLUMN', @level2name = N'AntoraMeasureDescriptionTagContent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f1675087-b547-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_MeasureDescriptionList', @level2type = N'COLUMN', @level2name = N'AntoraMeasureDescriptions';

