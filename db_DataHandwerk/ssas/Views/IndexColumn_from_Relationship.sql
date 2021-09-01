
/*
create index from each ssas column, which is used in any relationship

one index per column
*/
CREATE View ssas.IndexColumn_from_Relationship
As
Select
    index_name           = Concat (   'ix_'
                                    --, Row_Number () Over ( Partition By T2.databasename, T2.TableID Order By T2.ExplicitName )
                                    --, '_'
                                    , T2.tables_name
                                    , '_col_'
                                    , T2.tables_columns_name
                                  )
  , index_column_id      = 1 --one column per index => explicite value 1
  , T2.RepoObjectColumn_guid
  , is_descending_key    = 0
  , is_index_primary_key = IsNull ( T2.tables_columns_isKey, 0 )
  , is_index_unique      = IsNull ( T2.tables_columns_isUnique, 0 )
  , T2.databasename
  , T2.tables_columns_name
  , T2.tables_columns_type
  , T2.RepoObject_guid
  , TableName            = T2.tables_name
From
    ssas.model_json_311_tables_columns_T As T2
Where
    Exists
(
    Select
        1
    From
        ssas.model_json_32_relationships_T As T3
    Where
        T3.databasename                 = T2.databasename
        And T3.relationships_fromTable  = T2.tables_name
        And T3.relationships_fromColumn = T2.tables_columns_name
)
    Or Exists
(
    Select
        1
    From
        ssas.model_json_32_relationships_T As T3
    Where
        T3.databasename               = T2.databasename
        And T3.relationships_toTable  = T2.tables_name
        And T3.relationships_toColumn = T2.tables_columns_name
)
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7b6d05d0-0b08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'IndexColumn_from_Relationship', @level2type = N'COLUMN', @level2name = N'TableName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7a6d05d0-0b08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'IndexColumn_from_Relationship', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '766d05d0-0b08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'IndexColumn_from_Relationship', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '756d05d0-0b08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'IndexColumn_from_Relationship', @level2type = N'COLUMN', @level2name = N'is_index_unique';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '746d05d0-0b08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'IndexColumn_from_Relationship', @level2type = N'COLUMN', @level2name = N'is_index_primary_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '736d05d0-0b08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'IndexColumn_from_Relationship', @level2type = N'COLUMN', @level2name = N'is_descending_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '726d05d0-0b08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'IndexColumn_from_Relationship', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '716d05d0-0b08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'IndexColumn_from_Relationship', @level2type = N'COLUMN', @level2name = N'index_column_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '706d05d0-0b08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'IndexColumn_from_Relationship', @level2type = N'COLUMN', @level2name = N'index_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '969cf1c3-0b08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'IndexColumn_from_Relationship';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3d75e016-1c0b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'IndexColumn_from_Relationship', @level2type = N'COLUMN', @level2name = N'tables_columns_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3c75e016-1c0b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'IndexColumn_from_Relationship', @level2type = N'COLUMN', @level2name = N'tables_columns_name';

