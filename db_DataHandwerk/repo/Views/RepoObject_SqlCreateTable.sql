
CREATE VIEW [repo].[RepoObject_SqlCreateTable]
AS
SELECT ro.[RepoObject_guid]
 , DbmlTable = CONCAT (
  'Table '
  , QUOTENAME(ro.RepoObject_fullname, '"')
  , '{'
  , CHAR(13)
  , CHAR(10)
  , ColList.DbmlColumnList
  --note: 'string to add notes'
  , CASE 
   WHEN NOT ro.Property_ms_description IS NULL
    THEN CHAR(13) + CHAR(10) + 'Note: ''''''' + CHAR(13) + CHAR(10) + REPLACE(REPLACE(ro.Property_ms_description, '\', '\\'), '''''''', '\''''''') + CHAR(13) + CHAR(10) + ''''''''
   END
  --optional Settings [setting1: value1, setting2: value2, setting3, setting4]
  , CHAR(13)
  , CHAR(10)
  , CASE 
   WHEN NOT IndexList.DbmlIndexList IS NULL
    THEN CHAR(13) + CHAR(10) + 'indexes {' + CHAR(13) + CHAR(10) + IndexList.DbmlIndexList + CHAR(13) + CHAR(10) + '}' + CHAR(13) + CHAR(10)
   END
  , '}'
  , CHAR(13)
  , CHAR(10)
  )
 , ro.RepoObject_fullname
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
 --ConstraintList
 , ConList.ConList
 , ro.persistence_source_RepoObject_fullname
 , ro.persistence_source_RepoObject_guid
 , ro.persistence_source_SysObject_fullname
FROM repo.[RepoObject_gross] ro
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
LEFT JOIN (
 SELECT [parent_RepoObject_guid]
  , DbmlIndexList = STRING_AGG(CONCAT (
    --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
    CAST(' ' AS NVARCHAR(MAX))
    , '('
    , i.[DbmlIndexColumnList]
    , ') '
    , '['
    , CASE 
     --this doesn't work. but we define pk in DbmlColumnList
     WHEN i.[is_index_primary_key] = 1
      THEN 'pk'
     WHEN i.[is_index_unique] = 1
      THEN 'unique'
     ELSE 'name:''' + [index_name] + ''''
     END
    , ']'
    ), CHAR(13) + CHAR(10)) WITHIN
 GROUP (
   ORDER BY i.[RowNumber_PkPerParentObject]
   )
 FROM [repo].[Index_gross] i
 WHERE i.[is_index_primary_key] = 0
  AND (
   i.is_index_unique = 1
   OR i.is_index_real = 1
   )
 GROUP BY [parent_RepoObject_guid]
 ) IndexList
 ON IndexList.[parent_RepoObject_guid] = ro.[RepoObject_guid]
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


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4f4cb4d0-4762-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlCreateTable', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '524cb4d0-4762-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlCreateTable', @level2type = N'COLUMN', @level2name = N'persistence_source_SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '514cb4d0-4762-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlCreateTable', @level2type = N'COLUMN', @level2name = N'persistence_source_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '504cb4d0-4762-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlCreateTable', @level2type = N'COLUMN', @level2name = N'persistence_source_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3fdf2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlCreateTable', @level2type = N'COLUMN', @level2name = N'DbmlTable';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'[repo].[fs_get_parameter_value]
[repo].[Index_SqlConstraint_PkUq]
[repo].[RepoObject]
[repo].[RepoObject_ColumnList]
[repo].[RepoObject_gross]
[repo].[RepoObjectColumn]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlCreateTable';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject_gross].[persistence_source_SysObject_fullname]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlCreateTable', @level2type = N'COLUMN', @level2name = N'persistence_source_SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject_gross].[persistence_source_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlCreateTable', @level2type = N'COLUMN', @level2name = N'persistence_source_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject_gross].[persistence_source_RepoObject_fullname]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlCreateTable', @level2type = N'COLUMN', @level2name = N'persistence_source_RepoObject_fullname';

