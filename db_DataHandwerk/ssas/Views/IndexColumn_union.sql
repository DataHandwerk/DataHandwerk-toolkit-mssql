
CREATE View ssas.IndexColumn_union
As
Select
    index_name           = Cast(index_name As NVarchar(450))
  , index_column_id
  , RepoObjectColumn_guid
  , is_descending_key
  , is_index_primary_key
  , is_index_unique
  , databasename
  , TableID
  , ColumnName           = ExplicitName
  , type
  , RepoObject_guid
  , TableName
From
    ssas.IndexColumn_from_IsKey
Union All
Select
    index_name = Cast(index_name As NVarchar(450))
  , index_column_id
  , RepoObjectColumn_guid
  , is_descending_key
  , is_index_primary_key
  , is_index_unique
  , databasename
  , TableID
  , ExplicitName
  , type
  , RepoObject_guid
  , TableName
From
    ssas.IndexColumn_from_IsUnique
--exlcude columns, already provided in [ssas].[IndexColumn_from_IsKey]
Where
    is_index_primary_key = 0
    --it looks like these are artificial columns
    --we don't want them in puml
    And type             <> 3
Union All
Select
    index_name = Cast(index_name As NVarchar(450))
  , index_column_id
  , RepoObjectColumn_guid
  , is_descending_key
  , is_index_primary_key
  , is_index_unique
  , databasename
  , TableID
  , ExplicitName
  , type
  , RepoObject_guid
  , TableName
From
    ssas.IndexColumn_from_Relationship
--exlcude columns, already provided in [ssas].[IndexColumn_from_IsKey] or [ssas].[IndexColumn_from_IsUnique]
Where
    is_index_primary_key = 0
    And is_index_unique  = 0
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '936d05d0-0b08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'IndexColumn_union', @level2type = N'COLUMN', @level2name = N'TableName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '926d05d0-0b08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'IndexColumn_union', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '916d05d0-0b08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'IndexColumn_union', @level2type = N'COLUMN', @level2name = N'type';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8f6d05d0-0b08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'IndexColumn_union', @level2type = N'COLUMN', @level2name = N'TableID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8e6d05d0-0b08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'IndexColumn_union', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8d6d05d0-0b08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'IndexColumn_union', @level2type = N'COLUMN', @level2name = N'is_index_unique';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8c6d05d0-0b08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'IndexColumn_union', @level2type = N'COLUMN', @level2name = N'is_index_primary_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8b6d05d0-0b08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'IndexColumn_union', @level2type = N'COLUMN', @level2name = N'is_descending_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8a6d05d0-0b08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'IndexColumn_union', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '896d05d0-0b08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'IndexColumn_union', @level2type = N'COLUMN', @level2name = N'index_column_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '886d05d0-0b08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'IndexColumn_union', @level2type = N'COLUMN', @level2name = N'index_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '989cf1c3-0b08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'IndexColumn_union';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f14578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'IndexColumn_union', @level2type = N'COLUMN', @level2name = N'ColumnName';

