
CREATE VIEW [docs].[AntoraPage_IndexSemanticGroup]
AS
SELECT page_content = CONCAT (
  '= Index SemanticGroup'
  , CHAR(13) + CHAR(10)
  , STRING_AGG(AntoraIndexSemanticgroup, CHAR(13) + CHAR(10)) WITHIN GROUP (
    ORDER BY isnull([IndexSemanticGroup], 'zzzzzzz')
    )
  )
FROM docs.AntoraIndexSemanticgroup
GROUP BY fixvalue
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '8a1293b9-de96-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraPage_IndexSemanticGroup';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '961293b9-de96-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraPage_IndexSemanticGroup', @level2type = N'COLUMN', @level2name = N'page_content';

