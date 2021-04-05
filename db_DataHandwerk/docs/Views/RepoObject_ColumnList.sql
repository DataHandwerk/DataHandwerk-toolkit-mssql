
/*
alternative columns sort order for documentation:
- PK
- columns by name
*/
CREATE VIEW [docs].[RepoObject_ColumnList]
AS
SELECT roc.[RepoObject_guid]
 , AntoraColumnDetails = String_Agg(CONCAT (
   --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
   CAST('' AS NVARCHAR(MAX))
   , '[[column-'
   , roc.[RepoObjectColumn_name]
   , ']]'
   , CHAR(13) + CHAR(10)
   , '=== '
   , roc.[RepoObjectColumn_name]
   , CHAR(13) + CHAR(10)
   , CHAR(13) + CHAR(10)
   , '[cols="d,m,m,m,m,d"]'
   , CHAR(13) + CHAR(10)
   , '|==='
   , CHAR(13) + CHAR(10)
   , CONCAT (
    '|'
    , roc.[index_column_id]
    , CHAR(13) + CHAR(10)
    , '|'
    , IIF(roc.[is_index_primary_key] = 1, '*', '')
    , roc.[RepoObjectColumn_name]
    , IIF(roc.[is_index_primary_key] = 1, '*', '')
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
   , '|==='
   , CHAR(13) + CHAR(10)
   , CHAR(13) + CHAR(10)
   , CASE 
    WHEN roc.[Property_ms_description] <> ''
     THEN CONCAT (
       '.Description'
       , CHAR(13) + CHAR(10)
       , '....'
       , CHAR(13) + CHAR(10)
       , roc.[Property_ms_description]
       , CHAR(13) + CHAR(10)
       , '....'
       , CHAR(13) + CHAR(10)
       , CHAR(13) + CHAR(10)
       )
    END
   , CASE 
    WHEN roc.[Repo_default_definition] <> ''
     THEN CONCAT (
       '.Default: '
       , roc.[Repo_default_name]
       , CHAR(13) + CHAR(10)
       , '....'
       , CHAR(13) + CHAR(10)
       , roc.[Repo_default_definition]
       , CHAR(13) + CHAR(10)
       , '....'
       , CHAR(13) + CHAR(10)
       , CHAR(13) + CHAR(10)
       )
    END
   , CASE 
    WHEN roc.[Repo_definition] <> ''
     THEN CONCAT (
       '.Definition'
       , IIF(roc.[Repo_is_persisted] = 1, ' (PERSISTED)', NULL)
       , CHAR(13) + CHAR(10)
       , '....'
       , CHAR(13) + CHAR(10)
       , roc.[Repo_definition]
       , CHAR(13) + CHAR(10)
       , '....'
       , CHAR(13) + CHAR(10)
       , CHAR(13) + CHAR(10)
       )
    END
   , CASE 
    WHEN roc.[has_get_referenced_issue] = 1
     THEN CONCAT (
       '.has_get_referenced_issue'
       , CHAR(13) + CHAR(10)
       , '....'
       , CHAR(13) + CHAR(10)
       , roc.[has_get_referenced_issue]
       , CHAR(13) + CHAR(10)
       , '....'
       , CHAR(13) + CHAR(10)
       , CHAR(13) + CHAR(10)
       )
    END
   , CASE 
    WHEN roc.[AntoraReferencedColumnList] <> ''
     THEN CONCAT (
       '.Referenced Columns'
       , CHAR(13) + CHAR(10)
       , '--'
       , CHAR(13) + CHAR(10)
       , roc.[AntoraReferencedColumnList]
       , CHAR(13) + CHAR(10)
       , '--'
       , CHAR(13) + CHAR(10)
       , CHAR(13) + CHAR(10)
       )
    END
   , CASE 
    WHEN roc.[AntoraReferencingColumnList] <> ''
     THEN CONCAT (
       '.Referencing Columns'
       , CHAR(13) + CHAR(10)
       , '--'
       , CHAR(13) + CHAR(10)
       , roc.[AntoraReferencingColumnList]
       , CHAR(13) + CHAR(10)
       , '--'
       , CHAR(13) + CHAR(10)
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
       , '<<column-'
       , roc.[RepoObjectColumn_name]
       , '>>'
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
       , '<<column-'
       , roc.[RepoObjectColumn_name]
       , '>>'
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
 , PlantumlPkEntityColumns = String_Agg(CONCAT (
   CAST('' AS NVARCHAR(MAX))
   , CASE 
    WHEN roc.[is_index_primary_key] = 1
     THEN CONCAT (
       '  '
       --* to identify mandatory attributes
       , IIF([Repo_is_nullable] = 0, '* ', NULL)
       --{static}  => underline, {abstract} => italic
       , CASE 
        WHEN roc.[Repo_is_computed] = 1
         THEN IIF(roc.[Repo_is_persisted] = 1, '{static} ', '{abstract} ')
        END
       --PK in bold
       , '**'
       , roc.[RepoObjectColumn_name]
       , '**'
       , ' : '
       , roc.[Repo_user_type_fullname]
       --, CASE 
       -- WHEN roc.[Repo_is_computed] = 1
       --  THEN ' <<calc' + IIF(roc.[Repo_is_persisted] = 1, ' (Persisted)', '') + '>>'
       -- END
       , CHAR(13) + CHAR(10)
       )
    END
   ), '') WITHIN
GROUP (
  ORDER BY roc.[is_index_primary_key] DESC
   , roc.[index_column_id]
   , roc.[Repo_is_computed]
   , roc.[RepoObjectColumn_name]
  )
 , PlantumlNonPkEntityColumns = String_Agg(CONCAT (
   CAST('' AS NVARCHAR(MAX))
   , CASE 
    WHEN ISNULL(roc.[is_index_primary_key], 0) = 0
     THEN CONCAT (
       '  '
       --* to identify mandatory attributes
       , IIF([Repo_is_nullable] = 0, '* ', NULL)
       --{static}  => underline, {abstract} => italic
       , CASE 
        WHEN roc.[Repo_is_computed] = 1
         THEN IIF(roc.[Repo_is_persisted] = 1, '{static} ', '{abstract} ')
        END
       , roc.[RepoObjectColumn_name]
       , ' : '
       , roc.[Repo_user_type_fullname]
       --, CASE 
       -- WHEN roc.[Repo_is_computed] = 1
       --  THEN ' <<calc' + IIF(roc.[Repo_is_persisted] = 1, ' (Persisted)', '') + '>>'
       -- END
       , CHAR(13) + CHAR(10)
       )
    END
   ), '') WITHIN
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
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e0d49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList', @level2type = N'COLUMN', @level2name = N'PlantumlNonPkEntityColumns';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dfd49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList', @level2type = N'COLUMN', @level2name = N'PlantumlPkEntityColumns';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ad8b79d5-b993-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList', @level2type = N'COLUMN', @level2name = N'AntoraNonPkColumnTableRows';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ac8b79d5-b993-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList', @level2type = N'COLUMN', @level2name = N'AntoraPkColumnTableRows';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c035b4cd-e093-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList', @level2type = N'COLUMN', @level2name = N'AntoraColumnDetails';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ab8b79d5-b993-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9f8b79d5-b993-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList';

