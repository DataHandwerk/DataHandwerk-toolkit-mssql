
CREATE VIEW [ssis_t].[PackageDetails]
As
Select
    pkg.RowID
  , pkg.PackagePath
  , PackageObjectName                 = pkg.PackageXML.value (
                                                                 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
					/DTS:Executable[1]/@DTS:ObjectName'
                                                               , 'nvarchar(500)'
                                                             )
  , PackageCreationDate               = pkg.PackageXML.value (
                                                                 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
					/DTS:Executable[1]/@DTS:CreationDate'
                                                               , 'datetime'
                                                             )
  , PackageCreatorComputerName        = pkg.PackageXML.value (
                                                                 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
					/DTS:Executable[1]/@DTS:CreatorComputerName'
                                                               , 'nvarchar(500)'
                                                             )
  , PackageCreatorName                = pkg.PackageXML.value (
                                                                 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
					/DTS:Executable[1]/@DTS:CreatorName'
                                                               , 'nvarchar(500)'
                                                             )
  , PackageDescription                = pkg.PackageXML.value (
                                                                 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
					/DTS:Executable[1]/@DTS:Description'
                                                               , 'nvarchar(max)'
                                                             )
  , PackageDTSID                      = pkg.PackageXML.value (
                                                                 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
					/DTS:Executable[1]/@DTS:DTSID'
                                                               , 'uniqueidentifier'
                                                             )
  , PackageProtectionLevel            = pkg.PackageXML.value (
                                                                 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
					/DTS:Executable[1]/@DTS:ProtectionLevel'
                                                               , 'nvarchar(500)'
                                                             )
  , PackageVersionGUID                = pkg.PackageXML.value (
                                                                 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
					/DTS:Executable[1]/@DTS:VersionGUID'
                                                               , 'uniqueidentifier'
                                                             )
  , PackageLocaleID                   = pkg.PackageXML.value (
                                                                 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
					/DTS:Executable[1]/@DTS:LocaleID'
                                                               , 'int'
                                                             )
  , PackageLastModifiedProductVersion = pkg.PackageXML.value (
                                                                 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
					/DTS:Executable[1]/@DTS:LastModifiedProductVersion'
                                                               , 'nvarchar(500)'
                                                             )
From
    ssis_t.pkgStats As pkg
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '49f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'PackageDetails', @level2type = N'COLUMN', @level2name = N'PackageLastModifiedProductVersion';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '48f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'PackageDetails', @level2type = N'COLUMN', @level2name = N'PackageLocaleID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '47f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'PackageDetails', @level2type = N'COLUMN', @level2name = N'PackageVersionGUID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '46f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'PackageDetails', @level2type = N'COLUMN', @level2name = N'PackageProtectionLevel';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '45f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'PackageDetails', @level2type = N'COLUMN', @level2name = N'PackageDTSID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '44f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'PackageDetails', @level2type = N'COLUMN', @level2name = N'PackageDescription';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '43f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'PackageDetails', @level2type = N'COLUMN', @level2name = N'PackageCreatorName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '42f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'PackageDetails', @level2type = N'COLUMN', @level2name = N'PackageCreatorComputerName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '41f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'PackageDetails', @level2type = N'COLUMN', @level2name = N'PackageCreationDate';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '40f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'PackageDetails', @level2type = N'COLUMN', @level2name = N'PackageObjectName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3ff9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'PackageDetails', @level2type = N'COLUMN', @level2name = N'PackagePath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3ef9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'PackageDetails', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5b64fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'PackageDetails';

