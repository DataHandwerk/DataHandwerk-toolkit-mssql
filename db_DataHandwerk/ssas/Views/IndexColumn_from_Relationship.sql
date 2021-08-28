
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
                                    , T1.Name
                                    , '_col_'
                                    , T2.ExplicitName
                                  )
  , index_column_id      = 1 --one column per index => explicite value 1
  , T2.RepoObjectColumn_guid
  , is_descending_key    = 0
  , is_index_primary_key = T2.IsKey
  , is_index_unique      = T2.IsUnique
  , T2.databasename
  , T2.TableID
  , T2.ExplicitName
  , T2.type
  , T1.RepoObject_guid
  , TableName            = T1.Name
From
    ssas.TMSCHEMA_TABLES_T      As T1
    Inner Join
        ssas.TMSCHEMA_COLUMNS_T As T2
            On
            T2.databasename = T1.databasename
            And T2.TableID  = T1.ID
Where
    Exists
(
    Select
        1
    From
        ssas.TMSCHEMA_RELATIONSHIPS As T3
    Where
        T3.databasename     = T2.databasename
        And T3.FromTableID  = T2.TableID
        And T3.FromColumnID = T2.ID
)
    Or Exists
(
    Select
        1
    From
        ssas.TMSCHEMA_RELATIONSHIPS As T3
    Where
        T3.databasename   = T2.databasename
        And T3.ToTableID  = T2.TableID
        And T3.ToColumnID = T2.ID
)
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7b6d05d0-0b08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'IndexColumn_from_Relationship', @level2type = N'COLUMN', @level2name = N'TableName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7a6d05d0-0b08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'IndexColumn_from_Relationship', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '796d05d0-0b08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'IndexColumn_from_Relationship', @level2type = N'COLUMN', @level2name = N'type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '786d05d0-0b08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'IndexColumn_from_Relationship', @level2type = N'COLUMN', @level2name = N'ExplicitName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '776d05d0-0b08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'IndexColumn_from_Relationship', @level2type = N'COLUMN', @level2name = N'TableID';


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

