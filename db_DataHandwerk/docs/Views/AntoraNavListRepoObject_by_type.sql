


CREATE View [docs].[AntoraNavListRepoObject_by_type]
As
Select
    type      = ro.SysObject_type
  , type_name = ro.SysObject_type_name
  , ro.cultures_name
  , nav_list  =
  --
  String_Agg (
                 Concat (
                            --* xref:target-page-filename.adoc[link text]
                            --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                            Cast('* xref:' As NVarchar(Max)), docs.fs_cleanStringForFilename ( ro.RepoObject_fullname2 ), '.adoc[]'
                        )
               , Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                ro.RepoObject_fullname2)
From
    docs.RepoObject_OutputFilter_T As ro
Where
    ro.is_DocsOutput   = 1
    And ro.is_external = 0
Group By
    ro.SysObject_type
  , ro.SysObject_type_name
  , ro.cultures_name
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '9b8b79d5-b993-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraNavListRepoObject_by_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a38b79d5-b993-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraNavListRepoObject_by_type'
  , @level2type = N'COLUMN'
  , @level2name = N'type_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a28b79d5-b993-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraNavListRepoObject_by_type'
  , @level2type = N'COLUMN'
  , @level2name = N'type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a48b79d5-b993-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraNavListRepoObject_by_type'
  , @level2type = N'COLUMN'
  , @level2name = N'nav_list';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [docs].[RepoObject_OutputFilter]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListRepoObject_by_type';


GO



GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'type', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListRepoObject_by_type';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'char(2)', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListRepoObject_by_type';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'3D89F380-FD95-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListRepoObject_by_type';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.AntoraPage_ObjectByType.adoc[]
* xref:docs.usp_AntoraExport_navigation.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListRepoObject_by_type';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:docs.RepoObject_OutputFilter.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListRepoObject_by_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_OutputFilter].[SysObject_type_name]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListRepoObject_by_type', @level2type = N'COLUMN', @level2name = N'type_name';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListRepoObject_by_type';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListRepoObject_by_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4b7481bb-0a22-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListRepoObject_by_type', @level2type = N'COLUMN', @level2name = N'cultures_name';

