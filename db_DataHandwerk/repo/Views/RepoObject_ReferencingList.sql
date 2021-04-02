CREATE VIEW [repo].[RepoObject_ReferencingList]
AS
SELECT ror.[Referenced_guid]
 , MAX(ror.[Referenced_fullname]) AS [Referenced_fullname]
 , MAX(ror.[Referenced_fullname2]) AS [Referenced_fullname2]
 , MAX(ror.[Referenced_type]) AS [Referenced_type]
 , AntoraReferencingList = String_Agg(CONCAT (
   --* xref:target-page-filename.adoc[link text]
   --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
   CAST('* xref:' AS NVARCHAR(MAX))
   , ror.[Referencing_fullname2]
   , '.adoc[]'
   --, QuoteName(ror.[Referencing_fullname])
   --, ' '
   --, CHAR(13)
   --, CHAR(10)
   ), CHAR(13) + CHAR(10)) WITHIN
GROUP (
  ORDER BY ror.[Referencing_fullname]
  )
FROM [graph].[RepoObject_ReferencingReferenced] AS ror
GROUP BY ror.[Referenced_guid]
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '681254dc-0593-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencingList', @level2type = N'COLUMN', @level2name = N'AntoraReferencingList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '671254dc-0593-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencingList', @level2type = N'COLUMN', @level2name = N'Referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '661254dc-0593-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencingList', @level2type = N'COLUMN', @level2name = N'Referenced_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '651254dc-0593-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencingList', @level2type = N'COLUMN', @level2name = N'Referenced_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '641254dc-0593-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencingList', @level2type = N'COLUMN', @level2name = N'Referenced_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'e95bf6c2-0593-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencingList';

