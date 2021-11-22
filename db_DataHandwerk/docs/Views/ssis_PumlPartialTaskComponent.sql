

CREATE View [docs].[ssis_PumlPartialTaskComponent]
As
Select
    T3.AntoraModule
  , T3.PackageName
  , T3.TaskPath
  , T3.TaskName
  , T3.TaskPathLevel
  , T3.TaskPathLevelLag
  , T3.TaskPathLevelLead
  , T3.TaskPathParent
  , PumlPartialTaskComponent =
  --former task was a sub task and now we are back on a higher level, we nee '}' to close the previous block
  Iif(T3.TaskPathLevel < T3.TaskPathLevelLag
      , Replicate ( '  ', T3.TaskPathLevel ) + '}' + Char ( 13 ) + Char ( 10 )
      , '')
  --
  +
  --
  Replicate ( '  ', T3.TaskPathLevel ) + 'component "' + T3.TaskName + '" as '
  + docs.fs_cleanStringForAnchorId ( T3.TaskPath )
  --
  + ' <<' + T3.TaskType + '>> '
  --
  --hyperlink:
  --+ ' [[#task-' + docs.fs_cleanStringForAnchorId ( T3.TaskPath ) + ']]'
  --+ ' [[puml-link:' + docs.fs_cleanStringForFilename ( T3.PackageBasename ) + '.adoc#task-'
  --+ docs.fs_cleanStringForAnchorId ( T3.TaskPath ) + ']]'
  + ' [[../' + docs.fs_cleanStringForFilename ( T3.PackageBasename ) + '.html#task-'
  + docs.fs_cleanStringForAnchorId ( T3.TaskPath ) + ']]'
  --
  --current Task has sub tasks = the level of the next task is higher = the next task is a sub task
  + Iif(T3.TaskPathLevelLead > T3.TaskPathLevel, ' {', '')
From
    ssis.PackageTask_LevelLagLead As T3
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '629b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlPartialTaskComponent', @level2type = N'COLUMN', @level2name = N'PumlPartialTaskComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '619b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlPartialTaskComponent', @level2type = N'COLUMN', @level2name = N'TaskPathParent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '609b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlPartialTaskComponent', @level2type = N'COLUMN', @level2name = N'TaskPathLevelLead';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5f9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlPartialTaskComponent', @level2type = N'COLUMN', @level2name = N'TaskPathLevelLag';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5e9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlPartialTaskComponent', @level2type = N'COLUMN', @level2name = N'TaskPathLevel';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5d9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlPartialTaskComponent', @level2type = N'COLUMN', @level2name = N'TaskName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5c9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlPartialTaskComponent', @level2type = N'COLUMN', @level2name = N'TaskPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5b9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlPartialTaskComponent', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5a9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlPartialTaskComponent', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'abdcad7f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlPartialTaskComponent';

