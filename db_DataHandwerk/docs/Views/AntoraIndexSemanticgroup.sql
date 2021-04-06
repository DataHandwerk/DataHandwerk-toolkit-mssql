
CREATE VIEW [docs].[AntoraIndexSemanticgroup]
AS
SELECT [IndexSemanticGroup]
 , AntoraIndexSemanticgroup = CHAR(13) + CHAR(10) + '== ' + ISNULL([IndexSemanticGroup], '(no group)') + CHAR(13) + CHAR(10) + CHAR(13) + CHAR(10)
 --
 + STRING_AGG(AntoraIndexSemanticgroupPatterndatatype, CHAR(13) + CHAR(10)) WITHIN
GROUP (
  ORDER BY [IndexPatternColumnDatatype]
  )
 , fixvalue = 1
FROM docs.AntoraIndexSemanticgroupPatterndatatype
GROUP BY [IndexSemanticGroup]
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '891293b9-de96-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraIndexSemanticgroup';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '931293b9-de96-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraIndexSemanticgroup', @level2type = N'COLUMN', @level2name = N'IndexSemanticGroup';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '951293b9-de96-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraIndexSemanticgroup', @level2type = N'COLUMN', @level2name = N'fixvalue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '941293b9-de96-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraIndexSemanticgroup', @level2type = N'COLUMN', @level2name = N'AntoraIndexSemanticgroup';

