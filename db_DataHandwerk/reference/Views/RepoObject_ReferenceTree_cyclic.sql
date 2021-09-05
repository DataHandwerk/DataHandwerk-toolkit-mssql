
/*
cyclic references:

the same RepoObject_guid has the same references backward and forward: in _30_0 and in _0_30 +
this causes errors in PUML diagrams and in workflow generator

goals of this view:

* vizualisation in diagrams
* solving the issues in PUML reference diagrams and workflow generator
*/

CREATE View reference.RepoObject_ReferenceTree_cyclic
As
Select
    T1.RepoObject_guid
  , T1.Referenced_guid
  , Referenced_Depth_0_30  = T2.Referenced_Depth
  , Referenced_Depth_30_0  = T1.Referenced_Depth
  , T1.referenced_fullname
  , T1.referenced_fullname2
  , T1.referenced_type
  , T1.Referencing_guid
  , Referencing_Depth_0_30 = T2.Referencing_Depth
  , Referencing_Depth_30_0 = T1.Referencing_Depth
  , T1.referencing_fullname
  , T1.referencing_fullname2
  , T1.referencing_type
From
    reference.RepoObject_ReferenceTree     As T1
    Inner Join
        reference.RepoObject_ReferenceTree As T2
            On
            T1.RepoObject_guid       = T2.RepoObject_guid
            And T1.Referencing_guid  = T2.Referencing_guid
            And T1.Referenced_guid   = T2.Referenced_guid
            And T1.Referencing_Depth = 0
            And T2.Referenced_Depth  = 0
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7de72f09-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_cyclic';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '926d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_cyclic', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9c6d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_cyclic', @level2type = N'COLUMN', @level2name = N'Referencing_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '936d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_cyclic', @level2type = N'COLUMN', @level2name = N'Referencing_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9b6d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_cyclic', @level2type = N'COLUMN', @level2name = N'Referencing_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9a6d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_cyclic', @level2type = N'COLUMN', @level2name = N'Referencing_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '996d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_cyclic', @level2type = N'COLUMN', @level2name = N'Referencing_Depth_30_0';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9e6d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_cyclic', @level2type = N'COLUMN', @level2name = N'Referencing_Depth_0_30';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '986d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_cyclic', @level2type = N'COLUMN', @level2name = N'Referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '946d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_cyclic', @level2type = N'COLUMN', @level2name = N'Referenced_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '976d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_cyclic', @level2type = N'COLUMN', @level2name = N'Referenced_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '966d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_cyclic', @level2type = N'COLUMN', @level2name = N'Referenced_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '956d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_cyclic', @level2type = N'COLUMN', @level2name = N'Referenced_Depth_30_0';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9d6d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_cyclic', @level2type = N'COLUMN', @level2name = N'Referenced_Depth_0_30';

