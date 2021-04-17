Create View [reference].RepoObject_ReferencingReferenced_u_v
As
Select
    Object1.RepoObject_fullname As Referencing_fullname
  , Object1.RepoObject_guid     As Referencing_guid
  , Object1.RepoObject_type     As Referencing_type
  , Object2.RepoObject_fullname As Referenced_fullname
  , Object2.RepoObject_guid     As Referenced_guid
  , Object2.RepoObject_type     As Referenced_type
From
    graph.RepoObject As Object1
  , graph.ReferencedObject As referenced
  , graph.RepoObject As Object2
Where Match(
    Object1-(referenced)->Object2)
    And Object1.RepoObject_type In
        ( 'u', 'v' )
    And Object2.RepoObject_type In
        ( 'u', 'v' );
Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '18df2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencingReferenced_u_v'
  , @level2type = N'COLUMN'
  , @level2name = N'Referenced_type';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '17df2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencingReferenced_u_v'
  , @level2type = N'COLUMN'
  , @level2name = N'Referenced_guid';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '16df2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencingReferenced_u_v'
  , @level2type = N'COLUMN'
  , @level2name = N'Referenced_fullname';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '15df2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencingReferenced_u_v'
  , @level2type = N'COLUMN'
  , @level2name = N'Referencing_type';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '14df2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencingReferenced_u_v'
  , @level2type = N'COLUMN'
  , @level2name = N'Referencing_guid';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '13df2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencingReferenced_u_v'
  , @level2type = N'COLUMN'
  , @level2name = N'Referencing_fullname';


Go
Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '07df2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencingReferenced_u_v';

