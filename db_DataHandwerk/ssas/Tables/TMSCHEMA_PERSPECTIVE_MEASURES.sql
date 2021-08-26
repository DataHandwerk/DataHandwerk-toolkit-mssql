CREATE TABLE [ssas].[TMSCHEMA_PERSPECTIVE_MEASURES] (
    [databasename]       NVARCHAR (128) CONSTRAINT [DF_TMSCHEMA_PERSPECTIVE_MEASURES_databasename] DEFAULT (N'mydatabase') NOT NULL,
    [ID]                 NUMERIC (20)   NOT NULL,
    [PerspectiveTableID] NUMERIC (20)   NOT NULL,
    [MeasureID]          NUMERIC (20)   NOT NULL,
    [ModifiedTime]       DATETIME       NOT NULL,
    CONSTRAINT [PK_TMSCHEMA_PERSPECTIVE_MEASURES] PRIMARY KEY CLUSTERED ([databasename] ASC, [ID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b5e6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_MEASURES', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_PERSPECTIVE_MEASURES_databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b6e6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_MEASURES', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_PERSPECTIVE_MEASURES';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'afc60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_MEASURES', @level2type = N'COLUMN', @level2name = N'ModifiedTime';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aec60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_MEASURES', @level2type = N'COLUMN', @level2name = N'MeasureID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'adc60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_MEASURES', @level2type = N'COLUMN', @level2name = N'PerspectiveTableID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'acc60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_MEASURES', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'abc60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_MEASURES', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b4e6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_MEASURES';

