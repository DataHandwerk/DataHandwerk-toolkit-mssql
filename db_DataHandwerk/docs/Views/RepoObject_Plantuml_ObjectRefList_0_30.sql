
CREATE View docs.RepoObject_Plantuml_ObjectRefList_0_30
As
Select
    ro.RepoObject_guid
  --, ro.RepoObject_fullname2
  , ObjectRefList = String_Agg (
                                   Concat (
                                              Cast(N'' As NVarchar(Max))
                                            , objectref.referenced_puml_entity
                                            , ' <.. '
                                            , objectref.referencing_puml_entity
                                          )
                                 , Char ( 13 ) + Char ( 10 )
                               ) Within Group(Order By
                                                  objectref.referenced_puml_entity)
From
--select all objects pairs that have any reference relation inside the reference path with ro.RepoObject_guid (in the desired direction)
(
    Select
        RepoObject_guid
      --,[RepoObject_fullname2]
      , Referencing_guid
      , Referenced_guid
    From
        reference.RepoObject_ReferenceTree
    Where
        Referenced_Depth      = 0
        And Referencing_Depth <= 30
)     As ro
    Inner Join
    --only direct relations between pre-selected objects
    --maybe not required
    (
        --Select
        --    Object1.RepoObject_fullname2 As Referencing_ro_fullname2
        --  , Object1.RepoObject_guid      As Referencing_ro_guid
        --  , Object2.RepoObject_fullname2 As Referenced_ro_fullname2
        --  , Object2.RepoObject_guid      As Referenced_ro_guid
        --From
        --    graph.RepoObject As Object1
        --  , graph.ReferencedObject As referenced
        --  , graph.RepoObject As Object2
        --Where Match(
        --    Object1-(referenced)->Object2)
        Select
            Referenced_ro_guid     = referenced_RepoObject_guid
          , referenced_puml_entity
          , Referencing_ro_guid    = referencing_RepoObject_guid
          , referencing_puml_entity
        From
            reference.RepoObject_reference_T
    ) As objectref
        On
        objectref.Referencing_ro_guid    = ro.Referencing_guid
        And objectref.Referenced_ro_guid = ro.Referenced_guid
Group By
    ro.RepoObject_guid
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e626ab1d-619d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ObjectRefList_0_30', @level2type = N'COLUMN', @level2name = N'ObjectRefList';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e426ab1d-619d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ObjectRefList_0_30', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b1c70217-619d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ObjectRefList_0_30';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [docs].[fs_cleanStringForPuml]
* [reference].[RepoObject_reference_T]
* [reference].[RepoObject_ReferenceTree]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ObjectRefList_0_30';




GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ObjectRefList_0_30';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ObjectRefList_0_30';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ObjectRefList_0_30';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = '62c29e81-109e-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ObjectRefList_0_30';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.RepoObject_Plantuml.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ObjectRefList_0_30';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:docs.fs_cleanStringForPuml.adoc[]
* xref:reference.RepoObject_reference_T.adoc[]
* xref:reference.RepoObject_ReferenceTree.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ObjectRefList_0_30';






GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ObjectRefList_0_30';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ObjectRefList_0_30';

