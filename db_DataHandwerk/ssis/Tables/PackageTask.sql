CREATE TABLE [ssis].[PackageTask] (
    [AntoraModule]                 VARCHAR (50)     NOT NULL,
    [PackageName]                  VARCHAR (200)    NOT NULL,
    [TaskPath]                     VARCHAR (8000)   NOT NULL,
    [TaskName]                     VARCHAR (2000)   NOT NULL,
    [ControlFlowDetailsRowID]      INT              NOT NULL,
    [TaskDescription]              VARCHAR (MAX)    NULL,
    [TaskType]                     VARCHAR (5000)   NULL,
    [IsDisabled]                   VARCHAR (10)     NULL,
    [DelayValidationPropertyValue] VARCHAR (100)    NULL,
    [ExpressionValue]              VARCHAR (5000)   NULL,
    [Script]                       VARCHAR (MAX)    NULL,
    [SqlConnection]                UNIQUEIDENTIFIER NULL,
    [SqlStatementSource]           NVARCHAR (MAX)   NULL,
    [ExecutePackageExpression]     VARCHAR (1000)   NULL,
    [ExecutedPackageName]          VARCHAR (1000)   NULL,
    [ExecutePackageConnection]     VARCHAR (1000)   NULL,
    [TaskPathLevel]                AS               (len([TaskPath])-len(replace([TaskPath],'\',''))) PERSISTED,
    [TaskPathParent]               AS               (substring([TaskPath],(1),len([TaskPath])-charindex('\',reverse([TaskPath])))) PERSISTED,
    [PackageBasename]              AS               (replace([PackageName],'.dtsx','')) PERSISTED
)
WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b1251c51-9f41-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask', @level2type = N'COLUMN', @level2name = N'PackageBasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8e9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask', @level2type = N'COLUMN', @level2name = N'TaskPathParent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8d9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask', @level2type = N'COLUMN', @level2name = N'TaskPathLevel';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dff9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask', @level2type = N'COLUMN', @level2name = N'ExecutePackageConnection';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'def9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask', @level2type = N'COLUMN', @level2name = N'ExecutedPackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ddf9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask', @level2type = N'COLUMN', @level2name = N'ExecutePackageExpression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dcf9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask', @level2type = N'COLUMN', @level2name = N'SqlStatementSource';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dbf9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask', @level2type = N'COLUMN', @level2name = N'SqlConnection';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'daf9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask', @level2type = N'COLUMN', @level2name = N'Script';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd9f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask', @level2type = N'COLUMN', @level2name = N'ExpressionValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd4f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask', @level2type = N'COLUMN', @level2name = N'DelayValidationPropertyValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd3f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask', @level2type = N'COLUMN', @level2name = N'IsDisabled';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd2f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask', @level2type = N'COLUMN', @level2name = N'TaskType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd1f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask', @level2type = N'COLUMN', @level2name = N'TaskDescription';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd0f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask', @level2type = N'COLUMN', @level2name = N'ControlFlowDetailsRowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cff9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask', @level2type = N'COLUMN', @level2name = N'TaskName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ccf9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask', @level2type = N'COLUMN', @level2name = N'TaskPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f2e3c11b-183b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cdf9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '6264fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask';

