
CREATE View [ssis_t].[TblTask_Dft_Component_inputs_src]
As
Select
    T1.ControlFlowDetailsRowID
  , T1.RowID
  , T1.DftComponentId
  , T1.refId
  , input_refId                            = inputnodes.x.value ( '@refId[1]', 'varchar(max)' )
  , input_errorOrTruncationOperation       = inputnodes.x.value ( '@errorOrTruncationOperation[1]', 'varchar(100)' )
  , input_errorRowDisposition              = inputnodes.x.value ( '@errorRowDisposition[1]', 'varchar(100)' )
  , input_hasSideEffects                   = inputnodes.x.value ( '@hasSideEffects[1]', 'bit' )
  , input_name                             = inputnodes.x.value ( '@name[1]', 'varchar(500)' )
  , nodescontent                           = inputnodes.x.query ( '.' )
From
    ssis_t.TblTask_Dft_Component                    As T1
    Cross Apply T1.inputsQry.nodes ( './inputs/*' ) As inputnodes(x)
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1ec6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_inputs_src', @level2type = N'COLUMN', @level2name = N'nodescontent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1dc6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_inputs_src', @level2type = N'COLUMN', @level2name = N'input_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1cc6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_inputs_src', @level2type = N'COLUMN', @level2name = N'input_hasSideEffects';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1bc6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_inputs_src', @level2type = N'COLUMN', @level2name = N'input_errorRowDisposition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1ac6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_inputs_src', @level2type = N'COLUMN', @level2name = N'input_errorOrTruncationOperation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '19c6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_inputs_src', @level2type = N'COLUMN', @level2name = N'input_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '18c6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_inputs_src', @level2type = N'COLUMN', @level2name = N'refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '17c6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_inputs_src', @level2type = N'COLUMN', @level2name = N'DftComponentId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '16c6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_inputs_src', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '15c6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_inputs_src', @level2type = N'COLUMN', @level2name = N'ControlFlowDetailsRowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '75cc7fc6-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_inputs_src';

