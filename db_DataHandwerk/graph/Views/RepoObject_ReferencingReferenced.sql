
/*
per referencing RepoObject all directly referenced RepoOobject are listed

can be used in both directions:

* get all referenced per referencing
* get all referencing per referenced


uses graph tables

* [graph].[RepoObject]
* [graph].[ReferencedObject]

*/
CREATE VIEW [graph].[RepoObject_ReferencingReferenced]
AS
SELECT Object1.[RepoObject_fullname] AS Referencing_fullname
 , Object1.[RepoObject_fullname2] AS Referencing_fullname2
 , Object1.[RepoObject_guid] AS Referencing_guid
 , Object1.[RepoObject_type] AS Referencing_type
 , Object2.[RepoObject_fullname] AS Referenced_fullname
 , Object2.[RepoObject_fullname2] AS Referenced_fullname2
 , Object2.[RepoObject_guid] AS Referenced_guid
 , Object2.[RepoObject_type] AS Referenced_type
FROM [graph].[RepoObject] AS Object1
 , [graph].[ReferencedObject] AS referenced
 , [graph].[RepoObject] AS Object2
WHERE MATCH(Object1 - (referenced) - > Object2)
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '714679b8-147c-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencingReferenced', @level2type = N'COLUMN', @level2name = N'Referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '704679b8-147c-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencingReferenced', @level2type = N'COLUMN', @level2name = N'Referenced_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6f4679b8-147c-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencingReferenced', @level2type = N'COLUMN', @level2name = N'Referenced_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6e4679b8-147c-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencingReferenced', @level2type = N'COLUMN', @level2name = N'Referencing_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6d4679b8-147c-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencingReferenced', @level2type = N'COLUMN', @level2name = N'Referencing_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6c4679b8-147c-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencingReferenced', @level2type = N'COLUMN', @level2name = N'Referencing_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '414679b8-147c-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencingReferenced';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8371b9ec-0892-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencingReferenced', @level2type = N'COLUMN', @level2name = N'Referencing_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8471b9ec-0892-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencingReferenced', @level2type = N'COLUMN', @level2name = N'Referenced_fullname2';

