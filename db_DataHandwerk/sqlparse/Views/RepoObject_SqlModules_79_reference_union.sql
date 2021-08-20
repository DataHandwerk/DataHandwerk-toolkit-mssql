
CREATE View sqlparse.RepoObject_SqlModules_79_reference_union
As
Select
    RepoObject_guid
  , alias_QuoteName
  , SysObject_fullname
  , RepoObjectColumn_guid
  , RepoObjectColumn_name
  , source_RepoObject_guid
  , source_SysObject_fullname
  , source_RepoObjectColumn_guid
  , source_RepoObjectColumn_name
  , source_table_QuoteName
  , source_column_QuoteName
  , normalized
From
    sqlparse.RepoObject_SqlModules_71_reference_ExpliciteTableAlias
Union All
Select
    RepoObject_guid
  , alias_QuoteName
  , SysObject_fullname
  , RepoObjectColumn_guid
  , RepoObjectColumn_name
  , source_RepoObject_guid
  , source_SysObject_fullname
  , source_RepoObjectColumn_guid
  , source_RepoObjectColumn_name
  , source_table_QuoteName
  , source_column_QuoteName
  , normalized
From
    sqlparse.RepoObject_SqlModules_72_reference_NoTableAlias
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e48f8f21-4265-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_79_reference_union'
  , @level2type = N'COLUMN'
  , @level2name = N'normalized';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e38f8f21-4265-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_79_reference_union'
  , @level2type = N'COLUMN'
  , @level2name = N'alias_QuoteName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e28f8f21-4265-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_79_reference_union'
  , @level2type = N'COLUMN'
  , @level2name = N'source_column_QuoteName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e18f8f21-4265-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_79_reference_union'
  , @level2type = N'COLUMN'
  , @level2name = N'source_table_QuoteName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e08f8f21-4265-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_79_reference_union'
  , @level2type = N'COLUMN'
  , @level2name = N'source_RepoObjectColumn_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'df8f8f21-4265-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_79_reference_union'
  , @level2type = N'COLUMN'
  , @level2name = N'source_RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'de8f8f21-4265-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_79_reference_union'
  , @level2type = N'COLUMN'
  , @level2name = N'source_SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'dd8f8f21-4265-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_79_reference_union'
  , @level2type = N'COLUMN'
  , @level2name = N'source_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'dc8f8f21-4265-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_79_reference_union'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'db8f8f21-4265-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_79_reference_union'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'da8f8f21-4265-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_79_reference_union'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd98f8f21-4265-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_79_reference_union'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'd18f8f21-4265-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_79_reference_union';
Go
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [sqlparse].[RepoObject_SqlModules_71_reference_ExpliciteTableAlias]
* [sqlparse].[RepoObject_SqlModules_72_reference_NoTableAlias]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_79_reference_union';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:reference.RepoObjectColumn_reference_SqlModules.adoc[]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_79_reference_union';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:sqlparse.RepoObject_SqlModules_71_reference_ExpliciteTableAlias.adoc[]
* xref:sqlparse.RepoObject_SqlModules_72_reference_NoTableAlias.adoc[]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_79_reference_union';

