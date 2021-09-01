
/*
--check

Select
    Distinct
    j2.[Key]
  , j2.Type
From
    ssas.model_json_20                            As T1
    Cross Apply OpenJson ( T1.l2_dataSources_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
order by
    j2.[Key]
  , j2.Type
Go
*/
CREATE View ssas.model_json_33_dataSources
As
Select
    T1.databasename
  , j2.dataSources_name
  , j2.dataSources_account
  , j2.dataSources_annotations_ja
  , j2.dataSources_connectionString
  , j2.dataSources_impersonationMode
  , j2.dataSources_provider
From
    ssas.model_json_20                            As T1
    Cross Apply OpenJson ( T1.l2_dataSources_ja ) As j1
    Cross Apply
    OpenJson ( j1.Value )
    With
    (
        dataSources_name NVarchar ( 500 ) N'$.name'
      , dataSources_account NVarchar ( 500 ) N'$.account'
      , dataSources_annotations_ja NVarchar ( Max ) N'$.annotations' As Json
      , dataSources_connectionString NVarchar ( 4000 ) N'$.connectionString'
      , dataSources_impersonationMode NVarchar ( 500 ) N'$.impersonationMode'
      , dataSources_provider NVarchar ( 500 ) N'$.provider'
    ) As j2
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5460d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_33_dataSources', @level2type = N'COLUMN', @level2name = N'dataSources_provider';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5360d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_33_dataSources', @level2type = N'COLUMN', @level2name = N'dataSources_impersonationMode';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5260d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_33_dataSources', @level2type = N'COLUMN', @level2name = N'dataSources_connectionString';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5160d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_33_dataSources', @level2type = N'COLUMN', @level2name = N'dataSources_annotations_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5060d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_33_dataSources', @level2type = N'COLUMN', @level2name = N'dataSources_account';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4f60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_33_dataSources', @level2type = N'COLUMN', @level2name = N'dataSources_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4e60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_33_dataSources', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'fa5fd8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_33_dataSources';

