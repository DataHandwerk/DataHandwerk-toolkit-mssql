
CREATE VIEW [ssas].[model_json_313211_tables_partitions_PosDot]
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
  , StringFrom
  , PosDot1 = CharIndex ( '.', StringFrom )
  , PosDot2 = CharIndex ( '.', StringFrom, CharIndex ( '.', StringFrom ) + 1 )
From
    ssas.model_json_31321_tables_partitions_StringFrom
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aa86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313211_tables_partitions_PosDot', @level2type = N'COLUMN', @level2name = N'PosDot2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a986717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313211_tables_partitions_PosDot', @level2type = N'COLUMN', @level2name = N'PosDot1';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a886717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313211_tables_partitions_PosDot', @level2type = N'COLUMN', @level2name = N'StringFrom';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a786717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313211_tables_partitions_PosDot', @level2type = N'COLUMN', @level2name = N'PosFromWhere';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a686717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313211_tables_partitions_PosDot', @level2type = N'COLUMN', @level2name = N'PosFromDoublequota';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a586717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313211_tables_partitions_PosDot', @level2type = N'COLUMN', @level2name = N'PosFrom';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a486717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313211_tables_partitions_PosDot', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_j';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a386717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313211_tables_partitions_PosDot', @level2type = N'COLUMN', @level2name = N'tables_partitions_mode';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a286717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313211_tables_partitions_PosDot', @level2type = N'COLUMN', @level2name = N'tables_partitions_dataView';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a186717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313211_tables_partitions_PosDot', @level2type = N'COLUMN', @level2name = N'tables_partitions_annotations_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a086717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313211_tables_partitions_PosDot', @level2type = N'COLUMN', @level2name = N'tables_partitions_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9f86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313211_tables_partitions_PosDot', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9e86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313211_tables_partitions_PosDot', @level2type = N'COLUMN', @level2name = N'tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9d86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313211_tables_partitions_PosDot', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b708a66b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_313211_tables_partitions_PosDot';

