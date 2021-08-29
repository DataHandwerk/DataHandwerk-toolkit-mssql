


/*
can be used to update data in repo.Index_virtual
the RepoObject names are shown, can be used for sorting
*/
CREATE View [repo].[Index_virtual_ForUpdate]
As
Select
    iv.index_guid
  , iv.has_managedName
  , iv.index_name
  , iv.index_type
  , iv.is_index_disabled
  , iv.is_index_primary_key
  , iv.is_index_unique
  , iv.parent_RepoObject_guid
  , iv.referenced_index_guid
  , iv.RowNumberInReferencing
  , iset.IndexPatternColumnDatatype
  , iset.IndexPatternColumnName
  , iset.IndexSemanticGroup
  , ro.RepoObject_fullname
  , ro.RepoObject_fullname2
  , ro.SysObject_fullname
  , ro.SysObject_fullname2
  , parent.is_persistence
  , parent.is_repo_managed
From
    repo.Index_virtual        As iv
    Inner Join
        repo.RepoObject       As ro
            On
            ro.RepoObject_guid     = iv.parent_RepoObject_guid

    Left Join
        repo.Index_Settings   As iset
            On
            iset.index_guid        = iv.index_guid

    Left Join
        repo.RepoObject_gross As parent
            On
            parent.RepoObject_guid = iv.parent_RepoObject_guid
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'b45a9de2-3799-eb11-84f5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_virtual_ForUpdate'
  , @level2type = N'COLUMN'
  , @level2name = N'is_repo_managed';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'b35a9de2-3799-eb11-84f5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_virtual_ForUpdate'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4b00062f-0b99-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_virtual_ForUpdate'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4a00062f-0b99-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_virtual_ForUpdate'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4900062f-0b99-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_virtual_ForUpdate'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4800062f-0b99-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_virtual_ForUpdate'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'b25a9de2-3799-eb11-84f5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_virtual_ForUpdate'
  , @level2type = N'COLUMN'
  , @level2name = N'IndexSemanticGroup';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'b15a9de2-3799-eb11-84f5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_virtual_ForUpdate'
  , @level2type = N'COLUMN'
  , @level2name = N'IndexPatternColumnName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'b05a9de2-3799-eb11-84f5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_virtual_ForUpdate'
  , @level2type = N'COLUMN'
  , @level2name = N'IndexPatternColumnDatatype';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4700062f-0b99-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_virtual_ForUpdate'
  , @level2type = N'COLUMN'
  , @level2name = N'RowNumberInReferencing';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4600062f-0b99-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_virtual_ForUpdate'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_index_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4500062f-0b99-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_virtual_ForUpdate'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4400062f-0b99-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_virtual_ForUpdate'
  , @level2type = N'COLUMN'
  , @level2name = N'is_index_unique';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4300062f-0b99-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_virtual_ForUpdate'
  , @level2type = N'COLUMN'
  , @level2name = N'is_index_primary_key';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4200062f-0b99-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_virtual_ForUpdate'
  , @level2type = N'COLUMN'
  , @level2name = N'is_index_disabled';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4100062f-0b99-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_virtual_ForUpdate'
  , @level2type = N'COLUMN'
  , @level2name = N'index_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4000062f-0b99-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_virtual_ForUpdate'
  , @level2type = N'COLUMN'
  , @level2name = N'index_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3f00062f-0b99-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_virtual_ForUpdate'
  , @level2type = N'COLUMN'
  , @level2name = N'has_managedName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3e00062f-0b99-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_virtual_ForUpdate'
  , @level2type = N'COLUMN'
  , @level2name = N'index_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '5f96b427-0b99-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_virtual_ForUpdate';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[Index_Settings]
* [repo].[Index_virtual]
* [repo].[RepoObject]
* [repo].[RepoObject_gross]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_ForUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'index_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_ForUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'index_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_ForUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_ForUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = 'f2384bf6-3799-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_ForUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.usp_index_inheritance.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_ForUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.Index_Settings.adoc[]
* xref:repo.Index_virtual.adoc[]
* xref:repo.RepoObject.adoc[]
* xref:repo.RepoObject_gross.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_ForUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[SysObject_fullname2]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_ForUpdate', @level2type = N'COLUMN', @level2name = N'SysObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat([SysObject_schema_name],''.'',[SysObject_name]))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_ForUpdate', @level2type = N'COLUMN', @level2name = N'SysObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[SysObject_fullname]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_ForUpdate', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[SysObject_schema_name],''].['',[SysObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_ForUpdate', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_virtual].[RowNumberInReferencing]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_ForUpdate', @level2type = N'COLUMN', @level2name = N'RowNumberInReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'the same index can be inherited several times into the same referenced object, if a source is used several times
for example
SELECT A_A = A.A, B_A = B.A from source_1 as A LEFT JOIN source_1 as B ON ... 
normaly these indexes should have different columns', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_ForUpdate', @level2type = N'COLUMN', @level2name = N'RowNumberInReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_fullname2]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_ForUpdate', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat([RepoObject_schema_name],''.'',[RepoObject_name]))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_ForUpdate', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_fullname]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_ForUpdate', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_ForUpdate', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_virtual].[referenced_index_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_ForUpdate', @level2type = N'COLUMN', @level2name = N'referenced_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_virtual].[parent_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_ForUpdate', @level2type = N'COLUMN', @level2name = N'parent_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[is_repo_managed]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_ForUpdate', @level2type = N'COLUMN', @level2name = N'is_repo_managed';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[is_persistence]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_ForUpdate', @level2type = N'COLUMN', @level2name = N'is_persistence';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_virtual].[is_index_unique]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_ForUpdate', @level2type = N'COLUMN', @level2name = N'is_index_unique';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_virtual].[is_index_primary_key]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_ForUpdate', @level2type = N'COLUMN', @level2name = N'is_index_primary_key';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_virtual].[is_index_disabled]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_ForUpdate', @level2type = N'COLUMN', @level2name = N'is_index_disabled';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_Settings].[IndexSemanticGroup]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_ForUpdate', @level2type = N'COLUMN', @level2name = N'IndexSemanticGroup';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_Settings].[IndexPatternColumnName]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_ForUpdate', @level2type = N'COLUMN', @level2name = N'IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_Settings].[IndexPatternColumnDatatype]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_ForUpdate', @level2type = N'COLUMN', @level2name = N'IndexPatternColumnDatatype';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_virtual].[index_type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_ForUpdate', @level2type = N'COLUMN', @level2name = N'index_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Type of index:
0 = Heap
1 = Clustered
2 = Nonclustered
3 = XML
4 = Spatial
5 = Clustered columnstore index. Applies to: SQL Server 2014 (12.x) and later.
6 = Nonclustered columnstore index. Applies to: SQL Server 2012 (11.x) and later.
7 = Nonclustered hash index. Applies to: SQL Server 2014 (12.x) and later.', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_ForUpdate', @level2type = N'COLUMN', @level2name = N'index_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_virtual].[index_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_ForUpdate', @level2type = N'COLUMN', @level2name = N'index_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_virtual].[index_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_ForUpdate', @level2type = N'COLUMN', @level2name = N'index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_virtual].[has_managedName]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_ForUpdate', @level2type = N'COLUMN', @level2name = N'has_managedName';

