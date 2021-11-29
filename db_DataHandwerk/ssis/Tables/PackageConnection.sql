CREATE TABLE [ssis].[PackageConnection] (
    [AntoraModule]                 VARCHAR (50)     NOT NULL,
    [PackageName]                  VARCHAR (200)    NOT NULL,
    [ConnectionManagerID]          UNIQUEIDENTIFIER NOT NULL,
    [ConnectionManagerName]        VARCHAR (MAX)    NULL,
    [ConnectionManagerType]        VARCHAR (MAX)    NULL,
    [ConnectionString]             VARCHAR (MAX)    NULL,
    [ExpressionValue]              VARCHAR (MAX)    NULL,
    [RetainSameConnectionProperty] NVARCHAR (MAX)   NULL,
    [isFileAndDtsPackage]          AS               (case when [ConnectionManagerType]='FILE' AND right([ConnectionString],(5))='.dtsx' then (1) else (0) end) PERSISTED NOT NULL,
    [DtsPackageBaseName]           AS               (case when [ConnectionManagerType]='FILE' AND right([ConnectionString],(5))='.dtsx' then substring([ConnectionString],(len([ConnectionString])-charindex('\',reverse([ConnectionString])))+(2),charindex('\',reverse([ConnectionString]))-(6))  end) PERSISTED,
    CONSTRAINT [PK_PackageConnection] PRIMARY KEY CLUSTERED ([AntoraModule] ASC, [PackageName] ASC, [ConnectionManagerID] ASC) WITH (DATA_COMPRESSION = PAGE)
);




GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7364fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageConnection', @level2type = N'CONSTRAINT', @level2name = N'PK_PackageConnection';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b6f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageConnection', @level2type = N'COLUMN', @level2name = N'RetainSameConnectionProperty';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b5f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageConnection', @level2type = N'COLUMN', @level2name = N'ExpressionValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b4f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageConnection', @level2type = N'COLUMN', @level2name = N'ConnectionString';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b3f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageConnection', @level2type = N'COLUMN', @level2name = N'ConnectionManagerType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b2f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageConnection', @level2type = N'COLUMN', @level2name = N'ConnectionManagerName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aff9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageConnection', @level2type = N'COLUMN', @level2name = N'ConnectionManagerID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ece3c11b-183b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageConnection', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b0f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageConnection', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5864fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageConnection';

