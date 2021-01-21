
CREATE VIEW [repo].[SysObjectColumn__query_plan_expression]
AS
--
SELECT
       [referencing_RepoObject_guid] AS                         [RepoObject_guid]
     , TRY_CAST(RIGHT([referencing_column_name] , 4) AS INT) AS [SysObjectColumn_column_id]
     , [referencing_column_name] AS                             [SysObjectColumn_name]
FROM
     repo.RepoObjectColumn_reference__query_plan
WHERE   [is_target_column_name_expression] = 1
UNION
SELECT
       [referenced_RepoObject_guid]
     , TRY_CAST(RIGHT([referenced_column_name] , 4) AS INT) AS [SysObjectColumn_column_id]
     , [referenced_column_name]
FROM
     repo.RepoObjectColumn_reference__query_plan
WHERE  [is_source_column_name_expression] = 1
       AND NOT [referenced_RepoObject_guid] IS NULL
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'129908a2-534d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObjectColumn__query_plan_expression', @level2type = N'COLUMN', @level2name = N'SysObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'9d888a3c-034e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObjectColumn__query_plan_expression', @level2type = N'COLUMN', @level2name = N'SysObjectColumn_column_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'119908a2-534d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObjectColumn__query_plan_expression', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = N'ff9808a2-534d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObjectColumn__query_plan_expression';

