CREATE TABLE [ssis_t].[TblParameter] (
    [ParameterRowID]     INT            IDENTITY (1, 1) NOT NULL,
    [RowID]              INT            NULL,
    [PackagePath]        VARCHAR (5000) NULL,
    [PackageName]        VARCHAR (MAX)  NULL,
    [Category]           VARCHAR (1000) NULL,
    [PackageCreatorName] VARCHAR (1000) NULL,
    [ParameterName]      VARCHAR (500)  NULL,
    [ParameterDataType]  VARCHAR (MAX)  NULL,
    [ParameterValue]     VARCHAR (MAX)  NULL,
    [ExpressionValue]    VARCHAR (5000) NULL,
    [ParameterHexValue]  VARCHAR (1000) NULL
);


GO
CREATE CLUSTERED INDEX [CX_Variable]
    ON [ssis_t].[TblParameter]([ParameterRowID] ASC) WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '74fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblParameter', @level2type = N'COLUMN', @level2name = N'ParameterHexValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '73fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblParameter', @level2type = N'COLUMN', @level2name = N'ExpressionValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '72fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblParameter', @level2type = N'COLUMN', @level2name = N'ParameterValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '71fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblParameter', @level2type = N'COLUMN', @level2name = N'ParameterDataType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '70fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblParameter', @level2type = N'COLUMN', @level2name = N'ParameterName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6ffad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblParameter', @level2type = N'COLUMN', @level2name = N'PackageCreatorName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6efad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblParameter', @level2type = N'COLUMN', @level2name = N'Category';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6dfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblParameter', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6cfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblParameter', @level2type = N'COLUMN', @level2name = N'PackagePath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6bfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblParameter', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6afad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblParameter', @level2type = N'COLUMN', @level2name = N'ParameterRowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '8064fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblParameter';

