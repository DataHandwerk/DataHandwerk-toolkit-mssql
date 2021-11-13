

CREATE View [ssis].[PackageTask_Dft_SrcDest_src]
As
Select
    p.AntoraModule
  , p.PackageName
  , T3.DFTTasksPath
  , T4.SourceColumn
  , T4.DestinationColumn
  --, T3.DataFlowDetailsRowID
  --, T3.DFTTaskName
  --, T3.DFTTaskType
  --, T3.DFTTaskType1
  --, T3.DFTRowSet
  --, T3.ParameterBindingParameterName
  --, T3.DFTSQLCommand
  --, T3.DFTConnectionManager
  --, T3.Variable
  ------ The XML data type cannot be compared or sorted, except when using the IS NULL operator.
  ----, T3.InputQry
  ----, T3.OutputQry
  --, T3.IsSortedProperty
  , T3.MultihashcolumnSortPosition
  , T4.SortKeyPosition
  , T4.DataSource
  --, T2.TaskPath
  --, T2.ControlFlowDetailsRowID
From
    ssis.Package_src               As p
    Inner Join
        ssis_t.TblControlFlow      As T2
            On
            p.RowID                    = T2.RowID

    Inner Join
        ssis_t.TblTask_Dft_Details As T3
            On
            T3.ControlFlowDetailsRowID = T2.ControlFlowDetailsRowID

    Inner Join
        ssis_t.TblTask_Dft_SrcDest As T4
            On
            T4.DataFlowDetailsRowID    = T3.DataFlowDetailsRowID
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'adf8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_SrcDest_src', @level2type = N'COLUMN', @level2name = N'DataSource';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'acf8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_SrcDest_src', @level2type = N'COLUMN', @level2name = N'SortKeyPosition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a9f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_SrcDest_src', @level2type = N'COLUMN', @level2name = N'MultihashcolumnSortPosition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'abf8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_SrcDest_src', @level2type = N'COLUMN', @level2name = N'DestinationColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aaf8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_SrcDest_src', @level2type = N'COLUMN', @level2name = N'SourceColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9ef8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_SrcDest_src', @level2type = N'COLUMN', @level2name = N'DFTTasksPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e2e3c11b-183b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_SrcDest_src', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '96f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_SrcDest_src', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '6464fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_SrcDest_src';

