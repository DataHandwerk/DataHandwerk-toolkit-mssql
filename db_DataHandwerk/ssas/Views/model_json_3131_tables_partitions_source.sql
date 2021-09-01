
/*
Select
    Distinct
    j2.[Key]
  , j2.Type
From
    ssas.model_json_313_tables_partitions As T1
    Cross Apply OpenJson ( T1.tables_partitions_source_j )
                --As j1
                --   Cross Apply OpenJson ( j1.Value )
                                          As j2
Order By
    j2.[Key]
  , j2.Type
GO   
*/
CREATE View ssas.model_json_3131_tables_partitions_source
As
Select
    T1.databasename
  , T1.tables_name
  , T1.tables_partitions_name
  --, T1.tables_partitions_annotations_ja
  --, T1.tables_partitions_dataView
  --, T1.tables_partitions_mode
  --, T1.tables_partitions_source_j
  , j2.tables_partitions_source_name
  , j2.tables_partitions_source_dataSource
  , j2.tables_partitions_source_expression
  , j2.tables_partitions_source_query
  , j2.tables_partitions_source_query_ja
  , j2.tables_partitions_source_type
From
    ssas.model_json_313_tables_partitions As T1
    Cross Apply
    OpenJson ( T1.tables_partitions_source_j )
    --As j1
    --Cross Apply
    --OpenJson ( j1.Value )
    With
    (
        tables_partitions_source_name NVarchar ( 500 ) N'$.name'
      , tables_partitions_source_dataSource NVarchar ( 500 ) N'$.dataSource'
      , tables_partitions_source_expression NVarchar ( Max ) N'$.expression'
      , tables_partitions_source_query NVarchar ( Max ) N'$.query'
      , tables_partitions_source_query_ja NVarchar ( Max ) N'$.query' As Json
      , tables_partitions_source_type NVarchar ( 500 ) N'$.type'
    )                                     As j2
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a760d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3131_tables_partitions_source', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a660d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3131_tables_partitions_source', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_query_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a560d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3131_tables_partitions_source', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_query';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a460d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3131_tables_partitions_source', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_expression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a360d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3131_tables_partitions_source', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_dataSource';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a260d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3131_tables_partitions_source', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a160d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3131_tables_partitions_source', @level2type = N'COLUMN', @level2name = N'tables_partitions_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a060d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3131_tables_partitions_source', @level2type = N'COLUMN', @level2name = N'tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9f60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3131_tables_partitions_source', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f55fd8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3131_tables_partitions_source';

