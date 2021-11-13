create View docs.ssis_navlist_package
As
Select
    AntoraModule
  , nav_list =
  --
  String_Agg (
                 Concat (
                            --* xref:target-page-filename.adoc[link text]
                            --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                            Cast('* xref:' As NVarchar(Max))
                          , docs.fs_cleanStringForFilename ( PackageBasename )
                          , '.adoc[]'
                        )
               , Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                PackageBasename)
From
    ssis.Package
Group By
    AntoraModule
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eea5f6bc-533f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_navlist_package', @level2type = N'COLUMN', @level2name = N'nav_list';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eda5f6bc-533f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_navlist_package', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '262faab3-533f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_navlist_package';

