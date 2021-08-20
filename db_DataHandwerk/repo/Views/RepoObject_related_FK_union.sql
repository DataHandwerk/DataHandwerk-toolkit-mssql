

/*
<<property_start>>MS_Description
included_RepoObject:
* all RepoObject with potential FK (u - user table, v - view) +
Relation to themself to ensure, all RO are included into docs
* relation PK <- FK
* relation FK -> PK
*/
CREATE View repo.RepoObject_related_FK_union
As
Select
    ro.RepoObject_guid
  , ro.RepoObject_fullname2
  , included_RepoObject_guid      = ro.RepoObject_guid
  , included_RepoObject_fullname2 = ro.RepoObject_fullname2
From
    repo.RepoObject As ro
Where
    ro.RepoObject_type In
    ( 'u', 'v' )
Union
Select
    referenced_RepoObject_guid
  , referenced_RepoObject_fullname2
  , referencing_RepoObject_guid
  , referencing_RepoObject_fullname2
From
    repo.ForeignKey_Indexes_union_T
Union
Select
    referencing_RepoObject_guid
  , referencing_RepoObject_fullname2
  , referenced_RepoObject_guid
  , referenced_RepoObject_fullname2
From
    repo.ForeignKey_Indexes_union_T
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '22224606-439a-eb11-84f5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_related_FK_union'
  , @level2type = N'COLUMN'
  , @level2name = N'included_RepoObject_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '21224606-439a-eb11-84f5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_related_FK_union'
  , @level2type = N'COLUMN'
  , @level2name = N'included_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '20224606-439a-eb11-84f5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_related_FK_union'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1f224606-439a-eb11-84f5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_related_FK_union'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '1c224606-439a-eb11-84f5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_related_FK_union';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[ForeignKey_Indexes_union_T]
* [repo].[RepoObject]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_related_FK_union';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObject_guid,included_RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_related_FK_union';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier,uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_related_FK_union';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = '4f5b156f-129e-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_related_FK_union';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.RepoObject_PlantUml_FkRefList.adoc[]
* xref:docs.RepoObject_PlantUml_PumlEntityFkList.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_related_FK_union';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.ForeignKey_Indexes_union_T.adoc[]
* xref:repo.RepoObject.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_related_FK_union';

