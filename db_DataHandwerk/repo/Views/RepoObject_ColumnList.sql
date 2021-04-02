
CREATE VIEW [repo].[RepoObject_ColumnList]
AS
SELECT roc.[RepoObject_guid]
 , CreateColumnList = String_Agg(CONCAT (
   --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
   CAST('' AS NVARCHAR(MAX))
   , QuoteName(roc.[RepoObjectColumn_name])
   , ' '
   , CASE roc.Repo_is_computed
    WHEN 1
     THEN CONCAT (
       'AS '
       , roc.Repo_definition
       , CASE 
        WHEN roc.Repo_is_persisted = 1
         THEN ' PERSISTED'
        END
       )
    ELSE CONCAT (
      roc.[Repo_user_type_fullname]
      --CONSTRAINT
      --DEFAULT
      , CASE 
       WHEN roc.[Repo_default_name] <> ''
        AND IsNull(roc.[Repo_default_is_system_named], 0) = 0
        THEN CONCAT (
          ' CONSTRAINT '
          , roc.[Repo_default_name]
          )
       END
      --
      , CASE 
       WHEN roc.[Repo_default_definition] <> ''
        THEN CONCAT (
          ' DEFAULT '
          , roc.[Repo_default_definition]
          )
       END
      --temporal table columns
      , CASE roc.[Repo_generated_always_type]
       WHEN 1
        THEN ' GENERATED ALWAYS AS ROW START'
       WHEN 2
        THEN ' GENERATED ALWAYS AS ROW END'
       END
      --IDENTITY
      --, CASE roc.Repo_is_identity
      -- WHEN 1
      --  THEN ' IDENTITY ' + CASE 
      --    WHEN NOT roc.[Repo_seed_value] IS NULL
      --     AND NOT roc.[Repo_increment_value] IS NULL
      --     THEN CONCAT (
      --       '('
      --       , CAST(roc.[Repo_seed_value] AS NVARCHAR(max))
      --       , ', '
      --       , CAST(roc.[Repo_increment_value] AS NVARCHAR(max))
      --       , ')'
      --       )
      --    END
      -- END
      , CASE roc.[Repo_is_identity]
       WHEN 1
        THEN CONCAT (
          ' IDENTITY ('
          , IsNull(CAST(roc.[Repo_seed_value] AS NVARCHAR(MAX)), '1')
          , ', '
          , IsNull(CAST(roc.[Repo_increment_value] AS NVARCHAR(MAX)), '1')
          , ')'
          )
       END
      , CASE 
       WHEN roc.[Repo_is_nullable] = 0
        OR roc.[Repo_generated_always_type] >= 1
        THEN ' NOT'
       END
      , ' NULL '
      )
    END
   , CHAR(13)
   , CHAR(10)
   ), ', ') WITHIN
