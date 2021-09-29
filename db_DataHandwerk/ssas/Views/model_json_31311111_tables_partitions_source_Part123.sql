﻿
CREATE View ssas.model_json_31311111_tables_partitions_source_Part123
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
    ssas.model_json_3131111_tables_partitions_source_PosDot
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f586717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31311111_tables_partitions_source_Part123', @level2type = N'COLUMN', @level2name = N'Part3';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f486717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31311111_tables_partitions_source_Part123', @level2type = N'COLUMN', @level2name = N'Part2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f386717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31311111_tables_partitions_source_Part123', @level2type = N'COLUMN', @level2name = N'Part1';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f286717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31311111_tables_partitions_source_Part123', @level2type = N'COLUMN', @level2name = N'PosDot2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f186717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31311111_tables_partitions_source_Part123', @level2type = N'COLUMN', @level2name = N'PosDot1';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f086717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31311111_tables_partitions_source_Part123', @level2type = N'COLUMN', @level2name = N'StringFrom';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ef86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31311111_tables_partitions_source_Part123', @level2type = N'COLUMN', @level2name = N'PosFromWhere';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ee86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31311111_tables_partitions_source_Part123', @level2type = N'COLUMN', @level2name = N'PosFrom';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ed86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31311111_tables_partitions_source_Part123', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ec86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31311111_tables_partitions_source_Part123', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_query_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eb86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31311111_tables_partitions_source_Part123', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_query';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ea86717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31311111_tables_partitions_source_Part123', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_expression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e986717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31311111_tables_partitions_source_Part123', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_dataSource';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e886717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31311111_tables_partitions_source_Part123', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e786717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31311111_tables_partitions_source_Part123', @level2type = N'COLUMN', @level2name = N'tables_partitions_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e686717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31311111_tables_partitions_source_Part123', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e586717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31311111_tables_partitions_source_Part123', @level2type = N'COLUMN', @level2name = N'tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e486717b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31311111_tables_partitions_source_Part123', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b408a66b-7a20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31311111_tables_partitions_source_Part123';
