CREATE View docs.Schema_EntityList
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