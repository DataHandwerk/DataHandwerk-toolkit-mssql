
CREATE View docs.Schema_SsasRelationList
As
Select
    rel.SchemaName
  , schema_2_culture.cultures_name
  , SsasRelationList_PumlRelation = String_Agg ( rel.PumlRelation, Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                               rel.referenced_RepoObject_fullname2
                                                                                                             , rel.referencing_RepoObject_fullname2)
From
    docs.ssas_PumlRelation As rel
    Left Join
    (
        Select
            Distinct
            RepoObject_schema_name
          , cultures_name
        From
            docs.RepoObject_OutputFilter_T
        Where
            is_ssas = 1
    )                      As schema_2_culture
        On
        schema_2_culture.RepoObject_schema_name = rel.SchemaName
Group By
    rel.SchemaName
  , schema_2_culture.cultures_name
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


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4b0389e1-0622-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Schema_SsasRelationList', @level2type = N'COLUMN', @level2name = N'cultures_name';

