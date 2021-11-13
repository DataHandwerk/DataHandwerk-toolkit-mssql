CREATE View [ssis].[PackageTask_Dft_Component_output_outputcolumn_src]
As
Select
    p.AntoraModule
  , p.PackageName
  , Component_refId = T3.refId
  , T3.output_refId
  , T3.output_name
  , T3.output_isErrorOut
  , T3.Column_refId
  , T3.Column_name
  , T3.Column_dataType
  , T3.Column_length
  , T3.Column_precision
  , T3.Column_scale
  , T3.Column_errorOrTruncationOperation
  , T3.Column_errorRowDisposition
  , T3.Column_externalMetadataColumnId
  , T3.Column_lineageId
  , T3.Column_truncationRowDisposition
  , T2.TaskPath
  , T3.ControlFlowDetailsRowID
From
    ssis.Package_src                                          As p
    Inner Join
        ssis_t.TblControlFlow                                 As T2
            On
            p.RowID                    = T2.RowID

    Inner Join
        ssis_t.TblTask_Dft_Component_outputs_outputColumn_src As T3
            On
            T3.ControlFlowDetailsRowID = T2.ControlFlowDetailsRowID
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '44c6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_output_outputcolumn_src', @level2type = N'COLUMN', @level2name = N'ControlFlowDetailsRowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '43c6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_output_outputcolumn_src', @level2type = N'COLUMN', @level2name = N'TaskPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '42c6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_output_outputcolumn_src', @level2type = N'COLUMN', @level2name = N'Column_truncationRowDisposition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '41c6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_output_outputcolumn_src', @level2type = N'COLUMN', @level2name = N'Column_lineageId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '40c6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_output_outputcolumn_src', @level2type = N'COLUMN', @level2name = N'Column_externalMetadataColumnId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3fc6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_output_outputcolumn_src', @level2type = N'COLUMN', @level2name = N'Column_errorRowDisposition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3ec6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_output_outputcolumn_src', @level2type = N'COLUMN', @level2name = N'Column_errorOrTruncationOperation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3dc6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_output_outputcolumn_src', @level2type = N'COLUMN', @level2name = N'Column_scale';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3cc6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_output_outputcolumn_src', @level2type = N'COLUMN', @level2name = N'Column_precision';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3bc6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_output_outputcolumn_src', @level2type = N'COLUMN', @level2name = N'Column_length';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3ac6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_output_outputcolumn_src', @level2type = N'COLUMN', @level2name = N'Column_dataType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '39c6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_output_outputcolumn_src', @level2type = N'COLUMN', @level2name = N'Column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '38c6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_output_outputcolumn_src', @level2type = N'COLUMN', @level2name = N'Column_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '37c6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_output_outputcolumn_src', @level2type = N'COLUMN', @level2name = N'output_isErrorOut';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '36c6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_output_outputcolumn_src', @level2type = N'COLUMN', @level2name = N'output_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '35c6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_output_outputcolumn_src', @level2type = N'COLUMN', @level2name = N'output_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '34c6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_output_outputcolumn_src', @level2type = N'COLUMN', @level2name = N'Component_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '33c6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_output_outputcolumn_src', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '32c6e0cf-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_output_outputcolumn_src', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '78cc7fc6-cf3f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_output_outputcolumn_src';

