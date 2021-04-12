Create View repo.IndexColumn_union
As
--
Select
    index_guid
  , index_column_id
  , is_descending_key
  , RepoObjectColumn_guid
  , parent_RepoObject_guid
  , index_name
  , parent_schema_name
  , parent_SysObject_name
  , SysObject_column_name
  , SysObject_column_user_type_fullname
  , is_index_unique
  , is_index_primary_key
  , is_index_real
  , parent_SysObject_fullname
From
    repo_sys.IndexColumn_unique As T1
Union All
Select
    index_guid
  , index_column_id
  , is_descending_key
  , RepoObjectColumn_guid
  , parent_RepoObject_guid
  , index_name
  , parent_schema_name
  , parent_Object_name
  , Object_column_name
  , column_user_type_fullname
  , is_index_unique
  , is_index_primary_key
  , is_index_real
  , parent_Object_fullname
From
    repo.IndexColumn_virtual_gross As T2;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '6790291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_union';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0af67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_union'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_column_user_type_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '09f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_union'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_column_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '04f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_union'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '08f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_union'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_SysObject_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0ef67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_union'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '07f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_union'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '05f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_union'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0bf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_union'
  , @level2type = N'COLUMN'
  , @level2name = N'is_index_unique';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0df67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_union'
  , @level2type = N'COLUMN'
  , @level2name = N'is_index_real';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0cf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_union'
  , @level2type = N'COLUMN'
  , @level2name = N'is_index_primary_key';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '03f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_union'
  , @level2type = N'COLUMN'
  , @level2name = N'is_descending_key';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '06f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_union'
  , @level2type = N'COLUMN'
  , @level2name = N'index_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '01f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_union'
  , @level2type = N'COLUMN'
  , @level2name = N'index_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '02f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_union'
  , @level2type = N'COLUMN'
  , @level2name = N'index_column_id';
Go