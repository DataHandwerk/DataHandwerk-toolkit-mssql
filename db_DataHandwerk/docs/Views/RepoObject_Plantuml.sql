

CREATE View [docs].[RepoObject_Plantuml]
As
Select
    ro.RepoObject_guid
  , ro.RepoObject_fullname2
  , elist_1_1.PumlEntityList
  , elist_0_30.PumlEntityList As PumlEntityList_0_30
  , elist_30_0.PumlEntityList As PumlEntityList_30_0
  , clist.ColRefList
  , olist_1_1.ObjectRefList
  , olist_0_30.ObjectRefList  As ObjectRefList_0_30
  , olist_30_0.ObjectRefList  As ObjectRefList_30_0
  , PlantumlEntity_1_1_ColRef
  --
                              = Concat (
                                           'left to right direction'
                                         , Char ( 13 ) + Char ( 10 )
                                         , 'hide circle'
                                         , Char ( 13 ) + Char ( 10 )
                                         , '''avoide "." issues:'
                                         , Char ( 13 ) + Char ( 10 )
                                         , 'set namespaceSeparator none'
                                         , Char ( 13 ) + Char ( 10 )
                                         , Char ( 13 ) + Char ( 10 )
                                         , skin.[Parameter_value_result]
                                         , Char ( 13 ) + Char ( 10 )
                                         , Char ( 13 ) + Char ( 10 )
                                         , elist_1_1.PumlEntityList
                                         , Char ( 13 ) + Char ( 10 )
                                         , olist_1_1.ObjectRefList
                                         , Char ( 13 ) + Char ( 10 )
                                         , clist.ColRefList
                                       )
  , PlantumlEntity_1_1_ObjectRef
  --
                              = Concat (
                                           'left to right direction'
                                         , Char ( 13 ) + Char ( 10 )
                                         , 'hide circle'
                                         , Char ( 13 ) + Char ( 10 )
                                         , '''avoide "." issues:'
                                         , Char ( 13 ) + Char ( 10 )
                                         , 'set namespaceSeparator none'
                                         , Char ( 13 ) + Char ( 10 )
                                         , Char ( 13 ) + Char ( 10 )
                                         , skin.[Parameter_value_result]
                                         , Char ( 13 ) + Char ( 10 )
                                         , Char ( 13 ) + Char ( 10 )
                                         , elist_1_1.PumlEntityOnlyPkList
                                         , Char ( 13 ) + Char ( 10 )
                                         , olist_1_1.ObjectRefList
                                       )
  , PlantumlEntity_0_30_ObjectRef
  --
                              = Concat (
                                           '''Left to right direction'
                                         , Char ( 13 ) + Char ( 10 )
                                         , 'hide circle'
                                         , Char ( 13 ) + Char ( 10 )
                                         , '''avoide "." issues:'
                                         , Char ( 13 ) + Char ( 10 )
                                         , 'set namespaceSeparator none'
                                         , Char ( 13 ) + Char ( 10 )
                                         , Char ( 13 ) + Char ( 10 )
                                         , skin.[Parameter_value_result]
                                         , Char ( 13 ) + Char ( 10 )
                                         , Char ( 13 ) + Char ( 10 )
                                         , elist_0_30.PumlEntityOnlyPkList
                                         , Char ( 13 ) + Char ( 10 )
                                         , olist_0_30.ObjectRefList
                                       )
  , PlantumlEntity_30_0_ObjectRef
  --
                              = Concat (
                                           '''Left to right direction'
                                         , Char ( 13 ) + Char ( 10 )
                                         , 'hide circle'
                                         , Char ( 13 ) + Char ( 10 )
                                         , '''avoide "." issues:'
                                         , Char ( 13 ) + Char ( 10 )
                                         , 'set namespaceSeparator none'
                                         , Char ( 13 ) + Char ( 10 )
                                         , Char ( 13 ) + Char ( 10 )
                                         , skin.[Parameter_value_result]
                                         , Char ( 13 ) + Char ( 10 )
                                         , Char ( 13 ) + Char ( 10 )
                                         , elist_30_0.PumlEntityOnlyPkList
                                         , Char ( 13 ) + Char ( 10 )
                                         , olist_30_0.ObjectRefList
                                       )
  --, PlantumlEntity_cyclic_ObjectRef
  ----
  --                            = Concat (
  --                                         'left to right direction'
  --                                       , Char ( 13 ) + Char ( 10 )
  --                                       , 'hide circle'
  --                                       , Char ( 13 ) + Char ( 10 )
  --                                       , '''avoide "." issues:'
  --                                       , Char ( 13 ) + Char ( 10 )
  --                                       , 'set namespaceSeparator none'
  --                                       , Char ( 13 ) + Char ( 10 )
  --                                       , Char ( 13 ) + Char ( 10 )
  --                                       , skin.[Parameter_value_result]
  --                                       , Char ( 13 ) + Char ( 10 )
  --                                       , Char ( 13 ) + Char ( 10 )
  --                                       , elist_cyclic.PumlEntityOnlyPkList
  --                                       , Char ( 13 ) + Char ( 10 )
  --                                       , olist_cyclic.ObjectRefList
  --                                     )
  , PlantumlEntity_1_1_FkRef
  --
                              = Concat (
                                           'Left to right direction'
                                         , Char ( 13 ) + Char ( 10 )
                                         , 'hide circle'
                                         , Char ( 13 ) + Char ( 10 )
                                         , '''avoide "." issues:'
                                         , Char ( 13 ) + Char ( 10 )
                                         , 'set namespaceSeparator none'
                                         , Char ( 13 ) + Char ( 10 )
                                         , Char ( 13 ) + Char ( 10 )
                                         , skin.[Parameter_value_result]
                                         , Char ( 13 ) + Char ( 10 )
                                         , Char ( 13 ) + Char ( 10 )
                                         , EntityFkList.PumlEntityFkList
                                         , Char ( 13 ) + Char ( 10 )
                                         , FkRefList.FkRefList
                                       )
