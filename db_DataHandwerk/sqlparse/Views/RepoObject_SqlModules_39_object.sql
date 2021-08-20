
CREATE View sqlparse.RepoObject_SqlModules_39_object
As
--
Select
    T1.RepoObject_guid
  , is_create_view_Identifier_as_select = T31.is_1_create * T31.is_2_view * T31.is_3_Identifier * T31.is_4_as
                                          * T31.is_5_select
  , is_select_IdentifierList_from       = T31.is_5_select * T31.is_6_IdentifierList * T31.is_7_from
  , Min_RowNumber_IdentifierList        = T32_1.Min_RowNumber_per_class
  , Min_RowNumber_From                  = T33_1.Min_RowNumber_per_normalized
  , Min_RowNumber_GroupBy               = T33_2.Min_RowNumber_per_normalized
  , Min_RowNumber_Where                 = T32_2.Min_RowNumber_per_class
  --the following columns are for easy issue tracking
  , ro.SysObject_fullname
  , T31.is_1_create
  , T31.is_2_view
  , T31.is_3_Identifier
  , T31.is_4_as
  , T31.is_5_select
  , T31.is_6_Identifier
  , T31.is_6_IdentifierList
  , T31.is_7_from
  , T31.is_7_IdentifierList
  , T31.is_8_IdentifierList
  , T26.is_union
  , T27.has_GroupBy
From
    sqlparse.RepoObject_SqlModules                            As T1
    Left Outer Join
        repo.RepoObject                                       As ro
            On
            ro.RepoObject_guid    = T1.RepoObject_guid

    Left Outer Join
        sqlparse.RepoObject_SqlModules_31_object              As T31
            On
            T31.RepoObject_guid   = T1.RepoObject_guid

    Left Outer Join
        sqlparse.RepoObject_SqlModules_32_ObjectClass         As T32_1
            On
            T32_1.RepoObject_guid = T1.RepoObject_guid
            And T32_1.class       = 'IdentifierList'

    Left Outer Join
        sqlparse.RepoObject_SqlModules_32_ObjectClass         As T32_2
            On
            T32_2.RepoObject_guid = T1.RepoObject_guid
            And T32_2.class       = 'WHERE'

    Left Outer Join
        sqlparse.RepoObject_SqlModules_33_ObjectNormalized    As T33_1
            On
            T33_1.RepoObject_guid = T1.RepoObject_guid
            And T33_1.normalized  = 'FROM'

    Left Outer Join
        sqlparse.RepoObject_SqlModules_33_ObjectNormalized    As T33_2
            On
            T33_2.RepoObject_guid = T1.RepoObject_guid
            And T33_2.normalized  = 'GROUP BY'

    Left Outer Join
        sqlparse.RepoObject_SqlModules_29_1_object_is_union   As T26
            On
            T26.RepoObject_guid   = T1.RepoObject_guid

    Left Outer Join
        sqlparse.RepoObject_SqlModules_29_2_object_is_GroupBy As T27
            On
            T27.RepoObject_guid   = T1.RepoObject_guid
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '0190291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1df27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '16f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1cf27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'Min_RowNumber_Where';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '19f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'Min_RowNumber_IdentifierList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1bf27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'Min_RowNumber_GroupBy';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1af27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'Min_RowNumber_From';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '27f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'is_union';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '18f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'is_select_IdentifierList_from';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '17f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'is_create_view_Identifier_as_select';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '26f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'is_8_IdentifierList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '25f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'is_7_IdentifierList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '24f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'is_7_from';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '23f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'is_6_IdentifierList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '22f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'is_5_select';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '21f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'is_4_as';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '20f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'is_3_Identifier';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1ff27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'is_2_view';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1ef27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'is_1_create';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '28f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'has_GroupBy';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '32813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'is_6_Identifier';
Go

Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[SysObject_fullname]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'(concat(''['',[SysObject_schema_name],''].['',[SysObject_name],'']''))'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules].[RepoObject_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_32_ObjectClass].[Min_RowNumber_per_class]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'Min_RowNumber_Where';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_32_ObjectClass].[Min_RowNumber_per_class]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'Min_RowNumber_IdentifierList';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_33_ObjectNormalized].[Min_RowNumber_per_normalized]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'Min_RowNumber_GroupBy';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_33_ObjectNormalized].[Min_RowNumber_per_normalized]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'Min_RowNumber_From';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_29_1_object_is_union].[is_union]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'is_union';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_31_object].[is_8_IdentifierList]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'is_8_IdentifierList';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_31_object].[is_7_IdentifierList]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'is_7_IdentifierList';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_31_object].[is_7_from]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'is_7_from';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_31_object].[is_6_IdentifierList]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'is_6_IdentifierList';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_31_object].[is_6_Identifier]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'is_6_Identifier';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_31_object].[is_5_select]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'is_5_select';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_31_object].[is_4_as]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'is_4_as';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_31_object].[is_3_Identifier]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'is_3_Identifier';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_31_object].[is_2_view]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'is_2_view';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_31_object].[is_1_create]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'is_1_create';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_29_2_object_is_GroupBy].[has_GroupBy]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_39_object'
  , @level2type = N'COLUMN'
  , @level2name = N'has_GroupBy';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[RepoObject]
* [sqlparse].[RepoObject_SqlModules]
* [sqlparse].[RepoObject_SqlModules_29_1_object_is_union]
* [sqlparse].[RepoObject_SqlModules_29_2_object_is_GroupBy]
* [sqlparse].[RepoObject_SqlModules_31_object]
* [sqlparse].[RepoObject_SqlModules_32_ObjectClass]
* [sqlparse].[RepoObject_SqlModules_33_ObjectNormalized]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_39_object';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_39_object';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_39_object';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_39_object';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'EC89A10A-AB97-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_39_object';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:sqlparse.RepoObject_SqlModules_41_from.adoc[]
* xref:sqlparse.RepoObject_SqlModules_61_SelectIdentifier_Union.adoc[]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_39_object';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.RepoObject.adoc[]
* xref:sqlparse.RepoObject_SqlModules.adoc[]
* xref:sqlparse.RepoObject_SqlModules_29_1_object_is_union.adoc[]
* xref:sqlparse.RepoObject_SqlModules_29_2_object_is_GroupBy.adoc[]
* xref:sqlparse.RepoObject_SqlModules_31_object.adoc[]
* xref:sqlparse.RepoObject_SqlModules_32_ObjectClass.adoc[]
* xref:sqlparse.RepoObject_SqlModules_33_ObjectNormalized.adoc[]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_39_object';

