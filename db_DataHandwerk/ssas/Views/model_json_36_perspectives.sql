
/*
--check

Select
    Distinct
    j2.[Key]
  , j2.Type
From
    ssas.model_json_20                             As T1
    Cross Apply OpenJson ( T1.l2_perspectives_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
order by
    j2.[Key]
  , j2.Type
Go
*/
CREATE View ssas.model_json_36_perspectives
As
Select
    T1.databasename
  , j2.perspectives_name
  , j2.perspectives_tables_ja
From
    ssas.model_json_20                             As T1
    Cross Apply OpenJson ( T1.l2_perspectives_ja ) As j1
    Cross Apply
    OpenJson ( j1.Value )
    With
    (
        perspectives_name NVarchar ( 500 ) N'$.name'
      , perspectives_tables_ja NVarchar ( Max ) N'$.tables' As Json
    ) As j2
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6060d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_36_perspectives', @level2type = N'COLUMN', @level2name = N'perspectives_tables_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5f60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_36_perspectives', @level2type = N'COLUMN', @level2name = N'perspectives_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5e60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_36_perspectives', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0260d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_36_perspectives';

