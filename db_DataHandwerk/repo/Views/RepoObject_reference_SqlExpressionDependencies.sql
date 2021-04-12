Create View repo.RepoObject_reference_SqlExpressionDependencies
As
Select
    sed.referenced_id
  , sed.referencing_id
  --, [sed].[referencing_minor_id]
  , sed.referenced_entity_name
  , referenced_fullname                        = Concat (
                                                            QuoteName ( sed.referenced_schema_name )
                                                          , '.'
                                                          , QuoteName ( sed.referenced_entity_name )
                                                        )
  --, [sed].[referenced_minor_id]
  , Cast(sed.referenced_id As BigInt) * 10000  As referenced_node_id
  , sed.referenced_RepoObject_guid
  , sed.referenced_schema_name
  , sed.referenced_type
  --, [sed].[referenced_column_name]
  --, [sed].[referenced_RepoObjectColumn_guid]
  , sed.referencing_entity_name
  , referencing_fullname                       = Concat (
                                                            QuoteName ( sed.referencing_schema_name )
                                                          , '.'
                                                          , QuoteName ( sed.referencing_entity_name )
                                                        )
  , Cast(sed.referencing_id As BigInt) * 10000 As referencing_node_id
  , sed.referencing_RepoObject_guid
  , sed.referencing_schema_name
  , sed.referencing_type
  --, [sed].[referencing_RepoObjectColumn_guid]
  --, [sed].[referencing_column_name]
  , InformationSource                          = 'sys.sql_expression_dependencies'
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
    --object level
    sed.referencing_minor_id    = 0
    And sed.referenced_minor_id = 0
    --exclude virtual objects (like expressions used in procedures)
    --or objects without extended properties (like triggers)
    --currently:
    --[RepoObject_guid] = [sed].[referencing_RepoObject_guid]
    --and [sed].[referencing_RepoObject_guid] = SysObject_RepoObject_guid
    --these are RepoObject_guid storred in extended properties
    And Not sed.referencing_RepoObject_guid Is Null
    And Not sed.referenced_RepoObject_guid Is Null;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '6290291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_SqlExpressionDependencies';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'cdf57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'cef57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'cbf57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'c8f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_node_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'c7f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'cff57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_entity_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd2f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd0f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ccf57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'caf57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_node_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'c9f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd1f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_entity_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd3f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'InformationSource';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '36df2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '35df2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_fullname';
Go

Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo_sys].[sql_expression_dependencies].[referencing_type]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_type';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo_sys].[sql_expression_dependencies].[referencing_schema_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo_sys].[sql_expression_dependencies].[referencing_RepoObject_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo_sys].[sql_expression_dependencies].[referencing_id]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_id';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo_sys].[sql_expression_dependencies].[referencing_entity_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_entity_name';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo_sys].[sql_expression_dependencies].[referenced_type]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_type';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo_sys].[sql_expression_dependencies].[referenced_schema_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo_sys].[sql_expression_dependencies].[referenced_RepoObject_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo_sys].[sql_expression_dependencies].[referenced_id]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_id';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo_sys].[sql_expression_dependencies].[referenced_entity_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_SqlExpressionDependencies'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_entity_name';
