
CREATE VIEW [docs].[AntoraNavListPage_by_schema]
AS
SELECT [RepoObject_schema_name]
 , nav_list = CONCAT (
  '= '
  , [RepoObject_schema_name]
  , CHAR(13) + CHAR(10)
  , CHAR(13) + CHAR(10)
  , 'include::partial$navlist/navlist-schema-' + [RepoObject_schema_name] + '.adoc[]'
  , CHAR(13) + CHAR(10)
  )
FROM [repo].[RepoObject] ro
GROUP BY [RepoObject_schema_name]
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b65a9de2-3799-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListPage_by_schema', @level2type = N'COLUMN', @level2name = N'nav_list';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b55a9de2-3799-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListPage_by_schema', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ae5a9de2-3799-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListPage_by_schema';

