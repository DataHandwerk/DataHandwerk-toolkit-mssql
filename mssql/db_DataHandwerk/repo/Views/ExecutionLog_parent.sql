CREATE VIEW [repo].[ExecutionLog_parent]
AS
--
SELECT [T1].[id]
 , [T1].[parent_execution_log_id]
 , [parent].[current_execution_guid] AS [parent_current_execution_guid]
 , [parent].[proc_id] AS [parent_proc_id]
 , [parent].[proc_schema_name] AS [parent_proc_schema_name]
 , [parent].[proc_name] AS [parent_proc_name]
 , [parent].[step_id] AS [parent_step_id]
 , [parent].[step_name] AS [parent_step_name]
 , [parent].[created_dt] AS [parent_created_dt]
 , [parent].[parameter_01] AS [parent_parameter_01]
 , [parent].[parameter_02] AS [parent_parameter_02]
 , [parent].[parameter_03] AS [parent_parameter_03]
 , [parent].[parameter_04] AS [parent_parameter_04]
 , [parent].[parameter_05] AS [parent_parameter_05]
 , [parent].[parameter_06] AS [parent_parameter_06]
 , [parent].[parameter_07] AS [parent_parameter_07]
 , [parent].[parameter_08] AS [parent_parameter_08]
 , [parent].[parameter_09] AS [parent_parameter_09]
 , [parent].[parameter_10] AS [parent_parameter_10]
 , [parent].[parameter_11] AS [parent_parameter_11]
 , [parent].[parameter_12] AS [parent_parameter_12]
 , [parent].[parameter_13] AS [parent_parameter_13]
 , [parent].[parameter_14] AS [parent_parameter_14]
 , [parent].[parameter_15] AS [parent_parameter_15]
 , [parent].[parameter_16] AS [parent_parameter_16]
 , [parent].[parameter_17] AS [parent_parameter_17]
 , [parent].[parameter_18] AS [parent_parameter_18]
 , [parent].[parameter_19] AS [parent_parameter_19]
 , [parent].[parameter_20] AS [parent_parameter_20]
 , [parent].[proc_fullname] AS [parent_proc_fullname]
FROM repo.ExecutionLog AS T1
LEFT JOIN repo.ExecutionLog AS parent
 ON parent.id = T1.parent_execution_log_id
WHERE NOT [parent].[id] IS NULL

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'bd90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '98f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_step_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '97f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_step_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '95f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_proc_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '96f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_proc_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '94f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_proc_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aef77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_proc_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'adf77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_20';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'acf77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_19';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'abf77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_18';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aaf77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_17';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a9f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_16';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a8f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_15';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a7f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_14';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a6f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_13';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a5f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_12';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a4f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_11';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a3f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_10';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a2f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_09';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a1f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_08';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a0f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_07';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9ff77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_06';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9ef77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_05';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9df77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_04';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9cf77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_03';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9bf77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_02';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9af77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_01';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '92f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_execution_log_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '93f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_current_execution_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '99f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_created_dt';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '91f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'id';

