CREATE TABLE [ssis_t].[pkgStats] (
    [RowID]                             INT              IDENTITY (1, 1) NOT NULL,
    [ProjectPath]                       VARCHAR (8000)   NOT NULL,
    [PackagePath]                       VARCHAR (8000)   NOT NULL,
    [PackageXML]                        XML              NOT NULL,
    [PackageCreationDate]               DATETIME         NULL,
    [PackageCreatorComputerName]        NVARCHAR (500)   NULL,
    [PackageCreatorName]                VARCHAR (1000)   NULL,
    [PackageDescription]                NVARCHAR (MAX)   NULL,
    [PackageDTSID]                      UNIQUEIDENTIFIER NULL,
    [PackageLastModifiedProductVersion] NVARCHAR (500)   NULL,
    [PackageLocaleID]                   INT              NULL,
    [PackageObjectName]                 NVARCHAR (500)   NULL,
    [PackageProtectionLevel]            VARCHAR (100)    NULL,
    [PackageVersionGUID]                UNIQUEIDENTIFIER NULL,
    [PackageName]                       AS               (left(replace([PackagePath],[ProjectPath]+'\',''),(200))) PERSISTED,
    [PackageProtectionLevelName]        AS               (case [PackageProtectionLevel] when '0' then 'DontSaveSensitive' when '1' then 'EncryptSensitiveWithUserKey' when '2' then 'EncryptSensitiveWithPassword' when '3' then 'EncryptAllWithPassword' when '4' then 'EncryptAllWithUserKey' when '5' then 'ServerStorage'  end),
    CONSTRAINT [PK__pkgStats__FFEE7451CEB89CD7] PRIMARY KEY CLUSTERED ([RowID] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7164fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'pkgStats', @level2type = N'CONSTRAINT', @level2name = N'PK__pkgStats__FFEE7451CEB89CD7';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '50fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'pkgStats', @level2type = N'COLUMN', @level2name = N'PackageProtectionLevelName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4ffad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'pkgStats', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4efad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'pkgStats', @level2type = N'COLUMN', @level2name = N'PackageVersionGUID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4dfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'pkgStats', @level2type = N'COLUMN', @level2name = N'PackageProtectionLevel';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4cfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'pkgStats', @level2type = N'COLUMN', @level2name = N'PackageObjectName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4bfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'pkgStats', @level2type = N'COLUMN', @level2name = N'PackageLocaleID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4afad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'pkgStats', @level2type = N'COLUMN', @level2name = N'PackageLastModifiedProductVersion';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '49fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'pkgStats', @level2type = N'COLUMN', @level2name = N'PackageDTSID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '48fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'pkgStats', @level2type = N'COLUMN', @level2name = N'PackageDescription';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '47fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'pkgStats', @level2type = N'COLUMN', @level2name = N'PackageCreatorName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '46fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'pkgStats', @level2type = N'COLUMN', @level2name = N'PackageCreatorComputerName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '45fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'pkgStats', @level2type = N'COLUMN', @level2name = N'PackageCreationDate';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '44fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'pkgStats', @level2type = N'COLUMN', @level2name = N'PackageXML';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '43fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'pkgStats', @level2type = N'COLUMN', @level2name = N'PackagePath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '42fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'pkgStats', @level2type = N'COLUMN', @level2name = N'ProjectPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '41fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'pkgStats', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7a64fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'pkgStats';

