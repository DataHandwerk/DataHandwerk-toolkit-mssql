
CREATE Function [docs].[fs_cleanStringForLabel]
(
    @source_string NVarchar(4000)
)
Returns NVarchar(4000)
As
Begin
    Return Lower ( 
    Replace ( Replace ( Replace ( @source_string
    , '__', '++__++' )
    , '\', '{backslash}' )
    , ':', 'colon' )
    )
End;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '677159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'FUNCTION', @level1name = N'fs_cleanStringForLabel';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.AntoraIndexSemanticgroupPatterndatatype.adoc[]
* xref:docs.RepoObject_ColumnList.adoc[]
* xref:docs.RepoObject_IndexList.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'FUNCTION', @level1name = N'fs_cleanStringForLabel';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'FUNCTION', @level1name = N'fs_cleanStringForLabel';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'FUNCTION', @level1name = N'fs_cleanStringForLabel';

