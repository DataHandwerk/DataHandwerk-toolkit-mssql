
CREATE VIEW [docs].[RepoObject_IndexList]
AS
SELECT ix.[parent_RepoObject_guid] AS RepoObject_guid
 , AntoraIndexList = String_Agg(CONCAT (
   --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
   CAST('' AS NVARCHAR(MAX))
   , CHAR(13) + CHAR(10)
   , '[[index-'
   , ix.[index_name]
   , ']]'
   , CHAR(13) + CHAR(10)
   , '=== '
   , ix.[index_name]
   , CHAR(13) + CHAR(10)
   , CHAR(13) + CHAR(10)
   , '* IndexSemanticGroup: ' + 'xref:index/IndexSemanticGroup.adoc#_' + REPLACE(REPLACE(REPLACE(LOWER(ix.[IndexSemanticGroup]), ' ', '_'), '__', '_'), '__', '_') + '[' + ix.[IndexSemanticGroup] + ']'
   , CHAR(13) + CHAR(10)
   , '+' + CHAR(13) + CHAR(10)
   , '--' + CHAR(13) + CHAR(10)
   , [AntoraIndexColumnList]
   , CHAR(13) + CHAR(10)
   , '--' + CHAR(13) + CHAR(10)
   , '* PK, Unique, Real: '
   , [is_index_primary_key]
   , ', '
   , [is_index_unique]
   , ', '
   , [is_index_real]
   , CHAR(13) + CHAR(10)
   , '* ' + fk.[referenced_AntoraXref] + CHAR(13) + CHAR(10)
   , IIF(ix.[is_index_disabled] = 1, '* is disabled' + CHAR(13) + CHAR(10), NULL)
   ), CHAR(13) + CHAR(10)) WITHIN
GROUP (
  ORDER BY ix.[is_index_primary_key] DESC
   , ix.[is_index_unique] DESC
   , ix.[index_name]
  )
FROM [repo].[Index_gross] AS ix
LEFT JOIN [repo].[ForeignKey_gross] fk
 ON fk.[referencing_index_guid] = ix.index_guid
GROUP BY ix.[parent_RepoObject_guid]
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '71e2b548-5e96-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_IndexList', @level2type = N'COLUMN', @level2name = N'AntoraIndexList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '70e2b548-5e96-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_IndexList', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '6fe2b548-5e96-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_IndexList';

