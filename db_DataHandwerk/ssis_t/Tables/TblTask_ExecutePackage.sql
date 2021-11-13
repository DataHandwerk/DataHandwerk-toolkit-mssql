CREATE TABLE [ssis_t].[TblTask_ExecutePackage] (
    [ControlFlowDetailsRowID]  INT            NOT NULL,
    [RowID]                    INT            NULL,
    [ExecutePackageExpression] VARCHAR (1000) NULL,
    [ExecutedPackageName]      VARCHAR (1000) NULL,
    [ExecutePackageConnection] VARCHAR (1000) NULL,
    CONSTRAINT [PK_TblTask_ExecutePackage] PRIMARY KEY NONCLUSTERED ([ControlFlowDetailsRowID] ASC)
);


GO
CREATE CLUSTERED INDEX [CX_TblExecutePackageTaskDetails]
    ON [ssis_t].[TblTask_ExecutePackage]([ControlFlowDetailsRowID] ASC, [RowID] ASC) WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7764fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_ExecutePackage', @level2type = N'CONSTRAINT', @level2name = N'PK_TblTask_ExecutePackage';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9ffad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_ExecutePackage', @level2type = N'COLUMN', @level2name = N'ExecutePackageConnection';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9efad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_ExecutePackage', @level2type = N'COLUMN', @level2name = N'ExecutedPackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9dfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_ExecutePackage', @level2type = N'COLUMN', @level2name = N'ExecutePackageExpression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9cfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_ExecutePackage', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9bfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_ExecutePackage', @level2type = N'COLUMN', @level2name = N'ControlFlowDetailsRowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '8a64fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_ExecutePackage';

