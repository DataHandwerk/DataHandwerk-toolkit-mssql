

/*
output example:

* Objects by type
** xref:nav/nav-type-U.adoc[]
+
--
include::partial$navlist/navlist-type-U.adoc[]
--

*/
CREATE VIEW [docs].[AntoraNav_by_type]
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