﻿
--bad performance
CREATE View [reference].[RepoObject_ReferenceTree_referenced]
As
Select
    tree.*
From
    repo.RepoObject_gross                                                                     As ro
    Cross Apply [reference].ftv_RepoObject_ReferenceTree_referenced ( ro.RepoObject_guid, 100, 100 ) As tree
Where
    ro.is_in_reference = 1;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8acda946-459d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_referenced', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '89cda946-459d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_referenced', @level2type = N'COLUMN', @level2name = N'Referencing_Depth';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '88cda946-459d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_referenced', @level2type = N'COLUMN', @level2name = N'Referenced_Depth';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '87cda946-459d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_referenced', @level2type = N'COLUMN', @level2name = N'Referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '86cda946-459d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_referenced', @level2type = N'COLUMN', @level2name = N'Referenced_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '85cda946-459d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_referenced', @level2type = N'COLUMN', @level2name = N'Referenced_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '84cda946-459d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_referenced', @level2type = N'COLUMN', @level2name = N'Referenced_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '83cda946-459d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_referenced', @level2type = N'COLUMN', @level2name = N'Referencing_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '82cda946-459d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_referenced', @level2type = N'COLUMN', @level2name = N'Referencing_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '81cda946-459d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_referenced', @level2type = N'COLUMN', @level2name = N'Referencing_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '80cda946-459d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_referenced', @level2type = N'COLUMN', @level2name = N'Referencing_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '65cda946-459d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferenceTree_referenced';

