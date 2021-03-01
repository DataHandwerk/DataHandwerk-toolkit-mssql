
CREATE VIEW [repo].[RepoObjectColumn_ReferenceTree]
AS
SELECT [tree].*
FROM [repo].[RepoObjectColumn] AS roc
CROSS APPLY [repo].[ftv_RepoObjectColumn_ReferenceTree](roc.[RepoObjectColumn_guid], 1000, 1000) AS tree