
/*
--get and check existing values

Select
    Distinct
    j2.[Key]
  , j2.Type
From
    ssas.model_json_31_tables                        As T1
    Cross Apply OpenJson ( T1.tables_partitions_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
order by
    j2.[Key]
  , j2.Type
Go

Select
    T1.*
  , j2.*
From
    ssas.model_json_31_tables                        As T1
    Cross Apply OpenJson ( T1.tables_partitions_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Go

Select
    DISTINCT
    j2.*
From
    ssas.model_json_31_tables                        As T1
    Cross Apply OpenJson ( T1.tables_partitions_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Where
    j2.[Key] = 'dataView'
GO

Select
    DISTINCT
    j2.*
From
    ssas.model_json_31_tables                        As T1
    Cross Apply OpenJson ( T1.tables_partitions_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Where
    j2.[Key] = 'mode'
Go
*/
CREATE View ssas.model_json_313_tables_partitions
As
Select
    T1.databasename
  , T1.tables_name
  , T1.RepoObject_guid
  , j2.tables_partitions_name
  , j2.tables_partitions_annotations_ja
  , j2.tables_partitions_dataView
  , j2.tables_partitions_mode
  , j2.tables_partitions_source_j
From
    ssas.model_json_31_tables_T                      As T1
    Cross Apply OpenJson ( T1.tables_partitions_ja ) As j1
    Cross Apply
    OpenJson ( j1.Value )
    With
    (
        tables_partitions_name NVarchar ( 500 ) N'$.name'
      , tables_partitions_annotations_ja NVarchar ( Max ) N'$.annotations' As Json
      , tables_partitions_dataView NVarchar ( 500 ) N'$.dataView'
      , tables_partitions_mode NVarchar ( 500 ) N'$.mode'
      , tables_partitions_source_j NVarchar ( Max ) N'$.source' As Json
    ) As j2
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8760d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313_tables_partitions', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_j';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8660d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313_tables_partitions', @level2type = N'COLUMN', @level2name = N'tables_partitions_mode';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8560d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313_tables_partitions', @level2type = N'COLUMN', @level2name = N'tables_partitions_dataView';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8460d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313_tables_partitions', @level2type = N'COLUMN', @level2name = N'tables_partitions_annotations_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8360d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313_tables_partitions', @level2type = N'COLUMN', @level2name = N'tables_partitions_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '661fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313_tables_partitions', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8260d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313_tables_partitions', @level2type = N'COLUMN', @level2name = N'tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8160d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313_tables_partitions', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f45fd8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313_tables_partitions';

