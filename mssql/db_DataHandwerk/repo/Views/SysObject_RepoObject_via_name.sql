CREATE VIEW [repo].[SysObject_RepoObject_via_name]
AS
--
SELECT [so].[SysObject_id]
 , [so].[SysObject_schema_name]
 , [so].[SysObject_name]
 , [so].[type] AS [SysObject_type]
 , [so].[modify_date] AS [modify_date]
 , [so].[parent_object_id] AS [parent_object_id]
 , [so].[SysObject_RepoObject_guid] AS [SysObject_RepoObject_guid]
 --, [so].[temporal_type] AS              [SysObject_temporal_type]
 --, [so].[history_table_id] AS           [SysObject_history_table_id]
 --, [so].[max_column_id_used] AS         [SysObject_max_column_id_used]
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
 ON so.SysObject_schema_name = ro.SysObject_schema_name
  AND so.SysObject_name = ro.SysObject_name

