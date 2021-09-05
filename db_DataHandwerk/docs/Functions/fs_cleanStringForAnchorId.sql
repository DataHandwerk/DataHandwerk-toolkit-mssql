
/*
allowed characters in ID see the link from here
https://docs.asciidoctor.org/asciidoc/latest/sections/ids/#how-a-section-id-is-assembled
to here
https://www.w3.org/TR/REC-xml/#NT-Name

'_' and '-' could be used. but they work fine only if the are solo, but not as double '__' or '--'
`[#abc_d-e]` works fine, the right way
`[id=abc_d-e]` works fine, the right way, maybe it could also support blanks?
`[[abc_d-e]]` works fine, but deprecated
`[id:abc_d-e]` doesn't support '-', maybe it not the right syntqax at all

there could be additinal issues with äüö and so on, if this happens, we will need to add replacements here
*/
CREATE Function [docs].[fs_cleanStringForAnchorId]
(
    @source_string NVarchar(4000)
)
Returns NVarchar(4000)
As
Begin
    Return Replace ( Replace ( Replace ( Replace ( @source_string, '--', '-' ), '--', '-' ), ' ', '_' ), '__', '_' );
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


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'FUNCTION', @level1name = N'fs_cleanStringForAnchorId';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'FUNCTION', @level1name = N'fs_cleanStringForAnchorId';

