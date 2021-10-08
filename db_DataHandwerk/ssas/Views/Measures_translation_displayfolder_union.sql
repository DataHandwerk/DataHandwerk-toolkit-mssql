
CREATE View [ssas].[Measures_translation_displayfolder_union]
As
--real measures
Select
    T1.Measure_guid
  , T1.cultures_name
  , T1.RepoObject_name
  , T1.RepoSchema_name
  , T1.measures_name
  , T1.Measure_translation
  , T1.Measure_DisplayName
  , T1.measures_displayFolder
  , T1.displayfolder_translation
  , T1.displayfolder_DisplayName
  , is_displayfolder = 0
From
    ssas.Measures_translation_T T1
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
  , T2.measures_displayFolder
  , T2.displayfolder_translation
  , T2.displayfolder_DisplayName
  , T2.is_displayfolder
From
(
    Select
        T1.Measure_guid
      , T1.cultures_name
      , T1.RepoObject_name
      , T1.RepoSchema_name
      , T1.measures_name
      , T1.Measure_translation
      , T1.Measure_DisplayName
      , T1.measures_displayFolder
      , T1.displayfolder_translation
      , T1.displayfolder_DisplayName
      , is_displayfolder = 1
      , rn               = Row_Number () Over ( Partition By
                                                    T1.cultures_name
                                                  , T1.RepoSchema_name
                                                  , T1.RepoObject_name
                                                  , T1.displayfolder_DisplayName
                                                Order By
                                                    T1.Measure_DisplayName
                                              )
    From
        ssas.Measures_translation_T T1
) As T2
Where
    T2.rn = 1
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'bfd4ccd3-5027-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'Measures_translation_displayfolder_union';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f7a615de-5027-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'Measures_translation_displayfolder_union', @level2type = N'COLUMN', @level2name = N'RepoSchema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f6a615de-5027-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'Measures_translation_displayfolder_union', @level2type = N'COLUMN', @level2name = N'RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f8a615de-5027-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'Measures_translation_displayfolder_union', @level2type = N'COLUMN', @level2name = N'measures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fba615de-5027-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'Measures_translation_displayfolder_union', @level2type = N'COLUMN', @level2name = N'measures_displayFolder';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f9a615de-5027-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'Measures_translation_displayfolder_union', @level2type = N'COLUMN', @level2name = N'Measure_translation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f4a615de-5027-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'Measures_translation_displayfolder_union', @level2type = N'COLUMN', @level2name = N'Measure_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'faa615de-5027-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'Measures_translation_displayfolder_union', @level2type = N'COLUMN', @level2name = N'Measure_DisplayName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fea615de-5027-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'Measures_translation_displayfolder_union', @level2type = N'COLUMN', @level2name = N'is_displayfolder';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fca615de-5027-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'Measures_translation_displayfolder_union', @level2type = N'COLUMN', @level2name = N'displayfolder_translation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fda615de-5027-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'Measures_translation_displayfolder_union', @level2type = N'COLUMN', @level2name = N'displayfolder_DisplayName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f5a615de-5027-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'Measures_translation_displayfolder_union', @level2type = N'COLUMN', @level2name = N'cultures_name';

