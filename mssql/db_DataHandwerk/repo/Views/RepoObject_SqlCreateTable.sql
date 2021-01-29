CREATE   VIEW [repo].[RepoObject_SqlCreateTable]
AS
SELECT ro.[RepoObject_guid]
 , SqlCreateTable = CONCAT (
  'CREATE TABLE '
  , ro.[RepoObject_fullname]
  , ' ('
  , CHAR(13)
  , CHAR(10)
  , ColList.CreateColumnList
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
  , ConList.ConList
  --PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
  , CASE 
   WHEN EXISTS (
     SELECT 1
     FROM [repo].[RepoObjectColumn] roc
     WHERE roc.RepoObject_guid = ro.RepoObject_guid
      AND roc.[Repo_generated_always_type] = 1
     )
    AND EXISTS (
     SELECT 1
     FROM [repo].[RepoObjectColumn] roc
     WHERE roc.RepoObject_guid = ro.RepoObject_guid
      AND roc.[Repo_generated_always_type] = 2
     )
    THEN CONCAT (
      ', PERIOD FOR SYSTEM_TIME ('
      , QUOTENAME((
        SELECT [RepoObjectColumn_name]
        FROM [repo].[RepoObjectColumn] roc
        WHERE roc.RepoObject_guid = ro.RepoObject_guid
         AND roc.[Repo_generated_always_type] = 1
        ))
      , ', '
      , QUOTENAME((
        SELECT [RepoObjectColumn_name]
        FROM [repo].[RepoObjectColumn] roc
        WHERE roc.RepoObject_guid = ro.RepoObject_guid
         AND roc.[Repo_generated_always_type] = 2
        ))
      , ')'
      , CHAR(13)
      , CHAR(10)
      )
   END
  , ')'
  --WITH
  --(
  --SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [Application].[Cities_Archive] )
  --)
  , CASE ro.[Repo_temporal_type]
   WHEN 2
    THEN CONCAT (
      CHAR(13)
      , CHAR(10)
      , 'WITH'
      , CHAR(13)
      , CHAR(10)
      , '('
      , CHAR(13)
      , CHAR(10)
      , 'SYSTEM_VERSIONING = ON ( HISTORY_TABLE = '
      --, '[Application].[Cities_Archive]'
      , COALESCE(ro_hist.[RepoObject_fullname], CONCAT (
        QUOTENAME(ISNULL(CAST([repo].[fs_get_parameter_value]('Hist_Table_schema', DEFAULT) AS NVARCHAR(128)), ro.[RepoObject_schema_name]))
        , '.'
        , QUOTENAME(CONCAT (
          ro.[RepoObject_name]
          , CAST([repo].[fs_get_parameter_value]('Hist_Table_name_suffix', DEFAULT) AS NVARCHAR(128))
          ))
        ))
      , ' )'
      , CHAR(13)
      , CHAR(10)
      , ')'
      , CHAR(13)
      , CHAR(10)
      )
   END
  )
 , ConList.ConList
FROM repo.RepoObject ro
--column list should exist, otherwise CREATE statement will be invalid
INNER JOIN [repo].[RepoObject_ColumnList] AS ColList
 ON ColList.[RepoObject_guid] = ro.[RepoObject_guid]
LEFT JOIN (
 SELECT [parent_RepoObject_guid]
  , ConList = STRING_AGG(CONCAT (
    --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
    CAST(' ' AS NVARCHAR(MAX))
    , con.[SqlConstraint]
    , CHAR(13)
    , CHAR(10)
    ), ',')
 FROM [repo].[Index_SqlConstraint_PkUq] Con
 GROUP BY [parent_RepoObject_guid]
 ) ConList
 ON ConList.[parent_RepoObject_guid] = ro.[RepoObject_guid]
LEFT JOIN repo.RepoObject ro_hist
 ON ro_hist.RepoObject_guid = ro.Repo_history_table_guid

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7990291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlCreateTable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e9f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlCreateTable', @level2type = N'COLUMN', @level2name = N'SqlCreateTable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e8f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlCreateTable', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eaf67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlCreateTable', @level2type = N'COLUMN', @level2name = N'ConList';

