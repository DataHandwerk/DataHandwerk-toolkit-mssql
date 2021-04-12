
/*
wofür soll diese Sicht verwendet werden?
noch nicht fertig
*/
Create View repo.RepoObject_persistence_column
As
--
Select
    rop.target_RepoObject_guid
  , rop.source_RepoObject_guid
  , roc_s.RepoObjectColumn_guid As RepoObjectColumn_guid_s
  , ro_s.SysObject_schema_name  As SysObject_schema_name_s
  , ro_s.SysObject_name         As SysObject_name_s
  , roc_s.SysObjectColumn_name  As SysObjectColumn_name_s
  , ro_s.SysObject_type         As SysObject_type_s
  , ro_t.RepoObject_schema_name As RepoObject_schema_name_t
  , ro_t.RepoObject_name        As RepoObject_name_t
  , roc_t.RepoObjectColumn_name As RepoObjectColumn_name_t
  , ro_t.RepoObject_type        As RepoObject_type_t
  , ro_t.is_repo_managed        As is_repo_managed_t
  , rop.is_persistence_truncate
  , rop.is_persistence_delete_missing
  , rop.is_persistence_delete_changed
  , rop.is_persistence_update_changed
  , rop.is_persistence_insert
  , rop.has_history             As has_history
  , rop.has_history_columns     As has_history_columns
  , rop.is_persistence_check_for_empty_source
  , rop.history_schema_name
  , rop.history_table_name
  , rop.is_persistence
--       --, [roc_s].[RepoObject_guid]
--       --, [roc_s].[RepoObjectColumn_name]
--       --, [roc_s].[SysObjectColumn_column_id]
--       --, [roc_s].[is_SysObjectColumn_missing]
--       --, [roc_s].[Source_PersistenceColumn_guid]
--     , [roc_s].[Target_PersistenceColumn_guid] AS [Target_PersistenceColumn_guid_s]
--     , [roc_s].[is_force_persistence] AS          [is_force_persistence_s]
--     , [roc_s].[is_force_persistence_name] AS     [is_force_persistence_name_s]
--       --, [roc_s].[persistence_source_RepoObjectColumn_guid]
--       --, [roc_s].[Referencing_Count]
--       --, [roc_s].[has_different_sys_names]
--       --, [roc_s].[is_RepoObjectColumn_name_uniqueidentifier]
--       --, [roc_s].[is_SysObjectColumn_name_uniqueidentifier]
--       --, [roc_t].[RepoObjectColumn_guid]
--       --, [roc_t].[RepoObject_guid]
--       --, [roc_t].[SysObjectColumn_name]
--       --, [roc_t].[SysObjectColumn_column_id]
--       --, [roc_t].[is_SysObjectColumn_missing]
--       --, [roc_t].[Target_PersistenceColumn_guid]
--     , [roc_t].[is_force_persistence] AS          [is_force_persistence_t]
--     , [roc_t].[is_force_persistence_name] AS     [is_force_persistence_name_t]
----, [roc_t].[persistence_source_RepoObjectColumn_guid]
----, [roc_t].[Referencing_Count]
----, [roc_t].[has_different_sys_names]
----, [roc_t].[is_RepoObjectColumn_name_uniqueidentifier]
----, [roc_t].[is_SysObjectColumn_name_uniqueidentifier]
From
    repo.RepoObject_persistence As rop
    Inner Join
        repo.RepoObject         As ro_t
            On
            rop.target_RepoObject_guid                         = ro_t.RepoObject_guid

    Left Outer Join
        repo.RepoObject         As ro_s
            On
            rop.source_RepoObject_guid                         = ro_s.RepoObject_guid

    Left Outer Join
        repo.RepoObjectColumn   As roc_s
            On
            rop.source_RepoObject_guid                         = roc_s.RepoObject_guid

    Left Join
        repo.RepoObjectColumn   As roc_t
            On
            roc_t.RepoObject_guid                              = rop.target_RepoObject_guid
            And roc_t.persistence_source_RepoObjectColumn_guid = roc_s.RepoObjectColumn_guid;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '0490291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '45f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'target_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4af27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObjectColumn_name_s';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4bf27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_type_s';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '48f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_schema_name_s';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '49f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_name_s';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '46f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'source_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4ef27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_name_t';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '47f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_guid_s';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4ff27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_type_t';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4cf27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_schema_name_t';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4df27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_name_t';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '50f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'is_repo_managed_t';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '54f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_update_changed';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '51f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_truncate';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '55f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_insert';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '52f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_delete_missing';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '53f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_delete_changed';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '58f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_check_for_empty_source';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '5bf27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '5af27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'history_table_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '59f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'history_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '57f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'has_history_columns';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '56f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'has_history';
Go

Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_persistence].[target_RepoObject_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'target_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_persistence].[source_RepoObject_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'source_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_persistence].[is_persistence_update_changed]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_update_changed';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_persistence].[is_persistence_truncate]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_truncate';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_persistence].[is_persistence_insert]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_insert';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_persistence].[is_persistence_delete_missing]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_delete_missing';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_persistence].[is_persistence_delete_changed]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_delete_changed';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_persistence].[is_persistence_check_for_empty_source]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_check_for_empty_source';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_persistence].[is_persistence]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_persistence].[history_table_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'history_table_name';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_persistence].[history_schema_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'history_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_persistence].[has_history_columns]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'has_history_columns';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_persistence].[has_history]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_column'
  , @level2type = N'COLUMN'
  , @level2name = N'has_history';
