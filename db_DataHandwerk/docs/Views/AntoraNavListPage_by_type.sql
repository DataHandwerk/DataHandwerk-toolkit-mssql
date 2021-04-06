
CREATE VIEW [docs].[AntoraNavListPage_by_type]
AS
SELECT type
 , type_desc
 , nav_list = CONCAT (
  '= '
  , type_desc
  , CHAR(13) + CHAR(10)
  , CHAR(13) + CHAR(10)
  , 'include::partial$navlist/navlist-type-' + type + '.adoc[]'
  , CHAR(13) + CHAR(10)
  )
FROM config.type
WHERE (is_DocsOutput = 1)