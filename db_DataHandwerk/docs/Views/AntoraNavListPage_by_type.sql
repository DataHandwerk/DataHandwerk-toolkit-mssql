
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
FROM config.type t
WHERE (is_DocsOutput = 1)
 AND EXISTS (
  SELECT 1
  FROM [docs].[RepoObject_OutputFilter] f
  WHERE f.SysObject_type = t.type
  )
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '861293b9-de96-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListPage_by_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8d1293b9-de96-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListPage_by_type', @level2type = N'COLUMN', @level2name = N'type_desc';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8c1293b9-de96-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListPage_by_type', @level2type = N'COLUMN', @level2name = N'type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8e1293b9-de96-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListPage_by_type', @level2type = N'COLUMN', @level2name = N'nav_list';

