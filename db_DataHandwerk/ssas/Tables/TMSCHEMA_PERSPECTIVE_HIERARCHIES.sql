CREATE TABLE [ssas].[TMSCHEMA_PERSPECTIVE_HIERARCHIES] (
    [databasename]       NVARCHAR (128) CONSTRAINT [DF_TMSCHEMA_PERSPECTIVE_HIERARCHIES_databasename] DEFAULT (N'mydatabase') NOT NULL,
    [ID]                 NUMERIC (20)   NOT NULL,
    [PerspectiveTableID] NUMERIC (20)   NOT NULL,
    [HierarchyID]        NUMERIC (20)   NOT NULL,
    [ModifiedTime]       DATETIME       NOT NULL,
    CONSTRAINT [PK_TMSCHEMA_PERSPECTIVE_HIERARCHIES] PRIMARY KEY CLUSTERED ([databasename] ASC, [ID] ASC)
);




GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b2e6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_HIERARCHIES', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_PERSPECTIVE_HIERARCHIES_databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b3e6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_HIERARCHIES', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_PERSPECTIVE_HIERARCHIES';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aac60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_HIERARCHIES', @level2type = N'COLUMN', @level2name = N'ModifiedTime';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a9c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_HIERARCHIES', @level2type = N'COLUMN', @level2name = N'HierarchyID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a8c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_HIERARCHIES', @level2type = N'COLUMN', @level2name = N'PerspectiveTableID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a7c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_HIERARCHIES', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a6c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_HIERARCHIES', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b1e6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_HIERARCHIES';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_HIERARCHIES', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_PERSPECTIVE_HIERARCHIES';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_HIERARCHIES', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_PERSPECTIVE_HIERARCHIES';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_HIERARCHIES', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_PERSPECTIVE_HIERARCHIES_databasename';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_HIERARCHIES', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_PERSPECTIVE_HIERARCHIES_databasename';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'databasename,ID', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_HIERARCHIES';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'nvarchar(128),numeric(20, 0)', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_HIERARCHIES';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'B3E6A70A-8A06-EC11-8515-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_HIERARCHIES';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_HIERARCHIES';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVE_HIERARCHIES';

