
CREATE VIEW [repo].[Index_ColumList]
AS
SELECT col.[index_guid]
 --ColumnList doesn't contain Asc and Desc
 , ColumnList = STRING_AGG(CONCAT (
   --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
   CAST(' ' AS NVARCHAR(MAX))
   , QUOTENAME(col.[SysObject_column_name])
   ), ',') WITHIN
GROUP (
  ORDER BY col.[index_column_id]
  )
 --ConstraintColumnList contains Asc and Desc
 , ConstraintColumnList = STRING_AGG(CONCAT (
   --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
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
 , PersistenceWhereColumnList = STUFF(STRING_AGG(CONCAT (
    --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
    CAST('AND T.' AS NVARCHAR(MAX))
    , QUOTENAME(col.[SysObject_column_name])
    , ' = S.'
    , QUOTENAME(col.[SysObject_column_name])
    , CHAR(13)
    , CHAR(10)
    ), '') WITHIN GROUP (
   ORDER BY col.[index_column_id]
   ), 1, 4, NULL)
FROM [repo].[IndexColumn_union] AS col
GROUP BY col.[index_guid]
