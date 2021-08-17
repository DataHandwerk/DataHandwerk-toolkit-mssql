

CREATE View docs.RepoObject_Plantuml_ObjectRefList_30_0
As
Select
    ro.RepoObject_guid
  --, ro.RepoObject_fullname2
  , ObjectRefList = String_Agg (
                                   Concat (
                                              Cast(N'' As NVarchar(Max))
                                            , objectref.Referenced_ro_fullname2
                                            , ' <.. '
                                            , objectref.Referencing_ro_fullname2
                                          )
                                 , Char ( 13 ) + Char ( 10 )
                               ) Within Group(Order By
                                                  objectref.Referenced_ro_fullname2)
From
--select all objects pairs that have any reference relation inside the reference path with ro.RepoObject_guid (in the desired direction)
(
    --Select
    --    ro.RepoObject_guid
    --  , ro.RepoObject_fullname2
    --  , T1.Node_guid As Node_guid_1
    --  , T2.Node_guid As Node_guid_2
    --From
    --    repo.RepoObject                                                                     As ro
    --    Cross Apply [reference].ftv_RepoObject_ReferencedReferencing ( ro.RepoObject_guid, 30, 0 ) As T1
    --    Cross Apply [reference].ftv_RepoObject_ReferencedReferencing ( ro.RepoObject_guid, 30, 0 ) As T2
    Select
        RepoObject_guid
      --,[RepoObject_fullname2]
      , Referencing_guid
      , Referenced_guid
    From
        reference.RepoObject_ReferenceTree_30_0_T
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
            Referencing_ro_fullname2 = referencing_fullname2
          , Referencing_ro_guid      = referencing_RepoObject_guid
          , Referenced_ro_fullname2  = referenced_fullname2
          , Referenced_ro_guid       = referenced_RepoObject_guid
        From
            reference.RepoObject_reference_T
    ) As objectref
        On
        objectref.Referencing_ro_guid    = ro.Referencing_guid
        And objectref.Referenced_ro_guid = ro.Referenced_guid
Group By
    ro.RepoObject_guid
--, ro.RepoObject_fullname2;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e926ab1d-619d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ObjectRefList_30_0', @level2type = N'COLUMN', @level2name = N'ObjectRefList';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e726ab1d-619d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ObjectRefList_30_0', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b2c70217-619d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ObjectRefList_30_0';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [graph].[ReferencedObject]
* [graph].[RepoObject]
* [reference].[ftv_RepoObject_ReferencedReferencing]
* [repo].[RepoObject]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ObjectRefList_30_0';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ObjectRefList_30_0';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ObjectRefList_30_0';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ObjectRefList_30_0';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = 'bcbab688-109e-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ObjectRefList_30_0';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.RepoObject_Plantuml.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ObjectRefList_30_0';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:reference.RepoObject_reference_T.adoc[]
* xref:reference.RepoObject_ReferenceTree_30_0_T.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ObjectRefList_30_0';



