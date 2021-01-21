-- Alter View RepoObject_persistence__ObjectNames
-- Alter View RepoObject_persistence__ObjectNames

/*
Source - Sys names will be used
to create
Target - Repo names (because a persistence is per definition defined as 

if ro_s columns are empty, then the entry in [rop].[source_RepoObject_guid] is wrong and should be corrected or the entry should be deleted

SELECT
       *
FROM
     repo.RepoObject_persistence__ObjectNames AS T1
WHERE  [T1].[SysObject_name_s] IS NULL

*/
CREATE VIEW [repo].[RepoObject_persistence__ObjectNames]
AS
--
SELECT
       [rop].[target_RepoObject_guid]
     , [rop].[source_RepoObject_guid]
     , [ro_s].[SysObject_schema_name] AS  [SysObject_schema_name_s]
     , [ro_s].[SysObject_name] AS         [SysObject_name_s]
     , [ro_s].[SysObject_type] AS         [SysObject_type_s]
     , [ro_t].[RepoObject_schema_name] AS [RepoObject_schema_name_t]
     , [ro_t].[RepoObject_name] AS        [RepoObject_name_t]
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
FROM
     repo.RepoObject_persistence AS rop
     INNER JOIN
     repo.RepoObject AS ro_t
     ON rop.target_RepoObject_guid = ro_t.RepoObject_guid
     LEFT OUTER JOIN
     repo.RepoObject AS ro_s
     ON rop.source_RepoObject_guid = ro_s.RepoObject_guid
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'85068223-174d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence__ObjectNames', @level2type = N'COLUMN', @level2name = N'is_persistence';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'83068223-174d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence__ObjectNames', @level2type = N'COLUMN', @level2name = N'history_table_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'82068223-174d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence__ObjectNames', @level2type = N'COLUMN', @level2name = N'history_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'84068223-174d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence__ObjectNames', @level2type = N'COLUMN', @level2name = N'is_history_table_same_schema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'81068223-174d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence__ObjectNames', @level2type = N'COLUMN', @level2name = N'has_history_columns';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'8c068223-174d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence__ObjectNames', @level2type = N'COLUMN', @level2name = N'has_history';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'88068223-174d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence__ObjectNames', @level2type = N'COLUMN', @level2name = N'is_persistence_insert';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'8a068223-174d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence__ObjectNames', @level2type = N'COLUMN', @level2name = N'is_persistence_update_changed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'86068223-174d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence__ObjectNames', @level2type = N'COLUMN', @level2name = N'is_persistence_delete_changed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'87068223-174d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence__ObjectNames', @level2type = N'COLUMN', @level2name = N'is_persistence_delete_missing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'89068223-174d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence__ObjectNames', @level2type = N'COLUMN', @level2name = N'is_persistence_truncate';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'8b068223-174d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence__ObjectNames', @level2type = N'COLUMN', @level2name = N'is_repo_managed_t';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'8f068223-174d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence__ObjectNames', @level2type = N'COLUMN', @level2name = N'RepoObject_type_t';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'8d068223-174d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence__ObjectNames', @level2type = N'COLUMN', @level2name = N'RepoObject_name_t';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'8e068223-174d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence__ObjectNames', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name_t';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'93068223-174d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence__ObjectNames', @level2type = N'COLUMN', @level2name = N'SysObject_type_s';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'91068223-174d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence__ObjectNames', @level2type = N'COLUMN', @level2name = N'SysObject_name_s';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'92068223-174d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence__ObjectNames', @level2type = N'COLUMN', @level2name = N'SysObject_schema_name_s';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'90068223-174d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence__ObjectNames', @level2type = N'COLUMN', @level2name = N'source_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'94068223-174d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence__ObjectNames', @level2type = N'COLUMN', @level2name = N'target_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = N'80068223-174d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence__ObjectNames';

