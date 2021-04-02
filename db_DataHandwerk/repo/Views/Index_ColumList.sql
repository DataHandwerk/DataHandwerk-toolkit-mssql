


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
 , DbmlIndexColumnList = STRING_AGG(CONCAT (
   --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
   CAST(' ' AS NVARCHAR(MAX))
   , QUOTENAME(col.[SysObject_column_name], '"')
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

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '6890291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_ColumList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '12f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_ColumList', @level2type = N'COLUMN', @level2name = N'PersistenceWhereColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0ff67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_ColumList', @level2type = N'COLUMN', @level2name = N'index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '11f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_ColumList', @level2type = N'COLUMN', @level2name = N'ConstraintColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '10f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_ColumList', @level2type = N'COLUMN', @level2name = N'ColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3adf2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_ColumList', @level2type = N'COLUMN', @level2name = N'DbmlIndexColumnList';


GO


