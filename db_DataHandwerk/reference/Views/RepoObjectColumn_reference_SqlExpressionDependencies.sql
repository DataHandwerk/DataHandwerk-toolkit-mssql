

CREATE View reference.RepoObjectColumn_reference_SqlExpressionDependencies
As
--
Select
    sed.referencing_id
  , sed.referencing_minor_id
  , referencing_node_id                           = Cast(sed.referencing_id As BigInt) * 10000 + sed.referencing_minor_id
  , sed.referenced_id
  , sed.referenced_minor_id
  , referenced_node_id                            = Cast(sed.referenced_id As BigInt) * 10000 + sed.referenced_minor_id
  , sed.referencing_RepoObject_guid
  , sed.referencing_RepoObjectColumn_guid
  , sed.referenced_RepoObject_guid
  , sed.referenced_RepoObjectColumn_guid
  , sed.referencing_type
  , sed.referencing_schema_name
  , sed.referencing_entity_name
  , sed.referencing_column_name
  , sed.referenced_schema_name
  , sed.referenced_entity_name
  , sed.referenced_column_name
  , sed.referenced_type
  , InformationSource                             = 'sys.sql_expression_dependencies'
  , sed.is_computed
  , sed.definition
  , is_referencing_object_equal_referenced_object =
  --
  Cast(Case
           When sed.referencing_RepoObject_guid = sed.referenced_RepoObject_guid
               Then
               1
           Else
               0
       End As Bit)
  --Flag, if the [referenced_RepoObject_guid] is a referenced object in [repo].[RepoObject_reference__union]
  , is_referenced_object                          =
    (
        Select
            Top 1
            Cast(1 As Bit)
        From
            reference.RepoObject_reference_T As ro_r
        Where
            ro_r.referencing_RepoObject_guid    = sed.referencing_RepoObject_guid
            And ro_r.referenced_RepoObject_guid = sed.referenced_RepoObject_guid
    )
--, [sed].[referenced_server_name]
--, [sed].[referenced_database_name]
--, [sed].[referenced_class]
--, [sed].[referencing_class]
--, [sed].[referencing_class_desc]
--, [sed].[referenced_class_desc]
--, [sed].[referencing_type_desciption]
--, [sed].[referenced_type_desciption]
--, [sed].[is_schema_bound_reference]
--, [sed].[is_caller_dependent]
--, [sed].[is_ambiguous]
From
    repo_sys.sql_expression_dependencies As sed
Where
    --column level
    sed.referencing_minor_id    <> 0
    And sed.referenced_minor_id <> 0
    --exclude virtual objects (like expressions used in procedures)
    --or objects without extended properties (like triggers)
    --currently:
    --[RepoObject_guid] = [sed].[referencing_RepoObject_guid]
    --and [sed].[referencing_RepoObject_guid] = SysObject_RepoObject_guid
    --these are RepoObject_guid storred in extended properties
    And Not sed.referencing_RepoObject_guid Is Null
    And Not sed.referenced_RepoObject_guid Is Null
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '6490291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ebf57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ecf57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e8f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e7f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e3f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_node_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e2f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_minor_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e1f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'edf57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_entity_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'eef57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_column_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f2f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'eff57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'eaf57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e9f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e6f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_node_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e5f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_minor_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e4f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f0f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_entity_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f1f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_column_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f6f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'is_referencing_object_equal_referenced_object';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f7f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'is_referenced_object';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f4f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'is_computed';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f3f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'InformationSource';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f5f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'definition';
Go

Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo_sys].[sql_expression_dependencies].[referencing_type]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies', @level2type = N'COLUMN', @level2name = N'referencing_type';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo_sys].[sql_expression_dependencies].[referencing_schema_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies', @level2type = N'COLUMN', @level2name = N'referencing_schema_name';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo_sys].[sql_expression_dependencies].[referencing_RepoObjectColumn_guid]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies', @level2type = N'COLUMN', @level2name = N'referencing_RepoObjectColumn_guid';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo_sys].[sql_expression_dependencies].[referencing_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo_sys].[sql_expression_dependencies].[referencing_minor_id]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies', @level2type = N'COLUMN', @level2name = N'referencing_minor_id';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo_sys].[sql_expression_dependencies].[referencing_id]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies', @level2type = N'COLUMN', @level2name = N'referencing_id';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo_sys].[sql_expression_dependencies].[referencing_entity_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies', @level2type = N'COLUMN', @level2name = N'referencing_entity_name';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo_sys].[sql_expression_dependencies].[referencing_column_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies', @level2type = N'COLUMN', @level2name = N'referencing_column_name';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo_sys].[sql_expression_dependencies].[referenced_type]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies', @level2type = N'COLUMN', @level2name = N'referenced_type';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo_sys].[sql_expression_dependencies].[referenced_schema_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies', @level2type = N'COLUMN', @level2name = N'referenced_schema_name';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo_sys].[sql_expression_dependencies].[referenced_RepoObjectColumn_guid]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies', @level2type = N'COLUMN', @level2name = N'referenced_RepoObjectColumn_guid';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo_sys].[sql_expression_dependencies].[referenced_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo_sys].[sql_expression_dependencies].[referenced_minor_id]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies', @level2type = N'COLUMN', @level2name = N'referenced_minor_id';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo_sys].[sql_expression_dependencies].[referenced_id]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies', @level2type = N'COLUMN', @level2name = N'referenced_id';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo_sys].[sql_expression_dependencies].[referenced_entity_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies', @level2type = N'COLUMN', @level2name = N'referenced_entity_name';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo_sys].[sql_expression_dependencies].[referenced_column_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies', @level2type = N'COLUMN', @level2name = N'referenced_column_name';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo_sys].[sql_expression_dependencies].[is_computed]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies', @level2type = N'COLUMN', @level2name = N'is_computed';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo_sys].[sql_expression_dependencies].[definition]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies', @level2type = N'COLUMN', @level2name = N'definition';



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [reference].[RepoObject_reference_T]
* [repo_sys].[sql_expression_dependencies]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies';




GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'referencing_id,referencing_minor_id,referenced_id,referenced_minor_id', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'int,int,int,int', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = '47d36bd4-139e-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies';


GO
EXECUTE sp_addextendedproperty @name = N'has_execution_plan_issue', @value = N'1', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:reference.RepoObjectColumn_reference_union.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:reference.RepoObject_reference_T.adoc[]
* xref:repo_sys.sql_expression_dependencies.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'reference in [repo_sys].[type]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies', @level2type = N'COLUMN', @level2name = N'referencing_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'reference in [repo_sys].[type]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies', @level2type = N'COLUMN', @level2name = N'referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_SqlExpressionDependencies';

