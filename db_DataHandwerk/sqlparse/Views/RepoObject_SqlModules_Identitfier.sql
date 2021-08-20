

/*
obsolet?

--only SELECT Identifier (before FROM)
SELECT
T1.*
FROM repo.RepoObject_SqlModules_Identitfier T1
   INNER JOIN
   repo.RepoObject_SqlModules_39_object AS T39
   ON T39.RepoObject_guid = T1.RepoObject_guid
      AND T39.Min_RowNumber_From = T1.RowNumber_per_Object + 1


*/

CREATE View sqlparse.RepoObject_SqlModules_Identitfier
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
    sqlparse.RepoObject_SqlModules_20_statement_children As T1
Where
    T1.class = 'Identifier'
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '0f813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_Identitfier';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '5f813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_Identitfier'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '66813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_Identitfier'
  , @level2type = N'COLUMN'
  , @level2name = N'source_table';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '67813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_Identitfier'
  , @level2type = N'COLUMN'
  , @level2name = N'source_column';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '60813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_Identitfier'
  , @level2type = N'COLUMN'
  , @level2name = N'RowNumber_per_Object';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '5e813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_Identitfier'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '62813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_Identitfier'
  , @level2type = N'COLUMN'
  , @level2name = N'normalized';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '65813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_Identitfier'
  , @level2type = N'COLUMN'
  , @level2name = N'is_whitespace';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '64813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_Identitfier'
  , @level2type = N'COLUMN'
  , @level2name = N'is_keyword';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '63813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_Identitfier'
  , @level2type = N'COLUMN'
  , @level2name = N'is_group';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '61813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_Identitfier'
  , @level2type = N'COLUMN'
  , @level2name = N'class';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '68813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_Identitfier'
  , @level2type = N'COLUMN'
  , @level2name = N'children';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a15eb1d1-fa81-eb11-84e9-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_Identitfier'
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
  , @level1name = N'RepoObject_SqlModules_Identitfier'
  , @level2type = N'COLUMN'
  , @level2name = N'children';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [sqlparse].[RepoObject_SqlModules_20_statement_children]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Identitfier';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:sqlparse.RepoObject_SqlModules_20_statement_children.adoc[]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Identitfier';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_20_statement_children].[SysObject_fullname]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Identitfier', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[SysObject_schema_name],''].['',[SysObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Identitfier', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_20_statement_children].[RowNumber_per_Object]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Identitfier', @level2type = N'COLUMN', @level2name = N'RowNumber_per_Object';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_20_statement_children].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Identitfier', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_20_statement_children].[normalized]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Identitfier', @level2type = N'COLUMN', @level2name = N'normalized';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_20_statement_children].[json_key]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Identitfier', @level2type = N'COLUMN', @level2name = N'json_key';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_20_statement_children].[is_whitespace]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Identitfier', @level2type = N'COLUMN', @level2name = N'is_whitespace';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_20_statement_children].[is_keyword]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Identitfier', @level2type = N'COLUMN', @level2name = N'is_keyword';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_20_statement_children].[is_group]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Identitfier', @level2type = N'COLUMN', @level2name = N'is_group';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_20_statement_children].[class]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Identitfier', @level2type = N'COLUMN', @level2name = N'class';

