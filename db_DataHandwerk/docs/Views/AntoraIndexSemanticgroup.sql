CREATE VIEW docs.AntoraIndexSemanticgroup
AS
SELECT [IndexSemanticGroup]
 , AntoraIndexSemanticgroup = CHAR(13) + CHAR(10) + '== ' + ISNULL([IndexSemanticGroup], '.') + CHAR(13) + CHAR(10)
 --
 + STRING_AGG(AntoraIndexSemanticgroupPatterndatatype, CHAR(13) + CHAR(10)) WITHIN
GROUP (
  ORDER BY [IndexPatternColumnDatatype]
  )
FROM docs.AntoraIndexSemanticgroupPatterndatatype
GROUP BY [IndexSemanticGroup]