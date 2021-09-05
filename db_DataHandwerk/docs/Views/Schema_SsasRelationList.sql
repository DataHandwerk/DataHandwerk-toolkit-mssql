
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
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0c60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Schema_SsasRelationList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1660d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Schema_SsasRelationList', @level2type = N'COLUMN', @level2name = N'SsasRelationList_PumlRelation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1560d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Schema_SsasRelationList', @level2type = N'COLUMN', @level2name = N'SchemaName';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [docs].[ssas_PumlRelation]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Schema_SsasRelationList';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Schema_SsasRelationList';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Schema_SsasRelationList';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.Schema_puml.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Schema_SsasRelationList';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:docs.ssas_PumlRelation.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Schema_SsasRelationList';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[ssas_PumlRelation].[SchemaName]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Schema_SsasRelationList', @level2type = N'COLUMN', @level2name = N'SchemaName';

