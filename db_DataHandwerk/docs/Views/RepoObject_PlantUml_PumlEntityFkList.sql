Create View docs.RepoObject_PlantUml_PumlEntityFkList
As
Select
    ro.RepoObject_guid
  , Max ( RepoObject_fullname2 ) As RepoObject_fullname2
  , PumlEntityFkList             = String_Agg ( rop.RepoObject_PumlOnlyIndex, Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                                          ro.included_RepoObject_fullname2)
From
    repo.RepoObject_related_FK_union      ro
    Inner Join
        docs.RepoObject_Plantuml_Entity_T rop
            On
            rop.RepoObject_guid = ro.included_RepoObject_guid
Group By
    ro.RepoObject_guid;
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
