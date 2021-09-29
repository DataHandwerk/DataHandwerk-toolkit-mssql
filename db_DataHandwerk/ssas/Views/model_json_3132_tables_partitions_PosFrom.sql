
CREATE VIEW [ssas].[model_json_3132_tables_partitions_PosFrom]
As
Select
    databasename
  , tables_name
  , RepoObject_guid
  , tables_partitions_name
  , tables_partitions_annotations_ja
  , tables_partitions_dataView
  , tables_partitions_mode
  , tables_partitions_source_j
  , PosFrom            = CharIndex ( ' from ', tables_partitions_source_j )
  , PosFromDoublequota = CharIndex (
                                       '"'
                                     , tables_partitions_source_j
                                     , CharIndex ( ' from ', tables_partitions_source_j ) + 6
                                   )
  , PosFromWhere       = CharIndex (
                                       ' where '
                                     , tables_partitions_source_j
                                     , CharIndex ( ' from ', tables_partitions_source_j ) + 6
                                   )
From
    ssas.model_json_313_tables_partitions
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9086717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3132_tables_partitions_PosFrom', @level2type = N'COLUMN', @level2name = N'PosFromWhere';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8f86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3132_tables_partitions_PosFrom', @level2type = N'COLUMN', @level2name = N'PosFromDoublequota';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8e86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3132_tables_partitions_PosFrom', @level2type = N'COLUMN', @level2name = N'PosFrom';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8d86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3132_tables_partitions_PosFrom', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_j';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8c86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3132_tables_partitions_PosFrom', @level2type = N'COLUMN', @level2name = N'tables_partitions_mode';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8b86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3132_tables_partitions_PosFrom', @level2type = N'COLUMN', @level2name = N'tables_partitions_dataView';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8a86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3132_tables_partitions_PosFrom', @level2type = N'COLUMN', @level2name = N'tables_partitions_annotations_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8986717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3132_tables_partitions_PosFrom', @level2type = N'COLUMN', @level2name = N'tables_partitions_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8886717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3132_tables_partitions_PosFrom', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8786717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3132_tables_partitions_PosFrom', @level2type = N'COLUMN', @level2name = N'tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8686717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3132_tables_partitions_PosFrom', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b508a66b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3132_tables_partitions_PosFrom';

