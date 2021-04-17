
CREATE View docs.RepoObject_Plantuml_ObjectRefList
As
Select
    ro.RepoObject_guid
  , ro.RepoObject_fullname2
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
(
    Select
        ro.RepoObject_guid
      , ro.RepoObject_fullname2
      , T1.Node_guid As Node_guid_1
      , T2.Node_guid As Node_guid_2
    From
        repo.RepoObject                                                                    As ro
        Cross Apply [reference].ftv_RepoObject_ReferencedReferencing ( ro.RepoObject_guid, 1, 1 ) As T1
        Cross Apply [reference].ftv_RepoObject_ReferencedReferencing ( ro.RepoObject_guid, 1, 1 ) As T2
)     ro
    Inner Join
    (
        Select
            Object1.RepoObject_fullname2 As Referencing_ro_fullname2
          , Object1.RepoObject_guid      As Referencing_ro_guid
          , Object2.RepoObject_fullname2 As Referenced_ro_fullname2
          , Object2.RepoObject_guid      As Referenced_ro_guid
        From
            graph.RepoObject As Object1
          , graph.ReferencedObject As referenced
          , graph.RepoObject As Object2
        Where Match(
            Object1-(referenced)->Object2)
    ) objectref
        On
        objectref.Referencing_ro_guid    = ro.Node_guid_1
        And objectref.Referenced_ro_guid = ro.Node_guid_2
Group By
    ro.RepoObject_guid
  , ro.RepoObject_fullname2;
--ORDER BY ro.RepoObject_fullname2
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fe0b29c2-e595-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Plantuml_ObjectRefList'
  , @level2type = N'COLUMN'
  , @level2name = N'ObjectRefList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fd0b29c2-e595-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Plantuml_ObjectRefList'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fc0b29c2-e595-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Plantuml_ObjectRefList'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'f30b29c2-e595-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Plantuml_ObjectRefList';
