
/*
ssis_t.TblTask_Dft_Details contails details per each column between data flow task steps

data flow task steps will be extracted here by using select distinct
*/
CREATE VIEW [ssis_t].[TblTask_Dft_Step_src]
As
Select
    Distinct
    ControlFlowDetailsRowID
  , RowID
  , DFTTaskName
  , DFTTasksPath
  , DFTTaskType
  , DFTTaskType1
  , DFTRowSet
  , ParameterBindingParameterName
  , DFTSQLCommand
  , DFTConnectionManager
  , Variable
  , IsSortedProperty
--,[InputQry]
--,[OutputQry]
--,[MultihashcolumnSortPosition]
From
    ssis_t.TblTask_Dft_Details
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd1f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Step_src', @level2type = N'COLUMN', @level2name = N'IsSortedProperty';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd0f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Step_src', @level2type = N'COLUMN', @level2name = N'Variable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cff8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Step_src', @level2type = N'COLUMN', @level2name = N'DFTConnectionManager';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cef8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Step_src', @level2type = N'COLUMN', @level2name = N'DFTSQLCommand';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cdf8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Step_src', @level2type = N'COLUMN', @level2name = N'ParameterBindingParameterName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ccf8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Step_src', @level2type = N'COLUMN', @level2name = N'DFTRowSet';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cbf8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Step_src', @level2type = N'COLUMN', @level2name = N'DFTTaskType1';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'caf8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Step_src', @level2type = N'COLUMN', @level2name = N'DFTTaskType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c9f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Step_src', @level2type = N'COLUMN', @level2name = N'DFTTasksPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c8f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Step_src', @level2type = N'COLUMN', @level2name = N'DFTTaskName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c7f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Step_src', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c6f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Step_src', @level2type = N'COLUMN', @level2name = N'ControlFlowDetailsRowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '8964fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Step_src';

