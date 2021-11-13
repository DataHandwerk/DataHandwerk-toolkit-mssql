create View [ssis].PackageTask_Dft_Component_input_inputColumn_tgt
As
Select
    tgt.AntoraModule
  , tgt.PackageName
  , tgt.Component_refId
  , tgt.input_refId
  , tgt.input_errorOrTruncationOperation
  , tgt.input_errorRowDisposition
  , tgt.input_hasSideEffects
  , tgt.input_name
  , tgt.Column_refId
  , tgt.Column_cachedName
  , tgt.Column_cachedDataType
  , tgt.Column_externalMetadataColumnId
  , tgt.Column_lineageId
  , tgt.TaskPath
  , tgt.ControlFlowDetailsRowID
From
    ssis.PackageTask_Dft_Component_input_inputColumn As tgt
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
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fbe6c4fd-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_input_inputColumn_tgt', @level2type = N'COLUMN', @level2name = N'ControlFlowDetailsRowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f9e6c4fd-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_input_inputColumn_tgt', @level2type = N'COLUMN', @level2name = N'TaskPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ffe6c4fd-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_input_inputColumn_tgt', @level2type = N'COLUMN', @level2name = N'Column_lineageId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fde6c4fd-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_input_inputColumn_tgt', @level2type = N'COLUMN', @level2name = N'Column_externalMetadataColumnId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '00e7c4fd-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_input_inputColumn_tgt', @level2type = N'COLUMN', @level2name = N'Column_cachedDataType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '01e7c4fd-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_input_inputColumn_tgt', @level2type = N'COLUMN', @level2name = N'Column_cachedName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '04e7c4fd-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_input_inputColumn_tgt', @level2type = N'COLUMN', @level2name = N'Column_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '02e7c4fd-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_input_inputColumn_tgt', @level2type = N'COLUMN', @level2name = N'input_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fee6c4fd-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_input_inputColumn_tgt', @level2type = N'COLUMN', @level2name = N'input_hasSideEffects';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '03e7c4fd-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_input_inputColumn_tgt', @level2type = N'COLUMN', @level2name = N'input_errorRowDisposition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '06e7c4fd-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_input_inputColumn_tgt', @level2type = N'COLUMN', @level2name = N'input_errorOrTruncationOperation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fce6c4fd-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_input_inputColumn_tgt', @level2type = N'COLUMN', @level2name = N'input_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '07e7c4fd-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_input_inputColumn_tgt', @level2type = N'COLUMN', @level2name = N'Component_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '05e7c4fd-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_input_inputColumn_tgt', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fae6c4fd-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_input_inputColumn_tgt', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '529b11f6-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_input_inputColumn_tgt';

