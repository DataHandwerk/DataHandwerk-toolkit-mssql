Create View [sqlparse].RepoObject_SqlModules_24_IdentifierList_children
As
--
Select
    T1.RepoObject_guid
  , T1.json_key
  , T2.json_key                As T2_json_key
  , T1.SysObject_fullname
  , T1.RowNumber_per_Object
  , T1.class
  --, [T1].[is_group]
  --, [T1].[is_keyword]
  --, [T1].[is_whitespace]
  , T1.normalized
  --, [T1].[children]
  , T2_class                   = T2.class
  , Identifier_alias           = Case T2.class
                                     When 'Identifier'
                                         Then
                                         Case
                                             When T2.child1_normalized Is Null
                                                 Then
                                                 T2.child0_normalized
                                             When T2.child1_normalized = 'AS'
                                                 Then
                                                 T2.child2_normalized
                                             When T2.child1_normalized = '.'
                                                 Then
                                                 T2.child2_normalized
                                             When T2.child3_normalized = 'AS'
                                                 Then
                                                 T2.child4_normalized
                                         End
                                     When 'Comparison'
                                         Then
                                         Case
                                             When T2.child1_normalized = '='
                                                 Then
                                                 T2.child0_normalized
                                         End
                                 End
  , Identifier_source          = Case T2.class
                                     When 'Identifier'
                                         Then
                                         Case T2.child0_class
                                             When 'Token'
                                                 Then
                                                 T2.normalized
                                             When 'Function'
                                                 Then
                                                 T2.child0_normalized
                                         End
                                     When 'Comparison'
                                         Then
                                         Case
                                             When T2.child1_normalized = '='
                                                 Then
                                                 T2.child2_normalized
                                         End
                                 End
  , Identifier_source_class    = Case T2.class
                                     When 'Identifier'
                                         Then
                                         Case T2.child0_class
                                             When 'Token'
                                                 Then
                                                 T2.class
                                             When 'Function'
                                                 Then
                                                 T2.child0_class
                                         End
                                     When 'Comparison'
                                         Then
                                         Case
                                             When T2.child1_normalized = '='
                                                 Then
                                                 T2.child2_class
                                         End
                                 End
  , Identifier_source_children = Case T2.class
                                     When 'Identifier'
                                         Then
                                         Case T2.child0_class
                                             When 'Token'
                                                 Then
                                                 T2.children
                                             When 'Function'
                                                 Then
                                                 T2.child0_children
                                         End
                                     When 'Comparison'
                                         Then
                                         Case
                                             When T2.child1_normalized = '='
                                                 Then
                                                 T2.child2_children
                                         End
                                 End
--, [T2].[is_group]
--, [T2].[is_keyword]
--, [T2].[is_whitespace]
--, [T2].[normalized]
--, [T2].[children]
--, [T2].[child0_class]
--, [T2].[child0_is_group]
--, [T2].[child0_is_keyword]
--, [T2].[child0_is_whitespace]
--, [T2].[child0_normalized]
--, [T2].[child0_children]
--, [T2].[child1_class]
--, [T2].[child1_is_group]
--, [T2].[child1_is_keyword]
--, [T2].[child1_is_whitespace]
--, [T2].[child1_normalized]
--, [T2].[child1_children]
--, [T2].[child2_class]
--, [T2].[child2_is_group]
--, [T2].[child2_is_keyword]
--, [T2].[child2_is_whitespace]
--, [T2].[child2_normalized]
--, [T2].[child2_children]
--, [T2].[child3_class]
--, [T2].[child3_is_group]
--, [T2].[child3_is_keyword]
--, [T2].[child3_is_whitespace]
--, [T2].[child3_normalized]
--, [T2].[child3_children]
--, [T2].[child4_class]
--, [T2].[child4_is_group]
--, [T2].[child4_is_keyword]
--, [T2].[child4_is_whitespace]
--, [T2].[child4_normalized]
--, [T2].[child4_children]
From
    [sqlparse].RepoObject_SqlModules_20_statement_children                 As T1
    Cross Apply repo.ftv_sqlparse_with_some_children ( T1.children ) As T2
Where
    T1.class = 'IdentifierList'
    And T2.class In
        ( 'Identifier', 'Comparison' );
----there was any reason for this filter
----now we remove it, but we need to check the case of 'Identifier'
-- AND [T2].[class] = 'Comparison'
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '3b90291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_24_IdentifierList_children';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'c8f37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_24_IdentifierList_children'
  , @level2type = N'COLUMN'
  , @level2name = N'T2_class';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'c4f37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_24_IdentifierList_children'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'c5f37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_24_IdentifierList_children'
  , @level2type = N'COLUMN'
  , @level2name = N'RowNumber_per_Object';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'c2f37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_24_IdentifierList_children'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'c7f37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_24_IdentifierList_children'
  , @level2type = N'COLUMN'
  , @level2name = N'normalized';
Go

Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'cbf37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_24_IdentifierList_children'
  , @level2type = N'COLUMN'
  , @level2name = N'Identifier_source_class';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ccf37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_24_IdentifierList_children'
  , @level2type = N'COLUMN'
  , @level2name = N'Identifier_source_children';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'caf37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_24_IdentifierList_children'
  , @level2type = N'COLUMN'
  , @level2name = N'Identifier_source';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'c9f37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_24_IdentifierList_children'
  , @level2type = N'COLUMN'
  , @level2name = N'Identifier_alias';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'c6f37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_24_IdentifierList_children'
  , @level2type = N'COLUMN'
  , @level2name = N'class';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '35813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_24_IdentifierList_children'
  , @level2type = N'COLUMN'
  , @level2name = N'json_key';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '2f377e23-f381-eb11-84e9-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_24_IdentifierList_children'
  , @level2type = N'COLUMN'
  , @level2name = N'T2_json_key';
Go