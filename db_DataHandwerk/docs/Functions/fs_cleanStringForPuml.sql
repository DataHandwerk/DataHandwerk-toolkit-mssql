
CREATE Function docs.fs_cleanStringForPuml
(
    @source_string NVarchar(4000)
)
Returns NVarchar(4000)
As
Begin
    Return ( Replace ( @source_string, ' ', '_' ))
End
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '41bbcce5-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'FUNCTION', @level1name = N'fs_cleanStringForPuml';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'FUNCTION', @level1name = N'fs_cleanStringForPuml';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'FUNCTION', @level1name = N'fs_cleanStringForPuml';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.ObjectRefCyclic_ObjectRefList.adoc[]
* xref:docs.RepoObject_ColumnList.adoc[]
* xref:docs.RepoObject_IndexList.adoc[]
* xref:docs.RepoObject_Plantuml_ColRefList_1_1.adoc[]
* xref:docs.RepoObject_Plantuml_Entity.adoc[]
* xref:docs.RepoObject_PlantUml_FkRefList.adoc[]
* xref:docs.RepoObject_Plantuml_ObjectRefList_0_30.adoc[]
* xref:docs.RepoObject_Plantuml_ObjectRefList_1_1.adoc[]
* xref:docs.RepoObject_Plantuml_ObjectRefList_30_0.adoc[]
* xref:docs.Schema_PlantUml_FkRefList.adoc[]
* xref:docs.ssas_PumlRelation.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'FUNCTION', @level1name = N'fs_cleanStringForPuml';

