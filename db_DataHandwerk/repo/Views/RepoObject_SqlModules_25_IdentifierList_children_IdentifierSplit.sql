
--in case of an simple identifier like [T1].[aaa]
--get the table part [Identifier_source_table] (before dot) and the column part [Identifier_source_column] (after dot)
Create View repo.RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit
As
--
Select
    T1.RepoObject_guid
  , T1.json_key
  , T1.T2_json_key
  , T1.SysObject_fullname
  , T1.RowNumber_per_Object
  , T1.class
  , T1.normalized
  , T1.T2_class
  , T1.Identifier_alias
  , T1.Identifier_source
  , T1.Identifier_source_class
  , T1.Identifier_source_children
  --in case of an simple identifier like [T1].[aaa] get the table part (before dot) and the column part (after dot)
  , Identifier_source_table  = Case Identifier_source_class
                                   When 'Identifier'
                                       Then
                                       Case
                                           When T3.child1_normalized = '.'
                                                And Not T3.child2_normalized Is Null
                                               Then
                                               T3.child0_normalized
                                           When T3.child1_normalized Is Null
                                               Then
                                               Null
                                       End
                               End
  , Identifier_source_column = Case Identifier_source_class
                                   When 'Identifier'
                                       Then
                                       Case
                                           When T3.child1_normalized = '.'
                                                And Not T3.child2_normalized Is Null
                                               Then
                                               T3.child2_normalized
                                           When T3.child1_normalized Is Null
                                               Then
                                               T3.child0_normalized
                                       End
                               End
--, [T3].[child0_class]
--, [T3].[child0_is_group]
--, [T3].[child0_is_keyword]
--, [T3].[child0_normalized]
--, [T3].[child0_children]
--, [T3].[child1_class]
--, [T3].[child1_is_group]
--, [T3].[child1_is_keyword]
--, [T3].[child1_normalized]
--, [T3].[child1_children]
--, [T3].[child2_class]
--, [T3].[child2_is_group]
--, [T3].[child2_is_keyword]
--, [T3].[child2_normalized]
--, [T3].[child2_children]
--, [T3].[child3_class]
--, [T3].[child3_is_group]
--, [T3].[child3_is_keyword]
--, [T3].[child3_normalized]
--, [T3].[child3_children]
--, [T3].[child4_class]
--, [T3].[child4_is_group]
--, [T3].[child4_is_keyword]
--, [T3].[child4_normalized]
--, [T3].[child4_children]
From
    repo.RepoObject_SqlModules_24_IdentifierList_children                          As T1
    Cross Apply repo.ftv_sqlparse_children_pivot ( T1.Identifier_source_children ) As T3;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '3d90291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd3f37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit'
  , @level2type = N'COLUMN'
  , @level2name = N'T2_class';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'cff37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd0f37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit'
  , @level2type = N'COLUMN'
  , @level2name = N'RowNumber_per_Object';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'cdf37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd2f37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit'
  , @level2type = N'COLUMN'
  , @level2name = N'normalized';
Go

Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd8f37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit'
  , @level2type = N'COLUMN'
  , @level2name = N'Identifier_source_table';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd9f37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit'
  , @level2type = N'COLUMN'
  , @level2name = N'Identifier_source_column';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd6f37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit'
  , @level2type = N'COLUMN'
  , @level2name = N'Identifier_source_class';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd7f37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit'
  , @level2type = N'COLUMN'
  , @level2name = N'Identifier_source_children';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd5f37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit'
  , @level2type = N'COLUMN'
  , @level2name = N'Identifier_source';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd4f37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit'
  , @level2type = N'COLUMN'
  , @level2name = N'Identifier_alias';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd1f37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit'
  , @level2type = N'COLUMN'
  , @level2name = N'class';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '36813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit'
  , @level2type = N'COLUMN'
  , @level2name = N'json_key';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3301113c-f581-eb11-84e9-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit'
  , @level2type = N'COLUMN'
  , @level2name = N'T2_json_key';
Go