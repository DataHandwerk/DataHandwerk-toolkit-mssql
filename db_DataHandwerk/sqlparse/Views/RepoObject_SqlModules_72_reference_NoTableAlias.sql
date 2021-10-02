﻿

/*
missing table alias:

T1.source_table_QuoteName is NULL and can't be linked to an exsisting T44.alias_QuoteName
we try mapping only by T1.source_column_QuoteName

for example

aaa
from
table as T1

aaa
from
table
*/
CREATE View sqlparse.RepoObject_SqlModules_72_reference_NoTableAlias
As
Select
    --
    T1.RepoObject_guid
  , T1.alias_QuoteName
  , T1.SysObject_fullname
  , roc.RepoObjectColumn_guid
  , roc.RepoObjectColumn_name
  , source_RepoObject_guid       = ro_source.RepoObject_guid
  , source_SysObject_fullname    = ro_source.SysObject_fullname
  , source_RepoObjectColumn_guid = roc_source.RepoObjectColumn_guid
  , source_RepoObjectColumn_name = roc_source.RepoObjectColumn_name
  , T1.source_table_QuoteName
  , T1.source_column_QuoteName
  , T1.normalized
From
    sqlparse.RepoObject_SqlModules_61_SelectIdentifier_Union_T      As T1
    Inner Join
        sqlparse.RepoObject_SqlModules_44_from_Identifier_QuoteName As T44
            On
            T44.RepoObject_guid                           = T1.RepoObject_guid
    -- T1.source_table_QuoteName is NULL and can't be linked to an exsisting T44.alias_QuoteName
    --AND T44.alias_QuoteName = T1.source_table_QuoteName

    Inner Join
        repo.RepoObjectColumn                                       As roc
            On
            QuoteName ( roc.SysObjectColumn_name )        = T1.alias_QuoteName
            And roc.RepoObject_guid                       = T1.RepoObject_guid

    Inner Join
        repo.RepoObject                                             As ro_source
            On
            QuoteName ( ro_source.SysObject_schema_name ) = T44.name_PreDot_QuoteName
            And QuoteName ( ro_source.SysObject_name )    = T44.name_PostDot_QuoteName

    Inner Join
        repo.RepoObjectColumn                                       As roc_source
            On
            QuoteName ( roc_source.SysObjectColumn_name ) = T1.source_column_QuoteName
            And roc_source.RepoObject_guid                = ro_source.RepoObject_guid
Where
    --can't be linked to an exsisting T44.alias_QuoteName
    T1.source_table_QuoteName Is Null
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '297e4be1-8f64-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias'
  , @level2type = N'COLUMN'
  , @level2name = N'alias_QuoteName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '287e4be1-8f64-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias'
  , @level2type = N'COLUMN'
  , @level2name = N'source_column_QuoteName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '277e4be1-8f64-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias'
  , @level2type = N'COLUMN'
  , @level2name = N'source_table_QuoteName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '267e4be1-8f64-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias'
  , @level2type = N'COLUMN'
  , @level2name = N'source_RepoObjectColumn_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '257e4be1-8f64-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias'
  , @level2type = N'COLUMN'
  , @level2name = N'source_RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '247e4be1-8f64-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias'
  , @level2type = N'COLUMN'
  , @level2name = N'source_SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '237e4be1-8f64-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias'
  , @level2type = N'COLUMN'
  , @level2name = N'source_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '227e4be1-8f64-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '217e4be1-8f64-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '207e4be1-8f64-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1f7e4be1-8f64-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '137e4be1-8f64-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd48f8f21-4265-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias'
  , @level2type = N'COLUMN'
  , @level2name = N'normalized';
Go

Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[SysObject_fullname]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias', @level2type = N'COLUMN', @level2name = N'source_SysObject_fullname';


Go


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[RepoObjectColumn_name]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias', @level2type = N'COLUMN', @level2name = N'source_RepoObjectColumn_name';


Go


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[RepoObjectColumn_guid]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias', @level2type = N'COLUMN', @level2name = N'source_RepoObjectColumn_guid';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias', @level2type = N'COLUMN', @level2name = N'source_RepoObject_guid';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[RepoObjectColumn_name]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_name';


Go


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[RepoObjectColumn_guid]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[RepoObject]
* [repo].[RepoObjectColumn]
* [sqlparse].[RepoObject_SqlModules_44_from_Identifier_QuoteName]
* [sqlparse].[RepoObject_SqlModules_61_SelectIdentifier_Union_T]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:sqlparse.RepoObject_SqlModules_79_reference_union.adoc[]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.RepoObject.adoc[]
* xref:repo.RepoObjectColumn.adoc[]
* xref:sqlparse.RepoObject_SqlModules_44_from_Identifier_QuoteName.adoc[]
* xref:sqlparse.RepoObject_SqlModules_61_SelectIdentifier_Union_T.adoc[]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_72_reference_NoTableAlias';

