﻿
CREATE View docs.ObjectRefCyclic_EntityList
As
Select
    rop.cultures_name
  , PumlEntityList       =
  --
  String_Agg ( Cast(rop.RepoObject_Puml As NVarchar(Max)), Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                       ro.ro_fullname2)
  , PumlEntityOnlyPkList =
  --
  String_Agg ( Cast(rop.RepoObject_PumlOnlyPK As NVarchar(Max)), Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                             ro.ro_fullname2)
  , XrefEntityList       =
  --
  String_Agg (
                 Concat (
                            --* xref:sqldb:target-page-filename.adoc[link text]
                            --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                            Cast('* xref:sqldb:' As NVarchar(Max))
                          , docs.fs_cleanStringForFilename ( ro.ro_fullname2 )
                          , '.adoc[]'
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
Group By
    rop.cultures_name
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '84e72f09-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ObjectRefCyclic_EntityList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c56d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ObjectRefCyclic_EntityList', @level2type = N'COLUMN', @level2name = N'XrefEntityList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c46d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ObjectRefCyclic_EntityList', @level2type = N'COLUMN', @level2name = N'PumlEntityOnlyPkList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c36d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ObjectRefCyclic_EntityList', @level2type = N'COLUMN', @level2name = N'PumlEntityList';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [docs].[RepoObject_Plantuml_Entity_T]
* [reference].[ReferenceTree_cyclic_union]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ObjectRefCyclic_EntityList';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ObjectRefCyclic_EntityList';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ObjectRefCyclic_EntityList';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.ObjectRefCyclic.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ObjectRefCyclic_EntityList';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:docs.RepoObject_Plantuml_Entity_T.adoc[]
* xref:reference.ReferenceTree_cyclic_union.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ObjectRefCyclic_EntityList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '01d67baa-5925-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ObjectRefCyclic_EntityList', @level2type = N'COLUMN', @level2name = N'cultures_name';

