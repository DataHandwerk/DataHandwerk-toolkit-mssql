

/*
output example:

* Objects by type
** xref:nav/nav-type-U.adoc[]
+
--
include::partial$navlist/navlist-type-U.adoc[]
--

*/
CREATE VIEW [docs].[AntoraPage_ObjectByType]
AS
SELECT partial_content = CONCAT (
  '* Objects by type'
  , CHAR(13) + CHAR(10)
  , STRING_AGG(CONCAT (
    '** xref:nav/nav-type-' + ct.type + '.adoc[]'
    , CHAR(13) + CHAR(10)
    , '+'
    , CHAR(13) + CHAR(10)
    , '--'
    , CHAR(13) + CHAR(10)
    , 'include::partial$navlist/navlist-type-' + ct.type + '.adoc[]'
    , CHAR(13) + CHAR(10)
    , '--'
    ), CHAR(13) + CHAR(10)) WITHIN GROUP (
    ORDER BY ct.type_desc desc
    )
  )
FROM config.type ct
--only existing objects
INNER JOIN [docs].[AntoraNavListRepoObject_by_type] existing
 ON existing.type = ct.type
GROUP BY is_DocsOutput
HAVING (is_DocsOutput = 1)
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '871293b9-de96-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraPage_ObjectByType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8f1293b9-de96-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraPage_ObjectByType', @level2type = N'COLUMN', @level2name = N'partial_content';

