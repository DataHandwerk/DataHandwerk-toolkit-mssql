

--USE [dhw_self]
--GO
--/****** Object:  View [repo].[RepoObject_ReferencedList]    Script Date: 02.04.2021 19:31:28 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
CREATE VIEW [repo].[RepoObjectColumn_ReferencedList]
AS
SELECT ror.[Referencing_guid]
 , AntoraReferencedColumnList = String_Agg(CONCAT (
   --* xref:target-page-filename.adoc[link text]
   --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
   CAST('* xref:' AS NVARCHAR(MAX))
   , ror.[Referenced_fullname2]
   , '.adoc#column-' + ror.[ReferencedColumn_name] + '[' + ror.[ReferencedColumn_fullname2] + ']'
   ), CHAR(13) + CHAR(10)) WITHIN
GROUP (
  ORDER BY ror.[Referenced_fullname]
  )
 , MAX(ror.[Referencing_fullname]) AS [Referencing_fullname]
 , MAX(ror.[Referencing_fullname2]) AS [Referencing_fullname2]
 , MAX(ror.[ReferencingColumn_fullname]) AS [ReferencingColumn_fullname]
 , MAX(ror.[ReferencingColumn_fullname2]) AS [ReferencingColumn_fullname2]
 , MAX(ror.[Referencing_type]) AS [Referencing_type]
FROM [graph].[RepoObjectColumn_ReferencingReferenced] AS ror
GROUP BY ror.[Referencing_guid]
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c735b4cd-e093-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedList', @level2type = N'COLUMN', @level2name = N'Referencing_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c635b4cd-e093-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedList', @level2type = N'COLUMN', @level2name = N'ReferencingColumn_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c535b4cd-e093-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedList', @level2type = N'COLUMN', @level2name = N'ReferencingColumn_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c435b4cd-e093-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedList', @level2type = N'COLUMN', @level2name = N'Referencing_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c335b4cd-e093-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedList', @level2type = N'COLUMN', @level2name = N'Referencing_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c235b4cd-e093-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedList', @level2type = N'COLUMN', @level2name = N'AntoraReferencedColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c135b4cd-e093-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedList', @level2type = N'COLUMN', @level2name = N'Referencing_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b635b4cd-e093-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedList';

