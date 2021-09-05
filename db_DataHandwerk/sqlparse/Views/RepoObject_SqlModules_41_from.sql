


/*
rows in [repo].[RepoObject__sql_modules_20_statement_children]
which define the first Block 
- between FROM and WHERE
- or between FROM and GROUP BY

Attention, this will not work for UNION to analyze all parts of the UNION
- we could get the first part
- we could get the part from the first from to a first where in another part of the UNION
*/

CREATE View sqlparse.RepoObject_SqlModules_41_from
As
--
Select
    T1.RepoObject_guid
  , T1.json_key
  , T1.SysObject_fullname
  , T1.RowNumber_per_Object
  , T1.class
  , T1.is_group
  , T1.is_keyword
  , T1.is_whitespace
  , T1.normalized
  , T1.children
  , normalized_PatIndex_Select = PatIndex ( '%SELECT%', T1.normalized )
  , normalized_wo_nolock       = Trim ( Replace ( T1.normalized, '(NOLOCK)', '' ))
  --, [T23_normalized_wo_nolock] = [T23].[normalized_wo_nolock]
  , T2.Min_RowNumber_From
  , T2.Min_RowNumber_GroupBy
  , T2.Min_RowNumber_Where
  , T22.identifier_name
  , T22.identifier_alias
  , T4.join_type
  , is_join                    = Iif(Not T4.join_type Is Null, 1, 0)
  , is_from                    = Iif(T1.normalized = 'FROM' And T1.is_keyword = 1, 1, 0)
  , patindex_nolock            = PatIndex ( '%(NOLOCK)%', T1.normalized )
From
    sqlparse.RepoObject_SqlModules_20_statement_children      As T1
    Left Outer Join
        sqlparse.RepoObject_SqlModules_39_object              As T2
            On
            T2.RepoObject_guid   = T1.RepoObject_guid

    Left Outer Join
        sqlparse.RepoObject_SqlModules_22_identifier_alias_AS As T22
            On
            T22.RepoObject_guid  = T1.RepoObject_guid
            And T22.json_key     = T1.json_key
    --LEFT OUTER JOIN
    --[repo].[RepoObject__sql_modules_23_normalized_wo_nolock] AS T23
    --ON T23.[RepoObject_guid] = T1.[RepoObject_guid]
    --   AND T23.[key] = T1.[key]

    Left Outer Join
        configT.join_type                                     As T4
            On
            T4.join_type_variant = T1.normalized
            And T1.is_keyword    = 1
Where
    --extract the FROM part:
    --start: [Min_RowNumber_From]
    T2.Min_RowNumber_From           <= T1.RowNumber_per_Object
    --ende: [Min_RowNumber_Where] or [Min_RowNumber_GroupBy]
    And
    (
        T2.Min_RowNumber_Where Is Null
        Or T2.Min_RowNumber_Where   > T1.RowNumber_per_Object
    )
    And
    (
        T2.Min_RowNumber_GroupBy Is Null
        Or T2.Min_RowNumber_GroupBy > T1.RowNumber_per_Object
    )
--ORDER BY
--         [T1].[RepoObject_guid]
--       , [T1].[RowNumber_per_Object]
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '3f90291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_41_from';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fbf37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_41_from'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fcf37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_41_from'
  , @level2type = N'COLUMN'
  , @level2name = N'RowNumber_per_Object';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f9f37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_41_from'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0cf47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_41_from'
  , @level2type = N'COLUMN'
  , @level2name = N'patindex_nolock';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '03f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_41_from'
  , @level2type = N'COLUMN'
  , @level2name = N'normalized_wo_nolock';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '01f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_41_from'
  , @level2type = N'COLUMN'
  , @level2name = N'normalized';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '06f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_41_from'
  , @level2type = N'COLUMN'
  , @level2name = N'Min_RowNumber_Where';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '05f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_41_from'
  , @level2type = N'COLUMN'
  , @level2name = N'Min_RowNumber_GroupBy';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '04f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_41_from'
  , @level2type = N'COLUMN'
  , @level2name = N'Min_RowNumber_From';
Go

Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '09f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_41_from'
  , @level2type = N'COLUMN'
  , @level2name = N'join_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '00f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_41_from'
  , @level2type = N'COLUMN'
  , @level2name = N'is_whitespace';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fff37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_41_from'
  , @level2type = N'COLUMN'
  , @level2name = N'is_keyword';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0af47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_41_from'
  , @level2type = N'COLUMN'
  , @level2name = N'is_join';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fef37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_41_from'
  , @level2type = N'COLUMN'
  , @level2name = N'is_group';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0bf47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_41_from'
  , @level2type = N'COLUMN'
  , @level2name = N'is_from';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '07f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_41_from'
  , @level2type = N'COLUMN'
  , @level2name = N'identifier_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '08f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_41_from'
  , @level2type = N'COLUMN'
  , @level2name = N'identifier_alias';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fdf37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_41_from'
  , @level2type = N'COLUMN'
  , @level2name = N'class';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '02f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_41_from'
  , @level2type = N'COLUMN'
  , @level2name = N'children';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ff5bfbad-f063-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_41_from'
  , @level2type = N'COLUMN'
  , @level2name = N'normalized_PatIndex_Select';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '37813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_41_from'
  , @level2type = N'COLUMN'
  , @level2name = N'json_key';
Go

Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_20_statement_children].[SysObject_fullname]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_20_statement_children].[RowNumber_per_Object]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'RowNumber_per_Object';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_20_statement_children].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_20_statement_children].[normalized]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'normalized';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_39_object].[Min_RowNumber_Where]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'Min_RowNumber_Where';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_39_object].[Min_RowNumber_GroupBy]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'Min_RowNumber_GroupBy';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_39_object].[Min_RowNumber_From]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'Min_RowNumber_From';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_20_statement_children].[json_key]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'json_key';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [configT].[join_type].[join_type]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'join_type';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_20_statement_children].[is_whitespace]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'is_whitespace';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_20_statement_children].[is_keyword]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'is_keyword';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_20_statement_children].[is_group]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'is_group';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_22_identifier_alias_AS].[identifier_name]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'identifier_name';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_22_identifier_alias_AS].[identifier_alias]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'identifier_alias';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_20_statement_children].[class]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'class';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_20_statement_children].[children]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'children';



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [configT].[join_type]
* [sqlparse].[RepoObject_SqlModules_20_statement_children]
* [sqlparse].[RepoObject_SqlModules_22_identifier_alias_AS]
* [sqlparse].[RepoObject_SqlModules_39_object]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from';




GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'RepoObject_guid,json_key', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObject_guid,json_key', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier,nvarchar(4000)', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'2F8AA10A-AB97-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:sqlparse.RepoObject_SqlModules_41_from_T.adoc[]
* xref:sqlparse.usp_PERSIST_RepoObject_SqlModules_41_from_T.adoc[]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:configT.join_type.adoc[]
* xref:sqlparse.RepoObject_SqlModules_20_statement_children.adoc[]
* xref:sqlparse.RepoObject_SqlModules_22_identifier_alias_AS.adoc[]
* xref:sqlparse.RepoObject_SqlModules_39_object.adoc[]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[SysObject_schema_name],''].['',[SysObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from';

