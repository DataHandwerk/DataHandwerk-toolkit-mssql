﻿
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE View ssas.Measures_translation
As
Select
    m.Measure_guid
  , c.cultures_name
  , m.RepoSchema_name
  , m.RepoObject_name
  , m.measures_name
  , Measure_translation       = cult.cultures_translations_model_tables_measures_translatedCaption
  , Measure_DisplayName       = Coalesce (
                                             cult.cultures_translations_model_tables_measures_translatedCaption
                                           , m.measures_name
                                         )
  , m.measures_displayFolder
  , displayfolder_translation = cult.cultures_translations_model_tables_measures_translatedDisplayFolder
  , displayfolder_DisplayName = Coalesce (
                                             cult.cultures_translations_model_tables_measures_translatedDisplayFolder
                                           , m.measures_displayFolder
                                         )
From
    repo.Measures_union     As m
    Cross Join docs.Culture As c
    Left Outer Join
        ssas.model_json_341113_cultures_translations_model_tables_measures As cult
            On
            cult.databasename                                         = m.RepoSchema_name
            And
            (
                cult.cultures_translations_model_tables_name          = m.RepoObject_name
                Or m.RepoObject_name                                  = '_measures'
            )
            And cult.cultures_translations_model_tables_measures_name = m.measures_name
            And cult.cultures_name                                    = c.cultures_name
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7bab2b6f-6124-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'Measures_translation', @level2type = N'COLUMN', @level2name = N'Measure_DisplayName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7aab2b6f-6124-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'Measures_translation', @level2type = N'COLUMN', @level2name = N'Measure_translation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '79ab2b6f-6124-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'Measures_translation', @level2type = N'COLUMN', @level2name = N'measures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '78ab2b6f-6124-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'Measures_translation', @level2type = N'COLUMN', @level2name = N'RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '77ab2b6f-6124-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'Measures_translation', @level2type = N'COLUMN', @level2name = N'RepoSchema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '76ab2b6f-6124-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'Measures_translation', @level2type = N'COLUMN', @level2name = N'cultures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '75ab2b6f-6124-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'Measures_translation', @level2type = N'COLUMN', @level2name = N'Measure_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '1c8b3c65-6124-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'Measures_translation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6820c60c-ca26-ec11-8529-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'Measures_translation', @level2type = N'COLUMN', @level2name = N'measures_displayFolder';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6920c60c-ca26-ec11-8529-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'Measures_translation', @level2type = N'COLUMN', @level2name = N'displayfolder_translation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6a20c60c-ca26-ec11-8529-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'Measures_translation', @level2type = N'COLUMN', @level2name = N'displayfolder_DisplayName';

