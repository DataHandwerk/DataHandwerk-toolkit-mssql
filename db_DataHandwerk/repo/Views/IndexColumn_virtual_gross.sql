
CREATE View repo.IndexColumn_virtual_gross
As
--
Select
    icv.index_guid
  , icv.index_column_id
  , icv.is_descending_key
  , icv.RepoObjectColumn_guid
  , iv.parent_RepoObject_guid
  , iv.index_name
  , parent_schema_name        = Coalesce ( ro.SysObject_schema_name, ro.RepoObject_schema_name )
  , parent_Object_name        = Iif(
                                    Not ro.SysObject_name Is Null
                                    And ro.is_SysObject_name_uniqueidentifier = 0
                                  , ro.SysObject_name
                                  , ro.RepoObject_name)
  , Object_column_name        = Iif(
                                    Not roc.SysObjectColumn_name Is Null
                                    And roc.is_SysObjectColumn_name_uniqueidentifier = 0
                                  , roc.SysObjectColumn_name
                                  , roc.RepoObjectColumn_name)
  , column_user_type_fullname = roc.Repo_user_type_fullname
  , iv.is_index_unique
  , iv.is_index_primary_key
  , parent_Object_fullname    = Iif(
                                    Not ro.SysObject_fullname Is Null
                                    And ro.is_SysObject_name_uniqueidentifier = 0
                                  , ro.SysObject_fullname
                                  , ro.RepoObject_fullname)
  , is_index_real             = Cast(0 As Bit)
From
    repo.IndexColumn_virtual  As icv
    Inner Join
        repo.Index_virtual    As iv
            On
            icv.index_guid            = iv.index_guid

    Inner Join
        repo.RepoObjectColumn As roc
            On
            roc.RepoObjectColumn_guid = icv.RepoObjectColumn_guid

    Left Join
        repo.RepoObject       As ro
            On
            ro.RepoObject_guid        = iv.parent_RepoObject_guid
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '0690291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_gross';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '73f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '76f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '74f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '77f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_Object_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '7cf27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_Object_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '78f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Object_column_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '7af27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_index_unique';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '7df27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_index_real';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '7bf27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_index_primary_key';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '72f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_descending_key';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '75f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'index_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '70f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'index_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '71f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'index_column_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '79f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'column_user_type_fullname';
Go

Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[IndexColumn_virtual].[RepoObjectColumn_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[Index_virtual].[parent_RepoObject_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[Index_virtual].[is_index_unique]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_index_unique';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[Index_virtual].[is_index_primary_key]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_index_primary_key';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[IndexColumn_virtual].[is_descending_key]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_descending_key';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[Index_virtual].[index_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'index_name';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[IndexColumn_virtual].[index_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'index_guid';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[IndexColumn_virtual].[index_column_id]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'index_column_id';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'consecutive number of the column within the index.
sys.index_columns.index_column_id: "ID of the index column. index_column_id is unique only within index_id."
'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'index_column_id';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[Repo_user_type_fullname]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'column_user_type_fullname';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[Index_virtual]
* [repo].[IndexColumn_virtual]
* [repo].[RepoObject]
* [repo].[RepoObjectColumn]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_virtual_gross';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'index_column_id', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_virtual_gross';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'int', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_virtual_gross';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = '9ef6dc3b-119e-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_virtual_gross';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.IndexColumn_union.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_virtual_gross';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.Index_virtual.adoc[]
* xref:repo.IndexColumn_virtual.adoc[]
* xref:repo.RepoObject.adoc[]
* xref:repo.RepoObjectColumn.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_virtual_gross';

