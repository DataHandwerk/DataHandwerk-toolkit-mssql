﻿
CREATE View repo.Index_unique_IndexPatternColumnGuid
As
Select
    ic.index_guid
  , IndexPatternColumnGuid =
  --
  String_Agg ( Cast(ic.RepoObjectColumn_guid As Char(36)), ',' ) Within Group(Order By
                                                                                  Cast(ic.RepoObjectColumn_guid As Char(36)))
From
    repo_sys.IndexColumn_unique As ic
Group By
    ic.index_guid
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
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo_sys].[IndexColumn_unique]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_unique_IndexPatternColumnGuid';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.Index_union.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_unique_IndexPatternColumnGuid';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo_sys.IndexColumn_unique.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_unique_IndexPatternColumnGuid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo_sys].[IndexColumn_unique].[index_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_unique_IndexPatternColumnGuid', @level2type = N'COLUMN', @level2name = N'index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_unique_IndexPatternColumnGuid';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_unique_IndexPatternColumnGuid';

