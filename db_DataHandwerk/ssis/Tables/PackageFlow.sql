CREATE TABLE [ssis].[PackageFlow] (
    [AntoraModule]   VARCHAR (50)     NOT NULL,
    [PackageName]    VARCHAR (200)    NOT NULL,
    [TaskFrom]       VARCHAR (2000)   NOT NULL,
    [Taskto]         VARCHAR (2000)   NOT NULL,
    [FlowType]       VARCHAR (1000)   NULL,
    [LogicalAnd]     BIT              NULL,
    [ObjectName]     NVARCHAR (MAX)   NULL,
    [CreationName]   NVARCHAR (MAX)   NULL,
    [DTSID]          UNIQUEIDENTIFIER NULL,
    [EvalOp]         INT              NULL,
    [Expression]     NVARCHAR (MAX)   NULL,
    [TaskFromLevel]  AS               (len([TaskFrom])-len(replace([TaskFrom],'\',''))) PERSISTED,
    [TaskFromParent] AS               (substring([TaskFrom],(1),len([TaskFrom])-charindex('\',reverse([TaskFrom])))) PERSISTED,
    [TaskToLevel]    AS               (len([TaskTo])-len(replace([TaskTo],'\',''))) PERSISTED,
    [TaskToParent]   AS               (substring([TaskTo],(1),len([TaskTo])-charindex('\',reverse([TaskTo])))) PERSISTED
)
WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7f9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageFlow', @level2type = N'COLUMN', @level2name = N'TaskToParent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7e9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageFlow', @level2type = N'COLUMN', @level2name = N'TaskToLevel';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7d9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageFlow', @level2type = N'COLUMN', @level2name = N'TaskFromParent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7c9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageFlow', @level2type = N'COLUMN', @level2name = N'TaskFromLevel';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c2f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageFlow', @level2type = N'COLUMN', @level2name = N'Expression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c1f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageFlow', @level2type = N'COLUMN', @level2name = N'EvalOp';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c0f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageFlow', @level2type = N'COLUMN', @level2name = N'DTSID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bff9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageFlow', @level2type = N'COLUMN', @level2name = N'CreationName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bef9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageFlow', @level2type = N'COLUMN', @level2name = N'ObjectName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bdf9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageFlow', @level2type = N'COLUMN', @level2name = N'LogicalAnd';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bcf9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageFlow', @level2type = N'COLUMN', @level2name = N'FlowType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b9f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageFlow', @level2type = N'COLUMN', @level2name = N'Taskto';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b8f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageFlow', @level2type = N'COLUMN', @level2name = N'TaskFrom';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ede3c11b-183b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageFlow', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'baf9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageFlow', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5c64fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageFlow';

