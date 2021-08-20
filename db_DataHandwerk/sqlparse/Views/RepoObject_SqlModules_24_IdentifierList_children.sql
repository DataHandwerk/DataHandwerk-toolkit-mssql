

CREATE View sqlparse.RepoObject_SqlModules_24_IdentifierList_children
As
--
Select
    T1.RepoObject_guid
  , T1.json_key
  , T2_json_key                = T2.json_key
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
                                             When T2.child3_normalized = 'AS'
                                                 Then
                                                 T2.child4_normalized
                                             When T2.child1_normalized = '.'
                                                 Then
                                                 T2.child2_normalized
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
  , T2.is_group
  , T2.is_keyword
  , T2.is_whitespace
  --, [T2].[normalized]
  , T2.children
  , T2.child0_class
  , T2.child0_is_group
  , T2.child0_is_keyword
  , T2.child0_is_whitespace
  , T2.child0_normalized
  , T2.child0_children
  , T2.child1_class
  , T2.child1_is_group
  , T2.child1_is_keyword
  , T2.child1_is_whitespace
  , T2.child1_normalized
  , T2.child1_children
  , T2.child2_class
  , T2.child2_is_group
  , T2.child2_is_keyword
  , T2.child2_is_whitespace
  , T2.child2_normalized
  , T2.child2_children
  , T2.child3_class
  , T2.child3_is_group
  , T2.child3_is_keyword
  , T2.child3_is_whitespace
  , T2.child3_normalized
  , T2.child3_children
  , T2.child4_class
  , T2.child4_is_group
  , T2.child4_is_keyword
  , T2.child4_is_whitespace
  , T2.child4_normalized
  , T2.child4_children
From
    sqlparse.RepoObject_SqlModules_20_statement_children                 As T1
    Cross Apply sqlparse.ftv_sqlparse_with_some_children ( T1.children ) As T2
Where
    T1.class = 'IdentifierList'
    And T2.class In
        ( 'Identifier', 'Comparison' )
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
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7b7159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'is_whitespace';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7a7159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'is_keyword';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '797159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'is_group';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7c7159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'children';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '997159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'child4_normalized';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '987159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'child4_is_whitespace';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '977159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'child4_is_keyword';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '967159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'child4_is_group';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '957159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'child4_class';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9a7159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'child4_children';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '937159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'child3_normalized';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '927159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'child3_is_whitespace';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '917159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'child3_is_keyword';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '907159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'child3_is_group';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8f7159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'child3_class';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '947159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'child3_children';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8d7159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'child2_normalized';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8c7159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'child2_is_whitespace';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8b7159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'child2_is_keyword';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8a7159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'child2_is_group';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '897159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'child2_class';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8e7159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'child2_children';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '877159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'child1_normalized';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '867159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'child1_is_whitespace';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '857159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'child1_is_keyword';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '847159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'child1_is_group';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '837159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'child1_class';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '887159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'child1_children';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '817159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'child0_normalized';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '807159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'child0_is_whitespace';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7f7159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'child0_is_keyword';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7e7159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'child0_is_group';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7d7159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'child0_class';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '827159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'child0_children';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [sqlparse].[ftv_sqlparse_with_some_children]
* [sqlparse].[RepoObject_SqlModules_20_statement_children]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'RepoObject_guid,json_key,T2_json_key', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObject_guid,json_key,T2_json_key', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier,nvarchar(4000),nvarchar(4000)', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'23DEFC88-1196-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:sqlparse.RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit.adoc[]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:sqlparse.ftv_sqlparse_with_some_children.adoc[]
* xref:sqlparse.RepoObject_SqlModules_20_statement_children.adoc[]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_20_statement_children].[SysObject_fullname]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[SysObject_schema_name],''].['',[SysObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_20_statement_children].[RowNumber_per_Object]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'RowNumber_per_Object';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_20_statement_children].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_20_statement_children].[normalized]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'normalized';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_20_statement_children].[json_key]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'json_key';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_20_statement_children].[class]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_24_IdentifierList_children', @level2type = N'COLUMN', @level2name = N'class';

