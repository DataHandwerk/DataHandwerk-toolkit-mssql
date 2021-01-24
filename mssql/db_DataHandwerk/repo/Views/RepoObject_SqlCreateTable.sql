
CREATE VIEW [repo].[RepoObject_SqlCreateTable]
AS
SELECT ro.[RepoObject_guid]
 , SqlCreateTable = CONCAT (
  'CREATE TABLE '
  , ro.[RepoObject_fullname]
  , ' ('
  , CHAR(13)
  , CHAR(10)
  , ColList.[ColumnList]
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
  , ')'
  )
FROM repo.RepoObject ro
--column list should exist, otherwise CREATE statement will be invalid
INNER JOIN [repo].[RepoObject_SqlColumnList] AS ColList
 ON ColList.[RepoObject_guid] = ro.[RepoObject_guid]
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
