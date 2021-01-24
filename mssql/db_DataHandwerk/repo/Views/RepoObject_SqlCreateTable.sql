﻿
CREATE VIEW [repo].[RepoObject_SqlCreateTable]
AS
SELECT ro.[RepoObject_guid]
 , SqlCreateTable = CONCAT (
  'CREATE TABLE '
  , MAX(ro.[RepoObject_fullname])
  , ' ('
  , CHAR(13)
  , CHAR(10)
  --COLUMNS:
  , STRING_AGG(CONCAT (
    --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
    CAST(' ' AS NVARCHAR(MAX))
    , QUOTENAME(roc.[RepoObjectColumn_name])
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
         AND ISNULL(roc.[Repo_default_is_system_named], 0) = 0
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
           , ISNULL(CAST(roc.[Repo_seed_value] AS NVARCHAR(MAX)), '1')
           , ', '
           , ISNULL(CAST(roc.[Repo_increment_value] AS NVARCHAR(MAX)), '1')
           , ')'
           )
        END
       , CASE roc.[Repo_is_nullable]
        WHEN 0
         THEN ' NOT'
        END
       , ' NULL '
       )
     END
    , CHAR(13)
    , CHAR(10)
    ), ',') WITHIN GROUP (
    ORDER BY roc.RepoObjectColumn_column_id
    )
   --todo:
   --evtl noch ein Komma
   , CASE 
    WHEN EXISTS (
      SELECT 1
      FROM [repo].[Index_SqlConstraint_PkUq] ConList
      WHERE ConList.[parent_RepoObject_guid] = ro.[RepoObject_guid]
      )
     THEN ','
    END
   --CONSTRAINT PK, FK, depending on some settings
   , MAX(ConList.ConList)
   , ')'
  )
FROM repo.RepoObject ro
LEFT JOIN [repo].[RepoObjectColumn] AS roc
 ON roc.[RepoObject_guid] = ro.[RepoObject_guid]
LEFT JOIN (
 SELECT [parent_RepoObject_guid]
  , ConList = STRING_AGG(CONCAT (
    --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
    CAST(' ' AS NVARCHAR(MAX))
    , con.[SqlConstraint]
    , ')'
    , CHAR(13)
    , CHAR(10)
    ), ',')
 FROM [repo].[Index_SqlConstraint_PkUq] Con
 GROUP BY [parent_RepoObject_guid]
 ) ConList
 ON ConList.[parent_RepoObject_guid] = ro.[RepoObject_guid]
WHERE
 --not [is_query_plan_expression]
 roc.[is_query_plan_expression] IS NULL
 --we need the datatype, or it should be computed
 AND (
  NOT roc.[Repo_user_type_fullname] IS NULL
  OR roc.Repo_is_computed = 1
  )
GROUP BY ro.[RepoObject_guid]
