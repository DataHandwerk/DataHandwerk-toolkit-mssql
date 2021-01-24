CREATE VIEW [repo].[Index_IndexPattern]
AS
--
SELECT [index_guid]
 , IndexPatternColumnName = String_Agg(SysObject_column_name, ';') WITHIN
GROUP (
  ORDER BY [index_column_id]
  )
 , IndexPatternColumnDatatype = String_Agg([SysObject_column_user_type_fullname], ';') WITHIN
GROUP (
  ORDER BY [index_column_id]
  )
FROM [repo].[IndexColumn_union]
WHERE NOT [index_guid] IS NULL
GROUP BY [index_guid]
