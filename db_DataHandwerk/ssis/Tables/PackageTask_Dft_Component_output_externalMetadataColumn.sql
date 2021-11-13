CREATE TABLE [ssis].[PackageTask_Dft_Component_output_externalMetadataColumn] (
    [AntoraModule]                   VARCHAR (50)   NOT NULL,
    [PackageName]                    VARCHAR (200)  NULL,
    [Component_refId]                VARCHAR (MAX)  NULL,
    [output_refId]                   VARCHAR (MAX)  NULL,
    [output_name]                    VARCHAR (500)  NULL,
    [externalMetadataColumns_isused] BIT            NULL,
    [Column_refId]                   VARCHAR (MAX)  NULL,
    [Column_name]                    VARCHAR (MAX)  NULL,
    [Column_dataType]                VARCHAR (100)  NULL,
    [Column_length]                  INT            NULL,
    [Column_precision]               INT            NULL,
    [Column_scale]                   INT            NULL,
    [TaskPath]                       VARCHAR (8000) NULL,
    [ControlFlowDetailsRowID]        INT            NOT NULL
)
WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fb9c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_externalMetadataColumn', @level2type = N'COLUMN', @level2name = N'ControlFlowDetailsRowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fa9c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_externalMetadataColumn', @level2type = N'COLUMN', @level2name = N'TaskPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f99c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_externalMetadataColumn', @level2type = N'COLUMN', @level2name = N'Column_scale';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f89c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_externalMetadataColumn', @level2type = N'COLUMN', @level2name = N'Column_precision';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f79c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_externalMetadataColumn', @level2type = N'COLUMN', @level2name = N'Column_length';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f69c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_externalMetadataColumn', @level2type = N'COLUMN', @level2name = N'Column_dataType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f59c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_externalMetadataColumn', @level2type = N'COLUMN', @level2name = N'Column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f49c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_externalMetadataColumn', @level2type = N'COLUMN', @level2name = N'Column_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f39c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_externalMetadataColumn', @level2type = N'COLUMN', @level2name = N'externalMetadataColumns_isused';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f29c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_externalMetadataColumn', @level2type = N'COLUMN', @level2name = N'output_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f19c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_externalMetadataColumn', @level2type = N'COLUMN', @level2name = N'output_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f09c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_externalMetadataColumn', @level2type = N'COLUMN', @level2name = N'Component_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ef9c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_externalMetadataColumn', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ee9c17e2-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_externalMetadataColumn', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0f32c7d6-d13f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component_output_externalMetadataColumn';

