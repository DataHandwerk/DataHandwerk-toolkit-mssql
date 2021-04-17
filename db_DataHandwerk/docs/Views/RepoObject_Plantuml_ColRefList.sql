Create View docs.RepoObject_Plantuml_ColRefList
As
Select
    ro.RepoObject_guid
  , ro.RepoObject_fullname2
  , ColRefList = String_Agg (
                                Concat (
                                           Cast(N'' As NVarchar(Max))
                                         --, REPLACE(colref.Referenced_ro_fullname2, '.', '___')
                                         , colref.Referenced_ro_fullname2
                                         , '::'
                                         , colref.Referenced_ro_ColumnName
                                         , ' <-- '
                                         --, REPLACE(colref.Referencing_ro_fullname2, '.', '___')
                                         , colref.Referencing_ro_fullname2
                                         , '::'
                                         , colref.Referencing_ro_ColumnName
                                       )
                              , Char ( 13 ) + Char ( 10 )
                            ) Within Group(Order By
                                               colref.Referenced_ro_fullname2
                                             , colref.Referenced_ro_ColumnName)
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
            Object1.RepoObject_fullname2  As Referencing_ro_fullname2
          , Object1.RepoObject_guid       As Referencing_ro_guid
          , Object1.RepoObjectColumn_name As Referencing_ro_ColumnName
          , Object2.RepoObject_fullname2  As Referenced_ro_fullname2
          , Object2.RepoObject_guid       As Referenced_ro_guid
          , Object2.RepoObjectColumn_name As Referenced_ro_ColumnName
        From
            graph.RepoObjectColumn As Object1
          , graph.ReferencedObjectColumn As referenced
          , graph.RepoObjectColumn As Object2
        Where Match(
            Object1-(referenced)->Object2)
    ) colref
        On
        colref.Referencing_ro_guid     = ro.Node_guid_1
        And colref.Referenced_ro_guid  = ro.Node_guid_2
        --exclude column references inside object (calculated columns):
        And colref.Referencing_ro_guid <> colref.Referenced_ro_guid
Group By
    ro.RepoObject_guid
  , ro.RepoObject_fullname2;
--ORDER BY ro.RepoObject_fullname2
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f50b29c2-e595-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Plantuml_ColRefList'
  , @level2type = N'COLUMN'
  , @level2name = N'ColRefList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a418814c-9295-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Plantuml_ColRefList'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a318814c-9295-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Plantuml_ColRefList'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '8e18814c-9295-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Plantuml_ColRefList';
