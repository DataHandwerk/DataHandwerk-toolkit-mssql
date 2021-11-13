CREATE TABLE [ssis].[PackageParameter] (
    [AntoraModule]      VARCHAR (50)   NOT NULL,
    [PackageName]       VARCHAR (200)  NOT NULL,
    [ParameterName]     VARCHAR (500)  NOT NULL,
    [ParameterDataType] VARCHAR (MAX)  NULL,
    [ParameterValue]    VARCHAR (MAX)  NULL,
    [ExpressionValue]   VARCHAR (5000) NULL,
    [ParameterHexValue] VARCHAR (1000) NULL,
    CONSTRAINT [PK_PackageParameter_1] PRIMARY KEY CLUSTERED ([AntoraModule] ASC, [PackageName] ASC, [ParameterName] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'd2453d12-183b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageParameter', @level2type = N'CONSTRAINT', @level2name = N'PK_PackageParameter_1';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'caf9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageParameter', @level2type = N'COLUMN', @level2name = N'ParameterHexValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c9f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageParameter', @level2type = N'COLUMN', @level2name = N'ExpressionValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c8f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageParameter', @level2type = N'COLUMN', @level2name = N'ParameterValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c7f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageParameter', @level2type = N'COLUMN', @level2name = N'ParameterDataType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c4f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageParameter', @level2type = N'COLUMN', @level2name = N'ParameterName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eee3c11b-183b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageParameter', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c5f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageParameter', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5f64fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageParameter';

