
CREATE View ssas.model_json_31311_tables_partitions_source_PosFrom
As
Select
    databasename
  , tables_name
  , RepoObject_guid
  , tables_partitions_name
  , tables_partitions_source_name
  , tables_partitions_source_dataSource
  , tables_partitions_source_expression
  , tables_partitions_source_query
  , tables_partitions_source_query_ja
  , tables_partitions_source_type
  , PosFrom      = CharIndex ( ' from ', tables_partitions_source_query )
  , PosFromWhere = CharIndex (
                                 ' where '
                               , tables_partitions_source_query
                               , CharIndex ( ' from ', tables_partitions_source_query ) + 6
                             )
From
    ssas.model_json_3131_tables_partitions_source
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c786717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31311_tables_partitions_source_PosFrom', @level2type = N'COLUMN', @level2name = N'PosFromWhere';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c686717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31311_tables_partitions_source_PosFrom', @level2type = N'COLUMN', @level2name = N'PosFrom';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c586717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31311_tables_partitions_source_PosFrom', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c486717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31311_tables_partitions_source_PosFrom', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_query_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c386717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31311_tables_partitions_source_PosFrom', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_query';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c286717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31311_tables_partitions_source_PosFrom', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_expression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c186717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31311_tables_partitions_source_PosFrom', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_dataSource';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c086717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31311_tables_partitions_source_PosFrom', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bf86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31311_tables_partitions_source_PosFrom', @level2type = N'COLUMN', @level2name = N'tables_partitions_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'be86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31311_tables_partitions_source_PosFrom', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bd86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31311_tables_partitions_source_PosFrom', @level2type = N'COLUMN', @level2name = N'tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bc86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31311_tables_partitions_source_PosFrom', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b108a66b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31311_tables_partitions_source_PosFrom';

