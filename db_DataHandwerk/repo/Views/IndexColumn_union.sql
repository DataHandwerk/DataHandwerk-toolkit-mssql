
CREATE View repo.IndexColumn_union
As
Select
    T1.index_guid
  , T1.index_column_id
  , T1.is_descending_key
  , T1.RepoObjectColumn_guid
  , T1.parent_RepoObject_guid
  , T1.index_name
  , T1.parent_schema_name
  , T1.parent_SysObject_name
  , T1.SysObject_column_name
  , T1.SysObject_column_user_type_fullname
  , T1.is_index_unique
  , T1.is_index_primary_key
  , T1.is_index_real
  , T1.parent_SysObject_fullname
From
    repo_sys.IndexColumn_unique As T1
Where
    Not T1.index_guid Is Null
Union All
Select
    T2.index_guid
  , T2.index_column_id
  , T2.is_descending_key
  , T2.RepoObjectColumn_guid
  , T2.parent_RepoObject_guid
  , T2.index_name
  , T2.parent_schema_name
  , T2.parent_Object_name
  , T2.Object_column_name
  , T2.column_user_type_fullname
  , T2.is_index_unique
  , T2.is_index_primary_key
  , T2.is_index_real
  , T2.parent_Object_fullname
From
    repo.IndexColumn_virtual_gross As T2
Where
    Not T2.index_guid Is Null
Union All
Select
    T2.index_guid
  , T2.index_column_id
  , T2.is_descending_key
  , T2.RepoObjectColumn_guid
  , T2.parent_RepoObject_guid
  , T2.index_name
  , T2.parent_schema_name
  , T2.parent_Object_name
  , T2.Object_column_name
  , T2.column_user_type_fullname
  , T2.is_index_unique
  , T2.is_index_primary_key
  , T2.is_index_real
  , T2.parent_Object_fullname
From
    repo.IndexColumn_ssas_gross As T2
Where
    Not T2.index_guid Is Null
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
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[IndexColumn_ssas_gross]
* [repo].[IndexColumn_virtual_gross]
* [repo_sys].[IndexColumn_unique]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_union';




GO



GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'index_guid,index_column_id', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_union';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier,int', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_union';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'FD0EFFE1-0896-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_union';


GO
EXECUTE sp_addextendedproperty @name = N'has_execution_plan_issue', @value = N'1', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_union';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.Index_ColumList.adoc[]
* xref:repo.Index_IndexPattern.adoc[]
* xref:repo.IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing.adoc[]
* xref:repo.RepoObjectColumn_gross2.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_union';




GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.IndexColumn_ssas_gross.adoc[]
* xref:repo.IndexColumn_virtual_gross.adoc[]
* xref:repo_sys.IndexColumn_unique.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_union';




GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_union';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_union';

