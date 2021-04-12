Create View repo.Index_unique_IndexPatternColumnGuid
As
Select
    index_guid
  , IndexPatternColumnGuid = String_Agg ( Cast(ic.RepoObjectColumn_guid As Char(36)), ',' ) Within Group(Order By
                                                                                                             Cast(ic.RepoObjectColumn_guid As Char(36)))
From
    repo_sys.IndexColumn_unique ic
Group By
    ic.index_guid;
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '72ce8eb8-5f62-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_unique_IndexPatternColumnGuid'
  , @level2type = N'COLUMN'
  , @level2name = N'IndexPatternColumnGuid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '71ce8eb8-5f62-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_unique_IndexPatternColumnGuid'
  , @level2type = N'COLUMN'
  , @level2name = N'index_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '5fce8eb8-5f62-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_unique_IndexPatternColumnGuid';
Go