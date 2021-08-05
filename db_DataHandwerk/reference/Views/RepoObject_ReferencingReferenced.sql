

/*
per referencing RepoObject all directly referenced RepoOobject are listed

can be used in both directions:

* get all referenced per referencing
* get all referencing per referenced

////
old logic:

uses graph tables

* [graph].[RepoObject]
* [graph].[ReferencedObject]

----
Select
    Object1.RepoObject_fullname  As Referencing_fullname
  , Object1.RepoObject_fullname2 As Referencing_fullname2
  , Object1.RepoObject_guid      As Referencing_guid
  , Object1.RepoObject_type      As Referencing_type
  , Object2.RepoObject_fullname  As Referenced_fullname
  , Object2.RepoObject_fullname2 As Referenced_fullname2
  , Object2.RepoObject_guid      As Referenced_guid
  , Object2.RepoObject_type      As Referenced_type
From
    graph.RepoObject As Object1
  , graph.ReferencedObject As referenced
  , graph.RepoObject As Object2
Where Match(
    Object1-(referenced)->Object2);
----
////

*/
CREATE View [reference].[RepoObject_ReferencingReferenced]
As
Select
    Referencing_fullname
  , Referencing_fullname2
  , Referencing_guid     = referencing_RepoObject_guid
  , Referencing_type
  , Referenced_fullname
  , Referenced_fullname2
  , Referenced_guid      = referenced_RepoObject_guid
  , Referenced_type
From
    [reference].[RepoObject_reference_T]
Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '714679b8-147c-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencingReferenced'
  , @level2type = N'COLUMN'
  , @level2name = N'Referenced_type';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '704679b8-147c-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencingReferenced'
  , @level2type = N'COLUMN'
  , @level2name = N'Referenced_guid';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6f4679b8-147c-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencingReferenced'
  , @level2type = N'COLUMN'
  , @level2name = N'Referenced_fullname';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6e4679b8-147c-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencingReferenced'
  , @level2type = N'COLUMN'
  , @level2name = N'Referencing_type';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6d4679b8-147c-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencingReferenced'
  , @level2type = N'COLUMN'
  , @level2name = N'Referencing_guid';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6c4679b8-147c-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencingReferenced'
  , @level2type = N'COLUMN'
  , @level2name = N'Referencing_fullname';


Go
Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '414679b8-147c-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencingReferenced';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8371b9ec-0892-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencingReferenced'
  , @level2type = N'COLUMN'
  , @level2name = N'Referencing_fullname2';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8471b9ec-0892-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencingReferenced'
  , @level2type = N'COLUMN'
  , @level2name = N'Referenced_fullname2';