From
    repo.RepoObject_gross                                                                         As ro
    Left Join
        docs.RepoObject_Plantuml_ColRefList_1_1                                                   As clist
            On
            clist.RepoObject_guid = ro.RepoObject_guid

    Left Join
        docs.RepoObject_Plantuml_ObjectRefList_1_1                                                As olist_1_1
            On
            olist_1_1.RepoObject_guid = ro.RepoObject_guid

    Left Join
        docs.RepoObject_Plantuml_ObjectRefList_0_30                                               As olist_0_30
            On
            olist_0_30.RepoObject_guid = ro.RepoObject_guid

    Left Join
        docs.RepoObject_Plantuml_ObjectRefList_30_0                                               As olist_30_0
            On
            olist_30_0.RepoObject_guid = ro.RepoObject_guid

    --Left Join
    --    docs.RepoObject_Plantuml_ObjectRefList_cyclic                                             As olist_cyclic
    --        On
    --        olist_1_1.RepoObject_guid = ro.RepoObject_guid
    Cross Apply docs.ftv_RepoObject_Reference_PlantUml_EntityRefList ( ro.RepoObject_guid, 1, 1 ) As elist_1_1
    Cross Apply docs.ftv_RepoObject_Reference_PlantUml_EntityRefList ( ro.RepoObject_guid, 30, 0 ) As elist_30_0
    Cross Apply docs.ftv_RepoObject_Reference_PlantUml_EntityRefList ( ro.RepoObject_guid, 0, 30 ) As elist_0_30
    --Cross Apply docs.ftv_RepoObject_Reference_PlantUml_EntityRefList ( ro.RepoObject_guid, 1, 1 ) As elist_cyclic
    Left Join
        docs.RepoObject_PlantUml_PumlEntityFkList                            As EntityFkList
            On
            EntityFkList.RepoObject_guid = ro.RepoObject_guid

    Left Join
        docs.RepoObject_PlantUml_FkRefList                                   As FkRefList
            On
            FkRefList.RepoObject_guid = ro.RepoObject_guid
    Cross Join config.ftv_get_parameter_value ( 'puml_skinparam_class', '' ) As skin;
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

GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '97cda946-459d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml', @level2type = N'COLUMN', @level2name = N'PumlEntityList_30_0';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '96cda946-459d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml', @level2type = N'COLUMN', @level2name = N'PumlEntityList_0_30';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '98cda946-459d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml', @level2type = N'COLUMN', @level2name = N'PlantumlEntity_30_0_ObjectRef';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '99cda946-459d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml', @level2type = N'COLUMN', @level2name = N'PlantumlEntity_0_30_ObjectRef';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eb26ab1d-619d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml', @level2type = N'COLUMN', @level2name = N'ObjectRefList_30_0';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ea26ab1d-619d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml', @level2type = N'COLUMN', @level2name = N'ObjectRefList_0_30';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [config].[ftv_get_parameter_value]
* [docs].[ftv_RepoObject_Reference_PlantUml_EntityRefList]
* [docs].[RepoObject_Plantuml_ColRefList]
* [docs].[RepoObject_PlantUml_FkRefList]
* [docs].[RepoObject_Plantuml_ObjectRefList]
* [docs].[RepoObject_Plantuml_ObjectRefList_0_30]
* [docs].[RepoObject_Plantuml_ObjectRefList_30_0]
* [docs].[RepoObject_PlantUml_PumlEntityFkList]
* [repo].[RepoObject_gross]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'C18818B0-CA97-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.RepoObject_Plantuml_T.adoc[]
* xref:docs.usp_PERSIST_RepoObject_Plantuml_T.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:config.ftv_get_parameter_value.adoc[]
* xref:docs.ftv_RepoObject_Reference_PlantUml_EntityRefList.adoc[]
* xref:docs.RepoObject_Plantuml_ColRefList_1_1.adoc[]
* xref:docs.RepoObject_PlantUml_FkRefList.adoc[]
* xref:docs.RepoObject_Plantuml_ObjectRefList_0_30.adoc[]
* xref:docs.RepoObject_Plantuml_ObjectRefList_1_1.adoc[]
* xref:docs.RepoObject_Plantuml_ObjectRefList_30_0.adoc[]
* xref:docs.RepoObject_PlantUml_PumlEntityFkList.adoc[]
* xref:repo.RepoObject_gross.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml';






GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[RepoObject_fullname2]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat([RepoObject_schema_name],''.'',[RepoObject_name]))', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Plantuml_ObjectRefList].[ObjectRefList]
* [docs].[RepoObject_Plantuml_ObjectRefList_0_30].[ObjectRefList]
* [docs].[RepoObject_Plantuml_ObjectRefList_30_0].[ObjectRefList]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml', @level2type = N'COLUMN', @level2name = N'ObjectRefList';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Plantuml_ColRefList].[ColRefList]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml', @level2type = N'COLUMN', @level2name = N'ColRefList';

