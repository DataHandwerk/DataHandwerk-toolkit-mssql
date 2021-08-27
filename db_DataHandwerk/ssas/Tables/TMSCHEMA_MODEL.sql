CREATE TABLE [ssas].[TMSCHEMA_MODEL] (
    [databasename]          NVARCHAR (128) CONSTRAINT [DF_TMSCHEMA_MODEL_databasename] DEFAULT (N'mydatabase') NOT NULL,
    [ID]                    NUMERIC (20)   NOT NULL,
    [Name]                  NVARCHAR (MAX) NOT NULL,
    [Description]           NVARCHAR (MAX) NULL,
    [StorageLocation]       NVARCHAR (MAX) NULL,
    [DefaultMode]           BIGINT         NOT NULL,
    [DefaultDataView]       BIGINT         NOT NULL,
    [Culture]               NVARCHAR (MAX) NOT NULL,
    [Collation]             NVARCHAR (MAX) NULL,
    [ModifiedTime]          DATETIME       NOT NULL,
    [StructureModifiedTime] DATETIME       NOT NULL,
    [Version]               BIGINT         NOT NULL,
    [DataAccessOptions]     NVARCHAR (MAX) NULL,
    [DefaultMeasureID]      NUMERIC (20)   NULL,
    CONSTRAINT [PK_TMSCHEMA_MODEL] PRIMARY KEY CLUSTERED ([databasename] ASC, [ID] ASC)
);




GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a9e6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MODEL', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_MODEL_databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'aae6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MODEL', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_MODEL';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '98c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MODEL', @level2type = N'COLUMN', @level2name = N'DefaultMeasureID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '97c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MODEL', @level2type = N'COLUMN', @level2name = N'DataAccessOptions';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '96c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MODEL', @level2type = N'COLUMN', @level2name = N'Version';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '95c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MODEL', @level2type = N'COLUMN', @level2name = N'StructureModifiedTime';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '94c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MODEL', @level2type = N'COLUMN', @level2name = N'ModifiedTime';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '93c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MODEL', @level2type = N'COLUMN', @level2name = N'Collation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '92c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MODEL', @level2type = N'COLUMN', @level2name = N'Culture';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '91c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MODEL', @level2type = N'COLUMN', @level2name = N'DefaultDataView';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '90c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MODEL', @level2type = N'COLUMN', @level2name = N'DefaultMode';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8fc60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MODEL', @level2type = N'COLUMN', @level2name = N'StorageLocation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8ec60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MODEL', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8dc60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MODEL', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8cc60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MODEL', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8bc60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MODEL', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a8e6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MODEL';

