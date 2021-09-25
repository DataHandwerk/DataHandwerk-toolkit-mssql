﻿
CREATE View docs.Schema_EntityList
As
Select
    roe.RepoObject_schema_name
  , EntityList_Puml                       = String_Agg ( roe.RepoObject_Puml, Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                                          roe.RepoObject_fullname2)
  , EntityList_PumlOnlyIndex              = String_Agg ( roe.RepoObject_PumlOnlyIndex, Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                                                   roe.RepoObject_fullname2)
  , EntityList_PumlOnlyPK                 = String_Agg ( roe.RepoObject_PumlOnlyPK, Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                                                roe.RepoObject_fullname2)
  , EntityList_PumlOnlyPkOrIndex          = String_Agg ( roe.RepoObject_PumlOnlyPkOrIndex, Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                                                       roe.RepoObject_fullname2)
  , EntityList_PumlOnlyPkOrIndexOrMeasure = String_Agg (
                                                           roe.RepoObject_PumlOnlyPkOrIndexOrMeasure
                                                         , Char ( 13 ) + Char ( 10 )
                                                       ) Within Group(Order By
                                                                          roe.RepoObject_fullname2)
  , EntityList_PumlOnlyPkOrNotHidden      = String_Agg ( roe.RepoObject_PumlOnlyPkOrNotHidden, Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                                                           roe.RepoObject_fullname2)
From
    docs.RepoObject_Plantuml_Entity_T As roe
Group By
    roe.RepoObject_schema_name
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0960d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Schema_EntityList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0f60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Schema_EntityList', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1460d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Schema_EntityList', @level2type = N'COLUMN', @level2name = N'EntityList_PumlOnlyPkOrNotHidden';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1360d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Schema_EntityList', @level2type = N'COLUMN', @level2name = N'EntityList_PumlOnlyPkOrIndex';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1260d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Schema_EntityList', @level2type = N'COLUMN', @level2name = N'EntityList_PumlOnlyPK';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1160d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Schema_EntityList', @level2type = N'COLUMN', @level2name = N'EntityList_PumlOnlyIndex';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1060d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Schema_EntityList', @level2type = N'COLUMN', @level2name = N'EntityList_Puml';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [docs].[RepoObject_Plantuml_Entity_T]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Schema_EntityList';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Schema_EntityList';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Schema_EntityList';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.Schema_puml.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Schema_EntityList';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:docs.RepoObject_Plantuml_Entity_T.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Schema_EntityList';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Plantuml_Entity_T].[RepoObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Schema_EntityList', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9a83d451-5c1d-ec11-8522-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Schema_EntityList', @level2type = N'COLUMN', @level2name = N'EntityList_PumlOnlyPkOrIndexOrMeasure';

