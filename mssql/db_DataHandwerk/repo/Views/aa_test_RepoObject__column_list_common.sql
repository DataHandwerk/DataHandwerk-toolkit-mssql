
CREATE VIEW [repo].[aa_test_RepoObject__column_list_common]
AS
--liste für normale Spalten
--die Tabellenstruktur wird im Repo in den Repo-Spalten definiert
--weitere listen nötig für
--PK
--common (alphabetisch oder Original?, vielleicht mit Option)
--berechnet
--IDENTITY (1, 1)
--HistorySpalten - wo werden die definiert? auch im Repo?
--
--evtl abfangen, dass [RepoObjectColumn_name] eine guid sein könnte, die dann keinen Datentyp hat
SELECT [RepoObject_guid]
 --noch ergänzen
 --NULL oder NOT NULL - [is_nullable]
 --Datentyp
 --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
 , column_list_common = STRING_AGG(CONCAT (
   CAST(' ' AS NVARCHAR(max))
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
      --IDENTITY
      , CASE roc.Repo_is_identity
       WHEN 1
        THEN ' IDENTITY ' + CASE 
          WHEN NOT roc.[Repo_seed_value] IS NULL
           AND NOT roc.[Repo_increment_value] IS NULL
           THEN CONCAT (
             '('
             , CAST(roc.[Repo_seed_value] AS NVARCHAR(max))
             , ', '
             , CAST(roc.[Repo_increment_value] AS NVARCHAR(max))
             , ')'
             )
          END
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
   ), ',') WITHIN
GROUP (
  ORDER BY roc.Repo_is_identity
   , roc.Repo_is_computed
   , ISNULL(ic.[index_column_id], 99999) --ensure PK index is sorted before other columns
   , roc.[RepoObjectColumn_name]
   --   , roc.[SysObjectColumn_column_id]
  )
FROM [repo].[RepoObjectColumn] AS roc
LEFT JOIN [repo].[IndexColumn_union] ic ON ic.RepoObjectColumn_guid = roc.RepoObjectColumn_guid
 AND ic.[is_index_primary_key] = 1
WHERE
 --not [is_query_plan_expression]
 roc.[is_query_plan_expression] IS NULL
 --we need the datatype, or it should be computed
 AND (
  NOT roc.[Repo_user_type_fullname] IS NULL
  OR roc.Repo_is_computed = 1
  )
--AND (
-- --not persisted
-- --because persisted tables are the result
-- --the source should be objects which are not yet persisted
-- --for now we disable the persistence of a persistence
-- --but we could also allow
-- [Repo_is_persisted] IS NULL
-- OR [Repo_is_persisted] = 0
-- )
GROUP BY roc.[RepoObject_guid]