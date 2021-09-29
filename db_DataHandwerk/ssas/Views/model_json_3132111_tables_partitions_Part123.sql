
CREATE VIEW [ssas].[model_json_3132111_tables_partitions_Part123]
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
  , PosDot1
  , PosDot2
  --why we don't use STRING_SPLIT()
  --The output rows might be in any order. The order is not guaranteed to match the order of the substrings in the input string.
  , Part1 = Iif(PosDot1 > 2 And PosDot2 > PosDot1, Left(StringFrom, PosDot1 - 1), Null)
  , Part2 = Case
                When PosDot1 > 2
                    Then
                    Case
                        When PosDot2 > PosDot1
                            Then
                            Substring ( StringFrom, PosDot1 + 1, PosDot2 - PosDot1 - 1 )
                        Else
                            Left(StringFrom, PosDot1 - 1)
                    End
            End
  , Part3 = Case
                When PosDot1 > 2
                    Then
                    Case
                        When PosDot2 > PosDot1
                            Then
                            Right(StringFrom, Len ( StringFrom ) - PosDot2)
                        Else
                            Right(StringFrom, Len ( StringFrom ) - PosDot1)
                    End
            End
From
    ssas.model_json_313211_tables_partitions_PosDot
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bb86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3132111_tables_partitions_Part123', @level2type = N'COLUMN', @level2name = N'Part3';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ba86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3132111_tables_partitions_Part123', @level2type = N'COLUMN', @level2name = N'Part2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b986717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3132111_tables_partitions_Part123', @level2type = N'COLUMN', @level2name = N'Part1';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b886717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3132111_tables_partitions_Part123', @level2type = N'COLUMN', @level2name = N'PosDot2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b786717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3132111_tables_partitions_Part123', @level2type = N'COLUMN', @level2name = N'PosDot1';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b686717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3132111_tables_partitions_Part123', @level2type = N'COLUMN', @level2name = N'StringFrom';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b586717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3132111_tables_partitions_Part123', @level2type = N'COLUMN', @level2name = N'PosFromWhere';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b486717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3132111_tables_partitions_Part123', @level2type = N'COLUMN', @level2name = N'PosFromDoublequota';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b386717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3132111_tables_partitions_Part123', @level2type = N'COLUMN', @level2name = N'PosFrom';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b286717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3132111_tables_partitions_Part123', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_j';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b186717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3132111_tables_partitions_Part123', @level2type = N'COLUMN', @level2name = N'tables_partitions_mode';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b086717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3132111_tables_partitions_Part123', @level2type = N'COLUMN', @level2name = N'tables_partitions_dataView';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'af86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3132111_tables_partitions_Part123', @level2type = N'COLUMN', @level2name = N'tables_partitions_annotations_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ae86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3132111_tables_partitions_Part123', @level2type = N'COLUMN', @level2name = N'tables_partitions_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ad86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3132111_tables_partitions_Part123', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ac86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3132111_tables_partitions_Part123', @level2type = N'COLUMN', @level2name = N'tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ab86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3132111_tables_partitions_Part123', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b808a66b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3132111_tables_partitions_Part123';

