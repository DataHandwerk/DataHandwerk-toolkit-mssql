Create View repo.SysObject_RepoObject_via_guid
As
--
Select
    so.SysObject_id
  , ro.is_repo_managed
  , so.SysObject_schema_name
  , so.SysObject_name
  , so.type                       As SysObject_type
  , so.modify_date                As modify_date
  , so.parent_object_id           As parent_object_id
  , so.SysObject_RepoObject_guid  As SysObject_RepoObject_guid
  , ro_hist.RepoObject_guid       As history_table_guid
  , so.history_table_id
  , so.temporal_type
  --, [so].[max_column_id_used] AS         [SysObject_max_column_id_used]
  , ro.Repo_history_table_guid
  , ro.Repo_temporal_type
  , ro.RepoObject_guid            As RepoObject_guid
  , ro.RepoObject_schema_name
  , ro.RepoObject_name
  , ro.RepoObject_type
  , ro.SysObject_id               As RepoObject_SysObject_id
  , ro.SysObject_schema_name      As RepoObject_SysObject_schema_name
  , ro.SysObject_name             As RepoObject_SysObject_name
  , ro.SysObject_type             As RepoObject_SysObject_type
  , ro.SysObject_modify_date      As RepoObject_SysObject_modify_date
  , ro.SysObject_parent_object_id As RepoObject_SysObject_parent_object_id
  , ro.is_SysObject_missing       As RepoObject_is_SysObject_missing
  , ro.is_RepoObject_name_uniqueidentifier
  , ro.is_SysObject_name_uniqueidentifier
--, [ro].SysObject_parent_object_id AS          [RepoObject_parent_SysObject_id]
--, [ro].[SysObject_temporal_type] AS      [RepoObject_SysObject_temporal_type]
--, [ro].[SysObject_history_table_id] AS   [RepoObject_SysObject_history_table_id]
--, [ro].[SysObject_max_column_id_used] AS [RepoObject_SysObject_max_column_id_used]
From
    repo_sys.SysObject  As so
    Left Outer Join
        repo.RepoObject As ro
            On
            so.SysObject_RepoObject_guid = ro.RepoObject_guid

    Left Outer Join
        repo.RepoObject As ro_hist
            On
            so.history_table_id          = ro_hist.SysObject_id;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '5b90291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd6f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'temporal_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd0f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'cef47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd3f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'cff47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ccf47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'dcf47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e0f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_SysObject_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'def47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_SysObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e2f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_SysObject_parent_object_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'dff47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_SysObject_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e1f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_SysObject_modify_date';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ddf47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_SysObject_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'daf47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'dbf47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e3f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_is_SysObject_missing';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd9f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd8f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_temporal_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd7f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_history_table_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd2f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_object_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd1f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'modify_date';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e5f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'is_SysObject_name_uniqueidentifier';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e4f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'is_RepoObject_name_uniqueidentifier';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'cdf47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'is_repo_managed';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd5f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'history_table_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd4f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'history_table_guid';
Go

Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo_sys].[SysObject].[temporal_type]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'temporal_type';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[SysObject_type]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_type';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'reference in [repo_sys].[type]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_type';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[SysObject_schema_name]
[repo_sys].[SysObject].[SysObject_schema_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo_sys].[SysObject].[SysObject_RepoObject_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[SysObject_name]
[repo_sys].[SysObject].[SysObject_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_name';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[SysObject_id]
[repo_sys].[SysObject].[SysObject_id]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_id';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[RepoObject_type]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_type';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'reference in [repo_sys].[type]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_type';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[RepoObject_schema_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[RepoObject_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
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
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[Repo_temporal_type]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_temporal_type';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'reference in [repo_sys].[type]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_temporal_type';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[Repo_history_table_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_history_table_guid';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo_sys].[SysObject].[parent_object_id]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_object_id';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo_sys].[SysObject].[modify_date]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'modify_date';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[is_SysObject_name_uniqueidentifier]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'is_SysObject_name_uniqueidentifier';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'(case when TRY_CAST([SysObject_name] AS [uniqueidentifier]) IS NULL then (0) else (1) end)'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'is_SysObject_name_uniqueidentifier';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[is_RepoObject_name_uniqueidentifier]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'is_RepoObject_name_uniqueidentifier';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'(case when TRY_CAST([RepoObject_name] AS [uniqueidentifier]) IS NULL then (0) else (1) end)'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'is_RepoObject_name_uniqueidentifier';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[is_repo_managed]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'is_repo_managed';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo_sys].[SysObject].[history_table_id]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysObject_RepoObject_via_guid'
  , @level2type = N'COLUMN'
  , @level2name = N'history_table_id';
