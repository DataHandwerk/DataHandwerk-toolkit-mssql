CREATE TABLE [ssis].[Package] (
    [AntoraModule]                      VARCHAR (50)     NOT NULL,
    [PackageName]                       VARCHAR (200)    NOT NULL,
    [PackageDTSID]                      UNIQUEIDENTIFIER NOT NULL,
    [PackageCreationDate]               DATETIME         NULL,
    [PackageCreatorComputerName]        NVARCHAR (500)   NULL,
    [PackageCreatorName]                VARCHAR (1000)   NULL,
    [PackageDescription]                NVARCHAR (MAX)   NULL,
    [PackageLastModifiedProductVersion] NVARCHAR (500)   NULL,
    [PackageLocaleID]                   INT              NULL,
    [PackageObjectName]                 NVARCHAR (500)   NULL,
    [PackagePath]                       VARCHAR (8000)   NOT NULL,
    [PackageProtectionLevel]            VARCHAR (100)    NULL,
    [PackageProtectionLevelName]        VARCHAR (28)     NULL,
    [PackageVersionGUID]                UNIQUEIDENTIFIER NULL,
    [ProjectPath]                       VARCHAR (8000)   NOT NULL,
    [RowID]                             INT              NOT NULL,
    [PackageBasename]                   AS               (replace([PackageName],'.dtsx','')) PERSISTED,
    CONSTRAINT [PK_Package] PRIMARY KEY CLUSTERED ([AntoraModule] ASC, [PackageName] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'd1453d12-183b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'Package', @level2type = N'CONSTRAINT', @level2name = N'PK_Package';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '41ddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'Package', @level2type = N'COLUMN', @level2name = N'PackageBasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'adf9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'Package', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'acf9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'Package', @level2type = N'COLUMN', @level2name = N'ProjectPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aaf9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'Package', @level2type = N'COLUMN', @level2name = N'PackageVersionGUID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a9f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'Package', @level2type = N'COLUMN', @level2name = N'PackageProtectionLevelName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a8f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'Package', @level2type = N'COLUMN', @level2name = N'PackageProtectionLevel';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a7f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'Package', @level2type = N'COLUMN', @level2name = N'PackagePath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9ff9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'Package', @level2type = N'COLUMN', @level2name = N'PackageObjectName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a5f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'Package', @level2type = N'COLUMN', @level2name = N'PackageLocaleID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a4f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'Package', @level2type = N'COLUMN', @level2name = N'PackageLastModifiedProductVersion';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a3f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'Package', @level2type = N'COLUMN', @level2name = N'PackageDescription';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a2f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'Package', @level2type = N'COLUMN', @level2name = N'PackageCreatorName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a1f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'Package', @level2type = N'COLUMN', @level2name = N'PackageCreatorComputerName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a0f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'Package', @level2type = N'COLUMN', @level2name = N'PackageCreationDate';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9df9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'Package', @level2type = N'COLUMN', @level2name = N'PackageDTSID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a6f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'Package', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9ef9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'Package', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5464fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'Package';

