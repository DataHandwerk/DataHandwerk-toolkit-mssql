

CREATE View [ssis_t].[TblTask_Dft_Component_outputs_externalMetadataColumn_src]
As
Select
    T1.ControlFlowDetailsRowID
  , T1.RowID
  , T1.DftComponentId
  , T1.refId
  , output_refId                      = outputnodes.x.value ( '@refId[1]', 'varchar(max)' )
  , output_name                       = outputnodes.x.value ( '@name[1]', 'varchar(500)' )
  , externalMetadataColumns_isused    = outputnodes.x.value ( 'data(./externalMetadataColumns/@isUsed)[1]', 'bit' )
  , Column_refId                      = columsnodes.x.value ( '@refId[1]', 'varchar(max)' )
  , Column_name                       = columsnodes.x.value ( '@name[1]', 'varchar(max)' )
  , Column_dataType                   = columsnodes.x.value ( '@dataType[1]', 'varchar(100)' )
  , Column_length                     = columsnodes.x.value ( '@length[1]', 'int' )
  , Column_precision                  = columsnodes.x.value ( '@precision[1]', 'int' )
  , Column_scale                      = columsnodes.x.value ( '@scale[1]', 'int' )
  --, Column_errorOrTruncationOperation = columsnodes.x.value ( '@errorOrTruncationOperation[1]', 'varchar(100)' )
  --, Column_errorRowDisposition        = columsnodes.x.value ( '@errorRowDisposition[1]', 'varchar(100)' )
  --, Column_externalMetadataColumnId   = columsnodes.x.value ( '@externalMetadataColumnId[1]', 'varchar(max)' )
  --, Column_lineageId                  = columsnodes.x.value ( '@lineageId[1]', 'varchar(max)' )
  --, Column_truncationRowDisposition   = columsnodes.x.value ( '@truncationRowDisposition[1]', 'varchar(max)' )

  -- to check the nodes content:
  , nodescontent                      = outputnodes.x.query ( '.' )
  , columnscontent                    = columsnodes.x.query ( '.' )
From
    ssis_t.TblTask_Dft_Component                      As T1
    Cross Apply T1.outputsQry.nodes ( './outputs/*' ) As outputnodes(x)
    Outer Apply outputnodes.x.nodes ( './externalMetadataColumns/*' ) As columsnodes(x)
Where
    --some outputs are without externalMetadataColumns
    Not columsnodes.x.value ( '@refId[1]', 'varchar(max)' ) Is Null
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fbc5e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_externalMetadataColumn_src', @level2type = N'COLUMN', @level2name = N'columnscontent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f49b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_externalMetadataColumn_src', @level2type = N'COLUMN', @level2name = N'nodescontent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fac5e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_externalMetadataColumn_src', @level2type = N'COLUMN', @level2name = N'Column_scale';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f9c5e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_externalMetadataColumn_src', @level2type = N'COLUMN', @level2name = N'Column_precision';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f8c5e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_externalMetadataColumn_src', @level2type = N'COLUMN', @level2name = N'Column_length';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f7c5e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_externalMetadataColumn_src', @level2type = N'COLUMN', @level2name = N'Column_dataType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f6c5e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_externalMetadataColumn_src', @level2type = N'COLUMN', @level2name = N'Column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f5c5e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_externalMetadataColumn_src', @level2type = N'COLUMN', @level2name = N'Column_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e89b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_externalMetadataColumn_src', @level2type = N'COLUMN', @level2name = N'externalMetadataColumns_isused';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e69b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_externalMetadataColumn_src', @level2type = N'COLUMN', @level2name = N'output_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e59b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_externalMetadataColumn_src', @level2type = N'COLUMN', @level2name = N'output_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e49b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_externalMetadataColumn_src', @level2type = N'COLUMN', @level2name = N'refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e39b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_externalMetadataColumn_src', @level2type = N'COLUMN', @level2name = N'DftComponentId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e29b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_externalMetadataColumn_src', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e19b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_externalMetadataColumn_src', @level2type = N'COLUMN', @level2name = N'ControlFlowDetailsRowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b4dcad7f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_outputs_externalMetadataColumn_src';

