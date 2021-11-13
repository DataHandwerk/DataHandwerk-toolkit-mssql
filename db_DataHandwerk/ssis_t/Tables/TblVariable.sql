CREATE TABLE [ssis_t].[TblVariable] (
    [VariableRowID]      INT            IDENTITY (1, 1) NOT NULL,
    [RowID]              INT            NULL,
    [PackagePath]        VARCHAR (5000) NULL,
    [PackageName]        VARCHAR (MAX)  NULL,
    [Category]           VARCHAR (1000) NULL,
    [PackageCreatorName] VARCHAR (1000) NULL,
    [VariableName]       VARCHAR (500)  NULL,
    [VariableDataType]   VARCHAR (MAX)  NULL,
    [VariableValue]      VARCHAR (MAX)  NULL,
    [ExpressionValue]    VARCHAR (5000) NULL,
    [VariableHexValue]   VARCHAR (1000) NULL
);


GO
CREATE CLUSTERED INDEX [CX_Variable]
    ON [ssis_t].[TblVariable]([VariableRowID] ASC) WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bbfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblVariable', @level2type = N'COLUMN', @level2name = N'VariableHexValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bafad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblVariable', @level2type = N'COLUMN', @level2name = N'ExpressionValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b9fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblVariable', @level2type = N'COLUMN', @level2name = N'VariableValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b8fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblVariable', @level2type = N'COLUMN', @level2name = N'VariableDataType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b7fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblVariable', @level2type = N'COLUMN', @level2name = N'VariableName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b6fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblVariable', @level2type = N'COLUMN', @level2name = N'PackageCreatorName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b5fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblVariable', @level2type = N'COLUMN', @level2name = N'Category';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b4fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblVariable', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b3fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblVariable', @level2type = N'COLUMN', @level2name = N'PackagePath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b2fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblVariable', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b1fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblVariable', @level2type = N'COLUMN', @level2name = N'VariableRowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9164fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblVariable';

