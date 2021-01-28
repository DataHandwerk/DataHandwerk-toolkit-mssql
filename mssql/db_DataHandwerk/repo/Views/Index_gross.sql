
CREATE VIEW [repo].[Index_gross]
AS
--
SELECT [T1].[index_guid]
 , [T2].[index_name]
 , [T2].[index_type]
 , [T1].[IndexPatternColumnDatatype]
 , [T1].[IndexPatternColumnName]
 , [T1].[IndexSemanticGroup]
 , [T2].[is_index_disabled]
 , [T2].[is_index_primary_key]
 , [T2].[is_index_real]
 , [T2].[is_index_unique]
 , [T3].[is_persistence]
 , [T3].[is_repo_managed]
 , [T2].[parent_RepoObject_guid]
 , [T2].[referenced_index_guid]
 , [RowNumber_PkPerParentObject] = ROW_NUMBER() OVER (
  PARTITION BY [T2].[parent_RepoObject_guid]
  , [T2].[is_index_primary_key] ORDER BY
   --priority has real index
   [T2].[is_index_real] DESC
   --priority not disabled
   , [t2].[is_index_disabled]
   --priority first added index
   , [T2].[index_guid]
  )
 , [T3].[SysObject_schema_name]
 , [T3].[SysObject_name]
 , [T3].[SysObject_type]
 , [T3].[SysObject_id]
 , [ColumList].[ColumnList]
 , [ColumList].[ConstraintColumnList]
FROM repo.[Index_Settings] AS T1
INNER JOIN repo.Index_union AS T2
 ON T1.index_guid = T2.index_guid
INNER JOIN repo.RepoObject_gross AS T3
 ON T2.parent_RepoObject_guid = T3.RepoObject_guid
LEFT JOIN [repo].[Index_ColumList] AS ColumList
 ON ColumList.[index_guid] = T1.[index_guid]
