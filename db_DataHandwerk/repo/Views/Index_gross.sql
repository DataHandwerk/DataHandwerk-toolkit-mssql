Create View repo.Index_gross
As
--
Select
    T1.index_guid
  , T2.index_name
  , T2.index_type
  , T1.IndexPatternColumnDatatype
  , T1.IndexPatternColumnName
  , T1.IndexSemanticGroup
  , T2.is_index_disabled
  , T2.is_index_primary_key
  , T2.is_index_real
  , T2.is_index_unique
  , T3.is_persistence
  , T3.is_repo_managed
  , T2.parent_RepoObject_guid
  , T2.referenced_index_guid
  , T3.RepoObject_fullname
  , T3.RepoObject_fullname2
  --if [RowNumber_PatternPerParentObject] > 1 then these are duplicates by same ColumnPattern and normally should be deleted, at least in [repo].[Index_virtual] 
  , RowNumber_PatternPerParentObject = Row_Number () Over ( Partition By
                                                                T2.parent_RepoObject_guid
                                                              , T1.IndexPatternColumnName
                                                            Order By
                                                                --priority has real index
                                                                T2.is_index_real Desc
                                                              --priority PK
                                                              , T2.is_index_primary_key Desc
                                                              --priority not disabled
                                                              , T2.is_index_disabled
                                                              --priority first added index
                                                              , T2.index_guid
                                                          )
  , RowNumber_PkPerParentObject      = Row_Number () Over ( Partition By
                                                                T2.parent_RepoObject_guid
                                                              , T2.is_index_primary_key
                                                            Order By
                                                                --priority has real index
                                                                T2.is_index_real Desc
                                                              --priority not disabled
                                                              , T2.is_index_disabled
                                                              --priority first added index
                                                              , T2.index_guid
                                                          )
  , T3.SysObject_fullname
  , T3.SysObject_fullname2
  , T3.SysObject_schema_name
  , T3.SysObject_name
  , T3.SysObject_type
  , T3.SysObject_id
  , ColumList.AntoraIndexColumnList
  , ColumList.ColumnList
  , ColumList.ConstraintColumnList
  , ColumList.DbmlIndexColumnList
  , ColumList.PersistenceWhereColumnList
  , ColumList.PumlIndexColumnList
From
    repo.Index_Settings       As T1
    Inner Join
        repo.Index_union      As T2
            On
            T2.index_guid        = T1.index_guid

    Inner Join
        repo.RepoObject_gross As T3
            On
            T3.RepoObject_guid   = T2.parent_RepoObject_guid

    Left Join
        repo.Index_ColumList  As ColumList
            On
            ColumList.index_guid = T1.index_guid;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '8790291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '43f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '41f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '42f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '44f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '40f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RowNumber_PkPerParentObject';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3ff77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_index_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3ef77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3df77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_repo_managed';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3cf77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3bf77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_index_unique';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3af77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_index_real';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '39f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_index_primary_key';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '38f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_index_disabled';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '37f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'IndexSemanticGroup';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '36f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'IndexPatternColumnName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '35f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'IndexPatternColumnDatatype';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '34f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'index_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '33f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'index_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '32f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'index_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '46f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'ConstraintColumnList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '45f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'ColumnList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '11682e6a-3c65-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '517e36d5-5a65-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RowNumber_PatternPerParentObject';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '10682e6a-3c65-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '40df2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'DbmlIndexColumnList';
Go

Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_gross].[SysObject_type]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_type';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'reference in [repo_sys].[type]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_type';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_gross].[SysObject_schema_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_gross].[SysObject_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_name';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_gross].[SysObject_id]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_id';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_gross].[SysObject_fullname]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'(concat(''['',[SysObject_schema_name],''].['',[SysObject_name],'']''))'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[Index_ColumList].[ConstraintColumnList]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'ConstraintColumnList';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[Index_ColumList].[ColumnList]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'ColumnList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '7b9c578a-0194-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '7a9c578a-0194-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '7c9c578a-0194-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'AntoraIndexColumnList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'cec9519a-6298-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'PumlIndexColumnList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'cdc9519a-6298-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'PersistenceWhereColumnList';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[Index_ColumList]
* [repo].[Index_Settings]
* [repo].[Index_union]
* [repo].[RepoObject_gross]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_gross';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'index_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_gross';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'index_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_gross';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_gross';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'928AA10A-AB97-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_gross';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.AntoraIndexSemanticgroupPatterndatatype.adoc[]
* xref:docs.RepoObject_IndexList.adoc[]
* xref:repo.ForeignKey_gross.adoc[]
* xref:repo.ForeignKey_Indexes.adoc[]
* xref:repo.ForeignKey_virtual_Indexes.adoc[]
* xref:repo.RepoObject_SqlCreateTable.adoc[]
* xref:repo.usp_Index_finish.adoc[]
* xref:repo.usp_index_inheritance.adoc[]
* xref:repo.usp_Index_virtual_set.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_gross';




GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.Index_ColumList.adoc[]
* xref:repo.Index_Settings.adoc[]
* xref:repo.Index_union.adoc[]
* xref:repo.RepoObject_gross.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_gross';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[SysObject_fullname2]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_gross', @level2type = N'COLUMN', @level2name = N'SysObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat([SysObject_schema_name],''.'',[SysObject_name]))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_gross', @level2type = N'COLUMN', @level2name = N'SysObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[RepoObject_fullname2]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_gross', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat([RepoObject_schema_name],''.'',[RepoObject_name]))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_gross', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[RepoObject_fullname]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_gross', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_gross', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_union].[referenced_index_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_gross', @level2type = N'COLUMN', @level2name = N'referenced_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_ColumList].[PumlIndexColumnList]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_gross', @level2type = N'COLUMN', @level2name = N'PumlIndexColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_ColumList].[PersistenceWhereColumnList]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_gross', @level2type = N'COLUMN', @level2name = N'PersistenceWhereColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_union].[parent_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_gross', @level2type = N'COLUMN', @level2name = N'parent_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[is_repo_managed]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_gross', @level2type = N'COLUMN', @level2name = N'is_repo_managed';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[is_persistence]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_gross', @level2type = N'COLUMN', @level2name = N'is_persistence';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_union].[is_index_unique]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_gross', @level2type = N'COLUMN', @level2name = N'is_index_unique';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_union].[is_index_real]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_gross', @level2type = N'COLUMN', @level2name = N'is_index_real';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_union].[is_index_primary_key]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_gross', @level2type = N'COLUMN', @level2name = N'is_index_primary_key';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_union].[is_index_disabled]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_gross', @level2type = N'COLUMN', @level2name = N'is_index_disabled';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_Settings].[IndexSemanticGroup]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_gross', @level2type = N'COLUMN', @level2name = N'IndexSemanticGroup';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_Settings].[IndexPatternColumnName]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_gross', @level2type = N'COLUMN', @level2name = N'IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_Settings].[IndexPatternColumnDatatype]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_gross', @level2type = N'COLUMN', @level2name = N'IndexPatternColumnDatatype';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_union].[index_type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_gross', @level2type = N'COLUMN', @level2name = N'index_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_union].[index_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_gross', @level2type = N'COLUMN', @level2name = N'index_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_Settings].[index_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_gross', @level2type = N'COLUMN', @level2name = N'index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_ColumList].[DbmlIndexColumnList]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_gross', @level2type = N'COLUMN', @level2name = N'DbmlIndexColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_ColumList].[AntoraIndexColumnList]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_gross', @level2type = N'COLUMN', @level2name = N'AntoraIndexColumnList';

