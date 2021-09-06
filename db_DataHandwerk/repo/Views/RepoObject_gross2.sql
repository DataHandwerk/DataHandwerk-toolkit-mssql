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
  , ro.is_DocsExclude
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
  , ro.tables_dataCategory
  , ro.tables_isHidden
  , ro.tables_description
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
  , AntoraModule       = AntoraModule.Parameter_value_result
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
    Cross Join config.ftv_get_parameter_value ( 'AntoraModule', '' ) As AntoraModule
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '42bbcce5-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [config].[ftv_get_parameter_value]
* [reference].[RepoObject_ExternalReferencedList]
* [reference].[RepoObject_ExternalReferencingList]
* [reference].[RepoObject_ReferencedList]
* [reference].[RepoObject_ReferencingList]
* [repo].[RepoObject_ColumnList]
* [repo].[RepoObject_gross]
* [sqlparse].[RepoObject_SqlModules_Repo_Sys]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.RepoObject_Adoc.adoc[]
* xref:property.RepoObjectProperty_Collect_source_ROGross.adoc[]
* xref:uspgenerator.GeneratorUspStep_Persistence.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:config.ftv_get_parameter_value.adoc[]
* xref:reference.RepoObject_ExternalReferencedList.adoc[]
* xref:reference.RepoObject_ExternalReferencingList.adoc[]
* xref:reference.RepoObject_ReferencedList.adoc[]
* xref:reference.RepoObject_ReferencingList.adoc[]
* xref:repo.RepoObject_ColumnList.adoc[]
* xref:repo.RepoObject_gross.adoc[]
* xref:sqlparse.RepoObject_SqlModules_Repo_Sys.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f76be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'usp_persistence_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[usp_persistence_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'usp_persistence_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f66be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'usp_persistence_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[usp_persistence_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'usp_persistence_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(''usp_PERSIST_''+[RepoObject_name])', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'usp_persistence_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '106ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'temporal_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[temporal_type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'temporal_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(CONVERT([tinyint],case [has_history] when (1) then (2) else (0) end))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'temporal_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0f6ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'target_filter';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[target_filter]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'target_filter';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '85dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'tables_isHidden';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[tables_isHidden]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'tables_isHidden';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '86dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'tables_description';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[tables_description]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'tables_description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '84dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'tables_dataCategory';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[tables_dataCategory]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'tables_dataCategory';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f56be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'SysObject_type_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[SysObject_type_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'SysObject_type_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f46be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[SysObject_type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'reference in [repo_sys].[type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f36be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[SysObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f26be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'SysObject_query_sql';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[SysObject_query_sql]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'SysObject_query_sql';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''SELECT * FROM ['',[repo].[fs_dwh_database_name](),''].['',[SysObject_schema_name],''].['',[SysObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'SysObject_query_sql';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f16be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'SysObject_query_plan';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[SysObject_query_plan]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'SysObject_query_plan';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f06be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'SysObject_query_executed_dt';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[SysObject_query_executed_dt]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'SysObject_query_executed_dt';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ef6be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'SysObject_parent_object_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[SysObject_parent_object_id]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'SysObject_parent_object_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ee6be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[SysObject_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ed6be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'SysObject_modify_date';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[SysObject_modify_date]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'SysObject_modify_date';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ec6be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'SysObject_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[SysObject_id]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'SysObject_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eb6be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'SysObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[SysObject_fullname2]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'SysObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat([SysObject_schema_name],''.'',[SysObject_name]))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'SysObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ea6be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[SysObject_fullname]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[SysObject_schema_name],''].['',[SysObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1f6ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'sql_modules_formatted2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_Repo_Sys].[sql_modules_formatted2]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'sql_modules_formatted2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1e6ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'sql_modules_formatted';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_Repo_Sys].[sql_modules_formatted]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'sql_modules_formatted';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1c6ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'sql_modules_definition';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_Repo_Sys].[sql_modules_definition]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'sql_modules_definition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1d6ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'sql_modules_antora';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0e6ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'source_filter';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[source_filter]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'source_filter';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cf6be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'RepoObject_type_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[RepoObject_type_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'RepoObject_type_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ce6be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[RepoObject_type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'reference in [repo_sys].[type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cc6be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[RepoObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e96be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'RepoObject_Referencing_Count';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[RepoObject_Referencing_Count]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'RepoObject_Referencing_Count';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cd6be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[RepoObject_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cb6be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e86be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[RepoObject_fullname2]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat([RepoObject_schema_name],''.'',[RepoObject_name]))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e76be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[RepoObject_fullname]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e66be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'Repo_temporal_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[Repo_temporal_type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'Repo_temporal_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'reference in [repo_sys].[type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'Repo_temporal_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e56be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'Repo_history_table_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[Repo_history_table_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'Repo_history_table_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '126ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'Property_ms_description';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[Property_ms_description]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'Property_ms_description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e46be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'pk_IndexSemanticGroup';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[pk_IndexSemanticGroup]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'pk_IndexSemanticGroup';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e36be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'pk_IndexPatternColumnName_new';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[pk_IndexPatternColumnName_new]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'pk_IndexPatternColumnName_new';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e26be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'pk_IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[pk_IndexPatternColumnName]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'pk_IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e16be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'pk_IndexPatternColumnDatatype';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[pk_IndexPatternColumnDatatype]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'pk_IndexPatternColumnDatatype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e06be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'pk_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[pk_index_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'pk_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1b6ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'PersistenceUpdateColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_ColumnList].[PersistenceUpdateColumnList]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'PersistenceUpdateColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1a6ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'PersistenceInsertColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_ColumnList].[PersistenceInsertColumnList]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'PersistenceInsertColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '196ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'PersistenceCompareColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_ColumnList].[PersistenceCompareColumnList]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'PersistenceCompareColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fe6be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'persistence_source_SysObject_xref';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[persistence_source_SysObject_xref]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'persistence_source_SysObject_xref';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fd6be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'persistence_source_SysObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[persistence_source_SysObject_fullname2]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'persistence_source_SysObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat([SysObject_schema_name],''.'',[SysObject_name]))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'persistence_source_SysObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fc6be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'persistence_source_SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[persistence_source_SysObject_fullname]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'persistence_source_SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[SysObject_schema_name],''].['',[SysObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'persistence_source_SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fb6be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'persistence_source_RepoObject_xref';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[persistence_source_RepoObject_xref]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'persistence_source_RepoObject_xref';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f86be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'persistence_source_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[persistence_source_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'persistence_source_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fa6be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'persistence_source_RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[persistence_source_RepoObject_fullname2]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'persistence_source_RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat([RepoObject_schema_name],''.'',[RepoObject_name]))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'persistence_source_RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f96be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'persistence_source_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[persistence_source_RepoObject_fullname]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'persistence_source_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'persistence_source_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'df6be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'node_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[node_id]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'node_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(CONVERT([bigint],[SysObject_id])*(10000))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'node_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'de6be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'modify_dt';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[modify_dt]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'modify_dt';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dd6be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_SysObject_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[is_SysObject_name_uniqueidentifier]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_SysObject_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(case when TRY_CAST([SysObject_name] AS [uniqueidentifier]) IS NULL then (0) else (1) end)', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_SysObject_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dc6be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_SysObject_missing';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[is_SysObject_missing]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_SysObject_missing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd96be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_ssas';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[is_ssas]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_ssas';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'da6be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_required_ObjectMerge';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[is_required_ObjectMerge]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_required_ObjectMerge';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'db6be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_RepoObject_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[is_RepoObject_name_uniqueidentifier]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_RepoObject_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(case when TRY_CAST([RepoObject_name] AS [uniqueidentifier]) IS NULL then (0) else (1) end)', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_RepoObject_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd86be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_repo_managed';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[is_repo_managed]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_repo_managed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '086ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_persistence_update_changed';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[is_persistence_update_changed]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_persistence_update_changed';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'changed columns should be updated in persistence target +
An alternative option is ''is_persistence_delete_changed'' +
This requires a (real or virtual) PK defined in the source', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_persistence_update_changed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '076ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_persistence_truncate';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[is_persistence_truncate]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_persistence_truncate';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0b6ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_persistence_merge_update_changed';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[is_persistence_merge_update_changed]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_persistence_merge_update_changed';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'changed columns should be updated in persistence target +
An alternative option is ''is_persistence_delete_changed'' +
This requires a (real or virtual) PK defined in the source', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_persistence_merge_update_changed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0a6ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_persistence_merge_insert';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[is_persistence_merge_insert]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_persistence_merge_insert';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'missing columns or all columns should be inserted into persistence target +
The final result depends on other settings

* ''is_persistence_truncate'' = 1 and ''is_persistence_insert'' = 1 will just truncate the persistence target and insert all entries from persistence source
* if a (real or virtual) PK is defined in the source, the insert can be combined with delete and update
', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_persistence_merge_insert';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '096ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_persistence_merge_delete_missing';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[is_persistence_merge_delete_missing]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_persistence_merge_delete_missing';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'missing columns should be deleted in persistence target +
This requires a (real or virtual) PK defined in the source', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_persistence_merge_delete_missing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '066ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_persistence_insert';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[is_persistence_insert]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_persistence_insert';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'missing columns or all columns should be inserted into persistence target +
The final result depends on other settings

* ''is_persistence_truncate'' = 1 and ''is_persistence_insert'' = 1 will just truncate the persistence target and insert all entries from persistence source
* if a (real or virtual) PK is defined in the source, the insert can be combined with delete and update
', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_persistence_insert';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '046ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_persistence_delete_missing';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[is_persistence_delete_missing]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_persistence_delete_missing';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'missing columns should be deleted in persistence target +
This requires a (real or virtual) PK defined in the source', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_persistence_delete_missing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '056ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_persistence_delete_changed';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[is_persistence_delete_changed]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_persistence_delete_changed';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'changed columns should be deleted in persistence target +
An alternative option is ''is_persistence_update_changed'' +
This requires a (real or virtual) PK defined in the source', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_persistence_delete_changed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '036ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_persistence_check_for_empty_source';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[is_persistence_check_for_empty_source]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_persistence_check_for_empty_source';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'persistence source should be checked empty source, empty source should not be persisted', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_persistence_check_for_empty_source';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '026ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_persistence_check_duplicate_per_pk';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[is_persistence_check_duplicate_per_pk]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_persistence_check_duplicate_per_pk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'persistence source should be checked for duplicates per entry in the primary key. +
This requires a (real or virtual) PK defined in the source', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_persistence_check_duplicate_per_pk';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '016ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_persistence';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[is_persistence]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_persistence';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd76be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_in_reference';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[is_in_reference]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_in_reference';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd66be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_DocsOutput';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[is_DocsOutput]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_DocsOutput';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e2cc6bcb-3c0e-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_DocsExclude';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[is_DocsExclude]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'is_DocsExclude';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd56be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[InheritanceType]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd46be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[InheritanceDefinition]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd36be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'Inheritance_StringAggSeparatorSql';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[Inheritance_StringAggSeparatorSql]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'Inheritance_StringAggSeparatorSql';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0d6ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'history_table_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[history_table_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'history_table_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'the final history_table_name will be defined in xref:sqldb:repo.RepoObject_SqlCreateTable.adoc[] +
it looks like this column here is currently not used and should or could be deleted', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'history_table_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0c6ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'history_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[history_schema_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'history_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'the final history_schema_name will be defined in xref:sqldb:repo.RepoObject_SqlCreateTable.adoc[] +
it looks like this column here is currently not used and should or could be deleted', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'history_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '006ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'has_history_columns';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[has_history_columns]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'has_history_columns';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'history columns are created. Can be used if only these columns are required, but not the related history table', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'has_history_columns';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ff6be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'has_history';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[has_history]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'has_history';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'temporal table should be created, it will also automatically create the columns required for the history', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'has_history';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd26be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'has_get_referenced_issue';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[has_get_referenced_issue]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'has_get_referenced_issue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd16be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'has_execution_plan_issue';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[has_execution_plan_issue]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'has_execution_plan_issue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd06be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'has_different_sys_names';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[has_different_sys_names]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'has_different_sys_names';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(CONVERT([bit],case when [RepoObject_schema_name]<>[SysObject_schema_name] OR [RepoObject_name]<>[SysObject_name] OR [RepoObject_type]<>[SysObject_type] then (1) else (0) end))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'has_different_sys_names';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '116ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[Description]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '186ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'DbmlColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_ColumnList].[DbmlColumnList]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'DbmlColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '176ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'CreateColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_ColumnList].[CreateColumnList]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'CreateColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '216ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'AntoraReferencingList';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObject_ReferencingList].[AntoraReferencingList]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'AntoraReferencingList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '206ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'AntoraReferencedList';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObject_ReferencedList].[AntoraReferencedList]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'AntoraReferencedList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '236ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'AntoraExternalReferencingList';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObject_ExternalReferencingList].[AntoraExternalReferencingList]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'AntoraExternalReferencingList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '226ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'AntoraExternalReferencedList';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObject_ExternalReferencedList].[AntoraExternalReferencedList]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'AntoraExternalReferencedList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '256ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross2', @level2type = N'COLUMN', @level2name = N'AntoraComponent';

