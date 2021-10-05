
CREATE View docs.RepoObject_PlantUml_PumlEntityFkList
As
Select
    ro.RepoObject_guid
  , rop.cultures_name
  , RepoObject_fullname2 = Max ( ro.RepoObject_fullname2 )
  , PumlEntityFkList     = String_Agg ( rop.RepoObject_PumlOnlyIndex, Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                                  ro.included_RepoObject_fullname2)
From
    repo.RepoObject_related_FK_union      As ro
    Inner Join
        docs.RepoObject_Plantuml_Entity_T As rop
            On
            rop.RepoObject_guid = ro.included_RepoObject_guid
Group By
    ro.RepoObject_guid
  , rop.cultures_name
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '25224606-439a-eb11-84f5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_PlantUml_PumlEntityFkList'
  , @level2type = N'COLUMN'
  , @level2name = N'PumlEntityFkList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '24224606-439a-eb11-84f5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_PlantUml_PumlEntityFkList'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '23224606-439a-eb11-84f5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_PlantUml_PumlEntityFkList'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '1d224606-439a-eb11-84f5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_PlantUml_PumlEntityFkList';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [docs].[RepoObject_Plantuml_Entity_T]
* [repo].[RepoObject_related_FK_union]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_PlantUml_PumlEntityFkList';


GO



GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_PlantUml_PumlEntityFkList';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_PlantUml_PumlEntityFkList';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = 'cf2b2696-109e-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_PlantUml_PumlEntityFkList';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.RepoObject_Plantuml.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_PlantUml_PumlEntityFkList';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:docs.RepoObject_Plantuml_Entity_T.adoc[]
* xref:repo.RepoObject_related_FK_union.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_PlantUml_PumlEntityFkList';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_related_FK_union].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_PlantUml_PumlEntityFkList', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_PlantUml_PumlEntityFkList';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_PlantUml_PumlEntityFkList';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Plantuml_Entity_T].[RepoObject_fullname2]
* [repo].[RepoObject_related_FK_union].[RepoObject_fullname2]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_PlantUml_PumlEntityFkList', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '09d67baa-5925-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_PlantUml_PumlEntityFkList', @level2type = N'COLUMN', @level2name = N'cultures_name';

