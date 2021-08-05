
Create Function [docs].[fs_cleanStringForAnchorId]
(
    @source_string NVarchar(4000)
)
Returns NVarchar(4000)
As
Begin
    Return Replace ( @source_string, '__', '_' );
End;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '667159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'FUNCTION', @level1name = N'fs_cleanStringForAnchorId';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.AntoraIndexSemanticgroupPatterndatatype.adoc[]
* xref:docs.RepoObject_ColumnList.adoc[]
* xref:docs.RepoObject_IndexList.adoc[]
* xref:reference.RepoObjectColumn_ReferencedList.adoc[]
* xref:reference.RepoObjectColumn_ReferencingList.adoc[]
* xref:repo.ForeignKey_gross.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'FUNCTION', @level1name = N'fs_cleanStringForAnchorId';

