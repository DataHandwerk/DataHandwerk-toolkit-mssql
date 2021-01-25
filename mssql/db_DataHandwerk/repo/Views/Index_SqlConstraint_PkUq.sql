

--contains only PK or UNIQUE
--requirement:
-- - repo.Index_Settings.is_create_constraint = 1
-- - repo.Index_union.is_index_unique = 1
CREATE VIEW [repo].[Index_SqlConstraint_PkUq]
AS
SELECT i.Index_guid
 , i.parent_RepoObject_guid
 , SqlConstraint = CONCAT (
  'CONSTRAINT '
  --todo missing name?
  , QUOTENAME(i.index_name)
  , ' '
  , CASE 
   WHEN i.is_index_primary_key = 1
    THEN 'PRIMARY KEY '
   WHEN i.is_index_unique = 1
    THEN 'UNIQUE '
   END
  , CASE i.index_type
   WHEN 1
    THEN 'CLUSTERED '
   WHEN 2
    THEN 'NONCLUSTERED '
   END
  , '('
  , collist.ConstraintColumnList
  , ')'
  )
-- , i.index_name
-- , i.index_type
-- , i.is_index_unique
-- , i.is_index_primary_key
-- --, i.referenced_index_guid
-- , i.is_index_disabled
----, i.is_index_real
----, i_s.is_create_constraint
FROM repo.Index_union AS i
LEFT OUTER JOIN repo.Index_Settings AS i_s
 ON i_s.index_guid = i.Index_guid
LEFT OUTER JOIN (
 SELECT col.[Index_guid]
  --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
  , ConstraintColumnList = STRING_AGG(CONCAT (
    CAST(' ' AS NVARCHAR(MAX))
    , QUOTENAME(col.[SysObject_column_name])
    , CASE col.[is_descending_key]
     WHEN 1
      THEN ' DESC'
     ELSE ' ASC'
     END
    ), ',') WITHIN
 GROUP (
   ORDER BY col.[index_column_id]
   )
 FROM [repo].[IndexColumn_union] AS col
 GROUP BY col.[Index_guid]
 ) collist
 ON collist.[Index_guid] = i.[Index_guid]
WHERE i_s.is_create_constraint = 1
 AND i.is_index_unique = 1