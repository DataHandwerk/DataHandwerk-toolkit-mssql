



CREATE View [ssis].[Package_src]
As
Select
    proj.AntoraModule
  , p.PackageName
  , p.PackageCreationDate
  , p.PackageCreatorComputerName
  , p.PackageCreatorName
  , p.PackageDescription
  , p.PackageDTSID
  , p.PackageLastModifiedProductVersion
  , p.PackageLocaleID
  , p.PackageObjectName
  , p.PackagePath
  , p.PackageProtectionLevel
  , p.PackageProtectionLevelName
  , p.PackageVersionGUID
  ----The XML data type cannot be compared or sorted, except when using the IS NULL operator.
  --, p.PackageXML
  , p.ProjectPath
  , p.RowID

--, PackageProtectionLevelName =
---- https://docs.microsoft.com/en-us/dotnet/api/microsoft.sqlserver.dts.runtime.dtsprotectionlevel?view=sqlserver-2019
----DontSaveSensitive	0	
----Sensitive information is not saved in the package. The sensitive information is removed and replaced with blanks.

----EncryptAllWithPassword	3	
----Encrypts the entire package by using a password.

----EncryptAllWithUserKey	4	
----Encrypts the entire package by using keys based on the user profile. Only the same user using the same profile can load the package.

----EncryptSensitiveWithPassword	2	
----Encrypts only sensitive information contained in the package by using a password. DPAPI is used for this encryption.

----EncryptSensitiveWithUserKey	1	
----Encrypts sensitive properties only by using keys based on the current user. Only the same user using the same profile can load the package. If a different user opens the package, the sensitive information is replaced with blanks. DPAPI is used for this encryption.

----ServerStorage	5	
----Encrypts the package within a SQL Server msdb database. This option is supported only when a package is saved to SQL Server. It is not supported when a package is saved to the File System. The access control of who can decrypt the package is controlled by SQL Server database roles. For more information, see Database-Level Roles and sysssispackages (Transact-SQL).
--Case p.PackageProtectionLevel
--    When '0'
--        Then
--        'DontSaveSensitive'
--    When '1'
--        Then
--        'EncryptSensitiveWithUserKey'
--    When '2'
--        Then
--        'EncryptSensitiveWithPassword'
--    When '3'
--        Then
--        'EncryptAllWithPassword'
--    When '4'
--        Then
--        'EncryptAllWithUserKey'
--    When '5'
--        Then
--        'ServerStorage'
--End
From
    ssis_t.pkgStats  As p
    Inner Join
        ssis.Project As proj
            On
            p.ProjectPath = proj.ProjectPath
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eafad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'Package_src', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e9fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'Package_src', @level2type = N'COLUMN', @level2name = N'ProjectPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e7fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'Package_src', @level2type = N'COLUMN', @level2name = N'PackageVersionGUID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e6fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'Package_src', @level2type = N'COLUMN', @level2name = N'PackageProtectionLevelName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e5fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'Package_src', @level2type = N'COLUMN', @level2name = N'PackageProtectionLevel';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e4fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'Package_src', @level2type = N'COLUMN', @level2name = N'PackagePath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dcfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'Package_src', @level2type = N'COLUMN', @level2name = N'PackageObjectName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e2fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'Package_src', @level2type = N'COLUMN', @level2name = N'PackageLocaleID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e1fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'Package_src', @level2type = N'COLUMN', @level2name = N'PackageLastModifiedProductVersion';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dbfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'Package_src', @level2type = N'COLUMN', @level2name = N'PackageDTSID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e0fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'Package_src', @level2type = N'COLUMN', @level2name = N'PackageDescription';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dffad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'Package_src', @level2type = N'COLUMN', @level2name = N'PackageCreatorName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'defad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'Package_src', @level2type = N'COLUMN', @level2name = N'PackageCreatorComputerName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ddfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'Package_src', @level2type = N'COLUMN', @level2name = N'PackageCreationDate';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e3fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'Package_src', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dafad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'Package_src', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5564fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'Package_src';

