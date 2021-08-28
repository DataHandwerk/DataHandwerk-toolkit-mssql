
create View repo.Index_ssas_IndexPatternColumnGuid
As
Select
    i.index_guid
  --only one [parent_RepoObject_guid] per index_guid is possible
  , parent_RepoObject_guid = Max ( i.RepoObject_guid )
  , IndexPatternColumnGuid =
  --
  String_Agg ( Cast(ic.RepoObjectColumn_guid As Char(36)), ',' ) Within Group(Order By
                                                                                  Cast(ic.RepoObjectColumn_guid As Char(36)))
From
    repo.Index_ssas_T           As i
    Inner Join
        repo.IndexColumn_ssas_T As ic
            On
            i.index_guid = ic.index_guid
Group By
    i.index_guid