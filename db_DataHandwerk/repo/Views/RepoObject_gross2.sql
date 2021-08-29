
CREATE View repo.RepoObject_gross2
As
Select
    ro.RepoObject_guid
  , ro.RepoObject_schema_name
  , ro.RepoObject_name
  , ro.RepoObject_type
  , ro.RepoObject_type_name
  , ro.has_different_sys_names
  , ro.has_execution_plan_issue
  , ro.has_get_referenced_issue
  , ro.Inheritance_StringAggSeparatorSql
  , ro.InheritanceDefinition
  , ro.InheritanceType
  , ro.is_DocsOutput
  , ro.is_in_reference
  , ro.is_repo_managed
  , ro.is_ssas
  , ro.is_required_ObjectMerge
  , ro.is_RepoObject_name_uniqueidentifier
  , ro.is_SysObject_missing
  , ro.is_SysObject_name_uniqueidentifier
  , ro.modify_dt
  , ro.node_id
  , ro.pk_index_guid
  , ro.pk_IndexPatternColumnDatatype
  , ro.pk_IndexPatternColumnName
  , ro.pk_IndexPatternColumnName_new
  , ro.pk_IndexSemanticGroup
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
  , ro.SysObject_query_executed_dt
  , ro.SysObject_query_plan
  , ro.SysObject_query_sql
  , ro.SysObject_schema_name
  , ro.SysObject_type
  , ro.SysObject_type_name
  , ro.usp_persistence_name
  , ro.usp_persistence_RepoObject_guid
  , ro.persistence_source_RepoObject_guid
  , ro.persistence_source_RepoObject_fullname
  , ro.persistence_source_RepoObject_fullname2
  , ro.persistence_source_RepoObject_xref
  , ro.persistence_source_SysObject_fullname
  , ro.persistence_source_SysObject_fullname2
  , ro.persistence_source_SysObject_xref
  , ro.has_history
  , ro.has_history_columns
  , ro.is_persistence
  , ro.is_persistence_check_duplicate_per_pk
  , ro.is_persistence_check_for_empty_source
  , ro.is_persistence_delete_missing
  , ro.is_persistence_delete_changed
  , ro.is_persistence_insert
  , ro.is_persistence_truncate
  , ro.is_persistence_update_changed
  , ro.is_persistence_merge_delete_missing
  , ro.is_persistence_merge_insert
  , ro.is_persistence_merge_update_changed
  , ro.history_schema_name
  , ro.history_table_name
  , ro.source_filter
  , ro.target_filter
  , ro.temporal_type
  , ro.Description
  , ro.Property_ms_description
  , ro.ssas_Description
  , ro.ssas_IsHidden
  , ro.ssas_IsPrivate
  , ro.ssas_ShowAsVariationsOnly
  , ColumnList.CreateColumnList
  , ColumnList.DbmlColumnList
  , ColumnList.PersistenceCompareColumnList
  , ColumnList.PersistenceInsertColumnList
  , ColumnList.PersistenceUpdateColumnList
  , SqlModules.sql_modules_definition
  , sql_modules_antora = Replace (
                                     Replace (
                                                 Replace ( SqlModules.sql_modules_definition, 'include::', '\include::' )
                                               , 'ifdef::'
                                               , '\ifdef::'
                                             )
                                   , 'endif::'
                                   , '\endif::'
                                 )
  , SqlModules.sql_modules_formatted
  , SqlModules.sql_modules_formatted2
  , ro_referenced.AntoraReferencedList
  , ro_referencing.AntoraReferencingList
  , ext_referenced.AntoraExternalReferencedList
  , ext_referencing.AntoraExternalReferencingList
  , AntoraModul        = AntoraModul.Parameter_value_result
  , AntoraComponent    = AntoraComponent.Parameter_value_result
From
    repo.RepoObject_gross                                               As ro
    Left Outer Join
        repo.RepoObject_ColumnList                                      As ColumnList
            On
            ColumnList.RepoObject_guid = ro.RepoObject_guid

    Left Outer Join
        sqlparse.RepoObject_SqlModules_Repo_Sys                         As SqlModules
            On
            SqlModules.RepoObject_guid = ro.RepoObject_guid

    Left Join
        reference.RepoObject_ReferencedList                             As ro_referenced
            On
            ro_referenced.Referencing_guid = ro.RepoObject_guid

    Left Join
        reference.RepoObject_ReferencingList                            As ro_referencing
            On
            ro_referencing.Referenced_guid = ro.RepoObject_guid

    Left Join
        reference.RepoObject_ExternalReferencedList                     As ext_referenced
            On
            ext_referenced.RepoObject_guid = ro.RepoObject_guid

    Left Join
        reference.RepoObject_ExternalReferencingList                    As ext_referencing
            On
            ext_referencing.RepoObject_guid = ro.RepoObject_guid
    Cross Join config.ftv_get_parameter_value ( 'AntoraComponent', '' ) As AntoraComponent
    Cross Join config.ftv_get_parameter_value ( 'AntoraModul', '' ) As AntoraModul