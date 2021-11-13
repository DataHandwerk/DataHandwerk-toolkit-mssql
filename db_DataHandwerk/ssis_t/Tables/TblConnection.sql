CREATE TABLE [ssis_t].[TblConnection] (
    [RowID]                        INT              NOT NULL,
    [ConnectionManagerName]        VARCHAR (MAX)    NULL,
    [ConnectionManagerType]        VARCHAR (MAX)    NULL,
    [ConnectionString]             VARCHAR (MAX)    NULL,
    [ConnectionManagerID]          UNIQUEIDENTIFIER NULL,
    [PackagePath]                  VARCHAR (8000)   NOT NULL,
    [PackageName]                  VARCHAR (8000)   NULL,
    [Category]                     VARCHAR (10)     NOT NULL,
    [PackageCreatorName]           VARCHAR (1000)   NULL,
    [DelayValidationPropertyValue] VARCHAR (2)      NOT NULL,
    [ExpressionValue]              VARCHAR (MAX)    NULL,
    [RetainSameConnectionProperty] NVARCHAR (MAX)   NULL
)
WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5cfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblConnection', @level2type = N'COLUMN', @level2name = N'RetainSameConnectionProperty';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5bfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblConnection', @level2type = N'COLUMN', @level2name = N'ExpressionValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5afad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblConnection', @level2type = N'COLUMN', @level2name = N'DelayValidationPropertyValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '59fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblConnection', @level2type = N'COLUMN', @level2name = N'PackageCreatorName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '58fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblConnection', @level2type = N'COLUMN', @level2name = N'Category';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '57fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblConnection', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '56fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblConnection', @level2type = N'COLUMN', @level2name = N'PackagePath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '55fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblConnection', @level2type = N'COLUMN', @level2name = N'ConnectionManagerID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '54fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblConnection', @level2type = N'COLUMN', @level2name = N'ConnectionString';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '53fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblConnection', @level2type = N'COLUMN', @level2name = N'ConnectionManagerType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '52fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblConnection', @level2type = N'COLUMN', @level2name = N'ConnectionManagerName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '51fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblConnection', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7c64fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblConnection';

