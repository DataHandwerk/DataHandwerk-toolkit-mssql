
CREATE View docs.ObjectRefCyclic_ObjectRefList
As
Select
    PumlObjectRefList =
    --
    String_Agg (
                   Concat (
                              Cast(N'' As NVarchar(Max))
                            , docs.fs_cleanStringForPuml ( objectref.Referenced_fullname2 )
                            , ' <.. '
                            , docs.fs_cleanStringForPuml ( objectref.Referencing_fullname2 )
                          )
                 , Char ( 13 ) + Char ( 10 )
               ) Within Group(Order By
                                  objectref.Referenced_fullname2)
From
    reference.ReferenceTree_cyclic_union As objectref
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '85e72f09-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ObjectRefCyclic_ObjectRefList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c66d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ObjectRefCyclic_ObjectRefList', @level2type = N'COLUMN', @level2name = N'PumlObjectRefList';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [docs].[fs_cleanStringForPuml]
* [reference].[ReferenceTree_cyclic_union]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ObjectRefCyclic_ObjectRefList';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ObjectRefCyclic_ObjectRefList';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ObjectRefCyclic_ObjectRefList';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.ObjectRefCyclic.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ObjectRefCyclic_ObjectRefList';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:docs.fs_cleanStringForPuml.adoc[]
* xref:reference.ReferenceTree_cyclic_union.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ObjectRefCyclic_ObjectRefList';

