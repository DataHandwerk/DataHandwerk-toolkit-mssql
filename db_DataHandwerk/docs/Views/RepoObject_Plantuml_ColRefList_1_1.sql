
CREATE View docs.RepoObject_Plantuml_ColRefList_1_1
As
Select
    ro.RepoObject_guid
  , cultures_name = Cast('' As NVarchar(10))
  --, ro.RepoObject_fullname2
  , ColRefList    =
  --
  String_Agg (
                 Concat (
                            Cast(N'' As NVarchar(Max))
                          , '"'
                          , Iif(colref.referenced_is_external = 1
                              , colref.referenced_external_AntoraComponent + '.'
                                + colref.referenced_external_AntoraModule + '.'
                              , Null)
                          , docs.fs_cleanStringForPuml ( colref.Referenced_ro_fullname2 )
                          , '::'
                          , docs.fs_cleanStringForPuml ( colref.Referenced_ro_ColumnName )
                          , '"'
                          , ' <-- '
                          , '"'
                          , Iif(colref.referencing_is_external = 1
                              , colref.referencing_external_AntoraComponent + '.'
                                + colref.referencing_external_AntoraModule + '.'
                              , Null)
                          , docs.fs_cleanStringForPuml ( colref.Referencing_ro_fullname2 )
                          , '::'
                          , docs.fs_cleanStringForPuml ( colref.Referencing_ro_ColumnName )
                          , '"'
                        )
               , Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                colref.Referenced_ro_fullname2
                              , colref.Referenced_ro_ColumnName)
From
    repo.RepoObject As ro
    Inner Join
    (
        --Select
        --    Object1.RepoObject_fullname2  As Referencing_ro_fullname2
        --  , Object1.RepoObject_guid       As Referencing_ro_guid
        --  , Object1.RepoObjectColumn_name As Referencing_ro_ColumnName
        --  , Object2.RepoObject_fullname2  As Referenced_ro_fullname2
        --  , Object2.RepoObject_guid       As Referenced_ro_guid
        --  , Object2.RepoObjectColumn_name As Referenced_ro_ColumnName
        --From
        --    graph.RepoObjectColumn As Object1
        --  , graph.ReferencedObjectColumn As referenced
        --  , graph.RepoObjectColumn As Object2
        --Where Match(
        --    Object1-(referenced)->Object2)
        Select
            Referenced_ro_guid                  = referenced_RepoObject_guid
          , Referenced_ro_fullname2             = referenced_ro_fullname2
          , Referenced_ro_ColumnName            = referenced_column_name
          , referenced_external_AntoraComponent
          , referenced_external_AntoraModule
          , referenced_is_external
          , Referencing_ro_guid                 = referencing_RepoObject_guid
          , Referencing_ro_fullname2            = referencing_ro_fullname2
          , Referencing_ro_ColumnName           = referencing_column_name
          , referencing_external_AntoraComponent
          , referencing_external_AntoraModule
          , referencing_is_external
        From
            reference.RepoObjectColumn_reference_T
    )               As colref
        On
        colref.Referencing_ro_guid        = ro.RepoObject_guid
        Or colref.Referenced_ro_guid      = ro.RepoObject_guid
           --exclude column references inside object (calculated columns):
           And colref.Referencing_ro_guid <> colref.Referenced_ro_guid
Group By
    ro.RepoObject_guid
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5cc03c7f-23f6-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ColRefList_1_1', @level2type = N'COLUMN', @level2name = N'ColRefList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5bc03c7f-23f6-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ColRefList_1_1', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5ac03c7f-23f6-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ColRefList_1_1';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.RepoObject_Plantuml.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ColRefList_1_1';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:docs.fs_cleanStringForPuml.adoc[]
* xref:reference.RepoObjectColumn_reference_T.adoc[]
* xref:repo.RepoObject.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ColRefList_1_1';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [docs].[fs_cleanStringForPuml]
* [reference].[RepoObjectColumn_reference_T]
* [repo].[RepoObject]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ColRefList_1_1';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ColRefList_1_1';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ColRefList_1_1';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ColRefList_1_1', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '560389e1-0622-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ColRefList_1_1', @level2type = N'COLUMN', @level2name = N'cultures_name';

