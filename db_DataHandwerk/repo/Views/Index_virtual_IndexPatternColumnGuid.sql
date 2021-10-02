
CREATE View repo.Index_virtual_IndexPatternColumnGuid
As
Select
    i.index_guid
  --only one [parent_RepoObject_guid] per index_guid is possible
  , parent_RepoObject_guid = Max ( i.parent_RepoObject_guid )
  , IndexPatternColumnGuid =
  --
  String_Agg ( Cast(ic.RepoObjectColumn_guid As Char(36)), ',' ) Within Group(Order By
                                                                                  Cast(ic.RepoObjectColumn_guid As Char(36)))
From
    repo.Index_virtual           As i
    Inner Join
        repo.IndexColumn_virtual As ic
            On
            i.index_guid = ic.index_guid
Group By
    i.index_guid
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '75ce8eb8-5f62-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_IndexPatternColumnGuid', @level2type = N'COLUMN', @level2name = N'IndexPatternColumnGuid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '74ce8eb8-5f62-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_IndexPatternColumnGuid', @level2type = N'COLUMN', @level2name = N'parent_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '73ce8eb8-5f62-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_IndexPatternColumnGuid', @level2type = N'COLUMN', @level2name = N'index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '60ce8eb8-5f62-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_IndexPatternColumnGuid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[Index_virtual]
* [repo].[IndexColumn_virtual]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_IndexPatternColumnGuid';


GO



GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.Index_union.adoc[]
* xref:repo.usp_index_inheritance.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_IndexPatternColumnGuid';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.Index_virtual.adoc[]
* xref:repo.IndexColumn_virtual.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_IndexPatternColumnGuid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_virtual].[index_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_IndexPatternColumnGuid', @level2type = N'COLUMN', @level2name = N'index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_IndexPatternColumnGuid';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_IndexPatternColumnGuid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_virtual].[parent_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_virtual_IndexPatternColumnGuid', @level2type = N'COLUMN', @level2name = N'parent_RepoObject_guid';

