
CREATE View repo.Index_union
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
    repo_sys.Index_unique                        As T1
    Left Join
        repo.Index_unique_IndexPatternColumnGuid As T2
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
    repo.Index_virtual                            As T1
    Left Join
        repo.Index_virtual_IndexPatternColumnGuid As T2
            On
            T2.index_guid = T1.index_guid
Union All
Select
    T1.index_guid
  , T1.RepoObject_guid
  , T1.index_name
  , index_type            = Null
  , T1.is_index_unique
  , T1.is_index_primary_key
  , is_index_disabled     = Cast(0 As Bit)
  , T2.IndexPatternColumnGuid
  , referenced_index_guid = Null --maybe we need this later?
  , is_index_real         = Cast(1 As Bit)
From
    repo.Index_ssas_T                          As T1
    Left Join
        repo.Index_ssas_IndexPatternColumnGuid As T2
            On
            T2.index_guid = T1.index_guid
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
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[Index_unique_IndexPatternColumnGuid]
* [repo].[Index_virtual]
* [repo].[Index_virtual_IndexPatternColumnGuid]
* [repo_sys].[Index_unique]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_union';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'index_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_union';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'index_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_union';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_union';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'D0FC511B-0896-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_union';


GO
EXECUTE sp_addextendedproperty @name = N'has_execution_plan_issue', @value = N'1', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_union';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.Index_gross.adoc[]
* xref:repo.Index_Settings_ForUpdate.adoc[]
* xref:repo.Index_SqlConstraint_PkUq.adoc[]
* xref:repo.IndexReferencedReferencing.adoc[]
* xref:repo.usp_Index_finish.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_union';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.Index_unique_IndexPatternColumnGuid.adoc[]
* xref:repo.Index_virtual.adoc[]
* xref:repo.Index_virtual_IndexPatternColumnGuid.adoc[]
* xref:repo_sys.Index_unique.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_union';

