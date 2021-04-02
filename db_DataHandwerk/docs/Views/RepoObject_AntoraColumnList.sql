

CREATE VIEW [docs].[RepoObject_AntoraColumnList]
AS
SELECT roc.[RepoObject_guid]
 , AntoraPkColumnTableRows = String_Agg(CONCAT (
   --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
   CAST('' AS NVARCHAR(MAX))
   , CASE 
    WHEN roc.[is_index_primary_key] = 1
     THEN CONCAT (
       '|'
       , roc.[index_column_id]
       , CHAR(13) + CHAR(10)
       , '|'
       , '*'
       , roc.[RepoObjectColumn_name]
       , '*'
       , CHAR(13) + CHAR(10)
       , '|'
       , roc.[Repo_user_type_fullname]
       , CHAR(13) + CHAR(10)
       , '|'
       , IIF([Repo_is_nullable] = 0, 'NOT NULL', 'NULL')
       , CHAR(13) + CHAR(10)
       , '|'
       , IIF(roc.[Repo_is_identity] = 1, '(' + CAST(roc.[Repo_seed_value] AS NVARCHAR(4000)) + ',' + CAST(roc.[Repo_increment_value] AS NVARCHAR(4000)) + ')', NULL)
       , CHAR(13) + CHAR(10)
       , '|'
       , IIF(roc.[Repo_is_computed] = 1, IIF(roc.[Repo_is_persisted] = 1, 'Persisted', 'Calc'), NULL)
       , CHAR(13) + CHAR(10)
       )
    END
   ), CHAR(13) + CHAR(10)) WITHIN
GROUP (
  ORDER BY roc.[is_index_primary_key] DESC
   , roc.[index_column_id]
   , roc.[Repo_is_computed]
   , roc.[RepoObjectColumn_name]
  )
 , AntoraNonPkColumnTableRows = String_Agg(CONCAT (
   --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
   CAST('' AS NVARCHAR(MAX))
   , CASE 
    WHEN ISNULL(roc.[is_index_primary_key], 0) = 0
     THEN CONCAT (
       '|'
       --, roc.[index_column_id]
       , CHAR(13) + CHAR(10)
       , '|'
       , roc.[RepoObjectColumn_name]
       , CHAR(13) + CHAR(10)
       , '|'
       , roc.[Repo_user_type_fullname]
       , CHAR(13) + CHAR(10)
       , '|'
       , IIF([Repo_is_nullable] = 0, 'NOT NULL', 'NULL')
       , CHAR(13) + CHAR(10)
       , '|'
       , IIF(roc.[Repo_is_identity] = 1, '(' + CAST(roc.[Repo_seed_value] AS NVARCHAR(4000)) + ',' + CAST(roc.[Repo_increment_value] AS NVARCHAR(4000)) + ')', NULL)
       , CHAR(13) + CHAR(10)
       , '|'
       , IIF(roc.[Repo_is_computed] = 1, IIF(roc.[Repo_is_persisted] = 1, 'Persisted', 'Calc'), NULL)
       , CHAR(13) + CHAR(10)
       )
    END
   ), CHAR(13) + CHAR(10)) WITHIN
GROUP (
  ORDER BY roc.[is_index_primary_key] DESC
   , roc.[index_column_id]
   , roc.[Repo_is_computed]
   , roc.[RepoObjectColumn_name]
  )
FROM [repo].[RepoObjectColumn_gross] AS roc
WHERE
 --not [is_query_plan_expression], these are not real columms
 roc.[is_query_plan_expression] IS NULL
 --we need the datatype, or it should be computed
 AND (
  NOT roc.[Repo_user_type_fullname] IS NULL
  OR roc.Repo_is_computed = 1
  )
GROUP BY roc.[RepoObject_guid]
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9f8b79d5-b993-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_AntoraColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ab8b79d5-b993-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_AntoraColumnList', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ac8b79d5-b993-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_AntoraColumnList', @level2type = N'COLUMN', @level2name = N'AntoraPkColumnTableRows';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ad8b79d5-b993-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_AntoraColumnList', @level2type = N'COLUMN', @level2name = N'AntoraNonPkColumnTableRows';

