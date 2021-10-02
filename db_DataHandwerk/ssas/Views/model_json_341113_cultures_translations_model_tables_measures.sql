
/*
--get and check existing values

Select
    Distinct
    j2.[Key]
  , j2.Type
From
    ssas.model_json_34111_cultures_translations_model_tables                      As T1
    Cross Apply OpenJson ( T1.cultures_translations_model_tables_measures_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Order by
    j2.[Key]
  , j2.Type
Go

Select
    T1.*
  , j2.*
From
    ssas.model_json_34111_cultures_translations_model_tables                      As T1
    Cross Apply OpenJson ( T1.cultures_translations_model_tables_measures_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Go

Select
    j2.*
From
    ssas.model_json_34111_cultures_translations_model_tables                      As T1
    Cross Apply OpenJson ( T1.cultures_translations_model_tables_measures_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Where
    j2.[Key] = 'columns'

Select
    j2.*
From
    ssas.model_json_34111_cultures_translations_model_tables                      As T1
    Cross Apply OpenJson ( T1.cultures_translations_model_tables_measures_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Where
    j2.[Key] = 'measures'
Go

*/
Create   View ssas.model_json_341113_cultures_translations_model_tables_measures
As
Select
    T1.databasename
  , T1.cultures_name
  , T1.cultures_translations_model_name
  , T1.cultures_translations_model_tables_name
  , j2.cultures_translations_model_tables_measures_name
  , j2.cultures_translations_model_tables_measures_translatedCaption
  , j2.cultures_translations_model_tables_measures_translatedDescription
  , j2.cultures_translations_model_tables_measures_translatedDisplayFolder
From
    ssas.model_json_34111_cultures_translations_model_tables                   As T1
    Cross Apply OpenJson ( T1.cultures_translations_model_tables_measures_ja ) As j1
    Cross Apply
    OpenJson ( j1.Value )
    With
    (
        cultures_translations_model_tables_measures_name NVarchar ( 128 ) N'$.name'
      , cultures_translations_model_tables_measures_translatedCaption NVarchar ( 128 ) N'$.translatedCaption'
      , cultures_translations_model_tables_measures_translatedDescription NVarchar ( Max ) N'$.translatedDescription'
      , cultures_translations_model_tables_measures_translatedDisplayFolder NVarchar ( 512 ) N'$.translatedDisplayFolder'
    ) As j2
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'be32fc8a-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341113_cultures_translations_model_tables_measures', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_tables_measures_translatedDisplayFolder';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bd32fc8a-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341113_cultures_translations_model_tables_measures', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_tables_measures_translatedDescription';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bc32fc8a-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341113_cultures_translations_model_tables_measures', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_tables_measures_translatedCaption';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bb32fc8a-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341113_cultures_translations_model_tables_measures', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_tables_measures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ba32fc8a-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341113_cultures_translations_model_tables_measures', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b932fc8a-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341113_cultures_translations_model_tables_measures', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b832fc8a-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341113_cultures_translations_model_tables_measures', @level2type = N'COLUMN', @level2name = N'cultures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b732fc8a-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341113_cultures_translations_model_tables_measures', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '1109da81-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341113_cultures_translations_model_tables_measures';

