

--required colums depening on [repo].[RepoObject_persistence]
--WHERE rop.[has_history_columns] = 1  OR rop.[has_history] = 1
CREATE VIEW [repo].[RepoObjectColumn_HistValidColums_setpoint]
AS
SELECT rop.target_RepoObject_guid AS [RepoObject_guid]
 , CAST(p.[Parameter_value__result_nvarchar] AS SYSNAME) AS [RepoObjectColumn_name]
 , ValidList.[Repo_user_type_name]
 , ValidList.[Repo_user_type_fullname]
 , ValidList.[Repo_generated_always_type]
FROM [repo].[RepoObject_persistence] rop
CROSS JOIN (
 SELECT 'Hist_ValidFrom_column_name' AS [Parameter_name]
  , 'DATETIME2' AS [Repo_user_type_name]
  , 'datetime2(7)' AS [Repo_user_type_fullname]
  , 1 AS [Repo_generated_always_type]
 
 UNION ALL
 
 SELECT 'Hist_ValidTo_column_name' AS [Parameter_name]
  , 'DATETIME2' AS [Repo_user_type_name]
  , 'datetime2(7)' AS [Repo_user_type_fullname]
  , 2 AS [Repo_generated_always_type]
 ) ValidList
CROSS APPLY [repo].[ftv_get_parameter_value](ValidList.[Parameter_name], DEFAULT) p
WHERE rop.[has_history_columns] = 1
 OR rop.[has_history] = 1