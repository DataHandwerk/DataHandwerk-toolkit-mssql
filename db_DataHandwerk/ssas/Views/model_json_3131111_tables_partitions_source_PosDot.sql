
CREATE View ssas.model_json_3131111_tables_partitions_source_PosDot
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
  , PosFrom
  , PosFromWhere
  , StringFrom
  , PosDot1 = CharIndex ( '.', StringFrom )
  , PosDot2 = CharIndex ( '.', StringFrom, CharIndex ( '.', StringFrom ) + 1 )
From
    ssas.model_json_313111_tables_partitions_source_StringFrom
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e386717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3131111_tables_partitions_source_PosDot', @level2type = N'COLUMN', @level2name = N'PosDot2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e286717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3131111_tables_partitions_source_PosDot', @level2type = N'COLUMN', @level2name = N'PosDot1';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e186717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3131111_tables_partitions_source_PosDot', @level2type = N'COLUMN', @level2name = N'StringFrom';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e086717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3131111_tables_partitions_source_PosDot', @level2type = N'COLUMN', @level2name = N'PosFromWhere';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'df86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3131111_tables_partitions_source_PosDot', @level2type = N'COLUMN', @level2name = N'PosFrom';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'de86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3131111_tables_partitions_source_PosDot', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dd86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3131111_tables_partitions_source_PosDot', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_query_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dc86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3131111_tables_partitions_source_PosDot', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_query';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'db86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3131111_tables_partitions_source_PosDot', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_expression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'da86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3131111_tables_partitions_source_PosDot', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_dataSource';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd986717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3131111_tables_partitions_source_PosDot', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd886717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3131111_tables_partitions_source_PosDot', @level2type = N'COLUMN', @level2name = N'tables_partitions_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd786717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3131111_tables_partitions_source_PosDot', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd686717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3131111_tables_partitions_source_PosDot', @level2type = N'COLUMN', @level2name = N'tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd586717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3131111_tables_partitions_source_PosDot', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b308a66b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3131111_tables_partitions_source_PosDot';

