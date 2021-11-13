CREATE TABLE [ssis].[ProjectConnection] (
    [AntoraModule]          VARCHAR (50)     NOT NULL,
    [ConnectionManagerID]   UNIQUEIDENTIFIER NOT NULL,
    [ConnectionManagerName] VARCHAR (MAX)    NOT NULL,
    [ConnectionManagerType] VARCHAR (MAX)    NULL,
    [ConnectionPath]        VARCHAR (8000)   NOT NULL,
    [ConnectionString]      NVARCHAR (MAX)   NULL,
    [ExpressionValue]       NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_ProjectConnection_1] PRIMARY KEY CLUSTERED ([AntoraModule] ASC, [ConnectionManagerID] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9b2381cd-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'ProjectConnection', @level2type = N'CONSTRAINT', @level2name = N'PK_ProjectConnection_1';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '79ddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'ProjectConnection', @level2type = N'COLUMN', @level2name = N'ExpressionValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '78ddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'ProjectConnection', @level2type = N'COLUMN', @level2name = N'ConnectionString';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '77ddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'ProjectConnection', @level2type = N'COLUMN', @level2name = N'ConnectionPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '76ddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'ProjectConnection', @level2type = N'COLUMN', @level2name = N'ConnectionManagerType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '74ddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'ProjectConnection', @level2type = N'COLUMN', @level2name = N'ConnectionManagerName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '75ddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'ProjectConnection', @level2type = N'COLUMN', @level2name = N'ConnectionManagerID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '73ddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'ProjectConnection', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '809a07f7-c23c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'ProjectConnection';

