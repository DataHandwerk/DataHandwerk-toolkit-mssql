


/*
Assuming that a statement has only one child, this one child is decomposed into its components here.

In the next step the reiehenfolge can be checked
For example
- CREATE
- VIEW
- (identifier)
- AS
- SELECT

It can be checked if there are other components between SELECT and IdentifierList, like DISTINCT
- SELECT
- optional ... (DISTINCT, TOP xyz, ...)
- IdentifierList
- FROM

- FROM
- ...
- WHERE / HAVING

and so on

----old sql:
--SELECT [T1].[RepoObject_guid]
-- --we need the key for ROW_NUMBER
-- --key is an int in this case, maybe because the json is an array
-- , [j1].[key]
-- , [T1].[SysObject_fullname]
-- --a statement should have only one child
-- --if this is not the case we need to include into ROW_NUMBER()
-- --, T1.[children]
-- , [RowNumber_per_Object] = ROW_NUMBER() OVER (
--  PARTITION BY [T1].[RepoObject_guid] ORDER BY TRY_CAST([j1].[key] AS INT)
--  )
-- --, j1.[value]
-- --, j1.[type]
-- , [j2].*
--FROM [repo].[RepoObject_SqlModules_10_statement] AS T1
--CROSS APPLY OPENJSON(T1.[children]) AS j1
--CROSS APPLY OPENJSON(j1.[value]) WITH (
--  class NVARCHAR(500) N'$.class'
--  , is_group BIT N'$.is_group'
--  , is_keyword BIT N'$.is_keyword'
--  , is_whitespace BIT N'$.is_whitespace'
--  , normalized NVARCHAR(MAX) N'$.normalized'
--  , children NVARCHAR(MAX) N'$.children' AS JSON
--  ) AS j2


*/
CREATE View sqlparse.RepoObject_SqlModules_20_statement_children
As
--
Select
    T1.RepoObject_guid
  --we need the key for ROW_NUMBER
  --key is an int in this case, maybe because the json is an array
  , json_key             = T2.json_key Collate Database_Default
  , T1.SysObject_fullname
  --a statement should have only one child
  --if this is not the case we need to include into ROW_NUMBER()
  --, T1.[children]
  , RowNumber_per_Object = Row_Number () Over ( Partition By
                                                    T1.RepoObject_guid
                                                Order By
                                                    Try_Cast(T2.json_key As Int)
                                              )
  , T2.class
  , T2.is_group
  , T2.is_keyword
  , T2.is_whitespace
  , T2.normalized
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
    sqlparse.RepoObject_SqlModules_10_statement                          As T1
    Cross Apply sqlparse.ftv_sqlparse_with_some_children ( T1.children ) As T2
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'f78f291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e4f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e5f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'RowNumber_per_Object';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e2f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'eaf17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'normalized';
Go

Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e9f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'is_whitespace';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e8f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'is_keyword';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e7f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'is_group';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e6f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'class';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ebf17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'children';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '10813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'json_key';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '2d813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'child4_normalized';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '2c813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'child4_is_whitespace';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '2b813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'child4_is_keyword';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '2a813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'child4_is_group';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '29813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'child4_class';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '2e813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'child4_children';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '27813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'child3_normalized';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '26813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'child3_is_whitespace';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '25813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'child3_is_keyword';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '24813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'child3_is_group';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '23813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'child3_class';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '28813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'child3_children';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '21813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'child2_normalized';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '20813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'child2_is_whitespace';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1f813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'child2_is_keyword';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1e813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'child2_is_group';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1d813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'child2_class';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '22813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'child2_children';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1b813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'child1_normalized';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1a813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'child1_is_whitespace';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '19813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'child1_is_keyword';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '18813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'child1_is_group';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '17813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'child1_class';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1c813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'child1_children';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '15813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'child0_normalized';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '14813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'child0_is_whitespace';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '13813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'child0_is_keyword';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '12813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'child0_is_group';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '11813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'child0_class';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '16813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_20_statement_children'
  , @level2type = N'COLUMN'
  , @level2name = N'child0_children';
Go
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [sqlparse].[ftv_sqlparse_with_some_children]
* [sqlparse].[RepoObject_SqlModules_10_statement]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_20_statement_children';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'RepoObject_guid,json_key', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_20_statement_children';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObject_guid,json_key', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_20_statement_children';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier,nvarchar(4000)', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_20_statement_children';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'A4C41D30-1096-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_20_statement_children';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:sqlparse.RepoObject_SqlModules_21_statement_children_helper.adoc[]
* xref:sqlparse.RepoObject_SqlModules_22_identifier_alias_AS.adoc[]
* xref:sqlparse.RepoObject_SqlModules_23_normalized_wo_nolock.adoc[]
* xref:sqlparse.RepoObject_SqlModules_24_IdentifierList_children.adoc[]
* xref:sqlparse.RepoObject_SqlModules_29_1_object_is_union.adoc[]
* xref:sqlparse.RepoObject_SqlModules_29_2_object_is_GroupBy.adoc[]
* xref:sqlparse.RepoObject_SqlModules_32_ObjectClass.adoc[]
* xref:sqlparse.RepoObject_SqlModules_33_ObjectNormalized.adoc[]
* xref:sqlparse.RepoObject_SqlModules_41_from.adoc[]
* xref:sqlparse.RepoObject_SqlModules_51_Identitfier.adoc[]
* xref:sqlparse.RepoObject_SqlModules_Identitfier.adoc[]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_20_statement_children';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:sqlparse.ftv_sqlparse_with_some_children.adoc[]
* xref:sqlparse.RepoObject_SqlModules_10_statement.adoc[]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_20_statement_children';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_10_statement].[SysObject_fullname]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_20_statement_children', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[SysObject_schema_name],''].['',[SysObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_20_statement_children', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_10_statement].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_20_statement_children', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';

