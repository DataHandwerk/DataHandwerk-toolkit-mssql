
/*
we could create different content for different cultures.
But currently the content for all cultures is the same
*/
CREATE View docs.Measure_MeasurePropertyList
As
Select
    rom.Measure_guid
  , MeasurePropertyList  =
  --
  String_Agg (
                 Concat (
                            --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                            Cast(N'' As NVarchar(Max))

                          --add additional line to get more space
                          , '{empty} +'
                          , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , '.' + mp.property_name
                          , Char ( 13 ) + Char ( 10 )
                          , Iif(pn.NoOfCollapsibleChars > 1
                              , '[%collapsible]' + Char ( 13 ) + Char ( 10 )
                                + Replicate ( '=', pn.NoOfCollapsibleChars ) + Char ( 13 ) + Char ( 10 )
                              , '')
                          , Iif(pn.NoOfExampleChars > 1
                                , Replicate ( '=', pn.NoOfExampleChars ) + Char ( 13 ) + Char ( 10 )
                                , '')
                          , Iif(pn.NoOfListingChars > 1
                                , Replicate ( '-', pn.NoOfListingChars ) + Char ( 13 ) + Char ( 10 )
                                , '')
                          , Char ( 13 ) + Char ( 10 )
                          --escape some special characters
                          , Replace ( mp.property_value, '|', '\|' )
                          , Char ( 13 ) + Char ( 10 )
                          , Iif(pn.NoOfListingChars > 1
                                , Replicate ( '-', pn.NoOfListingChars ) + Char ( 13 ) + Char ( 10 )
                                , '')
                          , Iif(pn.NoOfExampleChars > 1
                                , Replicate ( '=', pn.NoOfExampleChars ) + Char ( 13 ) + Char ( 10 )
                                , '')
                          , Iif(pn.NoOfCollapsibleChars > 1
                                , Replicate ( '=', pn.NoOfCollapsibleChars ) + Char ( 13 ) + Char ( 10 )
                                , '')
                          , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                        )
               , Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                pn.OrderInAntoraMeasureDetails)
  , MeasurePropertyTable =
  --
  Concat (
             Cast(N'' As NVarchar(Max))
           --, '[#measureproperties-'
           --, docs.fs_cleanStringForAnchorId ( ParameterName )
           --, ']'
           --, Char ( 13 ) + Char ( 10 )
           --, '=== '
           --, docs.fs_cleanStringForHeader ( ParameterName )
           --, Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )

           --table start
           , '[cols="1,5a"]' + Char ( 13 ) + Char ( 10 )
           , '|===' + Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )

           --table content
           , String_Agg (
                            Concat (
                                       --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                                       Cast(N'' As NVarchar(Max))
                                     , '|' + mp.property_name + Char ( 13 ) + Char ( 10 )
                                     , '|' + Char ( 13 ) + Char ( 10 )
                                     , Iif(pn.NoOfCollapsibleChars > 1
                                         , '[%collapsible]' + Char ( 13 ) + Char ( 10 )
                                           + Replicate ( '=', pn.NoOfCollapsibleChars ) + Char ( 13 ) + Char ( 10 )
                                         , '')
                                     , Iif(pn.NoOfExampleChars > 1
                                           , Replicate ( '=', pn.NoOfExampleChars ) + Char ( 13 ) + Char ( 10 )
                                           , '')
                                     , Iif(pn.NoOfListingChars > 1
                                           , Replicate ( '-', pn.NoOfListingChars ) + Char ( 13 ) + Char ( 10 )
                                           , '')
                                     --escape some special characters
                                     , Replace ( mp.property_value, '|', '\|' )
                                     , Char ( 13 ) + Char ( 10 )
                                     , Iif(pn.NoOfListingChars > 1
                                           , Replicate ( '-', pn.NoOfListingChars ) + Char ( 13 ) + Char ( 10 )
                                           , '')
                                     , Iif(pn.NoOfExampleChars > 1
                                           , Replicate ( '=', pn.NoOfExampleChars ) + Char ( 13 ) + Char ( 10 )
                                           , '')
                                     , Iif(pn.NoOfCollapsibleChars > 1
                                           , Replicate ( '=', pn.NoOfCollapsibleChars ) + Char ( 13 ) + Char ( 10 )
                                           , '')
                                   )
                          , Char ( 13 ) + Char ( 10 )
                        ) Within Group(Order By
                                           pn.OrderInAntoraMeasureDetails)

           --table end
           , '|===' + Char ( 13 ) + Char ( 10 )
         )
From
    repo.Measure                       As rom
    Inner Join
        property.MeasureProperty        As mp
            On
            mp.Measure_guid                    = rom.Measure_guid

    Inner Join
        property.PropertyName_Measure_T As pn
            On
            pn.property_name                   = mp.property_name
            And pn.OrderInAntoraMeasureDetails > 0
Group By
    rom.Measure_guid
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '35535aab-3250-ec11-8532-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Measure_MeasurePropertyList', @level2type = N'COLUMN', @level2name = N'MeasurePropertyTable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '34535aab-3250-ec11-8532-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Measure_MeasurePropertyList', @level2type = N'COLUMN', @level2name = N'MeasurePropertyList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '33535aab-3250-ec11-8532-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Measure_MeasurePropertyList', @level2type = N'COLUMN', @level2name = N'Measure_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '308d889d-3250-ec11-8532-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Measure_MeasurePropertyList';

