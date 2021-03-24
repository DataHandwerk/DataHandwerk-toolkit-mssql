

CREATE   View [graph].[RepoObject_ReferencingReferenced]
As
Select
    Object1.[RepoObject_fullname] As Referencing_fullname
  , Object1.[RepoObject_guid]     As Referencing_guid
  , Object1.[RepoObject_type]     As Referencing_type
  , Object2.[RepoObject_fullname] As Referenced_fullname
  , Object2.[RepoObject_guid]     As Referenced_guid
  , Object2.[RepoObject_type]     As Referenced_type
From
    [graph].[RepoObject] As Object1
  , [graph].[ReferencedObject] As referenced
  , [graph].[RepoObject] As Object2
Where MATCH(
    Object1-(referenced)->Object2)
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

