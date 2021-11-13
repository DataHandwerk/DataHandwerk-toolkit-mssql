CREATE View [ssis].[PackageTask_LevelLagLead]
As
Select
    T1.AntoraModule
  , T1.PackageName
  , T1.TaskPath
  , T1.TaskName
  , T1.TaskPathLevel
  , TaskPathLevelLag  = Lag ( T1.TaskPathLevel ) Over ( Partition By T1.AntoraModule, T1.PackageName Order By T1.TaskPath )
  , TaskPathLevelLead = Lead ( T1.TaskPathLevel ) Over ( Partition By T1.AntoraModule, T1.PackageName Order By T1.TaskPath )
  , T1.TaskPathParent
  , T1.PackageBasename
From
    ssis.PackageTask As T1
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b2251c51-9f41-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_LevelLagLead', @level2type = N'COLUMN', @level2name = N'PackageBasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '969c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_LevelLagLead', @level2type = N'COLUMN', @level2name = N'TaskPathParent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '959c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_LevelLagLead', @level2type = N'COLUMN', @level2name = N'TaskPathLevelLead';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '949c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_LevelLagLead', @level2type = N'COLUMN', @level2name = N'TaskPathLevelLag';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '939c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_LevelLagLead', @level2type = N'COLUMN', @level2name = N'TaskPathLevel';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '929c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_LevelLagLead', @level2type = N'COLUMN', @level2name = N'TaskName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '919c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_LevelLagLead', @level2type = N'COLUMN', @level2name = N'TaskPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '909c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_LevelLagLead', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8f9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_LevelLagLead', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'bddcad7f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_LevelLagLead';

