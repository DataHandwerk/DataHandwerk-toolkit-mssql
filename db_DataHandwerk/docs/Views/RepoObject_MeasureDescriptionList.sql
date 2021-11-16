
CREATE View docs.RepoObject_MeasureDescriptionList
As
Select
    rom.RepoObject_guid
  , rof.cultures_name
  , rof.RepoObject_DisplayName
  , rof.FilenameRelatedMeasures
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
                          , '// uncomment the following attribute, to hide exported descriptions' + Char ( 13 )
                            + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
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
    repo.Measures_union                As rom
    Inner Join
        docs.RepoObject_OutputFilter_T As rof
            On
            rom.RepoObject_guid        = rof.RepoObject_guid

    Inner Join
        ssas.Measures_translation_T    As transl
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