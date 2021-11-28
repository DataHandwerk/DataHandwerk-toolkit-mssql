CREATE TABLE [ssas].[TMSCHEMA_OBJECT_TRANSLATIONS] (
    [databasename] NVARCHAR (128) CONSTRAINT [DF_TMSCHEMA_OBJECT_TRANSLATIONS_databasename] DEFAULT (N'mydatabase') NOT NULL,
    [ID]           NUMERIC (20)   NOT NULL,
    [CultureID]    NUMERIC (20)   NOT NULL,
    [ObjectID]     NUMERIC (20)   NOT NULL,
    [ObjectType]   INT            NOT NULL,
    [Property]     BIGINT         NOT NULL,
    [Value]        NVARCHAR (MAX) NOT NULL,
    [ModifiedTime] DATETIME       NOT NULL,
    CONSTRAINT [PK_TMSCHEMA_OBJECT_TRANSLATIONS] PRIMARY KEY CLUSTERED ([databasename] ASC, [ID] ASC) WITH (DATA_COMPRESSION = PAGE)
);








GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ace6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_OBJECT_TRANSLATIONS', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_OBJECT_TRANSLATIONS_databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ade6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_OBJECT_TRANSLATIONS', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_OBJECT_TRANSLATIONS';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a0c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_OBJECT_TRANSLATIONS', @level2type = N'COLUMN', @level2name = N'ModifiedTime';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9fc60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_OBJECT_TRANSLATIONS', @level2type = N'COLUMN', @level2name = N'Value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9ec60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_OBJECT_TRANSLATIONS', @level2type = N'COLUMN', @level2name = N'Property';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9dc60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_OBJECT_TRANSLATIONS', @level2type = N'COLUMN', @level2name = N'ObjectType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9cc60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_OBJECT_TRANSLATIONS', @level2type = N'COLUMN', @level2name = N'ObjectID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9bc60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_OBJECT_TRANSLATIONS', @level2type = N'COLUMN', @level2name = N'CultureID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9ac60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_OBJECT_TRANSLATIONS', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '99c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_OBJECT_TRANSLATIONS', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'abe6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_OBJECT_TRANSLATIONS';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_OBJECT_TRANSLATIONS', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_OBJECT_TRANSLATIONS';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_OBJECT_TRANSLATIONS', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_OBJECT_TRANSLATIONS';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_OBJECT_TRANSLATIONS', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_OBJECT_TRANSLATIONS_databasename';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_OBJECT_TRANSLATIONS', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_OBJECT_TRANSLATIONS_databasename';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'databasename,ID', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_OBJECT_TRANSLATIONS';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'nvarchar(128),numeric(20, 0)', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_OBJECT_TRANSLATIONS';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'ADE6A70A-8A06-EC11-8515-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_OBJECT_TRANSLATIONS';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_OBJECT_TRANSLATIONS';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_OBJECT_TRANSLATIONS';

