


/*
--check

Select
    Distinct
    j2.[Key]
  , j2.Type
From
    ssas.model_json_20                       As T1
    Cross Apply OpenJson ( T1.l2_tables_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
order by
    j2.[Key]
  , j2.Type

Go
*/

CREATE View [ssas].[model_json_31_tables]
As
Select
    T1.databasename
  --, T1.l1_name
  --, T1.l1_compatibilityLevel
  --, T1.l1_id
  --, T1.l2_name
  --, T1.l2_annotations_ja
  --, T1.l2_culture
  --, T1.l2_cultures_ja
  --, T1.l2_dataSources_ja
  --, T1.l2_perspectives_ja
  --, T1.l2_relationships_ja
  --, T1.l2_roles_ja
  --, T1.l2_tables_ja
  , j2.tables_name
  , j2.tables_annotations_ja
  , j2.tables_columns_ja
  , j2.tables_dataCategory
  , j2.tables_description
  , j2.tables_description_ja
  , j2.tables_hierarchies_ja
  , j2.tables_isHidden
  , j2.tables_measures_ja
  , j2.tables_partitions_ja
From
    ssas.model_json_20                       As T1
    Cross Apply OpenJson ( T1.l2_tables_ja ) As j1
    Cross Apply
    OpenJson ( j1.Value )
    With
    (
        tables_name NVarchar ( 128 ) N'$.name'
      , tables_annotations_ja NVarchar ( Max ) N'$.annotations' As Json
      , tables_columns_ja NVarchar ( Max ) N'$.columns' As Json
      , tables_dataCategory NVarchar ( 500 ) N'$.dataCategory'
      , tables_description NVarchar ( Max ) N'$.description'
      , tables_description_ja NVarchar ( Max ) N'$.description' As Json
      , tables_hierarchies_ja NVarchar ( Max ) N'$.hierarchies' As Json
      , tables_isHidden NVarchar ( 500 ) N'$.isHidden'
      , tables_measures_ja NVarchar ( Max ) N'$.measures' As Json
      , tables_partitions_ja NVarchar ( Max ) N'$.partitions' As Json
    ) As j2
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4360d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31_tables', @level2type = N'COLUMN', @level2name = N'tables_partitions_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4260d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31_tables', @level2type = N'COLUMN', @level2name = N'tables_measures_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4160d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31_tables', @level2type = N'COLUMN', @level2name = N'tables_isHidden';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4060d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31_tables', @level2type = N'COLUMN', @level2name = N'tables_hierarchies_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3f60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31_tables', @level2type = N'COLUMN', @level2name = N'tables_description_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3e60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31_tables', @level2type = N'COLUMN', @level2name = N'tables_description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3d60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31_tables', @level2type = N'COLUMN', @level2name = N'tables_dataCategory';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3c60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31_tables', @level2type = N'COLUMN', @level2name = N'tables_columns_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3b60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31_tables', @level2type = N'COLUMN', @level2name = N'tables_annotations_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3a60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31_tables', @level2type = N'COLUMN', @level2name = N'tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3960d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31_tables', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f15fd8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31_tables';

