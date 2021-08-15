
/*
reference.RepoObject_ReferenceTree_cyclic_ref_primary are uses as source to find related persistence procedures
*/
CREATE View [reference].[ReferenceTree_cyclic_ref_PersistenceUsp]
As
Select
    Distinct
    T1.referenced_RepoObject_guid  As Referencing_guid
  , T1.referencing_RepoObject_guid As Referenced_guid
  , T1.referenced_fullname
  , T1.referenced_fullname2
  , T1.referenced_type
  , T1.referencing_fullname
  , T1.referencing_fullname2
  , T1.referencing_type
From
    reference.RepoObject_reference_T                          As T1
    Inner Join
        reference.ReferenceTree_cyclic_ref_primary As T2
            On
            T1.referenced_RepoObject_guid = T2.Referencing_guid
Where
    ( T1.referencing_is_PersistenceUspTargetRef = 1 )
    And ( T1.referenced_is_PersistenceTarget    = 1 );
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '82e72f09-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'ReferenceTree_cyclic_ref_PersistenceUsp';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ba6d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'ReferenceTree_cyclic_ref_PersistenceUsp', @level2type = N'COLUMN', @level2name = N'referencing_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b36d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'ReferenceTree_cyclic_ref_PersistenceUsp', @level2type = N'COLUMN', @level2name = N'Referencing_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b96d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'ReferenceTree_cyclic_ref_PersistenceUsp', @level2type = N'COLUMN', @level2name = N'referencing_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b86d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'ReferenceTree_cyclic_ref_PersistenceUsp', @level2type = N'COLUMN', @level2name = N'referencing_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b76d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'ReferenceTree_cyclic_ref_PersistenceUsp', @level2type = N'COLUMN', @level2name = N'referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b46d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'ReferenceTree_cyclic_ref_PersistenceUsp', @level2type = N'COLUMN', @level2name = N'Referenced_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b66d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'ReferenceTree_cyclic_ref_PersistenceUsp', @level2type = N'COLUMN', @level2name = N'referenced_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b56d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'ReferenceTree_cyclic_ref_PersistenceUsp', @level2type = N'COLUMN', @level2name = N'referenced_fullname';

