
CREATE View docs.AntoraNavListRepoObject_by_schema
As
Select
    ro.RepoObject_schema_name
  , ro.cultures_name
  , nav_list =
  --
  String_Agg (
                 Concat (
                            --* xref:target-page-filename.adoc[link text]
                            --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                            Cast('* xref:' As NVarchar(Max))
                          , docs.fs_cleanStringForFilename ( ro.RepoObject_fullname2 )
                          , '.adoc[]'
                        )
               , Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                ro.RepoObject_DisplayName)
  , is_ssas  = Max ( Cast(ro.is_ssas As TinyInt))
From
    docs.RepoObject_OutputFilter_T As ro
Where
    ro.is_external = 0
Group By
    ro.RepoObject_schema_name
  , ro.cultures_name
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '9c8b79d5-b993-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraNavListRepoObject_by_schema';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a58b79d5-b993-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraNavListRepoObject_by_schema'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a68b79d5-b993-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraNavListRepoObject_by_schema'
  , @level2type = N'COLUMN'
  , @level2name = N'nav_list';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [docs].[RepoObject_OutputFilter]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListRepoObject_by_schema';


GO



GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.AntoraPage_ObjectBySchema.adoc[]
* xref:docs.usp_AntoraExport_navigation.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListRepoObject_by_schema';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:docs.RepoObject_OutputFilter.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListRepoObject_by_schema';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_OutputFilter].[RepoObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListRepoObject_by_schema', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListRepoObject_by_schema';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListRepoObject_by_schema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9c97208b-321e-ec11-8523-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListRepoObject_by_schema', @level2type = N'COLUMN', @level2name = N'is_ssas';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '497481bb-0a22-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListRepoObject_by_schema', @level2type = N'COLUMN', @level2name = N'cultures_name';

