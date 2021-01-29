
CREATE VIEW [repo].[SysObject_RepoObject_via_guid]
AS
--
SELECT [so].[SysObject_id]
 , [ro].[is_repo_managed]
 , [so].[SysObject_schema_name]
 , [so].[SysObject_name]
 , [so].[type] AS [SysObject_type]
 , [so].[modify_date] AS [modify_date]
 , [so].[parent_object_id] AS [parent_object_id]
 , [so].[SysObject_RepoObject_guid] AS [SysObject_RepoObject_guid]
 , [ro_hist].[RepoObject_guid] AS [history_table_guid]
 , [so].[history_table_id]
 , [so].[temporal_type]
 --, [so].[max_column_id_used] AS         [SysObject_max_column_id_used]
 , [ro].[Repo_history_table_guid]
 , [ro].[Repo_temporal_type]
 , [ro].[RepoObject_guid] AS [RepoObject_guid]
 , [ro].[RepoObject_schema_name]
 , [ro].[RepoObject_name]
 , [ro].[RepoObject_type]
 , [ro].[SysObject_id] AS [RepoObject_SysObject_id]
 , [ro].[SysObject_schema_name] AS [RepoObject_SysObject_schema_name]
 , [ro].[SysObject_name] AS [RepoObject_SysObject_name]
 , [ro].[SysObject_type] AS [RepoObject_SysObject_type]
 , [ro].[SysObject_modify_date] AS [RepoObject_SysObject_modify_date]
 , [ro].[SysObject_parent_object_id] AS [RepoObject_SysObject_parent_object_id]
 , [ro].[is_SysObject_missing] AS [RepoObject_is_SysObject_missing]
 , [ro].[is_RepoObject_name_uniqueidentifier]
 , [ro].[is_SysObject_name_uniqueidentifier]
--, [ro].SysObject_parent_object_id AS          [RepoObject_parent_SysObject_id]
--, [ro].[SysObject_temporal_type] AS      [RepoObject_SysObject_temporal_type]
--, [ro].[SysObject_history_table_id] AS   [RepoObject_SysObject_history_table_id]
--, [ro].[SysObject_max_column_id_used] AS [RepoObject_SysObject_max_column_id_used]
FROM repo_sys.SysObject AS so
LEFT OUTER JOIN repo.RepoObject AS ro
 ON so.SysObject_RepoObject_guid = ro.RepoObject_guid
LEFT OUTER JOIN repo.RepoObject AS ro_hist
 ON so.[history_table_id] = ro_hist.[SysObject_id]

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5b90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd6f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'temporal_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd0f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cef47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd3f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'SysObject_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cff47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ccf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'SysObject_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dcf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e0f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'RepoObject_SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'def47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'RepoObject_SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e2f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'RepoObject_SysObject_parent_object_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dff47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'RepoObject_SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e1f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'RepoObject_SysObject_modify_date';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ddf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'RepoObject_SysObject_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'daf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dbf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e3f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'RepoObject_is_SysObject_missing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd9f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd8f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'Repo_temporal_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd7f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'Repo_history_table_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd2f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'parent_object_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd1f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'modify_date';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e5f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'is_SysObject_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e4f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'is_RepoObject_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cdf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'is_repo_managed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd5f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'history_table_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd4f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'history_table_guid';

