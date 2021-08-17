



CREATE View docs.ObjectRefCyclic_EntityList
As
Select
    PumlEntityList       =
    --
    String_Agg ( rop.RepoObject_Puml, Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                  ro.ro_fullname2)
  , PumlEntityOnlyPkList =
  --
  String_Agg ( rop.RepoObject_PumlOnlyPK, Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                      ro.ro_fullname2)
  , XrefEntityList       =
  --
  String_Agg (
                 Concat (
                            --* xref:sqldb:target-page-filename.adoc[link text]
                            --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                            Cast('* xref:sqldb:' As NVarchar(Max)), ro.ro_fullname2, '.adoc[]'
                        )
               , Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                ro.ro_fullname2)
From
    docs.RepoObject_Plantuml_Entity_T As rop
    Inner Join
    (
        Select
            ro_guid      = Referenced_guid
          , ro_fullname2 = Referenced_fullname2
        From
            reference.ReferenceTree_cyclic_union
        Union
        Select
            Referencing_guid
          , Referencing_fullname2
        From
            reference.ReferenceTree_cyclic_union
    )                                 As ro
        On
        ro.ro_guid = rop.RepoObject_guid
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '84e72f09-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ObjectRefCyclic_EntityList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c56d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ObjectRefCyclic_EntityList', @level2type = N'COLUMN', @level2name = N'XrefEntityList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c46d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ObjectRefCyclic_EntityList', @level2type = N'COLUMN', @level2name = N'PumlEntityOnlyPkList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c36d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ObjectRefCyclic_EntityList', @level2type = N'COLUMN', @level2name = N'PumlEntityList';

