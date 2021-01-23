
CREATE VIEW [repo].[SysObjectColumn_QueryPlanExpression]
AS
--
SELECT
       [referencing_RepoObject_guid] AS                         [RepoObject_guid]
     , TRY_CAST(RIGHT([referencing_column_name] , 4) AS INT) AS [SysObjectColumn_column_id]
     , [referencing_column_name] AS                             [SysObjectColumn_name]
FROM
     repo.[RepoObjectColumn_reference_QueryPlan]
WHERE   [is_target_column_name_expression] = 1
UNION
SELECT
       [referenced_RepoObject_guid]
     , TRY_CAST(RIGHT([referenced_column_name] , 4) AS INT) AS [SysObjectColumn_column_id]
     , [referenced_column_name]
FROM
     repo.[RepoObjectColumn_reference_QueryPlan]
WHERE  [is_source_column_name_expression] = 1
       AND NOT [referenced_RepoObject_guid] IS NULL
GO



GO



GO



GO


