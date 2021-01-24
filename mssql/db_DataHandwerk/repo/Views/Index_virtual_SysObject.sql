CREATE VIEW [repo].[Index_virtual_SysObject]
AS
--
SELECT [iv].[Index_guid]
 , [iv].[parent_RepoObject_guid]
 , [iv].[index_name]
 , [iv].[is_index_disabled]
 , [iv].[is_index_unique]
 , [iv].[is_index_primary_key]
 , [iv].[referenced_index_guid]
 , [isg].[IndexPatternColumnDatatype]
 , [isg].[IndexPatternColumnName]
 , [isg].[IndexSemanticGroup]
 , [ro].[SysObject_id]
 , [ro].[SysObject_schema_name]
 , [ro].[SysObject_name]
 , [ro].[SysObject_type]
 , [ro].[pk_index_guid]
FROM repo.[Index_virtual] AS iv
INNER JOIN repo.RepoObject AS ro
 ON iv.parent_RepoObject_guid = ro.RepoObject_guid
INNER JOIN [repo].[Index_IndexSemanticGroup] AS isg
 ON isg.[Index_guid] = [iv].[Index_guid]
