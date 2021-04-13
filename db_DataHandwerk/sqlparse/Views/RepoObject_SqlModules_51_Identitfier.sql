
/*

--only SELECT Identifier (before FROM)
SELECT
T1.*
FROM repo.RepoObject_SqlModules_51_Identitfier T1
   INNER JOIN
   repo.RepoObject_SqlModules_39_object AS T39
   ON T39.RepoObject_guid = T1.RepoObject_guid
      AND T39.Min_RowNumber_From = T1.RowNumber_per_Object + 1


*/
Create View [sqlparse].RepoObject_SqlModules_51_Identitfier
As
Select
    --
    T1.RepoObject_guid
  , T1.json_key
  , T1.SysObject_fullname
  , T1.RowNumber_per_Object
  , T1.class
  , T1.normalized
  , T1.is_group
  , T1.is_keyword
  , T1.is_whitespace
  --same logic: [repo].[RepoObject_SqlModules_25_IdentifierList_children_IdentifierSplit]
  --in case of an simple identifier like [T1].[aaa] get the table part (before dot) and the column part (after dot)
  , source_table  = Case
                        When T1.child1_normalized = '.'
                             And Not T1.child2_normalized Is Null
                            Then
                            T1.child0_normalized
                        When T1.child1_normalized Is Null
                            Then
                            Null
                    End
  , source_column = Case
                        When T1.child1_normalized = '.'
                             And Not T1.child2_normalized Is Null
                            Then
                            T1.child2_normalized
                        When T1.child1_normalized Is Null
                            Then
                            T1.child0_normalized
                    End
  , T1.children
  , T1.child0_class
--what happens in case of aa.bb as c or c = aa.bb?
--, [T1].[RepoObject_guid]
--, [T1].[json_key]
--, [T1].[SysObject_fullname]
--, [T1].[RowNumber_per_Object]
--, [T1].[class]
--, [T1].[is_group]
--, [T1].[is_keyword]
--, [T1].[is_whitespace]
--, [T1].[normalized]
--, [T1].[children]
--, [T1].[child0_class]
--, [T1].[child0_is_group]
--, [T1].[child0_is_keyword]
--, [T1].[child0_is_whitespace]
--, [T1].[child0_normalized]
--, [T1].[child0_children]
--, [T1].[child1_class]
--, [T1].[child1_is_group]
--, [T1].[child1_is_keyword]
--, [T1].[child1_is_whitespace]
--, [T1].[child1_normalized]
--, [T1].[child1_children]
--, [T1].[child2_class]
--, [T1].[child2_is_group]
--, [T1].[child2_is_keyword]
--, [T1].[child2_is_whitespace]
--, [T1].[child2_normalized]
--, [T1].[child2_children]
--, [T1].[child3_class]
--, [T1].[child3_is_group]
--, [T1].[child3_is_keyword]
--, [T1].[child3_is_whitespace]
--, [T1].[child3_normalized]
--, [T1].[child3_children]
--, [T1].[child4_class]
--, [T1].[child4_is_group]
--, [T1].[child4_is_keyword]
--, [T1].[child4_is_whitespace]
--, [T1].[child4_normalized]
--, [T1].[child4_children]
From
    [sqlparse].RepoObject_SqlModules_20_statement_children As T1
Where
    T1.class = 'Identifier';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '0e813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_51_Identitfier';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '54813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_51_Identitfier'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '5b813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_51_Identitfier'
  , @level2type = N'COLUMN'
  , @level2name = N'source_table';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '5c813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_51_Identitfier'
  , @level2type = N'COLUMN'
  , @level2name = N'source_column';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '55813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_51_Identitfier'
  , @level2type = N'COLUMN'
  , @level2name = N'RowNumber_per_Object';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '53813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_51_Identitfier'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '57813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_51_Identitfier'
  , @level2type = N'COLUMN'
  , @level2name = N'normalized';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '5a813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_51_Identitfier'
  , @level2type = N'COLUMN'
  , @level2name = N'is_whitespace';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '59813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_51_Identitfier'
  , @level2type = N'COLUMN'
  , @level2name = N'is_keyword';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '58813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_51_Identitfier'
  , @level2type = N'COLUMN'
  , @level2name = N'is_group';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '56813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_51_Identitfier'
  , @level2type = N'COLUMN'
  , @level2name = N'class';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '5d813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_51_Identitfier'
  , @level2type = N'COLUMN'
  , @level2name = N'children';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0db3c709-8364-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_51_Identitfier'
  , @level2type = N'COLUMN'
  , @level2name = N'child0_class';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '99a0a6c2-f781-eb11-84e9-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_51_Identitfier'
  , @level2type = N'COLUMN'
  , @level2name = N'json_key';
Go

Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_20_statement_children].[children]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_51_Identitfier'
  , @level2type = N'COLUMN'
  , @level2name = N'children';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_20_statement_children].[child0_class]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_51_Identitfier'
  , @level2type = N'COLUMN'
  , @level2name = N'child0_class';
