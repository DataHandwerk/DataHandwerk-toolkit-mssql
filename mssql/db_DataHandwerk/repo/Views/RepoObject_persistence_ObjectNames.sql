/*
Source - Sys names will be used
to create
Target - Repo names (because a persistence is per definition defined as 

if ro_s columns are empty, then the entry in [rop].[source_RepoObject_guid] is wrong and should be corrected or the entry should be deleted

SELECT
       *
FROM
     repo.RepoObject_persistence_ObjectNames AS T1
WHERE  [T1].[SysObject_name_s] IS NULL

*/
CREATE VIEW [repo].[RepoObject_persistence_ObjectNames]
AS
--
SELECT [rop].[target_RepoObject_guid]
 , [rop].[source_RepoObject_guid]
 , [ro_s].[SysObject_schema_name] AS [SysObject_schema_name_s]
 , [ro_s].[SysObject_name] AS [SysObject_name_s]
 , [ro_s].[SysObject_type] AS [SysObject_type_s]
 , [ro_t].[RepoObject_schema_name] AS [RepoObject_schema_name_t]
 , [ro_t].[RepoObject_name] AS [RepoObject_name_t]
 , [ro_t].[RepoObject_type] AS [RepoObject_type_t]
 , [ro_t].[is_repo_managed] AS [is_repo_managed_t]
 , [rop].[is_persistence_truncate]
 , [rop].[is_persistence_delete_missing]
 , [rop].[is_persistence_delete_changed]
 , [rop].[is_persistence_update_changed]
 , [rop].[is_persistence_insert]
 , [rop].[has_history]
 , [rop].[has_history_columns]
 , [rop].[is_persistence_check_for_empty_source]
 , [rop].[history_schema_name]
 , [rop].[history_table_name]
 , [rop].[is_persistence]
FROM repo.RepoObject_persistence AS rop
INNER JOIN repo.RepoObject AS ro_t
 ON rop.target_RepoObject_guid = ro_t.RepoObject_guid
LEFT OUTER JOIN repo.RepoObject AS ro_s
 ON rop.source_RepoObject_guid = ro_s.RepoObject_guid
