


CREATE View reference.RepoObject_ReferenceTree_0_30
As
Select
    tree.RepoObject_guid
  , tree.Referencing_guid
  , tree.Referenced_guid
  , Referencing_Depth     = Min ( tree.Referencing_Depth )
  , Referencing_fullname  = Max ( tree.Referencing_fullname )
  , Referencing_fullname2 = Max ( tree.Referencing_fullname2 )
  , Referencing_type      = Max ( tree.Referencing_type )
  , Referenced_Depth      = Min ( tree.Referenced_Depth )
  , Referenced_fullname   = Max ( tree.Referenced_fullname )
  , Referenced_fullname2  = Max ( tree.Referenced_fullname2 )
  , Referenced_type       = Max ( tree.Referenced_type )
From
    repo.RepoObject_gross                                                            As ro
    Cross Apply reference.ftv_RepoObject_ReferenceTree ( ro.RepoObject_guid, 0, 30 ) As tree
Where
    ro.is_in_reference = 1
Group By
    tree.RepoObject_guid
  , tree.Referencing_guid
  , tree.Referenced_guid
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '73244e70-fdf5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_0_30', @level2type = N'COLUMN', @level2name = N'Referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '72244e70-fdf5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_0_30', @level2type = N'COLUMN', @level2name = N'Referenced_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '71244e70-fdf5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_0_30', @level2type = N'COLUMN', @level2name = N'Referenced_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '70244e70-fdf5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_0_30', @level2type = N'COLUMN', @level2name = N'Referenced_Depth';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6f244e70-fdf5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_0_30', @level2type = N'COLUMN', @level2name = N'Referencing_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6e244e70-fdf5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_0_30', @level2type = N'COLUMN', @level2name = N'Referencing_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6d244e70-fdf5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_0_30', @level2type = N'COLUMN', @level2name = N'Referencing_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6c244e70-fdf5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_0_30', @level2type = N'COLUMN', @level2name = N'Referencing_Depth';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6b244e70-fdf5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_0_30', @level2type = N'COLUMN', @level2name = N'Referenced_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6a244e70-fdf5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_0_30', @level2type = N'COLUMN', @level2name = N'Referencing_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '69244e70-fdf5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_0_30', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'd4e2805c-fdf5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_0_30';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObject_guid,Referencing_guid,Referenced_guid', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_0_30';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier,uniqueidentifier,uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_0_30';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = 'c511eece-fef5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_0_30';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:reference.RepoObject_ReferenceTree_0_30_T.adoc[]
* xref:reference.usp_PERSIST_RepoObject_ReferenceTree_0_30_T.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_0_30';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:reference.ftv_RepoObject_ReferenceTree.adoc[]
* xref:repo.RepoObject_gross.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_0_30';

