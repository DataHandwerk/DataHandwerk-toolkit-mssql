
CREATE View [docs].[RepoObject_Plantuml_ObjectRefList_1_1]
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
    repo.RepoObject As ro
    Inner Join
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
            [referencing_fullname2]       As Referencing_ro_fullname2
          , [referencing_RepoObject_guid] As Referencing_ro_guid
          , [referenced_fullname2]        As Referenced_ro_fullname2
          , [referenced_RepoObject_guid]  As Referenced_ro_guid
        From
            [reference].[RepoObject_reference_T]
    )               objectref
        On
        objectref.Referencing_ro_guid   = ro.RepoObject_guid
        Or objectref.Referenced_ro_guid = ro.RepoObject_guid
Group By
    ro.RepoObject_guid;
--, ro.RepoObject_fullname2;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9707068d-19f6-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ObjectRefList_1_1', @level2type = N'COLUMN', @level2name = N'ObjectRefList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9607068d-19f6-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ObjectRefList_1_1', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7f07068d-19f6-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_ObjectRefList_1_1';

