
CREATE VIEW [ssis].[Package_tgt]
As
Select
    tgt.AntoraModule
  , tgt.PackageName
  , tgt.PackageDTSID
  , tgt.PackageCreationDate
  , tgt.PackageCreatorComputerName
  , tgt.PackageCreatorName
  , tgt.PackageDescription
  , tgt.PackageLastModifiedProductVersion
  , tgt.PackageLocaleID
  , tgt.PackageObjectName
  , tgt.PackagePath
  , tgt.PackageProtectionLevel
  , tgt.PackageProtectionLevelName
  , tgt.PackageVersionGUID
  --, tgt.PackageXML
  , tgt.ProjectPath
  , tgt.RowID
From
    ssis.Package As tgt
Where
    Exists
(
    Select
        1
    From
        ssis.AntoraModule_tgt_filter As f
    Where
        tgt.AntoraModule = f.AntoraModule
)
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fcfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'Package_tgt', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fbfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'Package_tgt', @level2type = N'COLUMN', @level2name = N'ProjectPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f9fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'Package_tgt', @level2type = N'COLUMN', @level2name = N'PackageVersionGUID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f8fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'Package_tgt', @level2type = N'COLUMN', @level2name = N'PackageProtectionLevelName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f7fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'Package_tgt', @level2type = N'COLUMN', @level2name = N'PackageProtectionLevel';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f6fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'Package_tgt', @level2type = N'COLUMN', @level2name = N'PackagePath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eefad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'Package_tgt', @level2type = N'COLUMN', @level2name = N'PackageObjectName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f4fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'Package_tgt', @level2type = N'COLUMN', @level2name = N'PackageLocaleID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f3fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'Package_tgt', @level2type = N'COLUMN', @level2name = N'PackageLastModifiedProductVersion';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f2fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'Package_tgt', @level2type = N'COLUMN', @level2name = N'PackageDescription';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f1fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'Package_tgt', @level2type = N'COLUMN', @level2name = N'PackageCreatorName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f0fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'Package_tgt', @level2type = N'COLUMN', @level2name = N'PackageCreatorComputerName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'effad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'Package_tgt', @level2type = N'COLUMN', @level2name = N'PackageCreationDate';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ecfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'Package_tgt', @level2type = N'COLUMN', @level2name = N'PackageDTSID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f5fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'Package_tgt', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'edfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'Package_tgt', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5664fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'Package_tgt';

