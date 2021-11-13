

CREATE View [ssis].[PackageTask_Dft_SrcDest_tgt]
As
Select
    tgt.AntoraModule
  , tgt.PackageName
  , tgt.DFTTasksPath
  , tgt.SourceColumn
  , tgt.DestinationColumn
  , tgt.MultihashcolumnSortPosition
  , tgt.SortKeyPosition
  , tgt.DataSource

  --, tgt.DataFlowDetailsRowID
  --, tgt.DFTTaskName
  --, tgt.DFTTaskType
  --, tgt.DFTTaskType1
  --, tgt.DFTRowSet
  --, tgt.ParameterBindingParameterName
  --, tgt.DFTSQLCommand
  --, tgt.DFTConnectionManager
  --, tgt.Variable
  ----, tgt.InputQry
  ----, tgt.OutputQry
  --, tgt.IsSortedProperty
  --, tgt.TaskPath
  --, tgt.ControlFlowDetailsRowID
From
    ssis.PackageTask_Dft_SrcDest As tgt
Where
    Exists
(
    Select
        1
    From
        ssis.AntoraModule_tgt_filter As f
    Where
        tgt.AntoraModule = f.AntoraModule
)
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c5f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_SrcDest_tgt', @level2type = N'COLUMN', @level2name = N'DataSource';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c4f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_SrcDest_tgt', @level2type = N'COLUMN', @level2name = N'SortKeyPosition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c3f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_SrcDest_tgt', @level2type = N'COLUMN', @level2name = N'MultihashcolumnSortPosition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b1f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_SrcDest_tgt', @level2type = N'COLUMN', @level2name = N'DestinationColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b0f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_SrcDest_tgt', @level2type = N'COLUMN', @level2name = N'SourceColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aff8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_SrcDest_tgt', @level2type = N'COLUMN', @level2name = N'DFTTasksPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e3e3c11b-183b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_SrcDest_tgt', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b2f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_SrcDest_tgt', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '6564fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_SrcDest_tgt';

