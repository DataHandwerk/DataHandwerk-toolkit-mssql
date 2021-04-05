

CREATE VIEW [docs].[RepoObject_Plantuml_ColRefList]
AS
SELECT ro.RepoObject_guid
 , ro.RepoObject_fullname2
 , ColRefList = String_agg(CONCAT (
   cast(N'' AS NVARCHAR(max))
   --, REPLACE(colref.Referenced_ro_fullname2, '.', '___')
   , colref.Referenced_ro_fullname2
   , '::'
   , colref.Referenced_ro_ColumnName
   , ' <-- '
   --, REPLACE(colref.Referencing_ro_fullname2, '.', '___')
   , colref.Referencing_ro_fullname2
   , '::'
   , colref.Referencing_ro_ColumnName
   ), CHAR(13) + CHAR(10)) WITHIN
GROUP (
  ORDER BY colref.Referenced_ro_fullname2
   , colref.Referenced_ro_ColumnName
  )
FROM (
 SELECT ro.RepoObject_guid
  , ro.RepoObject_fullname2
  , T1.Node_guid AS Node_guid_1
  , T2.Node_guid AS Node_guid_2
 FROM repo.RepoObject AS ro
 CROSS APPLY [repo].[ftv_RepoObject_ReferencedReferencing](ro.RepoObject_guid, 1, 1) AS T1
 CROSS APPLY [repo].[ftv_RepoObject_ReferencedReferencing](ro.RepoObject_guid, 1, 1) AS T2
 ) ro
INNER JOIN (
 SELECT Object1.[RepoObject_fullname2] AS Referencing_ro_fullname2
  , Object1.[RepoObject_guid] AS Referencing_ro_guid
  , Object1.[RepoObjectColumn_name] AS Referencing_ro_ColumnName
  , Object2.[RepoObject_fullname2] AS Referenced_ro_fullname2
  , Object2.[RepoObject_guid] AS Referenced_ro_guid
  , Object2.[RepoObjectColumn_name] AS Referenced_ro_ColumnName
 FROM [graph].[RepoObjectColumn] AS Object1
  , [graph].[ReferencedObjectColumn] AS referenced
  , [graph].[RepoObjectColumn] AS Object2
 WHERE MATCH(Object1 - (referenced) - > Object2)
 ) colref
 ON colref.Referencing_ro_guid = ro.Node_guid_1
  AND colref.Referenced_ro_guid = ro.Node_guid_2
  --exclude column references inside object (calculated columns):
  AND colref.Referencing_ro_guid <> colref.Referenced_ro_guid
GROUP BY ro.RepoObject_guid
 , ro.RepoObject_fullname2
 --ORDER BY ro.RepoObject_fullname2
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f50b29c2-e595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ColRefList', @level2type = N'COLUMN', @level2name = N'ColRefList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a418814c-9295-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ColRefList', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a318814c-9295-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ColRefList', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '8e18814c-9295-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ColRefList';

