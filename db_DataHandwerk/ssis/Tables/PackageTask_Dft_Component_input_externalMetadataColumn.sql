CREATE TABLE [ssis].[PackageTask_Dft_Component_input_externalMetadataColumn] (
    [AntoraModule]                     VARCHAR (50)   NOT NULL,
    [PackageName]                      VARCHAR (200)  NULL,
    [Component_refId]                  VARCHAR (MAX)  NULL,
    [input_refId]                      VARCHAR (MAX)  NULL,
    [input_errorOrTruncationOperation] VARCHAR (100)  NULL,
    [input_errorRowDisposition]        VARCHAR (100)  NULL,
    [input_hasSideEffects]             BIT            NULL,
    [input_name]                       VARCHAR (500)  NULL,
    [externalMetadataColumns_isused]   BIT            NULL,
    [Column_refId]                     VARCHAR (MAX)  NULL,
    [Column_name]                      VARCHAR (MAX)  NULL,
    [Column_dataType]                  VARCHAR (100)  NULL,
    [Column_length]                    INT            NULL,
    [Column_precision]                 INT            NULL,
    [Column_scale]                     INT            NULL,
    [TaskPath]                         VARCHAR (8000) NULL,
    [ControlFlowDetailsRowID]          INT            NOT NULL
)
WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd39c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_input_externalMetadataColumn', @level2type = N'COLUMN', @level2name = N'ControlFlowDetailsRowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd29c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_input_externalMetadataColumn', @level2type = N'COLUMN', @level2name = N'TaskPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd19c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_input_externalMetadataColumn', @level2type = N'COLUMN', @level2name = N'Column_scale';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd09c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_input_externalMetadataColumn', @level2type = N'COLUMN', @level2name = N'Column_precision';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cf9c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_input_externalMetadataColumn', @level2type = N'COLUMN', @level2name = N'Column_length';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ce9c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_input_externalMetadataColumn', @level2type = N'COLUMN', @level2name = N'Column_dataType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cd9c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_input_externalMetadataColumn', @level2type = N'COLUMN', @level2name = N'Column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cc9c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_input_externalMetadataColumn', @level2type = N'COLUMN', @level2name = N'Column_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cb9c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_input_externalMetadataColumn', @level2type = N'COLUMN', @level2name = N'externalMetadataColumns_isused';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ca9c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_input_externalMetadataColumn', @level2type = N'COLUMN', @level2name = N'input_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c99c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_input_externalMetadataColumn', @level2type = N'COLUMN', @level2name = N'input_hasSideEffects';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c89c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_input_externalMetadataColumn', @level2type = N'COLUMN', @level2name = N'input_errorRowDisposition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c79c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_input_externalMetadataColumn', @level2type = N'COLUMN', @level2name = N'input_errorOrTruncationOperation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c69c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_input_externalMetadataColumn', @level2type = N'COLUMN', @level2name = N'input_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c59c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_input_externalMetadataColumn', @level2type = N'COLUMN', @level2name = N'Component_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c49c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_input_externalMetadataColumn', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c39c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_input_externalMetadataColumn', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0c32c7d6-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_input_externalMetadataColumn';

