


CREATE VIEW [docs].[RepoObject_Plantuml_ObjectRefList]
AS
SELECT ro.RepoObject_guid
 , ro.RepoObject_fullname2
 , ObjectRefList = String_agg(CONCAT (
   cast(N'' AS NVARCHAR(max))
   --, REPLACE(objectref.Referenced_ro_fullname2, '.', '___')
   , objectref.Referenced_ro_fullname2
   , ' <.. '
   --, REPLACE(objectref.Referencing_ro_fullname2, '.', '___')
   , objectref.Referencing_ro_fullname2
   ), CHAR(13) + CHAR(10)) WITHIN
GROUP (
  ORDER BY objectref.Referenced_ro_fullname2
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
  , Object2.[RepoObject_fullname2] AS Referenced_ro_fullname2
  , Object2.[RepoObject_guid] AS Referenced_ro_guid
 FROM [graph].[RepoObject] AS Object1
  , [graph].[ReferencedObject] AS referenced
  , [graph].[RepoObject] AS Object2
 WHERE MATCH(Object1 - (referenced) - > Object2)
 ) objectref
 ON objectref.Referencing_ro_guid = ro.Node_guid_1
  AND objectref.Referenced_ro_guid = ro.Node_guid_2
GROUP BY ro.RepoObject_guid
 , ro.RepoObject_fullname2
 --ORDER BY ro.RepoObject_fullname2
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fe0b29c2-e595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ObjectRefList', @level2type = N'COLUMN', @level2name = N'ObjectRefList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fd0b29c2-e595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ObjectRefList', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fc0b29c2-e595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ObjectRefList', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f30b29c2-e595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ObjectRefList';

