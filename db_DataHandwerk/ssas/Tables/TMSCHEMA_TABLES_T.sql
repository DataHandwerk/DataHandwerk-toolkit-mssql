CREATE TABLE [ssas].[TMSCHEMA_TABLES_T] (
    [databasename]                  NVARCHAR (128)   CONSTRAINT [DF__TMSCHEMA___datab__56A9BBE0] DEFAULT (N'mydatabase') NOT NULL,
    [ID]                            NUMERIC (20)     NOT NULL,
    [DataCategory]                  NVARCHAR (MAX)   NULL,
    [DefaultDetailRowsDefinitionID] NUMERIC (20)     NULL,
    [Description]                   NVARCHAR (MAX)   NULL,
    [IsHidden]                      BIT              NOT NULL,
    [IsPrivate]                     BIT              NOT NULL,
    [ModelID]                       NUMERIC (20)     NOT NULL,
    [ModifiedTime]                  DATETIME         NOT NULL,
    [Name]                          NVARCHAR (MAX)   NOT NULL,
    [ShowAsVariationsOnly]          BIT              NOT NULL,
    [StructureModifiedTime]         DATETIME         NOT NULL,
    [SystemFlags]                   BIGINT           NOT NULL,
    [TableStorageID]                NUMERIC (20)     NOT NULL,
    [RepoObject_guid]               UNIQUEIDENTIFIER CONSTRAINT [DF_TMSCHEMA_TABLES_T_RepoObject_guid] DEFAULT (newsequentialid()) NOT NULL,
    CONSTRAINT [PK_TMSCHEMA_TABLES_T] PRIMARY KEY CLUSTERED ([databasename] ASC, [ID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '074559f6-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_TABLES_T', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_TABLES_T_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '064559f6-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_TABLES_T', @level2type = N'CONSTRAINT', @level2name = N'DF__TMSCHEMA___datab__56A9BBE0';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '084559f6-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_TABLES_T', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_TABLES_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a5f5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_TABLES_T', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '78c2f975-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_TABLES_T', @level2type = N'COLUMN', @level2name = N'TableStorageID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '71c2f975-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_TABLES_T', @level2type = N'COLUMN', @level2name = N'SystemFlags';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '70c2f975-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_TABLES_T', @level2type = N'COLUMN', @level2name = N'StructureModifiedTime';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '73c2f975-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_TABLES_T', @level2type = N'COLUMN', @level2name = N'ShowAsVariationsOnly';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6dc2f975-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_TABLES_T', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '75c2f975-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_TABLES_T', @level2type = N'COLUMN', @level2name = N'ModifiedTime';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6cc2f975-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_TABLES_T', @level2type = N'COLUMN', @level2name = N'ModelID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '72c2f975-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_TABLES_T', @level2type = N'COLUMN', @level2name = N'IsPrivate';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '77c2f975-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_TABLES_T', @level2type = N'COLUMN', @level2name = N'IsHidden';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '76c2f975-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_TABLES_T', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '74c2f975-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_TABLES_T', @level2type = N'COLUMN', @level2name = N'DefaultDetailRowsDefinitionID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '79c2f975-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_TABLES_T', @level2type = N'COLUMN', @level2name = N'DataCategory';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6fc2f975-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_TABLES_T', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6ec2f975-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_TABLES_T', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '6bc2f975-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_TABLES_T';

