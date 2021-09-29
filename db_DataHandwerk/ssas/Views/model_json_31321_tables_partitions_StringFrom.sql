
CREATE VIEW [ssas].[model_json_31321_tables_partitions_StringFrom]
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
  , PosFrom
  , PosFromDoublequota
  , PosFromWhere
  , StringFrom = Trim (   Case
                              When PosFrom > 0
                                  Then
                                  Case
                                      When PosFromWhere
                                           Between PosFrom And PosFromDoublequota
                                          Then
                                          Substring (
                                                        tables_partitions_source_j
                                                      , PosFrom + 6
                                                      , PosFromWhere - PosFrom - 6
                                                    )
                                      When PosFromDoublequota > PosFrom
                                          Then
                                          Substring (
                                                        tables_partitions_source_j
                                                      , PosFrom + 6
                                                      , PosFromDoublequota - PosFrom - 6
                                                    )
                                  End
                          End
                      )
From
    ssas.model_json_3132_tables_partitions_PosFrom
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9c86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31321_tables_partitions_StringFrom', @level2type = N'COLUMN', @level2name = N'StringFrom';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9b86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31321_tables_partitions_StringFrom', @level2type = N'COLUMN', @level2name = N'PosFromWhere';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9a86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31321_tables_partitions_StringFrom', @level2type = N'COLUMN', @level2name = N'PosFromDoublequota';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9986717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31321_tables_partitions_StringFrom', @level2type = N'COLUMN', @level2name = N'PosFrom';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9886717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31321_tables_partitions_StringFrom', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_j';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9786717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31321_tables_partitions_StringFrom', @level2type = N'COLUMN', @level2name = N'tables_partitions_mode';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9686717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31321_tables_partitions_StringFrom', @level2type = N'COLUMN', @level2name = N'tables_partitions_dataView';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9586717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31321_tables_partitions_StringFrom', @level2type = N'COLUMN', @level2name = N'tables_partitions_annotations_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9486717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31321_tables_partitions_StringFrom', @level2type = N'COLUMN', @level2name = N'tables_partitions_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9386717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31321_tables_partitions_StringFrom', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9286717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31321_tables_partitions_StringFrom', @level2type = N'COLUMN', @level2name = N'tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9186717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31321_tables_partitions_StringFrom', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b608a66b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31321_tables_partitions_StringFrom';

