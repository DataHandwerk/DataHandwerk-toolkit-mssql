
/*
Select
    Distinct
    j2.[Key]
  , j2.Type
From
    ssas.model_json_10 As T1
    Cross Apply OpenJson ( T1.l1_model_j )
                --As j1
                --Cross Apply OpenJson ( j1.Value )
                       As j2
order by j2.[Key]
Go

Select
    T1.*
  , j2.*
From
    ssas.model_json_10 As T1
    Cross Apply OpenJson ( T1.l1_model_j )
                --As j1
                --Cross Apply OpenJson ( j1.Value ) 
                       As j2
Go

*/

CREATE View ssas.model_json_20
As
Select
    --T1.*
    --, j2.*
    T1.databasename
  , T1.l1_name
  , T1.l1_compatibilityLevel
  , T1.l1_id
  --, T1.l1_model_j
  , j2.l2_name
  , j2.l2_annotations_ja
  , j2.l2_culture
  , j2.l2_cultures_ja
  , j2.l2_dataSources_ja
  , j2.l2_description
  , j2.l2_description_ja
  , j2.l2_perspectives_ja
  , j2.l2_relationships_ja
  , j2.l2_roles_ja
  , j2.l2_tables_ja
From
    ssas.model_json_10 As T1
    Cross Apply
    OpenJson ( T1.l1_model_j )
    --As j1
    --Cross Apply
    --OpenJson ( j1.Value )
    With
    (
        l2_name NVarchar ( 500 ) N'$.name'
      , l2_annotations_ja NVarchar ( Max ) N'$.annotations' As Json
      , l2_culture NVarchar ( 500 ) N'$.culture'
      , l2_cultures_ja NVarchar ( Max ) N'$.cultures' As Json
      , l2_dataSources_ja NVarchar ( Max ) N'$.dataSources' As Json
      , l2_description NVarchar ( Max ) N'$.description'
      , l2_description_ja NVarchar ( Max ) N'$.description' As Json
      , l2_perspectives_ja NVarchar ( Max ) N'$.perspectives' As Json
      , l2_relationships_ja NVarchar ( Max ) N'$.relationships' As Json
      , l2_roles_ja NVarchar ( Max ) N'$.roles' As Json
      , l2_tables_ja NVarchar ( Max ) N'$.tables' As Json
    --, l2_calculationGroups_ja NVarchar ( Max ) N'$.calculationGroups' As Json --?, not used in my models
    )                  As j2
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3860d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_20', @level2type = N'COLUMN', @level2name = N'l2_tables_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3760d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_20', @level2type = N'COLUMN', @level2name = N'l2_roles_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3660d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_20', @level2type = N'COLUMN', @level2name = N'l2_relationships_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3560d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_20', @level2type = N'COLUMN', @level2name = N'l2_perspectives_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2a064fc7-110b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_20', @level2type = N'COLUMN', @level2name = N'l2_description_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '29064fc7-110b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_20', @level2type = N'COLUMN', @level2name = N'l2_description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3460d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_20', @level2type = N'COLUMN', @level2name = N'l2_dataSources_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3360d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_20', @level2type = N'COLUMN', @level2name = N'l2_cultures_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3260d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_20', @level2type = N'COLUMN', @level2name = N'l2_culture';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3160d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_20', @level2type = N'COLUMN', @level2name = N'l2_annotations_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3060d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_20', @level2type = N'COLUMN', @level2name = N'l2_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2f60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_20', @level2type = N'COLUMN', @level2name = N'l1_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2e60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_20', @level2type = N'COLUMN', @level2name = N'l1_compatibilityLevel';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2d60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_20', @level2type = N'COLUMN', @level2name = N'l1_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2c60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_20', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f05fd8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_20';

