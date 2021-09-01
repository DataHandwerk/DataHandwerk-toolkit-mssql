
/*
--get and check existing values

Select
    Distinct
    j2.[Key]
  , j2.Type
From
    ssas.model_json_31_tables                         As T1
    Cross Apply OpenJson ( T1.tables_hierarchies_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
ORDER BY
    j2.[Key]
  , j2.Type
Go

Select
    T1.*
  , j2.*
From
    ssas.model_json_31_tables                         As T1
    Cross Apply OpenJson ( T1.tables_hierarchies_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Go

Select
    DISTINCT
    j2.*
From
    ssas.model_json_31_tables                         As T1
    Cross Apply OpenJson ( T1.tables_hierarchies_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Where
    j2.[Key] = 'levels'
GO
*/
CREATE View ssas.model_json_314_tables_hierarchies
As
Select
    T1.databasename
  , T1.tables_name
  , T1.RepoObject_guid
  , j2.tables_hierarchies_name
  , j2.tables_hierarchies_levels_ja
From
    ssas.model_json_31_tables_T                       As T1
    Cross Apply OpenJson ( T1.tables_hierarchies_ja ) As j1
    Cross Apply
    OpenJson ( j1.Value )
    With
    (
        tables_hierarchies_name NVarchar ( 500 ) N'$.name'
      , tables_hierarchies_levels_ja NVarchar ( Max ) N'$.levels' As Json
    ) As j2
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8b60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_314_tables_hierarchies', @level2type = N'COLUMN', @level2name = N'tables_hierarchies_levels_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8a60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_314_tables_hierarchies', @level2type = N'COLUMN', @level2name = N'tables_hierarchies_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '671fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_314_tables_hierarchies', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8960d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_314_tables_hierarchies', @level2type = N'COLUMN', @level2name = N'tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8860d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_314_tables_hierarchies', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f65fd8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_314_tables_hierarchies';

