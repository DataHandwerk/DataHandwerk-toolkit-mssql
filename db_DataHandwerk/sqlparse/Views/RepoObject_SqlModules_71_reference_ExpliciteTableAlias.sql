
/*
explicit table alias:

T1.source_table_QuoteName exists an can be linked to an exsisting T44.alias_QuoteName
for example

T1.aaa
from
table as T1


*/
Create View [sqlparse].RepoObject_SqlModules_71_reference_ExpliciteTableAlias
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
    [sqlparse].RepoObject_SqlModules_61_SelectIdentifier_Union_T      As T1
    Inner Join
        [sqlparse].RepoObject_SqlModules_44_from_Identifier_QuoteName As T44
            On
            T44.RepoObject_guid                           = T1.RepoObject_guid
            And T44.alias_QuoteName                       = T1.source_table_QuoteName

    Inner Join
        repo.RepoObjectColumn                                   roc
            On
            QuoteName ( roc.SysObjectColumn_name )        = T1.alias_QuoteName
            And roc.RepoObject_guid                       = T1.RepoObject_guid

    Inner Join
        repo.RepoObject                                         ro_source
            On
            QuoteName ( ro_source.SysObject_schema_name ) = T44.name_PreDot_QuoteName
            And QuoteName ( ro_source.SysObject_name )    = T44.name_PostDot_QuoteName

    Inner Join
        repo.RepoObjectColumn                                   roc_source
            On
            QuoteName ( roc_source.SysObjectColumn_name ) = T1.source_column_QuoteName
            And roc_source.RepoObject_guid                = ro_source.RepoObject_guid;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '0d813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_71_reference_ExpliciteTableAlias';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4c813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_71_reference_ExpliciteTableAlias'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '50813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_71_reference_ExpliciteTableAlias'
  , @level2type = N'COLUMN'
  , @level2name = N'source_SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '52813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_71_reference_ExpliciteTableAlias'
  , @level2type = N'COLUMN'
  , @level2name = N'source_RepoObjectColumn_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '51813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_71_reference_ExpliciteTableAlias'
  , @level2type = N'COLUMN'
  , @level2name = N'source_RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4f813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_71_reference_ExpliciteTableAlias'
  , @level2type = N'COLUMN'
  , @level2name = N'source_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4e813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_71_reference_ExpliciteTableAlias'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4d813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_71_reference_ExpliciteTableAlias'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4b813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_71_reference_ExpliciteTableAlias'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '147e4be1-8f64-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_71_reference_ExpliciteTableAlias'
  , @level2type = N'COLUMN'
  , @level2name = N'source_table_QuoteName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '157e4be1-8f64-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_71_reference_ExpliciteTableAlias'
  , @level2type = N'COLUMN'
  , @level2name = N'source_column_QuoteName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '167e4be1-8f64-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_71_reference_ExpliciteTableAlias'
  , @level2type = N'COLUMN'
  , @level2name = N'alias_QuoteName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd38f8f21-4265-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_71_reference_ExpliciteTableAlias'
  , @level2type = N'COLUMN'
  , @level2name = N'normalized';
Go

Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[SysObject_fullname]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_71_reference_ExpliciteTableAlias'
  , @level2type = N'COLUMN'
  , @level2name = N'source_SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'(concat(''['',[SysObject_schema_name],''].['',[SysObject_name],'']''))'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_71_reference_ExpliciteTableAlias'
  , @level2type = N'COLUMN'
  , @level2name = N'source_SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[RepoObjectColumn_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_71_reference_ExpliciteTableAlias'
  , @level2type = N'COLUMN'
  , @level2name = N'source_RepoObjectColumn_name';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'Name of the column. Is unique within the object.'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_71_reference_ExpliciteTableAlias'
  , @level2type = N'COLUMN'
  , @level2name = N'source_RepoObjectColumn_name';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[RepoObjectColumn_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_71_reference_ExpliciteTableAlias'
  , @level2type = N'COLUMN'
  , @level2name = N'source_RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[RepoObject_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_71_reference_ExpliciteTableAlias'
  , @level2type = N'COLUMN'
  , @level2name = N'source_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[RepoObjectColumn_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_71_reference_ExpliciteTableAlias'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_name';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'Name of the column. Is unique within the object.'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_71_reference_ExpliciteTableAlias'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_name';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[RepoObjectColumn_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_71_reference_ExpliciteTableAlias'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_guid';
