
CREATE View docs.RepoObject_PlantUml_FkRefList
As
Select
    ro.RepoObject_guid
  , RepoObject_fullname2 = Max ( ro.RepoObject_fullname2 )
  , FkRefList            = String_Agg (
                                          Concat (
                                                     Cast(N'' As NVarchar(Max))
                                                   , fk.referenced_RepoObject_fullname2
                                                   , '::'
                                                   , fk.referenced_index_name
                                                   , ' <-- '
                                                   , fk.referencing_RepoObject_fullname2
                                                   , '::'
                                                   , fk.referencing_index_name
                                                 )
                                        , Char ( 13 ) + Char ( 10 )
                                      ) Within Group(Order By
                                                         fk.referenced_RepoObject_fullname2
                                                       , fk.referencing_RepoObject_fullname2)
From
    repo.RepoObject_related_FK_union    As ro
    Inner Join
        repo.ForeignKey_Indexes_union_T As fk
            On
            (
                ro.included_RepoObject_guid = fk.referenced_RepoObject_guid
                And ro.RepoObject_guid      = fk.referencing_RepoObject_guid
            )
            Or
            (
                ro.included_RepoObject_guid = fk.referencing_RepoObject_guid
                And ro.RepoObject_guid      = fk.referenced_RepoObject_guid
            )
Group By
    ro.RepoObject_guid
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '28224606-439a-eb11-84f5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_PlantUml_FkRefList'
  , @level2type = N'COLUMN'
  , @level2name = N'FkRefList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '27224606-439a-eb11-84f5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_PlantUml_FkRefList'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '26224606-439a-eb11-84f5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_PlantUml_FkRefList'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '1e224606-439a-eb11-84f5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_PlantUml_FkRefList';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[ForeignKey_Indexes_union_T]
* [repo].[RepoObject_related_FK_union]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_PlantUml_FkRefList';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.RepoObject_Plantuml.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_PlantUml_FkRefList';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.ForeignKey_Indexes_union_T.adoc[]
* xref:repo.RepoObject_related_FK_union.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_PlantUml_FkRefList';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_related_FK_union].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_PlantUml_FkRefList', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';

