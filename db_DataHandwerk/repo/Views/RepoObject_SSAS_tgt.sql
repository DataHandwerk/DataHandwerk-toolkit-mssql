
CREATE View repo.RepoObject_SSAS_tgt
As
Select
    RepoObject_guid
  , has_execution_plan_issue
  , has_get_referenced_issue
  , Inheritance_StringAggSeparatorSql
  , InheritanceDefinition
  , InheritanceType
  , is_required_ObjectMerge
  , is_repo_managed
  , is_ssas
  , is_SysObject_missing
  , modify_dt
  , pk_index_guid
  , pk_IndexPatternColumnName_new
  , Repo_history_table_guid
  , Repo_temporal_type
  , RepoObject_name
  , RepoObject_Referencing_Count
  , RepoObject_schema_name
  , RepoObject_type
  , SysObject_id
  , SysObject_modify_date
  , SysObject_name
  , SysObject_parent_object_id
  , SysObject_schema_name
  , SysObject_type
  , external_AntoraComponent
  , external_AntoraModule
  , is_external
From
    repo.RepoObject
Where
    is_ssas = 1
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd2f5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd1f5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd0f5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'SysObject_parent_object_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cff5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cef5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'SysObject_modify_date';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cdf5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'SysObject_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ccf5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cbf5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'caf5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'RepoObject_Referencing_Count';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c9f5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c8f5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'Repo_temporal_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c7f5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'Repo_history_table_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c6f5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'pk_IndexPatternColumnName_new';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c5f5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'pk_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c4f5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'modify_dt';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c3f5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'is_SysObject_missing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c2f5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'is_ssas';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c1f5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'is_repo_managed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c0f5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'is_required_ObjectMerge';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bff5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bef5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bdf5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'Inheritance_StringAggSeparatorSql';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bcf5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'has_get_referenced_issue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bbf5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'has_execution_plan_issue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'baf5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '134559f6-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt';


GO
EXECUTE sp_addextendedproperty @name = N'usp_persistence_RepoObject_guid', @value = N'4ECA43F5-1F07-EC11-8515-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[RepoObject]
* [repo].[RepoObject_SSAS_src]
* [repo].[RepoObjectColumn_SSAS_tgt]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'E52ED185-0907-EC11-8515-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_xref', @value = N'xref:repo.RepoObject_SSAS_src.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_guid', @value = N'114559F6-0807-EC11-8515-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_fullname2', @value = N'repo.RepoObject_SSAS_src', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_fullname', @value = N'[repo].[RepoObject_SSAS_src]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'1', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_update_changed', @value = N'1', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_truncate', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_insert', @value = N'1', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_missing', @value = N'1', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_changed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_for_empty_source', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_duplicate_per_pk', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence', @value = N'1', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt';


GO
EXECUTE sp_addextendedproperty @name = N'has_history_columns', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt';


GO
EXECUTE sp_addextendedproperty @name = N'has_history', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.RepoObject.adoc[]
* xref:repo.RepoObjectColumn_SSAS_tgt.adoc[]
* xref:repo.usp_PERSIST_RepoObject_SSAS_tgt.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.RepoObject.adoc[]
* xref:repo.RepoObject_SSAS_src.adoc[]
* xref:repo.RepoObjectColumn_SSAS_tgt.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[SysObject_type]
* [repo].[RepoObject_SSAS_src].[SysObject_type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'reference in [repo_sys].[type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[SysObject_schema_name]
* [repo].[RepoObject_SSAS_src].[SysObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[SysObject_parent_object_id]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'SysObject_parent_object_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[SysObject_name]
* [repo].[RepoObject_SSAS_src].[SysObject_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[SysObject_modify_date]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'SysObject_modify_date';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[SysObject_id]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'SysObject_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_type]
* [repo].[RepoObject_SSAS_src].[RepoObject_type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'reference in [repo_sys].[type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_schema_name]
* [repo].[RepoObject_SSAS_src].[RepoObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_Referencing_Count]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'RepoObject_Referencing_Count';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_name]
* [repo].[RepoObject_SSAS_src].[RepoObject_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_guid]
* [repo].[RepoObject_SSAS_src].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[Repo_temporal_type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'Repo_temporal_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'reference in [repo_sys].[type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'Repo_temporal_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[Repo_history_table_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'Repo_history_table_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[pk_IndexPatternColumnName_new]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'pk_IndexPatternColumnName_new';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[pk_index_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'pk_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[modify_dt]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'modify_dt';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[is_SysObject_missing]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'is_SysObject_missing';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[is_ssas]
* [repo].[RepoObject_SSAS_src].[is_ssas]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'is_ssas';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[is_required_ObjectMerge]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'is_required_ObjectMerge';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[is_repo_managed]
* [repo].[RepoObject_SSAS_src].[is_repo_managed]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'is_repo_managed';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[InheritanceType]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[InheritanceDefinition]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[Inheritance_StringAggSeparatorSql]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'Inheritance_StringAggSeparatorSql';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[has_get_referenced_issue]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'has_get_referenced_issue';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[has_execution_plan_issue]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'has_execution_plan_issue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2dfe2e93-491a-ec11-851f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'is_external';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2cfe2e93-491a-ec11-851f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'external_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2bfe2e93-491a-ec11-851f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_tgt', @level2type = N'COLUMN', @level2name = N'external_AntoraComponent';

