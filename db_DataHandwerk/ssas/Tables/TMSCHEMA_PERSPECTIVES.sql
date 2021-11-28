CREATE TABLE [ssas].[TMSCHEMA_PERSPECTIVES] (
    [databasename] NVARCHAR (128) CONSTRAINT [DF_TMSCHEMA_PERSPECTIVES_databasename] DEFAULT (N'mydatabase') NOT NULL,
    [ID]           NUMERIC (20)   NOT NULL,
    [ModelID]      NUMERIC (20)   NOT NULL,
    [Name]         NVARCHAR (MAX) NOT NULL,
    [Description]  NVARCHAR (MAX) NULL,
    [ModifiedTime] DATETIME       NOT NULL,
    CONSTRAINT [PK_TMSCHEMA_PERSPECTIVES] PRIMARY KEY CLUSTERED ([databasename] ASC, [ID] ASC) WITH (DATA_COMPRESSION = PAGE)
);








GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'bbe6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVES', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_PERSPECTIVES_databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'bce6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVES', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_PERSPECTIVES';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bbc60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVES', @level2type = N'COLUMN', @level2name = N'ModifiedTime';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bac60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVES', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b9c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVES', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b8c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVES', @level2type = N'COLUMN', @level2name = N'ModelID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b7c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVES', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b6c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVES', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'bae6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVES';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVES', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_PERSPECTIVES';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVES', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_PERSPECTIVES';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVES', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_PERSPECTIVES_databasename';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVES', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_PERSPECTIVES_databasename';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'databasename,ID', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVES';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'nvarchar(128),numeric(20, 0)', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVES';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'BCE6A70A-8A06-EC11-8515-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVES';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVES';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_PERSPECTIVES';

