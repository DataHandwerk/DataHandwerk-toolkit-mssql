﻿CREATE View docs.Schema_EntityList
As
Select
    roe.RepoObject_schema_name
  , EntityList_Puml                  = String_Agg ( roe.RepoObject_Puml, Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                                           roe.RepoObject_fullname2)
  , EntityList_PumlOnlyIndex         = String_Agg ( roe.RepoObject_PumlOnlyIndex, Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                                                    roe.RepoObject_fullname2)
  , EntityList_PumlOnlyPK            = String_Agg ( roe.RepoObject_PumlOnlyPK, Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                                                 roe.RepoObject_fullname2)
  , EntityList_PumlOnlyPkOrIndex     = String_Agg ( roe.RepoObject_PumlOnlyPkOrIndex, Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                                                        roe.RepoObject_fullname2)
  , EntityList_PumlOnlyPkOrNotHidden = String_Agg (
                                                            roe.RepoObject_PumlOnlyPkOrNotHidden
                                                          , Char ( 13 ) + Char ( 10 )
                                                        ) Within Group(Order By
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

