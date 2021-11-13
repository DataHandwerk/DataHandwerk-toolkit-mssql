CREATE View [docs].[ssis_PumlPartialDftComponent]
As
Select
    AntoraModule
  , PackageName
  , TaskPath
  , Component_refId
  , Component_name
  , PumlPartialDftComponent =
  --
  '  component "' + Component_name + '" as ' + docs.fs_cleanStringForAnchorId ( Component_refId )
  --hyperlink:
  --+ ' [[#dftcomponent-' + docs.fs_cleanStringForAnchorId ( Component_refId ) + ']]'
  + ' [[../' + docs.fs_cleanStringForFilename ( PackageBasename ) + '.html#dftcomponent-'
  + docs.fs_cleanStringForAnchorId ( Component_refId ) + ']]'
From
    ssis.PackageTask_Dft_Component
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd0d0d060-fc3e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlPartialDftComponent', @level2type = N'COLUMN', @level2name = N'PumlPartialDftComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cfd0d060-fc3e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlPartialDftComponent', @level2type = N'COLUMN', @level2name = N'Component_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ced0d060-fc3e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlPartialDftComponent', @level2type = N'COLUMN', @level2name = N'Component_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cdd0d060-fc3e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlPartialDftComponent', @level2type = N'COLUMN', @level2name = N'TaskPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ccd0d060-fc3e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlPartialDftComponent', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cbd0d060-fc3e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlPartialDftComponent', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '69ddd159-fc3e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlPartialDftComponent';

