CREATE TABLE [ssis_t].[TblTask_Dft_Details] (
    [DataFlowDetailsRowID]          INT            IDENTITY (1, 1) NOT NULL,
    [ControlFlowDetailsRowID]       INT            NULL,
    [RowID]                         INT            NULL,
    [DFTTaskName]                   VARCHAR (MAX)  NULL,
    [DFTTasksPath]                  VARCHAR (MAX)  NULL,
    [DFTTaskType]                   VARCHAR (MAX)  NULL,
    [DFTTaskType1]                  VARCHAR (MAX)  NULL,
    [DFTRowSet]                     VARCHAR (MAX)  NULL,
    [ParameterBindingParameterName] VARCHAR (2000) NULL,
    [DFTSQLCommand]                 VARCHAR (MAX)  NULL,
    [DFTConnectionManager]          VARCHAR (MAX)  NULL,
    [Variable]                      VARCHAR (MAX)  NULL,
    [InputQry]                      XML            NULL,
    [OutputQry]                     XML            NULL,
    [IsSortedProperty]              VARCHAR (10)   NULL,
    [MultihashcolumnSortPosition]   VARCHAR (MAX)  NULL
);


GO
CREATE NONCLUSTERED INDEX [NCX_TblDFTTaskDetails_2]
    ON [ssis_t].[TblTask_Dft_Details]([ControlFlowDetailsRowID] ASC, [DataFlowDetailsRowID] ASC)
    INCLUDE([DFTTasksPath], [MultihashcolumnSortPosition]);


GO
CREATE NONCLUSTERED INDEX [NCX_TblDFTTaskDetails]
    ON [ssis_t].[TblTask_Dft_Details]([RowID] ASC);


GO
CREATE CLUSTERED INDEX [CX_TblDFTTaskDetails]
    ON [ssis_t].[TblTask_Dft_Details]([DataFlowDetailsRowID] ASC, [RowID] ASC) WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '94fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Details', @level2type = N'COLUMN', @level2name = N'MultihashcolumnSortPosition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '93fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Details', @level2type = N'COLUMN', @level2name = N'IsSortedProperty';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '92fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Details', @level2type = N'COLUMN', @level2name = N'OutputQry';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '91fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Details', @level2type = N'COLUMN', @level2name = N'InputQry';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '90fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Details', @level2type = N'COLUMN', @level2name = N'Variable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8ffad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Details', @level2type = N'COLUMN', @level2name = N'DFTConnectionManager';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8efad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Details', @level2type = N'COLUMN', @level2name = N'DFTSQLCommand';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8dfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Details', @level2type = N'COLUMN', @level2name = N'ParameterBindingParameterName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8cfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Details', @level2type = N'COLUMN', @level2name = N'DFTRowSet';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8bfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Details', @level2type = N'COLUMN', @level2name = N'DFTTaskType1';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8afad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Details', @level2type = N'COLUMN', @level2name = N'DFTTaskType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '89fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Details', @level2type = N'COLUMN', @level2name = N'DFTTasksPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '88fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Details', @level2type = N'COLUMN', @level2name = N'DFTTaskName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '87fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Details', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '86fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Details', @level2type = N'COLUMN', @level2name = N'ControlFlowDetailsRowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '85fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Details', @level2type = N'COLUMN', @level2name = N'DataFlowDetailsRowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '8564fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Details';

