CREATE View [ssis_t].[TblTask_Dft_Component_inputs_inputColumn_src]
As
Select
    T1.ControlFlowDetailsRowID
  , T1.RowID
  , T1.DftComponentId
  , T1.refId
  , input_refId                       = inputnodes.x.value ( '@refId[1]', 'varchar(max)' )
  , input_errorOrTruncationOperation  = inputnodes.x.value ( '@errorOrTruncationOperation[1]', 'varchar(100)' )
  , input_errorRowDisposition         = inputnodes.x.value ( '@errorRowDisposition[1]', 'varchar(100)' )
  , input_hasSideEffects              = inputnodes.x.value ( '@hasSideEffects[1]', 'bit' )
  , input_name                        = inputnodes.x.value ( '@name[1]', 'varchar(500)' )
  , Column_refId                      = columsnodes.x.value ( '@refId[1]', 'varchar(max)' )
  --, Column_name                       = columsnodes.x.value ( '@name[1]', 'varchar(max)' )
  --, Column_dataType                   = columsnodes.x.value ( '@dataType[1]', 'varchar(100)' )
  --, Column_length                     = columsnodes.x.value ( '@length[1]', 'int' )
  --, Column_precision                  = columsnodes.x.value ( '@precision[1]', 'int' )
  --, Column_scale                      = columsnodes.x.value ( '@scale[1]', 'int' )
  , Column_cachedName                 = columsnodes.x.value ( '@cachedName[1]', 'varchar(max)' )
  , Column_cachedDataType             = columsnodes.x.value ( '@cachedDataType[1]', 'varchar(100)' )
  --, Column_cachedlength               = columsnodes.x.value ( '@cachedlength[1]', 'int' )
  --, Column_cachedprecision            = columsnodes.x.value ( '@cachedprecision[1]', 'int' )
  --, Column_cachedscale                = columsnodes.x.value ( '@cachedscale[1]', 'int' )
  , Column_externalMetadataColumnId   = columsnodes.x.value ( '@externalMetadataColumnId[1]', 'varchar(max)' )
  , Column_lineageId                  = columsnodes.x.value ( '@lineageId[1]', 'varchar(max)' )

  -- to check the nodes content:
  , nodescontent                      = inputnodes.x.query ( '.' )
  , columnscontent                    = columsnodes.x.query ( '.' )
From
    ssis_t.TblTask_Dft_Component                    As T1
    Cross Apply T1.inputsQry.nodes ( './inputs/*' ) As inputnodes(x)
    Outer Apply inputnodes.x.nodes ( './inputColumns/*' ) As columsnodes(x)
Where
    --some outputs are without inputColumns
    Not columsnodes.x.value ( '@refId[1]', 'varchar(max)' ) Is Null
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '01c6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_inputs_inputColumn_src', @level2type = N'COLUMN', @level2name = N'columnscontent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0e9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_inputs_inputColumn_src', @level2type = N'COLUMN', @level2name = N'nodescontent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '00c6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_inputs_inputColumn_src', @level2type = N'COLUMN', @level2name = N'Column_lineageId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ffc5e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_inputs_inputColumn_src', @level2type = N'COLUMN', @level2name = N'Column_externalMetadataColumnId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fec5e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_inputs_inputColumn_src', @level2type = N'COLUMN', @level2name = N'Column_cachedDataType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fdc5e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_inputs_inputColumn_src', @level2type = N'COLUMN', @level2name = N'Column_cachedName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fcc5e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_inputs_inputColumn_src', @level2type = N'COLUMN', @level2name = N'Column_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fd9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_inputs_inputColumn_src', @level2type = N'COLUMN', @level2name = N'input_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fc9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_inputs_inputColumn_src', @level2type = N'COLUMN', @level2name = N'input_hasSideEffects';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fb9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_inputs_inputColumn_src', @level2type = N'COLUMN', @level2name = N'input_errorRowDisposition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fa9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_inputs_inputColumn_src', @level2type = N'COLUMN', @level2name = N'input_errorOrTruncationOperation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f99b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_inputs_inputColumn_src', @level2type = N'COLUMN', @level2name = N'input_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f89b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_inputs_inputColumn_src', @level2type = N'COLUMN', @level2name = N'refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f79b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_inputs_inputColumn_src', @level2type = N'COLUMN', @level2name = N'DftComponentId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f69b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_inputs_inputColumn_src', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f59b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_inputs_inputColumn_src', @level2type = N'COLUMN', @level2name = N'ControlFlowDetailsRowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b5dcad7f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_inputs_inputColumn_src';

