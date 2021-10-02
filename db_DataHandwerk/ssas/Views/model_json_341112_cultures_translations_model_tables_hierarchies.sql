
/*
--get and check existing values

Select
    Distinct
    j2.[Key]
  , j2.Type
From
    ssas.model_json_34111_cultures_translations_model_tables                      As T1
    Cross Apply OpenJson ( T1.cultures_translations_model_tables_hierarchies_ja ) As j1
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
    Cross Apply OpenJson ( T1.cultures_translations_model_tables_hierarchies_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Go

Select
    j2.*
From
    ssas.model_json_34111_cultures_translations_model_tables                      As T1
    Cross Apply OpenJson ( T1.cultures_translations_model_tables_hierarchies_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Where
    j2.[Key] = 'columns'

Select
    j2.*
From
    ssas.model_json_34111_cultures_translations_model_tables                      As T1
    Cross Apply OpenJson ( T1.cultures_translations_model_tables_hierarchies_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Where
    j2.[Key] = 'measures'
Go

*/
create View ssas.model_json_341112_cultures_translations_model_tables_hierarchies
As
Select
    T1.databasename
  , T1.cultures_name
  , T1.cultures_translations_model_name
  , T1.cultures_translations_model_tables_name
  , j2.cultures_translations_model_tables_hierarchies_name
  , j2.cultures_translations_model_tables_hierarchies_translatedCaption
  , j2.cultures_translations_model_tables_hierarchies_levels_ja
From
    ssas.model_json_34111_cultures_translations_model_tables                      As T1
    Cross Apply OpenJson ( T1.cultures_translations_model_tables_hierarchies_ja ) As j1
    Cross Apply
    OpenJson ( j1.Value )
    With
    (
        cultures_translations_model_tables_hierarchies_name NVarchar ( 128 ) N'$.name'
      , cultures_translations_model_tables_hierarchies_translatedCaption NVarchar ( 128 ) N'$.translatedCaption'
      , cultures_translations_model_tables_hierarchies_levels_ja NVarchar ( Max ) N'$.levels' As Json --array
    ) As j2
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b632fc8a-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341112_cultures_translations_model_tables_hierarchies', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_tables_hierarchies_levels_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b532fc8a-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341112_cultures_translations_model_tables_hierarchies', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_tables_hierarchies_translatedCaption';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b432fc8a-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341112_cultures_translations_model_tables_hierarchies', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_tables_hierarchies_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b332fc8a-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341112_cultures_translations_model_tables_hierarchies', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b232fc8a-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341112_cultures_translations_model_tables_hierarchies', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b132fc8a-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341112_cultures_translations_model_tables_hierarchies', @level2type = N'COLUMN', @level2name = N'cultures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b032fc8a-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341112_cultures_translations_model_tables_hierarchies', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0f09da81-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341112_cultures_translations_model_tables_hierarchies';

