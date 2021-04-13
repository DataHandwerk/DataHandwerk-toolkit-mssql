
CREATE View docs.RepoObject_Plantuml
As
Select
    ro.RepoObject_guid
  , ro.RepoObject_fullname2
  , elist.PumlEntityList
  , clist.ColRefList
  , olist.ObjectRefList
  , PlantumlEntity_1_1_ColRef    = Concat (
                                              'left to right direction'
                                            , Char ( 13 ) + Char ( 10 )
                                            , 'hide circle'
                                            , Char ( 13 ) + Char ( 10 )
                                            , '''avoide "." issues:'
                                            , Char ( 13 ) + Char ( 10 )
                                            , 'set namespaceSeparator none'
                                            , Char ( 13 ) + Char ( 10 )
                                            , Char ( 13 ) + Char ( 10 )
                                            , skin.Parameter_value__result_nvarchar
                                            , Char ( 13 ) + Char ( 10 )
                                            , Char ( 13 ) + Char ( 10 )
                                            , elist.PumlEntityList
                                            , Char ( 13 ) + Char ( 10 )
                                            , olist.ObjectRefList
                                            , Char ( 13 ) + Char ( 10 )
                                            , clist.ColRefList
                                          )
  , PlantumlEntity_1_1_ObjectRef = Concat (
                                              'left to right direction'
                                            , Char ( 13 ) + Char ( 10 )
                                            , 'hide circle'
                                            , Char ( 13 ) + Char ( 10 )
                                            , '''avoide "." issues:'
                                            , Char ( 13 ) + Char ( 10 )
                                            , 'set namespaceSeparator none'
                                            , Char ( 13 ) + Char ( 10 )
                                            , Char ( 13 ) + Char ( 10 )
                                            , skin.Parameter_value__result_nvarchar
                                            , Char ( 13 ) + Char ( 10 )
                                            , Char ( 13 ) + Char ( 10 )
                                            , elist.PumlEntityOnlyPkList
                                            , Char ( 13 ) + Char ( 10 )
                                            , olist.ObjectRefList
                                          )
  , PlantumlEntity_1_1_FkRef     = Concat (
                                              'left to right direction'
                                            , Char ( 13 ) + Char ( 10 )
                                            , 'hide circle'
                                            , Char ( 13 ) + Char ( 10 )
                                            , '''avoide "." issues:'
                                            , Char ( 13 ) + Char ( 10 )
                                            , 'set namespaceSeparator none'
                                            , Char ( 13 ) + Char ( 10 )
                                            , Char ( 13 ) + Char ( 10 )
                                            , skin.Parameter_value__result_nvarchar
                                            , Char ( 13 ) + Char ( 10 )
                                            , Char ( 13 ) + Char ( 10 )
                                            , EntityFkList.PumlEntityFkList
                                            , Char ( 13 ) + Char ( 10 )
                                            , FkRefList.FkRefList
                                          )
From
    repo.RepoObject_gross                                                                         As ro
    Left Join
        docs.RepoObject_Plantuml_ColRefList                                                       As clist
            On
            clist.RepoObject_guid = ro.RepoObject_guid

    Left Join
        docs.RepoObject_Plantuml_ObjectRefList                                                    As olist
            On
            olist.RepoObject_guid = ro.RepoObject_guid
    Cross Apply docs.ftv_RepoObject_Reference_PlantUml_EntityRefList ( ro.RepoObject_guid, 1, 1 ) As elist
    Left Join
        docs.RepoObject_PlantUml_PumlEntityFkList                          As EntityFkList
            On
            EntityFkList.RepoObject_guid = ro.RepoObject_guid

    Left Join
        docs.RepoObject_PlantUml_FkRefList                                 As FkRefList
            On
            FkRefList.RepoObject_guid = ro.RepoObject_guid
    Cross Join repo.ftv_get_parameter_value ( 'puml_skinparam_class', '' ) As skin;
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fb0b29c2-e595-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Plantuml'
  , @level2type = N'COLUMN'
  , @level2name = N'PlantumlEntity_1_1_ColRef';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fa0b29c2-e595-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Plantuml'
  , @level2type = N'COLUMN'
  , @level2name = N'ObjectRefList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f90b29c2-e595-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Plantuml'
  , @level2type = N'COLUMN'
  , @level2name = N'ColRefList';
Go

Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f70b29c2-e595-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Plantuml'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f60b29c2-e595-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Plantuml'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'f20b29c2-e595-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Plantuml';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '95c4873b-8a98-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Plantuml'
  , @level2type = N'COLUMN'
  , @level2name = N'PumlEntityList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '96c4873b-8a98-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Plantuml'
  , @level2type = N'COLUMN'
  , @level2name = N'PlantumlEntity_1_1_ObjectRef';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '97c4873b-8a98-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Plantuml'
  , @level2type = N'COLUMN'
  , @level2name = N'PlantumlEntity_1_1_FkRef';
