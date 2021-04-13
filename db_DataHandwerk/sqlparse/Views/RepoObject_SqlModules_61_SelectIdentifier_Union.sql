Create View [sqlparse].RepoObject_SqlModules_61_SelectIdentifier_Union
As
Select
    T1.RepoObject_guid
  , T1.SysObject_fullname
  --can be empty, this is fine in case of only one source table in FROM, but it could be also OK in case of unique name within multiple source tables
  , T1.source_table_QuoteName
  , T1.source_column_QuoteName
  , alias_QuoteName = T1.source_column_QuoteName
  , T1.RowNumber_per_Object
  , T1.class
  , T1.normalized
From
    [sqlparse].RepoObject_SqlModules_52_Identitfier_QuoteName As T1
    --only SELECT Identifier before FROM
    Inner Join
        [sqlparse].RepoObject_SqlModules_39_object            As T39
            On
            T39.RepoObject_guid        = T1.RepoObject_guid
            And T39.Min_RowNumber_From = T1.RowNumber_per_Object + 1
Where
    Not T1.source_column_QuoteName Is Null
Union All
Select
    T26.RepoObject_guid
  , T26.SysObject_fullname
  --can be empty, this is fine in case of only one source table in FROM, but it could be also OK in case of unique name within multiple source tables
  , source_table_QuoteName  = T26.Identifier_source_table_QuoteName
  , source_column_QuoteName = T26.Identifier_source_column_QuoteName
  , alias_QuoteName         = T26.Identifier_alias_QuoteName
  , T26.RowNumber_per_Object
  , T26.class
  , T26.normalized
From
    [sqlparse].RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName As T26
    Inner Join
        [sqlparse].RepoObject_SqlModules_39_object                                        As T39
            On
            T26.RepoObject_guid          = T39.RepoObject_guid
            --only default views where SELECT is the 5th element in view definition
            And T39.is_5_select          = 1
            --only SELECT IdentifierList after SELECT (5)
            And T26.RowNumber_per_Object > 5
            --only SELECT IdentifierList before FROM
            And T39.Min_RowNumber_From   > T26.RowNumber_per_Object
--source column should exist (it will not exist in case of calculations, functions, ...)
Where
    Not T26.Identifier_source_column_QuoteName Is Null;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '127e4be1-8f64-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '187e4be1-8f64-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '197e4be1-8f64-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union'
  , @level2type = N'COLUMN'
  , @level2name = N'source_table_QuoteName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1a7e4be1-8f64-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union'
  , @level2type = N'COLUMN'
  , @level2name = N'source_column_QuoteName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1c7e4be1-8f64-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union'
  , @level2type = N'COLUMN'
  , @level2name = N'RowNumber_per_Object';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '177e4be1-8f64-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1e7e4be1-8f64-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union'
  , @level2type = N'COLUMN'
  , @level2name = N'normalized';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1d7e4be1-8f64-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union'
  , @level2type = N'COLUMN'
  , @level2name = N'class';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1b7e4be1-8f64-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union'
  , @level2type = N'COLUMN'
  , @level2name = N'alias_QuoteName';
Go