GROUP (
  ORDER BY roc.RepoObjectColumn_column_id
  )
 , DbmlColumnList = String_Agg(CONCAT (
   --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
   CAST('' AS NVARCHAR(MAX))
   , QUOTENAME(roc.[RepoObjectColumn_name], '"')
   , ' '
   , roc.[Repo_user_type_fullname]
   , ' '
   , '['
   --null or not null
   , CASE 
    WHEN roc.[Repo_is_nullable] = 0
     OR roc.[Repo_generated_always_type] >= 1
     THEN 'not'
    END
   , ' null'
   --primary key or pk
   , CASE 
    WHEN roc.[is_index_primary_key] = 1
     THEN ', pk'
    END
   --unique
   --default: some_value
   --Attention: 
   --number value starts blank: default: 123 or default: 123.456
   --string value starts with single quotes: default: 'some string value'
   --expression value is wrapped with parenthesis: default: `now() - interval '5 days'`
   --boolean (true/false/null): default: false or default: null
   --
   , CASE 
    WHEN roc.[Repo_default_definition] <> ''
     THEN CONCAT (
       ', default: '
       , QUOTENAME(roc.[Repo_default_definition], '`')
       )
    END
   --increment
   , CASE roc.[Repo_is_identity]
    WHEN 1
     THEN ', increment'
    END
   --note: 'string to add notes'
   , CASE 
    WHEN NOT roc.Property_ms_description IS NULL
     THEN ', Note: ''''''' + CHAR(13) + CHAR(10) + REPLACE(REPLACE(roc.Property_ms_description, '\', '\\'), '''''''', '\''''''') + CHAR(13) + CHAR(10) + ''''''''
    END
   , ']'
   ), CHAR(13) + CHAR(10)) WITHIN
GROUP (
  ORDER BY roc.RepoObjectColumn_column_id
  )
 , PersistenceCompareColumnList = STUFF(String_Agg(CONCAT (
    --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
    CAST('' AS NVARCHAR(MAX))
    , ''
    , CASE 
     WHEN
      --source should exists
      NOT roc.[persistence_source_RepoObjectColumn_guid] IS NULL
      AND IsNull(roc.[is_persistence_no_include], 0) = 0
      AND IsNull(roc.[is_persistence_no_check], 0) = 0
      AND IsNull(roc.is_query_plan_expression, 0) = 0
      AND roc.Repo_generated_always_type = 0
      AND roc.Repo_is_computed = 0
      AND roc.Repo_is_identity = 0
      --do not compare PK
      --issue: if the source column is marked as PK but the target column is not marked as PK, then this column is included
      --to avoid this we would need to analyze also the source column properties
      --or we could set [is_persistence_no_check] = 1
      AND roc.[is_index_primary_key] IS NULL
      THEN CONCAT (
        'OR T.'
        , QuoteName(roc.[RepoObjectColumn_name])
        , ' <> S.'
        , QuoteName(roc.[RepoObjectColumn_name])
        , CASE 
         WHEN roc.Repo_is_nullable = 1
          THEN CONCAT (
            ' OR (S.'
            , QuoteName(roc.[RepoObjectColumn_name])
            , ' IS NULL AND NOT T.'
            , QuoteName(roc.[RepoObjectColumn_name])
            , ' IS NULL)'
            , ' OR (NOT S.'
            , QuoteName(roc.[RepoObjectColumn_name])
            , ' IS NULL AND T.'
            , QuoteName(roc.[RepoObjectColumn_name])
            , ' IS NULL)'
            )
         END
        , CHAR(13)
        , CHAR(10)
        )
     END
    ), '') WITHIN GROUP (
   ORDER BY roc.RepoObjectColumn_column_id
   ), 1, 3, '   ')
 , PersistenceInsertColumnList = STUFF(String_Agg(CONCAT (
    --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
    CAST('' AS NVARCHAR(MAX))
    , ''
    , CASE 
     WHEN
      --source should exists
      NOT roc.[persistence_source_RepoObjectColumn_guid] IS NULL
      AND IsNull(roc.[is_persistence_no_include], 0) = 0
      AND IsNull(roc.is_query_plan_expression, 0) = 0
      AND roc.Repo_generated_always_type = 0
      AND roc.Repo_is_computed = 0
      AND roc.Repo_is_identity = 0
      THEN CONCAT (
        ', '
        , QuoteName(roc.[RepoObjectColumn_name])
        , CHAR(13)
        , CHAR(10)
        )
     END
    ), '') WITHIN GROUP (
   ORDER BY roc.RepoObjectColumn_column_id
   ), 1, 2, '  ')
 , PersistenceUpdateColumnList = STUFF(String_Agg(CONCAT (
    --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
    CAST('' AS NVARCHAR(MAX))
    , ''
    , CASE 
     WHEN
      --source should exists
      NOT roc.[persistence_source_RepoObjectColumn_guid] IS NULL
      AND IsNull(roc.[is_persistence_no_include], 0) = 0
      AND IsNull(roc.[is_persistence_no_check], 0) = 0
      AND IsNull(roc.is_query_plan_expression, 0) = 0
      AND roc.Repo_generated_always_type = 0
      AND roc.Repo_is_computed = 0
      AND roc.Repo_is_identity = 0
      THEN CONCAT (
        ', T.'
        , QuoteName(roc.[RepoObjectColumn_name])
        , ' = S.'
        , QuoteName(roc.[RepoObjectColumn_name])
        , CHAR(13)
        , CHAR(10)
        )
     END
    ), '') WITHIN GROUP (
   ORDER BY roc.RepoObjectColumn_column_id
   ), 1, 2, '  ')
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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '6f90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '80f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '84f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList', @level2type = N'COLUMN', @level2name = N'PersistenceUpdateColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '83f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList', @level2type = N'COLUMN', @level2name = N'PersistenceInsertColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '82f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList', @level2type = N'COLUMN', @level2name = N'PersistenceCompareColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '81f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList', @level2type = N'COLUMN', @level2name = N'CreateColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3cdf2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList', @level2type = N'COLUMN', @level2name = N'DbmlColumnList';


GO


