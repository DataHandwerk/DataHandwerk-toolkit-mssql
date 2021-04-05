




CREATE VIEW [repo].[RepoObjectColumn_ReferencingList]
AS
SELECT ror.[Referenced_guid]
 , AntoraReferencingColumnList = String_Agg(CONCAT (
   --* xref:target-page-filename.adoc[link text]
   --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
   CAST('* xref:' AS NVARCHAR(MAX))
   , ror.[Referencing_fullname2]
   , '.adoc#column-' + ror.[ReferencingColumn_name] + '[' + ror.[ReferencingColumn_fullname2]+']'
   ), CHAR(13) + CHAR(10)) WITHIN
GROUP (
  ORDER BY ror.[Referencing_fullname]
  )
 , MAX(ror.[Referenced_fullname]) AS [Referenced_fullname]
 , MAX(ror.[Referenced_fullname2]) AS [Referenced_fullname2]
 , MAX(ror.[ReferencedColumn_fullname]) AS [ReferencedColumn_fullname]
 , MAX(ror.[ReferencedColumn_fullname2]) AS [ReferencedColumn_fullname2]
 , MAX(ror.[Referenced_type]) AS [Referenced_type]
FROM [graph].[RepoObjectColumn_ReferencingReferenced] AS ror
GROUP BY ror.[Referenced_guid]
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ce35b4cd-e093-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencingList', @level2type = N'COLUMN', @level2name = N'Referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cd35b4cd-e093-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencingList', @level2type = N'COLUMN', @level2name = N'ReferencedColumn_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cc35b4cd-e093-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencingList', @level2type = N'COLUMN', @level2name = N'ReferencedColumn_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cb35b4cd-e093-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencingList', @level2type = N'COLUMN', @level2name = N'Referenced_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ca35b4cd-e093-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencingList', @level2type = N'COLUMN', @level2name = N'Referenced_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c935b4cd-e093-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencingList', @level2type = N'COLUMN', @level2name = N'AntoraReferencingColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c835b4cd-e093-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencingList', @level2type = N'COLUMN', @level2name = N'Referenced_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b735b4cd-e093-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencingList';

