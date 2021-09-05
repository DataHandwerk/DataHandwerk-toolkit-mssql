CREATE TABLE [ssas].[TMSCHEMA_PERSPECTIVE_COLUMNS] (
    [databasename]       NVARCHAR (128) CONSTRAINT [DF_TMSCHEMA_PERSPECTIVE_COLUMNS_databasename] DEFAULT (N'mydatabase') NOT NULL,
    [ID]                 NUMERIC (20)   NOT NULL,
    [PerspectiveTableID] NUMERIC (20)   NOT NULL,
    [ColumnID]           NUMERIC (20)   NOT NULL,
    [ModifiedTime]       DATETIME       NOT NULL,
    CONSTRAINT [PK_TMSCHEMA_PERSPECTIVE_COLUMNS] PRIMARY KEY CLUSTERED ([databasename] ASC, [ID] ASC)
);




GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'afe6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_COLUMNS', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_PERSPECTIVE_COLUMNS_databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b0e6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_COLUMNS', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_PERSPECTIVE_COLUMNS';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a5c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_COLUMNS', @level2type = N'COLUMN', @level2name = N'ModifiedTime';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a4c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_COLUMNS', @level2type = N'COLUMN', @level2name = N'ColumnID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a3c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_COLUMNS', @level2type = N'COLUMN', @level2name = N'PerspectiveTableID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a2c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_COLUMNS', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a1c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_COLUMNS', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'aee6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_COLUMNS';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_COLUMNS', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_PERSPECTIVE_COLUMNS';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_COLUMNS', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_PERSPECTIVE_COLUMNS';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_COLUMNS', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_PERSPECTIVE_COLUMNS_databasename';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_COLUMNS', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_PERSPECTIVE_COLUMNS_databasename';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'databasename,ID', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_COLUMNS';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'nvarchar(128),numeric(20, 0)', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_COLUMNS';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'B0E6A70A-8A06-EC11-8515-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_COLUMNS';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_COLUMNS';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_COLUMNS';

