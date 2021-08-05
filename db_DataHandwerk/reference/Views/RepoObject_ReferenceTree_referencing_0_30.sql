
CREATE View [reference].[RepoObject_ReferenceTree_referencing_0_30]
As
Select
    ro.RepoObject_guid
  , tree.Referencing_guid
  , Max ( ro.RepoObject_fullname )     As RepoObject_fullname
  , Max ( ro.RepoObject_fullname2 )    As RepoObject_fullname2
  , Max ( tree.Referencing_fullname )  As referencing_fullname
  , Max ( tree.Referencing_fullname2 ) As referencing_fullname2
  , Min ( tree.Referencing_Depth )     As referencing_Depth
From
    repo.RepoObject_gross                                                                          As ro
    Cross Apply [reference].ftv_RepoObject_ReferenceTree_referencing ( ro.RepoObject_guid, 0, 30 ) As tree
Where
    ro.is_in_reference = 1
Group By
    ro.RepoObject_guid
  , tree.Referencing_guid;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8ded290e-ecf5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_referencing_0_30', @level2type = N'COLUMN', @level2name = N'referencing_Depth';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8ced290e-ecf5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_referencing_0_30', @level2type = N'COLUMN', @level2name = N'referencing_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8bed290e-ecf5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_referencing_0_30', @level2type = N'COLUMN', @level2name = N'referencing_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8aed290e-ecf5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_referencing_0_30', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '89ed290e-ecf5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_referencing_0_30', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '88ed290e-ecf5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_referencing_0_30', @level2type = N'COLUMN', @level2name = N'Referencing_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '87ed290e-ecf5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_referencing_0_30', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'dbc7d500-ecf5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_referencing_0_30';

