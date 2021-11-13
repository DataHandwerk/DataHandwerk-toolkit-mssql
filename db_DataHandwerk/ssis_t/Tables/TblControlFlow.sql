CREATE TABLE [ssis_t].[TblControlFlow] (
    [ControlFlowDetailsRowID]      INT            IDENTITY (1, 1) NOT NULL,
    [RowID]                        INT            NULL,
    [TaskPath]                     VARCHAR (8000) NULL,
    [TaskName]                     VARCHAR (2000) NULL,
    [TaskDescription]              VARCHAR (MAX)  NULL,
    [TaskType]                     VARCHAR (5000) NULL,
    [DelayValidationPropertyValue] VARCHAR (100)  NULL,
    [DFTQuery]                     XML            NULL,
    [SqlTaskQry]                   XML            NULL,
    [ExecPkgTaskQry]               XML            NULL,
    [ScriptTaskQry]                XML            NULL,
    [IsDisabled]                   VARCHAR (10)   NULL,
    [ExpressionValue]              VARCHAR (5000) NULL,
    CONSTRAINT [PK_TblControlFlow] PRIMARY KEY NONCLUSTERED ([ControlFlowDetailsRowID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [NCX_ControlFlow]
    ON [ssis_t].[TblControlFlow]([RowID] ASC);


GO
CREATE CLUSTERED INDEX [CX_ControlFlow]
    ON [ssis_t].[TblControlFlow]([ControlFlowDetailsRowID] ASC, [RowID] ASC) WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7664fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblControlFlow', @level2type = N'CONSTRAINT', @level2name = N'PK_TblControlFlow';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '69fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblControlFlow', @level2type = N'COLUMN', @level2name = N'ExpressionValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '68fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblControlFlow', @level2type = N'COLUMN', @level2name = N'IsDisabled';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '67fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblControlFlow', @level2type = N'COLUMN', @level2name = N'ScriptTaskQry';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '66fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblControlFlow', @level2type = N'COLUMN', @level2name = N'ExecPkgTaskQry';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '65fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblControlFlow', @level2type = N'COLUMN', @level2name = N'SqlTaskQry';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '64fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblControlFlow', @level2type = N'COLUMN', @level2name = N'DFTQuery';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '63fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblControlFlow', @level2type = N'COLUMN', @level2name = N'DelayValidationPropertyValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '62fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblControlFlow', @level2type = N'COLUMN', @level2name = N'TaskType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '61fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblControlFlow', @level2type = N'COLUMN', @level2name = N'TaskDescription';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '60fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblControlFlow', @level2type = N'COLUMN', @level2name = N'TaskName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5ffad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblControlFlow', @level2type = N'COLUMN', @level2name = N'TaskPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5efad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblControlFlow', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5dfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblControlFlow', @level2type = N'COLUMN', @level2name = N'ControlFlowDetailsRowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7e64fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblControlFlow';

