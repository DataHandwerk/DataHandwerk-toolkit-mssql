
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
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '41ecd625-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_ssas_IndexPatternColumnGuid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0e40bc32-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_ssas_IndexPatternColumnGuid', @level2type = N'COLUMN', @level2name = N'parent_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0f40bc32-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_ssas_IndexPatternColumnGuid', @level2type = N'COLUMN', @level2name = N'IndexPatternColumnGuid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0d40bc32-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_ssas_IndexPatternColumnGuid', @level2type = N'COLUMN', @level2name = N'index_guid';

