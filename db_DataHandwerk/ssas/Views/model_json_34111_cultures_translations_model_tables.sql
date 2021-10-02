

/*
--get and check existing values

Select
    Distinct
    j2.[Key]
  , j2.Type
From
    ssas.model_json_3411_cultures_translations_model_T                      As T1
    Cross Apply OpenJson ( T1.cultures_translations_model_tables_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Order by
    j2.[Key]
  , j2.Type
Go

Select
    T1.*
  , j2.*
From
    ssas.model_json_3411_cultures_translations_model_T                      As T1
    Cross Apply OpenJson ( T1.cultures_translations_model_tables_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Go

Select
    j2.*
From
    ssas.model_json_3411_cultures_translations_model_T                      As T1
    Cross Apply OpenJson ( T1.cultures_translations_model_tables_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Where
    j2.[Key] = 'columns'

Select
    j2.*
From
    ssas.model_json_3411_cultures_translations_model_T                      As T1
    Cross Apply OpenJson ( T1.cultures_translations_model_tables_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Where
    j2.[Key] = 'measures'
Go

*/
CREATE View [ssas].[model_json_34111_cultures_translations_model_tables]
As
Select
    T1.databasename
  , T1.cultures_name
  , T1.cultures_translations_model_name
  , j2.cultures_translations_model_tables_name
  , j2.cultures_translations_model_tables_translatedCaption
  , j2.cultures_translations_model_tables_columns_ja
  , j2.cultures_translations_model_tables_hierarchies_ja
  , j2.cultures_translations_model_tables_measures_ja
From
    ssas.model_json_3411_cultures_translations_model_T                As T1
    Cross Apply OpenJson ( T1.cultures_translations_model_tables_ja ) As j1
    Cross Apply
    OpenJson ( j1.Value )
    With
    (
        cultures_translations_model_tables_name NVarchar ( 128 ) N'$.name'
      , cultures_translations_model_tables_translatedCaption NVarchar ( 128 ) N'$.translatedCaption'
      , cultures_translations_model_tables_columns_ja NVarchar ( Max ) N'$.columns' As Json         --array
      , cultures_translations_model_tables_hierarchies_ja NVarchar ( Max ) N'$.hierarchies' As Json --array
      , cultures_translations_model_tables_measures_ja NVarchar ( Max ) N'$.measures' As Json --arrey
    ) As j2
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a932fc8a-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_34111_cultures_translations_model_tables', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_tables_measures_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a832fc8a-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_34111_cultures_translations_model_tables', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_tables_hierarchies_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a732fc8a-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_34111_cultures_translations_model_tables', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_tables_columns_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a632fc8a-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_34111_cultures_translations_model_tables', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_tables_translatedCaption';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a532fc8a-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_34111_cultures_translations_model_tables', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a432fc8a-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_34111_cultures_translations_model_tables', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a332fc8a-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_34111_cultures_translations_model_tables', @level2type = N'COLUMN', @level2name = N'cultures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a232fc8a-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_34111_cultures_translations_model_tables', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0d09da81-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_34111_cultures_translations_model_tables';

