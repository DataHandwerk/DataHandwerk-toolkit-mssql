
CREATE VIEW [graph].[RepoObjectColumn_ReferencingReferenced]
AS
SELECT
 --
 Object2.[RepoObject_fullname] AS Referenced_fullname
 , Object2.[RepoObject_fullname2] AS Referenced_fullname2
 , Object2.[RepoObject_guid] AS Referenced_RepoObject_guid
 , Object2.[RepoObject_type] AS Referenced_type
 , Object2.[RepoObjectColumn_fullname] AS ReferencedColumn_fullname
 , Object2.[RepoObjectColumn_fullname2] AS ReferencedColumn_fullname2
 , Object2.[RepoObjectColumn_type] AS ReferencedColumn_type
 , Object2.[RepoObjectColumn_guid] AS Referenced_guid
 , Object1.[RepoObject_fullname] AS Referencing_fullname
 , Object1.[RepoObject_fullname2] AS Referencing_fullname2
 , Object1.[RepoObject_guid] AS Referencing_RepoObject_guid
 , Object1.[RepoObject_type] AS Referencing_type
 , Object1.[RepoObjectColumn_fullname] AS ReferencingColumn_fullname
 , Object1.[RepoObjectColumn_fullname2] AS ReferencingColumn_fullname2
 , Object1.[RepoObjectColumn_type] AS ReferencingColumn_type
 , Object1.[RepoObjectColumn_guid] AS Referencing_guid
FROM [graph].[RepoObjectColumn] AS Object1
 , [graph].[ReferencedObjectColumn] AS referenced
 , [graph].[RepoObjectColumn] AS Object2
WHERE MATCH(Object1 - (referenced) - > Object2)
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '3e4679b8-147c-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencingReferenced';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4b4679b8-147c-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencingReferenced', @level2type = N'COLUMN', @level2name = N'ReferencingColumn_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4a4679b8-147c-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencingReferenced', @level2type = N'COLUMN', @level2name = N'Referencing_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '494679b8-147c-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencingReferenced', @level2type = N'COLUMN', @level2name = N'Referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4d4679b8-147c-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencingReferenced', @level2type = N'COLUMN', @level2name = N'Referencing_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '484679b8-147c-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencingReferenced', @level2type = N'COLUMN', @level2name = N'Referencing_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '454679b8-147c-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencingReferenced', @level2type = N'COLUMN', @level2name = N'ReferencedColumn_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '444679b8-147c-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencingReferenced', @level2type = N'COLUMN', @level2name = N'Referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '434679b8-147c-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencingReferenced', @level2type = N'COLUMN', @level2name = N'Referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '474679b8-147c-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencingReferenced', @level2type = N'COLUMN', @level2name = N'Referenced_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '424679b8-147c-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencingReferenced', @level2type = N'COLUMN', @level2name = N'Referenced_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4c4679b8-147c-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencingReferenced', @level2type = N'COLUMN', @level2name = N'ReferencingColumn_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '464679b8-147c-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencingReferenced', @level2type = N'COLUMN', @level2name = N'ReferencedColumn_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5e1254dc-0593-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencingReferenced', @level2type = N'COLUMN', @level2name = N'ReferencingColumn_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5d1254dc-0593-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencingReferenced', @level2type = N'COLUMN', @level2name = N'Referencing_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5c1254dc-0593-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencingReferenced', @level2type = N'COLUMN', @level2name = N'ReferencedColumn_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5b1254dc-0593-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencingReferenced', @level2type = N'COLUMN', @level2name = N'Referenced_fullname2';

