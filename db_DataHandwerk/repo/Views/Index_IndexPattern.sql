
CREATE VIEW [repo].[Index_IndexPattern]
AS
--
SELECT [index_guid]
 , IndexPatternColumnName = String_Agg(SysObject_column_name, ',') WITHIN
GROUP (
  ORDER BY [index_column_id]
  )
 , IndexPatternColumnDatatype = String_Agg([SysObject_column_user_type_fullname], ',') WITHIN
GROUP (
  ORDER BY [index_column_id]
  )
FROM [repo].[IndexColumn_union]
WHERE NOT [index_guid] IS NULL
GROUP BY [index_guid]

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '6a90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_IndexPattern';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4af67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_IndexPattern', @level2type = N'COLUMN', @level2name = N'IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4bf67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_IndexPattern', @level2type = N'COLUMN', @level2name = N'IndexPatternColumnDatatype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '49f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_IndexPattern', @level2type = N'COLUMN', @level2name = N'index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'[repo].[IndexColumn_union]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_IndexPattern';

