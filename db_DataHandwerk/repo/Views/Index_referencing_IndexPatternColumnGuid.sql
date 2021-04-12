

/*
if a source_index "HasFullColumnsInReferencing"
we need to know [referencing_IndexPatternColumnGuid]
to filter out different source_index referencing in same referencing column combination

Because that would only lead to multiple indexes with the same column combination in the same RepoObject
*/

Create View repo.Index_referencing_IndexPatternColumnGuid
As
Select
    source_index_guid                  = ic.index_guid
  , ic.referencing_RepoObject_guid
  , referencing_IndexPatternColumnGuid = String_Agg ( Cast(ic.referencing_RepoObjectColumn_guid As Char(36)), ',' ) Within Group(Order By
                                                                                                                                     Cast(ic.referencing_RepoObjectColumn_guid As Char(36)))
From
    repo.IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T As ic
Group By
    ic.index_guid
  , ic.referencing_RepoObject_guid;
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '70ce8eb8-5f62-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_referencing_IndexPatternColumnGuid'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_IndexPatternColumnGuid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6fce8eb8-5f62-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_referencing_IndexPatternColumnGuid'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6ece8eb8-5f62-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_referencing_IndexPatternColumnGuid'
  , @level2type = N'COLUMN'
  , @level2name = N'source_index_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '5ece8eb8-5f62-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_referencing_IndexPatternColumnGuid';
Go