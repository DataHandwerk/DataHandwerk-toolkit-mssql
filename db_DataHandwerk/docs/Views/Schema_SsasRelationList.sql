
create View docs.Schema_SsasRelationList
As
Select
    rel.SchemaName
  , SsasRelationList_PumlRelation = String_Agg ( rel.PumlRelation, Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                               rel.referenced_RepoObject_fullname2
                                                                                                             , rel.referencing_RepoObject_fullname2)
From
    docs.ssas_PumlRelation As rel
Group By
    rel.SchemaName