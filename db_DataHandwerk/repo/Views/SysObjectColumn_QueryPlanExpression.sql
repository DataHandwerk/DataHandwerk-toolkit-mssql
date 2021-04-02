CREATE VIEW [repo].[SysObjectColumn_QueryPlanExpression]
AS
--
SELECT [referencing_RepoObject_guid] AS [RepoObject_guid]
 , TRY_CAST(RIGHT([referencing_column_name], 4) AS INT) AS [SysObjectColumn_column_id]
 , [referencing_column_name] AS [SysObjectColumn_name]
FROM repo.[RepoObjectColumn_reference_QueryPlan]
WHERE [is_target_column_name_expression] = 1

UNION

SELECT [referenced_RepoObject_guid]
 , TRY_CAST(RIGHT([referenced_column_name], 4) AS INT) AS [SysObjectColumn_column_id]
 , [referenced_column_name]
FROM repo.[RepoObjectColumn_reference_QueryPlan]
WHERE [is_source_column_name_expression] = 1
 AND NOT [referenced_RepoObject_guid] IS NULL

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '6d90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObjectColumn_QueryPlanExpression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7ff67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObjectColumn_QueryPlanExpression', @level2type = N'COLUMN', @level2name = N'SysObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7ef67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObjectColumn_QueryPlanExpression', @level2type = N'COLUMN', @level2name = N'SysObjectColumn_column_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7df67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObjectColumn_QueryPlanExpression', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO


