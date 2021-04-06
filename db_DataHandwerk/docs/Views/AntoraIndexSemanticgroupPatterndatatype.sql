CREATE VIEW docs.AntoraIndexSemanticgroupPatterndatatype
AS
SELECT [IndexSemanticGroup]
 , [IndexPatternColumnDatatype]
 , AntoraIndexSemanticgroupPatterndatatype = STRING_AGG(CONCAT (
   CAST(N'' AS NVARCHAR(max))
   --** xref:aaa.bbb.adoc#index-pk_ccc[aaa.bbb pk_abc]
   , '** xref:' + [RepoObject_fullname2] + '.adoc[], xref:' + [RepoObject_fullname2] + '.adoc#' + 'index-' + [index_name] + '[' + [index_name] + '] +'
   , CHAR(13) + CHAR(10)
   , [IndexPatternColumnName]
   , ' +'
   , CHAR(13) + CHAR(10)
   , [IndexPatternColumnDatatype]
   , ' +'
   , CHAR(13) + CHAR(10)
   , 'PK, Unique, Real: '
   , [is_index_primary_key]
   , ', '
   , [is_index_unique]
   , ', '
   , [is_index_real]
   ), CHAR(13) + CHAR(10)) WITHIN
GROUP (
  ORDER BY [RepoObject_fullname2]
  )
FROM [repo].[Index_gross]
GROUP BY [IndexSemanticGroup]
 , [IndexPatternColumnDatatype]