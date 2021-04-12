Create View repo.RepoObject_gross
As
--
Select
    --
    ro.RepoObject_guid
  , ro.RepoObject_schema_name
  , ro.RepoObject_name
  , ro.RepoObject_type
  , repo_type.type_desc                               As RepoObject_type_name
  , ro.has_different_sys_names
  , ro.has_execution_plan_issue
  , ro.has_get_referenced_issue
  , ro.Inheritance_StringAggSeparatorSql
  , ro.InheritanceDefinition
  , ro.InheritanceType
  , ty.is_DocsOutput
  , is_in_reference                                   = Case
                                                            When Exists
                                                                 (
                                                                     Select
                                                                         1
                                                                     From
                                                                         graph.RepoObject_ReferencingReferenced As ref
                                                                     Where
                                                                         ref.Referenced_guid     = ro.RepoObject_guid
                                                                         Or ref.Referencing_guid = ro.RepoObject_guid
                                                                 )
                                                                Then
                                                                1
                                                            Else
                                                                0
                                                        End
  , ro.is_repo_managed
  , ro.is_required_ObjectMerge
  , ro.is_RepoObject_name_uniqueidentifier
  , ro.is_SysObject_missing
  , ro.is_SysObject_name_uniqueidentifier
  , ro.modify_dt
  , ro.node_id
  , ro.pk_index_guid
  , ipk.IndexPatternColumnDatatype                    As pk_IndexPatternColumnDatatype
  , ipk.IndexPatternColumnName                        As pk_IndexPatternColumnName
  , ro.pk_IndexPatternColumnName_new
  , ipk.IndexSemanticGroup                            As pk_IndexSemanticGroup
  , ro.Repo_history_table_guid
  , ro.Repo_temporal_type
  , ro.RepoObject_fullname
  , ro.RepoObject_fullname2
  , ro.RepoObject_Referencing_Count
  , ro.SysObject_fullname
  , ro.SysObject_fullname2
  , ro.SysObject_id
  , ro.SysObject_modify_date
  , ro.SysObject_name
  , ro.SysObject_parent_object_id
  , QueryPlan.SysObject_query_executed_dt
  , QueryPlan.SysObject_query_plan
  , ro.SysObject_query_sql
  , ro.SysObject_schema_name
  , ro.SysObject_type
  , sys_type.type_desc                                As SysObject_type_name
  , ro.usp_persistence_name
  , ro_usp_p.RepoObject_guid                          As usp_persistence_RepoObject_guid
  , ro_p.source_RepoObject_guid                       As persistence_source_RepoObject_guid
  , ro_p_s.RepoObject_fullname                        As persistence_source_RepoObject_fullname
  , ro_p_s.RepoObject_fullname2                       As persistence_source_RepoObject_fullname2
  , 'xref:' + ro_p_s.RepoObject_fullname2 + '.adoc[]' As persistence_source_RepoObject_xref
  , ro_p_s.SysObject_fullname                         As persistence_source_SysObject_fullname
  , ro_p_s.SysObject_fullname2                        As persistence_source_SysObject_fullname2
  , 'xref:' + ro_p_s.SysObject_fullname2 + '.adoc[]'  As persistence_source_SysObject_xref
  , ro_p.has_history
  , ro_p.has_history_columns
  , ro_p.is_persistence
  , ro_p.is_persistence_check_duplicate_per_pk
  , ro_p.is_persistence_check_for_empty_source
  , ro_p.is_persistence_delete_missing
  , ro_p.is_persistence_delete_changed
  , ro_p.is_persistence_insert
  , ro_p.is_persistence_truncate
  , ro_p.is_persistence_update_changed
  , ro_p.history_schema_name
  , ro_p.history_table_name
  , ro_p.temporal_type
  , ColumnList.CreateColumnList
  , ColumnList.DbmlColumnList
  , ColumnList.PersistenceCompareColumnList
  , ColumnList.PersistenceInsertColumnList
  , ColumnList.PersistenceUpdateColumnList
  , Property_ms_description                           = repo.fs_get_RepoObjectProperty_nvarchar ( ro.RepoObject_guid, 'ms_description' )
  , SqlModules.sql_modules_definition
  , Replace (
                Replace (
                            Replace ( SqlModules.sql_modules_definition, 'include::', '\include::' )
                          , 'ifdef::'
                          , '\ifdef::'
                        )
              , 'endif::'
              , '\endif::'
            )                                         As sql_modules_antora
  , SqlModules.sql_modules_formatted
  , SqlModules.sql_modules_formatted2
  , ro_referenced.AntoraReferencedList
  , ro_referencing.AntoraReferencingList
