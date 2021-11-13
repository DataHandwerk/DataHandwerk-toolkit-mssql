CREATE TABLE [ssis_t].[TblPrecedenceConstraint] (
    [RowID]        INT              NULL,
    [PackagePath]  VARCHAR (2000)   NULL,
    [TaskFrom]     VARCHAR (2000)   NULL,
    [TaskTo]       VARCHAR (2000)   NULL,
    [LogicalAnd]   BIT              NULL,
    [ObjectName]   NVARCHAR (MAX)   NULL,
    [CreationName] NVARCHAR (MAX)   NULL,
    [DTSID]        UNIQUEIDENTIFIER NULL,
    [EvalOp]       INT              NULL,
    [Expression]   NVARCHAR (MAX)   NULL,
    [FlowType]     VARCHAR (1000)   NULL
);


GO
CREATE NONCLUSTERED INDEX [NCIX_TblPrecedenceConstraint]
    ON [ssis_t].[TblPrecedenceConstraint]([TaskFrom] ASC, [TaskTo] ASC);


GO
CREATE CLUSTERED INDEX [CIX_TblPrecedenceConstraint]
    ON [ssis_t].[TblPrecedenceConstraint]([RowID] ASC) WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7ffad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblPrecedenceConstraint', @level2type = N'COLUMN', @level2name = N'FlowType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7efad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblPrecedenceConstraint', @level2type = N'COLUMN', @level2name = N'Expression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7dfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblPrecedenceConstraint', @level2type = N'COLUMN', @level2name = N'EvalOp';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7cfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblPrecedenceConstraint', @level2type = N'COLUMN', @level2name = N'DTSID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7bfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblPrecedenceConstraint', @level2type = N'COLUMN', @level2name = N'CreationName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7afad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblPrecedenceConstraint', @level2type = N'COLUMN', @level2name = N'ObjectName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '79fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblPrecedenceConstraint', @level2type = N'COLUMN', @level2name = N'LogicalAnd';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '78fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblPrecedenceConstraint', @level2type = N'COLUMN', @level2name = N'TaskTo';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '77fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblPrecedenceConstraint', @level2type = N'COLUMN', @level2name = N'TaskFrom';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '76fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblPrecedenceConstraint', @level2type = N'COLUMN', @level2name = N'PackagePath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '75fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblPrecedenceConstraint', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '8264fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblPrecedenceConstraint';

