Create View docs.RepoObject_OutputFilter_T_gross
As
Select
    RepoObject_guid
  , cultures_name
  , SysObject_type
  , SysObject_type_name
  , RepoObject_fullname
  , RepoObject_fullname2
  , RepoObject_FullDisplayName2
  , RepoObject_DisplayName
  , RepoObject_translation
  , RepoObject_schema_name
  , is_DocsOutput
  , RepoObject_name
  , is_external
  , is_ssas
  , tables_isHidden
  , external_AntoraComponent
  , external_AntoraModule
  , external_DatabaseName
  , AntoraComponent
  , AntoraModule
  , PumlEntityTopDefault
  , PumlEntityTopWorkaround
  , FilenameRelatedMeasures = Case
                                  When is_ssas = ( 1 )
                                      Then
                                      docs.fs_cleanStringForFilename ( RepoObject_schema_name + '._measures' )
                              End
From
    docs.RepoObject_OutputFilter_T
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd6c9bf7f-1355-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter_T_gross', @level2type = N'COLUMN', @level2name = N'FilenameRelatedMeasures';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd5c9bf7f-1355-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter_T_gross', @level2type = N'COLUMN', @level2name = N'PumlEntityTopWorkaround';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd4c9bf7f-1355-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter_T_gross', @level2type = N'COLUMN', @level2name = N'PumlEntityTopDefault';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd3c9bf7f-1355-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter_T_gross', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd2c9bf7f-1355-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter_T_gross', @level2type = N'COLUMN', @level2name = N'AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd1c9bf7f-1355-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter_T_gross', @level2type = N'COLUMN', @level2name = N'external_DatabaseName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd0c9bf7f-1355-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter_T_gross', @level2type = N'COLUMN', @level2name = N'external_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cfc9bf7f-1355-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter_T_gross', @level2type = N'COLUMN', @level2name = N'external_AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cec9bf7f-1355-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter_T_gross', @level2type = N'COLUMN', @level2name = N'tables_isHidden';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cdc9bf7f-1355-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter_T_gross', @level2type = N'COLUMN', @level2name = N'is_ssas';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ccc9bf7f-1355-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter_T_gross', @level2type = N'COLUMN', @level2name = N'is_external';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cbc9bf7f-1355-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter_T_gross', @level2type = N'COLUMN', @level2name = N'RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cac9bf7f-1355-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter_T_gross', @level2type = N'COLUMN', @level2name = N'is_DocsOutput';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c9c9bf7f-1355-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter_T_gross', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c8c9bf7f-1355-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter_T_gross', @level2type = N'COLUMN', @level2name = N'RepoObject_translation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c7c9bf7f-1355-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter_T_gross', @level2type = N'COLUMN', @level2name = N'RepoObject_DisplayName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c6c9bf7f-1355-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter_T_gross', @level2type = N'COLUMN', @level2name = N'RepoObject_FullDisplayName2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c5c9bf7f-1355-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter_T_gross', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c4c9bf7f-1355-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter_T_gross', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c3c9bf7f-1355-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter_T_gross', @level2type = N'COLUMN', @level2name = N'SysObject_type_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c2c9bf7f-1355-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter_T_gross', @level2type = N'COLUMN', @level2name = N'SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c1c9bf7f-1355-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter_T_gross', @level2type = N'COLUMN', @level2name = N'cultures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c0c9bf7f-1355-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter_T_gross', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a3c25376-1355-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter_T_gross';

