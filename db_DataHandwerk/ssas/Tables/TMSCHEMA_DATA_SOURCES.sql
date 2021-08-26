CREATE TABLE [ssas].[TMSCHEMA_DATA_SOURCES] (
    [databasename]      NVARCHAR (128) CONSTRAINT [DF_TMSCHEMA_DATA_SOURCES_database] DEFAULT (N'mydatabase') NOT NULL,
    [ID]                NUMERIC (20)   NOT NULL,
    [ModelID]           NUMERIC (20)   NOT NULL,
    [Name]              NTEXT          NOT NULL,
    [Description]       NTEXT          NULL,
    [Type]              BIGINT         NOT NULL,
    [ConnectionString]  NTEXT          NOT NULL,
    [ImpersonationMode] BIGINT         NOT NULL,
    [Account]           NTEXT          NULL,
    [Password]          NTEXT          NULL,
    [MaxConnections]    INT            NOT NULL,
    [Isolation]         BIGINT         NOT NULL,
    [Timeout]           INT            NOT NULL,
    [Provider]          NTEXT          NULL,
    [ModifiedTime]      DATETIME       NOT NULL,
    [ConnectionDetails] NTEXT          NULL,
    [Options]           NTEXT          NULL,
    [Credential]        NTEXT          NULL,
    [ContextExpression] NTEXT          NULL,
    CONSTRAINT [PK_TMSCHEMA_DATA_SOURCES] PRIMARY KEY CLUSTERED ([databasename] ASC, [ID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'dce6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DATA_SOURCES', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_DATA_SOURCES_database';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'dde6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DATA_SOURCES', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_DATA_SOURCES';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '32c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DATA_SOURCES', @level2type = N'COLUMN', @level2name = N'ContextExpression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '31c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DATA_SOURCES', @level2type = N'COLUMN', @level2name = N'Credential';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '30c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DATA_SOURCES', @level2type = N'COLUMN', @level2name = N'Options';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2fc70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DATA_SOURCES', @level2type = N'COLUMN', @level2name = N'ConnectionDetails';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2ec70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DATA_SOURCES', @level2type = N'COLUMN', @level2name = N'ModifiedTime';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2dc70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DATA_SOURCES', @level2type = N'COLUMN', @level2name = N'Provider';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2cc70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DATA_SOURCES', @level2type = N'COLUMN', @level2name = N'Timeout';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2bc70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DATA_SOURCES', @level2type = N'COLUMN', @level2name = N'Isolation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2ac70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DATA_SOURCES', @level2type = N'COLUMN', @level2name = N'MaxConnections';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '29c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DATA_SOURCES', @level2type = N'COLUMN', @level2name = N'Password';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '28c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DATA_SOURCES', @level2type = N'COLUMN', @level2name = N'Account';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '27c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DATA_SOURCES', @level2type = N'COLUMN', @level2name = N'ImpersonationMode';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '26c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DATA_SOURCES', @level2type = N'COLUMN', @level2name = N'ConnectionString';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '25c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DATA_SOURCES', @level2type = N'COLUMN', @level2name = N'Type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '24c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DATA_SOURCES', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '23c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DATA_SOURCES', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '22c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DATA_SOURCES', @level2type = N'COLUMN', @level2name = N'ModelID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '21c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DATA_SOURCES', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '20c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DATA_SOURCES', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'dbe6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DATA_SOURCES';

