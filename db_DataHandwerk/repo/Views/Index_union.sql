Create View repo.Index_union
As
--
Select
    T1.index_guid
  , T1.parent_RepoObject_guid
  , T1.index_name
  , T1.index_type
  , T1.is_index_unique
  , T1.is_index_primary_key
  , T1.is_index_disabled
  , T2.IndexPatternColumnGuid
  , referenced_index_guid = Null
  , is_index_real         = Cast(1 As Bit)
From
    repo_sys.Index_unique                        T1
    Left Join
        repo.Index_unique_IndexPatternColumnGuid T2
            On
            T2.index_guid = T1.index_guid
Union All
Select
    T1.index_guid
  , T1.parent_RepoObject_guid
  , T1.index_name
  , T1.index_type
  , T1.is_index_unique
  , T1.is_index_primary_key
  , T1.is_index_disabled
  , T2.IndexPatternColumnGuid
  , T1.referenced_index_guid
  , is_index_real = Cast(0 As Bit)
From
    repo.Index_virtual                            T1
    Left Join
        repo.Index_virtual_IndexPatternColumnGuid T2
            On
            T2.index_guid = T1.index_guid;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '2590291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_union';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1df37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_union'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_index_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '18f37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_union'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1bf37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_union'
  , @level2type = N'COLUMN'
  , @level2name = N'is_index_unique';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1ff37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_union'
  , @level2type = N'COLUMN'
  , @level2name = N'is_index_real';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1cf37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_union'
  , @level2type = N'COLUMN'
  , @level2name = N'is_index_primary_key';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1ef37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_union'
  , @level2type = N'COLUMN'
  , @level2name = N'is_index_disabled';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1af37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_union'
  , @level2type = N'COLUMN'
  , @level2name = N'index_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '19f37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_union'
  , @level2type = N'COLUMN'
  , @level2name = N'index_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '17f37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_union'
  , @level2type = N'COLUMN'
  , @level2name = N'index_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6cce8eb8-5f62-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_union'
  , @level2type = N'COLUMN'
  , @level2name = N'IndexPatternColumnGuid';
Go