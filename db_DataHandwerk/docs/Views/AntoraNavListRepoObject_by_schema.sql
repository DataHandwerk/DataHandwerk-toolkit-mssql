CREATE VIEW docs.AntoraNavListRepoObject_by_schema
AS
SELECT [RepoObject_schema_name]
 , nav_list = String_Agg(CONCAT (
   --* xref:target-page-filename.adoc[link text]
   --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
   CAST('* xref:' AS NVARCHAR(MAX))
   , ro.[RepoObject_fullname2]
   , '.adoc[]'
   ), CHAR(13) + CHAR(10)) WITHIN
GROUP (
  ORDER BY ro.[RepoObject_fullname2]
  )
FROM [docs].[RepoObject_OutputFilter] ro
GROUP BY [RepoObject_schema_name]
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9c8b79d5-b993-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListRepoObject_by_schema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a58b79d5-b993-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListRepoObject_by_schema', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a68b79d5-b993-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListRepoObject_by_schema', @level2type = N'COLUMN', @level2name = N'nav_list';