From
    repo.RepoObject                         As ro
    Left Outer Join
        repo.RepoObject_persistence         As ro_p
            On
            ro_p.target_RepoObject_guid         = ro.RepoObject_guid

    Left Outer Join
        repo.RepoObject                     As ro_p_s
            On
            ro_p_s.RepoObject_guid              = ro_p.source_RepoObject_guid

    Left Outer Join
        repo.RepoObject                     As ro_usp_p
            On
            ro_usp_p.RepoObject_name            = ro.usp_persistence_name
            And ro_usp_p.RepoObject_schema_name = ro.RepoObject_schema_name

    Left Outer Join
        repo.RepoObject_ColumnList          As ColumnList
            On
            ColumnList.RepoObject_guid          = ro.RepoObject_guid

    Left Outer Join
        repo.RepoObject_QueryPlan           As QueryPlan
            On
            QueryPlan.RepoObject_guid           = ro.RepoObject_guid

    Left Outer Join
        repo.RepoObject_SqlModules_Repo_Sys As SqlModules
            On
            SqlModules.RepoObject_guid          = ro.RepoObject_guid

    Left Join
        repo.Index_Settings                 As ipk
            On
            ipk.index_guid                      = ro.pk_index_guid

    Left Join
        repo.RepoObject_ReferencedList      As ro_referenced
            On
            ro_referenced.Referencing_guid      = ro.RepoObject_guid

    Left Join
        repo.RepoObject_ReferencingList     As ro_referencing
            On
            ro_referencing.Referenced_guid      = ro.RepoObject_guid

    Left Join
        config.type                         As repo_type
            On
            repo_type.type                      = ro.RepoObject_type

    Left Join
        config.type                         As sys_type
            On
            sys_type.type                       = ro.SysObject_type

    Left Join
        config.type                         ty
            On
            ty.type                             = ro.RepoObject_type;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '7790291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd3f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'usp_persistence_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e3f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'temporal_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd2f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd1f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd0f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_query_sql';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'cff67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_query_plan';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'cef67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_query_executed_dt';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'cdf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_parent_object_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ccf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'cbf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_modify_date';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'caf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'c9f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'baf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'b8f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'c7f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_Referencing_Count';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'b9f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'b7f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'c8f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'c6f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_temporal_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'c5f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_history_table_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'c4f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'pk_index_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e7f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'PersistenceUpdateColumnList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e6f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'PersistenceInsertColumnList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e5f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'PersistenceCompareColumnList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd6f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'persistence_source_SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd4f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'persistence_source_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd5f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'persistence_source_RepoObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'c3f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'node_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'c2f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'modify_dt';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'c1f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_SysObject_name_uniqueidentifier';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'c0f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_SysObject_missing';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'bff67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_RepoObject_name_uniqueidentifier';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'bef67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_repo_managed';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e0f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_update_changed';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'dff67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_truncate';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'def67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_insert';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'dcf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_delete_missing';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ddf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_delete_changed';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'dbf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_check_for_empty_source';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'daf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_check_duplicate_per_pk';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd9f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e2f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'history_table_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e1f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'history_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd8f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'has_history_columns';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd7f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'has_history';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'bdf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'has_get_referenced_issue';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'bcf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'has_execution_plan_issue';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'bbf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'has_different_sys_names';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e4f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'CreateColumnList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fa4a3013-3866-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'usp_persistence_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd6b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'InheritanceType';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd5b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'InheritanceDefinition';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd4b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Inheritance_StringAggSeparatorSql';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3edf2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Property_ms_description';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3ddf2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'DbmlColumnList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '764679b8-147c-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'sql_modules_formatted2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '754679b8-147c-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'sql_modules_formatted';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '744679b8-147c-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'sql_modules_definition';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '734679b8-147c-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_in_reference';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '67b8b46b-a08f-eb11-84f1-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'pk_IndexSemanticGroup';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '66b8b46b-a08f-eb11-84f1-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'pk_IndexPatternColumnName_new';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '65b8b46b-a08f-eb11-84f1-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'pk_IndexPatternColumnName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '64b8b46b-a08f-eb11-84f1-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'pk_IndexPatternColumnDatatype';
