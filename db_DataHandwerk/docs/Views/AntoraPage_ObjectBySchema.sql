
/*
output example:

* Objects by schema
** xref:nav/nav-schema-dbo.adoc[]
+
--
include::partial$navlist/navlist-schema_dbo.adoc[]
--

*/
CREATE VIEW [docs].[AntoraPage_ObjectBySchema]
AS
SELECT partial_content = CONCAT (
  '* Objects by schema'
  , CHAR(13) + CHAR(10)
  , STRING_AGG(CONCAT (
    '** xref:nav/nav-schema-' + [RepoObject_schema_name] + '.adoc[]'
    , CHAR(13) + CHAR(10)
    , '+'
    , CHAR(13) + CHAR(10)
    , '--'
    , CHAR(13) + CHAR(10)
    , 'include::partial$navlist/navlist-schema-' + [RepoObject_schema_name] + '.adoc[]'
    , CHAR(13) + CHAR(10)
    , '--'
    ), CHAR(13) + CHAR(10)) WITHIN GROUP (
    ORDER BY [RepoObject_schema_name]
    )
  )
FROM [docs].[AntoraNavListRepoObject_by_schema] ro
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b75a9de2-3799-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraPage_ObjectBySchema', @level2type = N'COLUMN', @level2name = N'partial_content';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'af5a9de2-3799-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraPage_ObjectBySchema';

