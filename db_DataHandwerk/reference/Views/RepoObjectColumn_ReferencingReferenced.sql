﻿Create View [reference].RepoObjectColumn_ReferencingReferenced
As
Select
    --
    Object2.RepoObject_fullname        As Referenced_fullname
  , Object2.RepoObject_fullname2       As Referenced_fullname2
  , Object2.RepoObject_guid            As Referenced_RepoObject_guid
  , Object2.RepoObject_type            As Referenced_type
  , Object2.RepoObjectColumn_fullname  As ReferencedColumn_fullname
  , Object2.RepoObjectColumn_fullname2 As ReferencedColumn_fullname2
  , Object2.RepoObjectColumn_name      As ReferencedColumn_name
  , Object2.RepoObjectColumn_type      As ReferencedColumn_type
  , Object2.RepoObjectColumn_guid      As Referenced_guid
  , Object1.RepoObject_fullname        As Referencing_fullname
  , Object1.RepoObject_fullname2       As Referencing_fullname2
  , Object1.RepoObject_guid            As Referencing_RepoObject_guid
  , Object1.RepoObject_type            As Referencing_type
  , Object1.RepoObjectColumn_fullname  As ReferencingColumn_fullname
  , Object1.RepoObjectColumn_fullname2 As ReferencingColumn_fullname2
  , Object1.RepoObjectColumn_name      As ReferencingColumn_name
  , Object1.RepoObjectColumn_type      As ReferencingColumn_type
  , Object1.RepoObjectColumn_guid      As Referencing_guid
From
    graph.RepoObjectColumn As Object1
  , graph.ReferencedObjectColumn As referenced
  , graph.RepoObjectColumn As Object2
Where Match(
    Object1-(referenced)->Object2);
Go
Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '3e4679b8-147c-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_ReferencingReferenced';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4b4679b8-147c-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_ReferencingReferenced'
  , @level2type = N'COLUMN'
  , @level2name = N'ReferencingColumn_fullname';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4a4679b8-147c-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_ReferencingReferenced'
  , @level2type = N'COLUMN'
  , @level2name = N'Referencing_type';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '494679b8-147c-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_ReferencingReferenced'
  , @level2type = N'COLUMN'
  , @level2name = N'Referencing_RepoObject_guid';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4d4679b8-147c-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_ReferencingReferenced'
  , @level2type = N'COLUMN'
  , @level2name = N'Referencing_guid';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '484679b8-147c-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_ReferencingReferenced'
  , @level2type = N'COLUMN'
  , @level2name = N'Referencing_fullname';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '454679b8-147c-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_ReferencingReferenced'
  , @level2type = N'COLUMN'
  , @level2name = N'ReferencedColumn_fullname';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '444679b8-147c-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_ReferencingReferenced'
  , @level2type = N'COLUMN'
  , @level2name = N'Referenced_type';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '434679b8-147c-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_ReferencingReferenced'
  , @level2type = N'COLUMN'
  , @level2name = N'Referenced_RepoObject_guid';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '474679b8-147c-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_ReferencingReferenced'
  , @level2type = N'COLUMN'
  , @level2name = N'Referenced_guid';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '424679b8-147c-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_ReferencingReferenced'
  , @level2type = N'COLUMN'
  , @level2name = N'Referenced_fullname';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4c4679b8-147c-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_ReferencingReferenced'
  , @level2type = N'COLUMN'
  , @level2name = N'ReferencingColumn_type';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '464679b8-147c-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_ReferencingReferenced'
  , @level2type = N'COLUMN'
  , @level2name = N'ReferencedColumn_type';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '5e1254dc-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_ReferencingReferenced'
  , @level2type = N'COLUMN'
  , @level2name = N'ReferencingColumn_fullname2';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '5d1254dc-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_ReferencingReferenced'
  , @level2type = N'COLUMN'
  , @level2name = N'Referencing_fullname2';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '5c1254dc-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_ReferencingReferenced'
  , @level2type = N'COLUMN'
  , @level2name = N'ReferencedColumn_fullname2';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '5b1254dc-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_ReferencingReferenced'
  , @level2type = N'COLUMN'
  , @level2name = N'Referenced_fullname2';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'b935b4cd-e093-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_ReferencingReferenced'
  , @level2type = N'COLUMN'
  , @level2name = N'ReferencingColumn_name';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'b835b4cd-e093-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_ReferencingReferenced'
  , @level2type = N'COLUMN'
  , @level2name = N'ReferencedColumn_name';

