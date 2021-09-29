
CREATE View ssas.model_json_313111_tables_partitions_source_StringFrom
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
  , StringFrom = Trim (   Case
                              When PosFrom > 0
                                  Then
                                  Case
                                      When PosFromWhere > PosFrom
                                          Then
                                          Substring (
                                                        tables_partitions_source_query
                                                      , PosFrom + 6
                                                      , PosFromWhere - PosFrom - 6
                                                    )
                                      Else
                                          Substring (
                                                        tables_partitions_source_query
                                                      , PosFrom + 6
                                                      , Len ( tables_partitions_source_query ) - PosFrom - 5
                                                    )
                                  End
                          End
                      )
From
    ssas.model_json_31311_tables_partitions_source_PosFrom
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd486717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313111_tables_partitions_source_StringFrom', @level2type = N'COLUMN', @level2name = N'StringFrom';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd386717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313111_tables_partitions_source_StringFrom', @level2type = N'COLUMN', @level2name = N'PosFromWhere';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd286717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313111_tables_partitions_source_StringFrom', @level2type = N'COLUMN', @level2name = N'PosFrom';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd186717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313111_tables_partitions_source_StringFrom', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd086717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313111_tables_partitions_source_StringFrom', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_query_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cf86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313111_tables_partitions_source_StringFrom', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_query';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ce86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313111_tables_partitions_source_StringFrom', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_expression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cd86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313111_tables_partitions_source_StringFrom', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_dataSource';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cc86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313111_tables_partitions_source_StringFrom', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cb86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313111_tables_partitions_source_StringFrom', @level2type = N'COLUMN', @level2name = N'tables_partitions_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ca86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313111_tables_partitions_source_StringFrom', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c986717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313111_tables_partitions_source_StringFrom', @level2type = N'COLUMN', @level2name = N'tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c886717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313111_tables_partitions_source_StringFrom', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b208a66b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313111_tables_partitions_source_StringFrom';