Go

Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[usp_persistence_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'usp_persistence_name';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'(''usp_PERSIST_''+[RepoObject_name])'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'usp_persistence_name';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_persistence].[temporal_type]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'temporal_type';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'(CONVERT([tinyint],case [has_history] when (1) then (2) else (0) end))'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'temporal_type';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[SysObject_type]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_type';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'reference in [repo_sys].[type]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_type';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[SysObject_schema_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[SysObject_query_sql]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_query_sql';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'(concat(''SELECT * FROM ['',[repo].[fs_dwh_database_name](),''].['',[SysObject_schema_name],''].['',[SysObject_name],'']''))'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_query_sql';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[SysObject_query_plan]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_query_plan';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[SysObject_query_executed_dt]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_query_executed_dt';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[SysObject_parent_object_id]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_parent_object_id';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[SysObject_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_name';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[SysObject_modify_date]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_modify_date';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[SysObject_id]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_id';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[SysObject_fullname]
[repo].[RepoObject].[SysObject_fullname]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'(concat(''['',[SysObject_schema_name],''].['',[SysObject_name],'']''))'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[RepoObject_type]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_type';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'reference in [repo_sys].[type]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_type';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[RepoObject_schema_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[RepoObject_Referencing_Count]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_Referencing_Count';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[RepoObject_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_name';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[RepoObject_guid]
[repo].[RepoObject].[RepoObject_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[RepoObject_fullname]
[repo].[RepoObject].[RepoObject_fullname]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[Repo_temporal_type]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_temporal_type';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'reference in [repo_sys].[type]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_temporal_type';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[Repo_history_table_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_history_table_guid';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[pk_index_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'pk_index_guid';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_ColumnList].[PersistenceUpdateColumnList]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'PersistenceUpdateColumnList';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_ColumnList].[PersistenceInsertColumnList]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'PersistenceInsertColumnList';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_ColumnList].[PersistenceCompareColumnList]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'PersistenceCompareColumnList';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[node_id]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'node_id';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'(CONVERT([bigint],[SysObject_id])*(10000))'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'node_id';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[modify_dt]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'modify_dt';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[is_SysObject_name_uniqueidentifier]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_SysObject_name_uniqueidentifier';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'(case when TRY_CAST([SysObject_name] AS [uniqueidentifier]) IS NULL then (0) else (1) end)'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_SysObject_name_uniqueidentifier';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[is_SysObject_missing]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_SysObject_missing';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[is_RepoObject_name_uniqueidentifier]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_RepoObject_name_uniqueidentifier';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'(case when TRY_CAST([RepoObject_name] AS [uniqueidentifier]) IS NULL then (0) else (1) end)'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_RepoObject_name_uniqueidentifier';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[is_repo_managed]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_repo_managed';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_persistence].[is_persistence_update_changed]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_update_changed';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_persistence].[is_persistence_truncate]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_truncate';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_persistence].[is_persistence_insert]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_insert';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_persistence].[is_persistence_delete_missing]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_delete_missing';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_persistence].[is_persistence_delete_changed]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_delete_changed';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_persistence].[is_persistence_check_for_empty_source]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_check_for_empty_source';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_persistence].[is_persistence_check_duplicate_per_pk]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_check_duplicate_per_pk';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_persistence].[is_persistence]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_persistence].[history_table_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'history_table_name';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_persistence].[history_schema_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'history_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_persistence].[has_history_columns]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'has_history_columns';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_persistence].[has_history]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'has_history';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[has_get_referenced_issue]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'has_get_referenced_issue';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[has_execution_plan_issue]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'has_execution_plan_issue';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[has_different_sys_names]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'has_different_sys_names';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'(CONVERT([bit],case when [RepoObject_schema_name]<>[SysObject_schema_name] OR [RepoObject_name]<>[SysObject_name] OR [RepoObject_type]<>[SysObject_type] then (1) else (0) end))'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'has_different_sys_names';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_ColumnList].[CreateColumnList]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'CreateColumnList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6a1254dc-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_type_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0539cf17-0592-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6b1254dc-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'sql_modules_antora';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '691254dc-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_type_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0439cf17-0592-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6d1254dc-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'AntoraReferencingList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6c1254dc-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'AntoraReferencedList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'bf35b4cd-e093-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'persistence_source_SysObject_xref';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'be35b4cd-e093-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'persistence_source_SysObject_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'bd35b4cd-e093-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'persistence_source_RepoObject_xref';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'bc35b4cd-e093-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'persistence_source_RepoObject_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '44e90a1e-7495-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_DocsOutput';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '7fd54692-a79b-eb11-84f6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_required_ObjectMerge';
