Create View ssas.Measures_translation_displayfolder_union
As
--real measures
Select
    Measure_guid
  , cultures_name
  , RepoObject_name
  , RepoSchema_name
  , measures_name
  , Measure_translation
  , Measure_DisplayName
  , measures_displayFolder
  , displayfolder_translation
  , displayfolder_DisplayName
  , is_displayfolder = 0
From
    ssas.Measures_translation_T
Union All
--one pseudo measure per culture, table and displayfolder
Select
    T2.Measure_guid
  , T2.cultures_name
  , T2.RepoObject_name
  , T2.RepoSchema_name
  , T2.measures_name
  , T2.Measure_translation
  , T2.Measure_DisplayName
  , measures_displayFolder
  , displayfolder_translation
  , displayfolder_DisplayName
  , is_displayfolder = 1
From
(
    Select
        Measure_guid
      , cultures_name
      , RepoObject_name
      , RepoSchema_name
      , measures_name
      , Measure_translation
      , Measure_DisplayName
      , measures_displayFolder
      , displayfolder_translation
      , displayfolder_DisplayName
      , is_displayfolder = 1
      , rn               = Row_Number () Over ( Partition By
                                                    cultures_name
                                                  , RepoSchema_name
                                                  , RepoObject_name
                                                  , displayfolder_DisplayName
                                                Order By
                                                    Measure_DisplayName
                                              )
    From
        ssas.Measures_translation_T
) As T2
Where
    T2.rn = 1