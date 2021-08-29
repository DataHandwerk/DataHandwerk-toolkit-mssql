Create   View repo.RepoObjectColumn_gross2
As
Select
    roc.RepoObjectColumn_guid
  , roc.Column_name
  , roc.has_different_sys_names
  , roc.Inheritance_StringAggSeparatorSql
  , roc.InheritanceDefinition
  , roc.InheritanceType
  , roc.is_persistence_no_check
  , roc.is_persistence_no_include
  , roc.is_persistence_no_update
  , roc.is_query_plan_expression
  , roc.is_RepoObjectColumn_name_uniqueidentifier
  , roc.is_required_ColumnMerge
  , roc.is_SysObjectColumn_missing
  , roc.is_SysObjectColumn_name_uniqueidentifier
  , roc.persistence_source_RepoObjectColumn_guid
  , roc.Referencing_Count
  , roc.Repo_default_definition
  , roc.Repo_default_is_system_named
  , roc.Repo_default_name
  , roc.Repo_definition
  , roc.Repo_generated_always_type
  , roc.Repo_graph_type
  , roc.Repo_is_computed
  , roc.Repo_is_identity
  , roc.Repo_is_nullable
  , roc.Repo_is_persisted
  , roc.Repo_seed_value
  , roc.Repo_increment_value
  , roc.Repo_user_type_fullname
  , roc.Repo_user_type_name
  , roc.Repo_uses_database_collation
  , roc.RepoObject_guid
  , roc.RepoObjectColumn_column_id
  , roc.RepoObjectColumn_fullname
  , roc.RepoObjectColumn_fullname2
  , roc.RepoObjectColumn_name
  , roc.SysObjectColumn_column_id
  , roc.SysObjectColumn_name
  , roc.has_get_referenced_issue
  , roc.is_repo_managed
  , roc.is_ssas
  , roc.is_RepoObject_name_uniqueidentifier
  , roc.is_SysObject_missing
  , roc.is_SysObject_name_uniqueidentifier
  , roc.modify_dt
  , roc.node_id
  , roc.pk_index_guid
  , roc.RepoObject_fullname
  , roc.RepoObject_fullname2
  , roc.RepoObject_name
  , roc.RepoObject_Referencing_Count
  , roc.RepoObject_schema_name
  , roc.RepoObject_type
  , roc.SysObject_fullname
  , roc.SysObject_fullname2
  , roc.SysObject_id
  , roc.SysObject_modify_date
  , roc.SysObject_name
  , roc.SysObject_schema_name
  , roc.SysObject_type
  , roc.SysObject_parent_object_id
  --based on ro.pk_index_guid
  --in other words: only, if the columns are part of the PK
  , roc.Property_ms_description
  , roc.Description
  , roc.ssas_Description
  , roc.ssas_DisplayFolder
  , roc.ssas_Expression
  , roc.ssas_FormatString
  , roc.ssas_IsHidden
  , roc.ssas_IsKey
  , roc.ssas_IsUnique
  , roc.ssas_SummarizeBy
  , ic.index_column_id
  , ic.index_name
  , ic.is_index_primary_key
  , isAnyIndexColumn =
    (
        Select
            Top 1
            1
        From
            repo.IndexColumn_union As icu
        Where
            icu.RepoObjectColumn_guid = roc.RepoObjectColumn_guid
    )
  , roc_referenced.AntoraReferencedColumnList
  , roc_referencing.AntoraReferencingColumnList
From
    repo.RepoObjectColumn_gross                    As roc
    Left Outer Join
        repo.IndexColumn_union                     As ic
            On
            ic.index_guid                   = roc.pk_index_guid
            And ic.RepoObjectColumn_guid    = roc.RepoObjectColumn_guid

    Left Join
        reference.RepoObjectColumn_ReferencedList  As roc_referenced
            On
            roc_referenced.Referencing_guid = roc.RepoObjectColumn_guid

    Left Join
        reference.RepoObjectColumn_ReferencingList As roc_referencing
            On
            roc_referencing.Referenced_guid = roc.RepoObjectColumn_guid