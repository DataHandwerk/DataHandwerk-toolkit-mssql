CREATE TABLE [ssis].[PackageTask_Dft_Component_output_outputcolumn] (
    [AntoraModule]                      VARCHAR (50)   NOT NULL,
    [PackageName]                       VARCHAR (200)  NULL,
    [Component_refId]                   VARCHAR (MAX)  NULL,
    [output_refId]                      VARCHAR (MAX)  NULL,
    [output_name]                       VARCHAR (500)  NULL,
    [output_isErrorOut]                 BIT            NULL,
    [Column_refId]                      VARCHAR (MAX)  NULL,
    [Column_name]                       VARCHAR (MAX)  NULL,
    [Column_dataType]                   VARCHAR (100)  NULL,
    [Column_length]                     INT            NULL,
    [Column_precision]                  INT            NULL,
    [Column_scale]                      INT            NULL,
    [Column_errorOrTruncationOperation] VARCHAR (100)  NULL,
    [Column_errorRowDisposition]        VARCHAR (100)  NULL,
    [Column_externalMetadataColumnId]   VARCHAR (MAX)  NULL,
    [Column_lineageId]                  VARCHAR (MAX)  NULL,
    [Column_truncationRowDisposition]   VARCHAR (MAX)  NULL,
    [TaskPath]                          VARCHAR (8000) NULL,
    [ControlFlowDetailsRowID]           INT            NOT NULL
)
WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0e9d17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_outputcolumn', @level2type = N'COLUMN', @level2name = N'ControlFlowDetailsRowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0d9d17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_outputcolumn', @level2type = N'COLUMN', @level2name = N'TaskPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0c9d17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_outputcolumn', @level2type = N'COLUMN', @level2name = N'Column_truncationRowDisposition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0b9d17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_outputcolumn', @level2type = N'COLUMN', @level2name = N'Column_lineageId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0a9d17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_outputcolumn', @level2type = N'COLUMN', @level2name = N'Column_externalMetadataColumnId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '099d17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_outputcolumn', @level2type = N'COLUMN', @level2name = N'Column_errorRowDisposition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '089d17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_outputcolumn', @level2type = N'COLUMN', @level2name = N'Column_errorOrTruncationOperation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '079d17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_outputcolumn', @level2type = N'COLUMN', @level2name = N'Column_scale';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '069d17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_outputcolumn', @level2type = N'COLUMN', @level2name = N'Column_precision';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '059d17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_outputcolumn', @level2type = N'COLUMN', @level2name = N'Column_length';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '049d17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_outputcolumn', @level2type = N'COLUMN', @level2name = N'Column_dataType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '039d17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_outputcolumn', @level2type = N'COLUMN', @level2name = N'Column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '029d17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_outputcolumn', @level2type = N'COLUMN', @level2name = N'Column_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '019d17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_outputcolumn', @level2type = N'COLUMN', @level2name = N'output_isErrorOut';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '009d17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_outputcolumn', @level2type = N'COLUMN', @level2name = N'output_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ff9c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_outputcolumn', @level2type = N'COLUMN', @level2name = N'output_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fe9c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_outputcolumn', @level2type = N'COLUMN', @level2name = N'Component_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fd9c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_outputcolumn', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fc9c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_outputcolumn', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '1032c7d6-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_outputcolumn';

