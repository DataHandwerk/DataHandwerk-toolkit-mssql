

/*
--get and check existing values

Select
    Distinct
    j2.[Key]
  , j2.Type
From
    ssas.model_json_36_perspectives                    As T1
    Cross Apply OpenJson ( T1.perspectives_tables_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
ORDER BY
    j2.[Key]
  , j2.Type
Go

Select
    T1.*
  , j2.*
From
    ssas.model_json_36_perspectives                    As T1
    Cross Apply OpenJson ( T1.perspectives_tables_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Go

Select
    DISTINCT
    j2.*
From
    ssas.model_json_36_perspectives                    As T1
    Cross Apply OpenJson ( T1.perspectives_tables_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Where
    j2.[Key] = 'columns'
GO
*/
CREATE View [ssas].[model_json_361_perspectives_tables]
As
Select
    T1.databasename
  , T1.perspectives_name
  , j2.perspectives_tables_name
  , j2.perspectives_tables_columns_ja
  , j2.perspectives_tables_hierarchies_ja
  , j2.perspectives_tables_measures_ja
From
    ssas.model_json_36_perspectives                    As T1
    Cross Apply OpenJson ( T1.perspectives_tables_ja ) As j1
    Cross Apply
    OpenJson ( j1.Value )
    With
    (
        perspectives_tables_name NVarchar ( 500 ) N'$.name'
      , perspectives_tables_columns_ja NVarchar ( Max ) N'$.columns' As Json
      , perspectives_tables_hierarchies_ja NVarchar ( Max ) N'$.hierarchies' As Json
      , perspectives_tables_measures_ja NVarchar ( Max ) N'$.measures' As Json
    ) As j2
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bb60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_361_perspectives_tables', @level2type = N'COLUMN', @level2name = N'perspectives_tables_measures_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ba60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_361_perspectives_tables', @level2type = N'COLUMN', @level2name = N'perspectives_tables_hierarchies_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b960d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_361_perspectives_tables', @level2type = N'COLUMN', @level2name = N'perspectives_tables_columns_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b860d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_361_perspectives_tables', @level2type = N'COLUMN', @level2name = N'perspectives_tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b760d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_361_perspectives_tables', @level2type = N'COLUMN', @level2name = N'perspectives_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b660d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_361_perspectives_tables', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0360d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_361_perspectives_tables';

