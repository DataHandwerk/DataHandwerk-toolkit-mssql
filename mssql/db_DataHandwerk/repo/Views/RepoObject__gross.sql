﻿
-- Alter View RepoObject__gross
-- Alter View RepoObject__gross
-- Alter View RepoObject__gross
-- Alter View RepoObject_all
CREATE VIEW [repo].[RepoObject__gross]
AS
--
SELECT
       [ro].[RepoObject_guid]
     , [ro].[RepoObject_schema_name]
     , [ro].[RepoObject_name]
     , [ro].[RepoObject_type]
     , [ro].[SysObject_id]
     , [ro].[SysObject_schema_name]
     , [ro].[SysObject_name]
     , [ro].[SysObject_type]
     , [ro].[SysObject_parent_object_id]
     , [ro].[SysObject_modify_date]
     , [ro].[has_different_sys_names]
     , [ro].[has_get_referenced_issue]
     , [ro].[is_repo_managed]
     , [ro].[is_SysObject_missing]
     , [ro].[modify_dt]
     , [ro].[pk_index_guid]
     , [ro].[RepoObject_Referencing_Count]
     , [ro].[RepoObject_fullname]
     , [ro].[SysObject_fullname]
     , [ro].[is_RepoObject_name_uniqueidentifier]
     , [ro].[is_SysObject_name_uniqueidentifier]
     , [ro].[node_id]
       --, [ro].[SysObject_max_column_id_used]
       --, [ro].[SysObject_temporal_type]
       --, [ro].[SysObject_history_table_id]
       --, [ro].SysObject_parent_object_id AS parent_SysObject_id
     , [rot].[source_RepoObject_guid] AS [persistence_source_RepoObject_guid]
     , [rot].[is_persistence]
     , [rot].[is_persistence_truncate]
     , [rot].[is_persistence_delete_missing]
     , [rot].[is_persistence_delete_changed]
     , [rot].[is_persistence_update_changed]
     , [rot].[has_history] AS            [has_history]
     , [rot].[has_history_columns] AS    [has_history_columns]
     , [rot].[history_schema_name] AS    [temporal_table_schema_name]
     , [rot].[history_table_name] AS     [temporal_table_table_name]
     , [rot].[is_persistence_insert]
     , [rot].[is_history_table_same_schema]
FROM
     repo.RepoObject AS ro
     LEFT OUTER JOIN
     repo.RepoObject_persistence AS rot
     ON ro.RepoObject_guid = rot.target_RepoObject_guid
GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO


