CREATE View ssis_t.TblTask_Dft_Component_outputs_outputColumn_src
As
Select
    T1.ControlFlowDetailsRowID
  , T1.RowID
  , T1.DftComponentId
  , T1.refId
  , output_refId                      = outputnodes.x.value ( '@refId[1]', 'varchar(max)' )
  , output_name                       = outputnodes.x.value ( '@name[1]', 'varchar(500)' )
  , output_isErrorOut                 = outputnodes.x.value ( '@isErrorOut[1]', 'bit' )
  , Column_refId                      = columsnodes.x.value ( '@refId[1]', 'varchar(max)' )
  , Column_name                       = columsnodes.x.value ( '@name[1]', 'varchar(max)' )
  , Column_dataType                   = columsnodes.x.value ( '@dataType[1]', 'varchar(100)' )
  , Column_length                     = columsnodes.x.value ( '@length[1]', 'int' )
  , Column_precision                  = columsnodes.x.value ( '@precision[1]', 'int' )
  , Column_scale                      = columsnodes.x.value ( '@scale[1]', 'int' )
  , Column_errorOrTruncationOperation = columsnodes.x.value ( '@errorOrTruncationOperation[1]', 'varchar(100)' )
  , Column_errorRowDisposition        = columsnodes.x.value ( '@errorRowDisposition[1]', 'varchar(100)' )
  , Column_externalMetadataColumnId   = columsnodes.x.value ( '@externalMetadataColumnId[1]', 'varchar(max)' )
  , Column_lineageId                  = columsnodes.x.value ( '@lineageId[1]', 'varchar(max)' )
  , Column_truncationRowDisposition   = columsnodes.x.value ( '@truncationRowDisposition[1]', 'varchar(max)' )

  -- to check the nodes content:
  , nodescontent                      = outputnodes.x.query ( '.' )
  , columnscontent                    = columsnodes.x.query ( '.' )
From
    ssis_t.TblTask_Dft_Component                      As T1
    Cross Apply T1.outputsQry.nodes ( './outputs/*' ) As outputnodes(x)
    Outer Apply outputnodes.x.nodes ( './outputColumns/*' ) As columsnodes(x)
Where
    --some outputs are without outputColumns
    Not columsnodes.x.value ( '@refId[1]', 'varchar(max)' ) Is Null
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f4c5e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_outputColumn_src', @level2type = N'COLUMN', @level2name = N'columnscontent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e09b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_outputColumn_src', @level2type = N'COLUMN', @level2name = N'nodescontent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f3c5e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_outputColumn_src', @level2type = N'COLUMN', @level2name = N'Column_truncationRowDisposition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f2c5e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_outputColumn_src', @level2type = N'COLUMN', @level2name = N'Column_lineageId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f1c5e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_outputColumn_src', @level2type = N'COLUMN', @level2name = N'Column_externalMetadataColumnId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f0c5e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_outputColumn_src', @level2type = N'COLUMN', @level2name = N'Column_errorRowDisposition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'efc5e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_outputColumn_src', @level2type = N'COLUMN', @level2name = N'Column_errorOrTruncationOperation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eec5e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_outputColumn_src', @level2type = N'COLUMN', @level2name = N'Column_scale';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'edc5e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_outputColumn_src', @level2type = N'COLUMN', @level2name = N'Column_precision';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ecc5e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_outputColumn_src', @level2type = N'COLUMN', @level2name = N'Column_length';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ebc5e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_outputColumn_src', @level2type = N'COLUMN', @level2name = N'Column_dataType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eac5e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_outputColumn_src', @level2type = N'COLUMN', @level2name = N'Column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e9c5e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_outputColumn_src', @level2type = N'COLUMN', @level2name = N'Column_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd49b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_outputColumn_src', @level2type = N'COLUMN', @level2name = N'output_isErrorOut';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd39b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_outputColumn_src', @level2type = N'COLUMN', @level2name = N'output_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd29b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_outputColumn_src', @level2type = N'COLUMN', @level2name = N'output_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd19b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_outputColumn_src', @level2type = N'COLUMN', @level2name = N'refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd09b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_outputColumn_src', @level2type = N'COLUMN', @level2name = N'DftComponentId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cf9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_outputColumn_src', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ce9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_outputColumn_src', @level2type = N'COLUMN', @level2name = N'ControlFlowDetailsRowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b3dcad7f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_outputColumn_src';

