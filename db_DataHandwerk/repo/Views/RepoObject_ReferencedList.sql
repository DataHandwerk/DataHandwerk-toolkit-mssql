
CREATE VIEW [repo].[RepoObject_ReferencedList]
AS
SELECT ror.[Referencing_guid]
 , AntoraReferencedList = String_Agg(CONCAT (
   --* xref:target-page-filename.adoc[link text]
   --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
   CAST('* xref:' AS NVARCHAR(MAX))
   , ror.[Referenced_fullname2]
   , '.adoc[]'
   --, QuoteName(ror.[Referenced_fullname])
   --, ' '
   --, CHAR(13)
   --, CHAR(10)
   ), CHAR(13) + CHAR(10)) WITHIN
GROUP (
  ORDER BY ror.[Referenced_fullname]
  )
 , MAX(ror.[Referencing_fullname]) AS [Referencing_fullname]
 , MAX(ror.[Referencing_fullname2]) AS [Referencing_fullname2]
 , MAX(ror.[Referencing_type]) AS [Referencing_type]
FROM [graph].[RepoObject_ReferencingReferenced] AS ror
GROUP BY ror.[Referencing_guid]
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '631254dc-0593-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedList', @level2type = N'COLUMN', @level2name = N'AntoraReferencedList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '621254dc-0593-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedList', @level2type = N'COLUMN', @level2name = N'Referencing_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '611254dc-0593-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedList', @level2type = N'COLUMN', @level2name = N'Referencing_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '601254dc-0593-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedList', @level2type = N'COLUMN', @level2name = N'Referencing_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5f1254dc-0593-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedList', @level2type = N'COLUMN', @level2name = N'Referencing_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'e85bf6c2-0593-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedList';

