Create View [sqlparse].RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName
As
Select
    RepoObject_guid
  , json_key
  , T2_json_key
  , SysObject_fullname
  , RowNumber_per_Object
  , class
  , normalized
  , T2_class
  , Identifier_alias
  , Identifier_source
  , Identifier_source_class
  , Identifier_source_children
  , Identifier_source_table
  , Identifier_source_column
  , Identifier_alias_QuoteName         = Case
                                             When Left(Identifier_alias, 1) = '['
                                                  And Right(Identifier_alias, 1) = ']'
                                                 Then
                                                 Identifier_alias
                                             Else
                                                 QuoteName ( Identifier_alias )
                                         End
  , Identifier_source_table_QuoteName  = Case
                                             When Left(Identifier_source_table, 1) = '['
                                                  And Right(Identifier_source_table, 1) = ']'
                                                 Then
                                                 Identifier_source_table
                                             Else
                                                 QuoteName ( Identifier_source_table )
                                         End
  , Identifier_source_column_QuoteName = Case
                                             When Left(Identifier_source_column, 1) = '['
                                                  And Right(Identifier_source_column, 1) = ']'
                                                 Then
                                                 Identifier_source_column
                                             Else
                                                 QuoteName ( Identifier_source_column )
                                         End
From
    [sqlparse].RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '0c813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '41813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName'
  , @level2type = N'COLUMN'
  , @level2name = N'T2_class';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3d813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3e813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName'
  , @level2type = N'COLUMN'
  , @level2name = N'RowNumber_per_Object';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3b813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '40813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName'
  , @level2type = N'COLUMN'
  , @level2name = N'normalized';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3c813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName'
  , @level2type = N'COLUMN'
  , @level2name = N'json_key';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '49813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName'
  , @level2type = N'COLUMN'
  , @level2name = N'Identifier_source_table_QuoteName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '46813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName'
  , @level2type = N'COLUMN'
  , @level2name = N'Identifier_source_table';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4a813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName'
  , @level2type = N'COLUMN'
  , @level2name = N'Identifier_source_column_QuoteName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '47813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName'
  , @level2type = N'COLUMN'
  , @level2name = N'Identifier_source_column';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '44813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName'
  , @level2type = N'COLUMN'
  , @level2name = N'Identifier_source_class';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '45813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName'
  , @level2type = N'COLUMN'
  , @level2name = N'Identifier_source_children';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '43813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName'
  , @level2type = N'COLUMN'
  , @level2name = N'Identifier_source';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '48813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName'
  , @level2type = N'COLUMN'
  , @level2name = N'Identifier_alias_QuoteName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '42813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName'
  , @level2type = N'COLUMN'
  , @level2name = N'Identifier_alias';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3f813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName'
  , @level2type = N'COLUMN'
  , @level2name = N'class';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3401113c-f581-eb11-84e9-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_26_IdentifierList_children_IdentifierSplit_QuoteName'
  , @level2type = N'COLUMN'
  , @level2name = N'T2_json_key';
Go