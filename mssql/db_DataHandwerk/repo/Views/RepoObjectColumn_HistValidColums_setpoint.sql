
--required colums depening on [repo].[RepoObject_persistence]
--WHERE rop.[has_history_columns] = 1  OR rop.[has_history] = 1
CREATE VIEW [repo].[RepoObjectColumn_HistValidColums_setpoint]
AS
SELECT rop.target_RepoObject_guid AS [RepoObject_guid]
 , CAST(p.[Parameter_value__result_nvarchar] AS SYSNAME) AS [RepoObjectColumn_name]
 , ValidList.[Repo_generated_always_type]
 , 0 AS [Repo_is_nullable]
 , 'DATETIME2' AS [Repo_user_type_name]
 , 'datetime2(7)' AS [Repo_user_type_fullname]
FROM [repo].[RepoObject_persistence] rop
CROSS JOIN (
 SELECT 'Hist_ValidFrom_column_name' AS [Parameter_name]
  , 1 AS [Repo_generated_always_type]
 
 UNION ALL
 
 SELECT 'Hist_ValidTo_column_name' AS [Parameter_name]
  , 2 AS [Repo_generated_always_type]
 ) ValidList
CROSS APPLY [repo].[ftv_get_parameter_value](ValidList.[Parameter_name], DEFAULT) p
WHERE rop.[has_history_columns] = 1
 OR rop.[has_history] = 1
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '4390291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_HistValidColums_setpoint';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '15f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_HistValidColums_setpoint', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '14f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_HistValidColums_setpoint', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '18f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_HistValidColums_setpoint', @level2type = N'COLUMN', @level2name = N'Repo_user_type_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '19f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_HistValidColums_setpoint', @level2type = N'COLUMN', @level2name = N'Repo_user_type_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '17f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_HistValidColums_setpoint', @level2type = N'COLUMN', @level2name = N'Repo_is_nullable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '16f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_HistValidColums_setpoint', @level2type = N'COLUMN', @level2name = N'Repo_generated_always_type';

