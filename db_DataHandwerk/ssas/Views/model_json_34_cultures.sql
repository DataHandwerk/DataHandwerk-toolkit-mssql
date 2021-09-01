
/*
--check

Select
    Distinct
    j2.[Key]
  , j2.Type
From
    ssas.model_json_20                         As T1
    Cross Apply OpenJson ( T1.l2_cultures_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
order by
    j2.[Key]
  , j2.Type
Go
*/
CREATE View ssas.model_json_34_cultures
As
Select
    T1.databasename
  , j2.cultures_name
  , j2.cultures_translations_j
From
    ssas.model_json_20                         As T1
    Cross Apply OpenJson ( T1.l2_cultures_ja ) As j1
    Cross Apply
    OpenJson ( j1.Value )
    With
    (
        cultures_name NVarchar ( 500 ) N'$.name'
      , cultures_translations_j NVarchar ( Max ) N'$.translations' As Json
    ) As j2
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5760d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_34_cultures', @level2type = N'COLUMN', @level2name = N'cultures_translations_j';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5660d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_34_cultures', @level2type = N'COLUMN', @level2name = N'cultures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5560d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_34_cultures', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'fc5fd8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_34_cultures';

