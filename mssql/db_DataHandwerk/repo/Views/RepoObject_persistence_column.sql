﻿
-- Alter View RepoObject_persistence_column
-- Alter View RepoObject_persistence_column

-- Alter View RepoObject_persistence_column

/*
noch nicht fertig
*/
CREATE VIEW [repo].[RepoObject_persistence_column]
AS
--
SELECT
       [rop].[target_RepoObject_guid]
     , [rop].[source_RepoObject_guid]
     , [roc_s].[RepoObjectColumn_guid] AS [RepoObjectColumn_guid_s]
     , [ro_s].[SysObject_schema_name] AS  [SysObject_schema_name_s]
     , [ro_s].[SysObject_name] AS         [SysObject_name_s]
     , [roc_s].[SysObjectColumn_name] AS  [SysObjectColumn_name_s]
     , [ro_s].[SysObject_type] AS         [SysObject_type_s]
     , [ro_t].[RepoObject_schema_name] AS [RepoObject_schema_name_t]
     , [ro_t].[RepoObject_name] AS        [RepoObject_name_t]
     , [roc_t].[RepoObjectColumn_name] AS [RepoObjectColumn_name_t]
     , [ro_t].[RepoObject_type] AS        [RepoObject_type_t]
     , [ro_t].[is_repo_managed] AS        [is_repo_managed_t]
     , [rop].[is_persistence_truncate]
     , [rop].[is_persistence_delete_missing]
     , [rop].[is_persistence_delete_changed]
     , [rop].[is_persistence_update_changed]
     , [rop].[is_persistence_insert]
     , [rop].has_history AS has_history
     , [rop].has_history_columns AS has_history_columns
     , [rop].[is_history_table_same_schema]
     , [rop].[history_schema_name]
     , [rop].[history_table_name]
     , [rop].[is_persistence]
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
FROM
     repo.RepoObject_persistence AS rop
     INNER JOIN
     repo.RepoObject AS ro_t
     ON rop.target_RepoObject_guid = ro_t.RepoObject_guid
     LEFT OUTER JOIN
     repo.RepoObject AS ro_s
     ON rop.source_RepoObject_guid = ro_s.RepoObject_guid
     LEFT OUTER JOIN
     repo.RepoObjectColumn AS roc_s
     ON rop.source_RepoObject_guid = roc_s.RepoObject_guid
     LEFT JOIN
     repo.RepoObjectColumn AS roc_t
     ON roc_t.RepoObject_guid = rop.target_RepoObject_guid
        AND roc_t.[persistence_source_RepoObjectColumn_guid] = roc_s.RepoObjectColumn_guid
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


