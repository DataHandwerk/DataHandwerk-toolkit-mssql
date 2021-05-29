Create View repo.[Index_Settings_ForUpdate]
As
Select
    T1.index_guid
  , T1.IndexPatternColumnDatatype
  , T1.IndexPatternColumnName
  , T1.IndexSemanticGroup
  , T1.is_create_constraint
  , T2.index_name
  , T2.parent_RepoObject_guid
  , T3.RepoObject_fullname
From
    repo.Index_Settings  As T1
    Inner Join
        repo.Index_union As T2
            On
            T2.index_guid      = T1.index_guid

    Left Outer Join
        repo.RepoObject  As T3
            On
            T3.RepoObject_guid = T2.parent_RepoObject_guid;