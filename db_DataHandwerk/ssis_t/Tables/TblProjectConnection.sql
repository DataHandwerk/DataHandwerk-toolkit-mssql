CREATE TABLE [ssis_t].[TblProjectConnection] (
    [ConnectionPath]        VARCHAR (8000)   NOT NULL,
    [ConnectionManagerName] VARCHAR (MAX)    NULL,
    [ConnectionManagerID]   UNIQUEIDENTIFIER NULL,
    [ConnectionManagerType] VARCHAR (MAX)    NULL,
    [ConnectionString]      NVARCHAR (MAX)   NULL,
    [ExpressionValue]       NVARCHAR (MAX)   NULL,
    [RowID]                 INT              NOT NULL
)
WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '64ddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblProjectConnection', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '63ddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblProjectConnection', @level2type = N'COLUMN', @level2name = N'ExpressionValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '62ddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblProjectConnection', @level2type = N'COLUMN', @level2name = N'ConnectionString';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '61ddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblProjectConnection', @level2type = N'COLUMN', @level2name = N'ConnectionManagerType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '60ddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblProjectConnection', @level2type = N'COLUMN', @level2name = N'ConnectionManagerID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5fddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblProjectConnection', @level2type = N'COLUMN', @level2name = N'ConnectionManagerName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5eddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblProjectConnection', @level2type = N'COLUMN', @level2name = N'ConnectionPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '899a07f7-c23c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblProjectConnection';

