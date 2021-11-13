CREATE TABLE [ssis_t].[PackageAnalysis] (
    [TableRowID]                    INT            IDENTITY (1, 1) NOT NULL,
    [PackageSequenceNo]             INT            NULL,
    [SequenceNo]                    INT            NULL,
    [RowID]                         INT            NULL,
    [PackagePath]                   VARCHAR (5000) NULL,
    [PackageName]                   VARCHAR (MAX)  NULL,
    [Category]                      VARCHAR (1000) NULL,
    [PackageCreatorName]            VARCHAR (1000) NULL,
    [PackageProtectionLevel]        VARCHAR (100)  NULL,
    [TaskPath]                      VARCHAR (MAX)  NULL,
    [ObjectName]                    VARCHAR (500)  NULL,
    [ObjectType]                    VARCHAR (MAX)  NULL,
    [ObjectTypeDescription]         VARCHAR (MAX)  NULL,
    [DelayValidationPropertyValue]  VARCHAR (10)   NULL,
    [ObjectValue]                   VARCHAR (MAX)  NULL,
    [ExpressionValue]               VARCHAR (5000) NULL,
    [ConnectionManager]             VARCHAR (5000) NULL,
    [SourceColumn]                  VARCHAR (5000) NULL,
    [DestinationColumn]             VARCHAR (5000) NULL,
    [SortKeyPosition]               VARCHAR (10)   NULL,
    [DerivedValue]                  VARCHAR (5000) NULL,
    [IsDisabled]                    VARCHAR (10)   NULL,
    [ResultSetParameterName]        VARCHAR (1000) NULL,
    [ParameterBindingSequence]      VARCHAR (1000) NULL,
    [ParameterBindingParameterName] VARCHAR (1000) NULL,
    [ExecutePackageExpression]      VARCHAR (8000) NULL,
    [ExecutedPackageName]           VARCHAR (8000) NULL,
    [ExecutePackageConnection]      VARCHAR (8000) NULL,
    [Script]                        VARCHAR (MAX)  NULL,
    [Variable]                      VARCHAR (1000) NULL,
    [ConnectionManagerID]           VARCHAR (100)  NULL,
    [LookupJoins]                   VARCHAR (8000) NULL,
    [IsSortedProperty]              VARCHAR (10)   NULL,
    [MultihashcolumnSortPosition]   VARCHAR (MAX)  NULL,
    [RetainSameConnectionProperty]  VARCHAR (100)  NULL
);


GO
CREATE NONCLUSTERED INDEX [NCIX]
    ON [ssis_t].[PackageAnalysis]([RowID] ASC, [SequenceNo] ASC);


GO
CREATE CLUSTERED INDEX [CX_ControlFlow]
    ON [ssis_t].[PackageAnalysis]([TableRowID] ASC) WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '40fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'RetainSameConnectionProperty';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3ffad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'MultihashcolumnSortPosition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3efad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'IsSortedProperty';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3dfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'LookupJoins';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3cfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'ConnectionManagerID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3bfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'Variable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3afad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'Script';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '39fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'ExecutePackageConnection';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '38fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'ExecutedPackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '37fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'ExecutePackageExpression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '36fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'ParameterBindingParameterName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '35fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'ParameterBindingSequence';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '34fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'ResultSetParameterName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '33fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'IsDisabled';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '32fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'DerivedValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '31fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'SortKeyPosition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '30fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'DestinationColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2ffad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'SourceColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2efad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'ConnectionManager';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2dfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'ExpressionValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2cfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'ObjectValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2bfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'DelayValidationPropertyValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2afad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'ObjectTypeDescription';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '29fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'ObjectType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '28fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'ObjectName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '27fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'TaskPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '26fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'PackageProtectionLevel';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '25fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'PackageCreatorName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '24fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'Category';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '23fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '22fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'PackagePath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '21fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '20fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'SequenceNo';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1ffad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'PackageSequenceNo';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1efad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis', @level2type = N'COLUMN', @level2name = N'TableRowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5764fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'PackageAnalysis';

