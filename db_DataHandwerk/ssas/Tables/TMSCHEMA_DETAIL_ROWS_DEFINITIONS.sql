CREATE TABLE [ssas].[TMSCHEMA_DETAIL_ROWS_DEFINITIONS] (
    [databasename] NVARCHAR (128) CONSTRAINT [DF_TMSCHEMA_DETAIL_ROWS_DEFINITIONS_databasename] DEFAULT (N'mydatabase') NOT NULL,
    [ID]           NUMERIC (20)   NOT NULL,
    [ObjectID]     NUMERIC (20)   NOT NULL,
    [ObjectType]   INT            NOT NULL,
    [Expression]   NVARCHAR (MAX) NULL,
    [ModifiedTime] DATETIME       NULL,
    [State]        BIGINT         NULL,
    [ErrorMessage] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_TMSCHEMA_DETAIL_ROWS_DEFINITIONS] PRIMARY KEY CLUSTERED ([databasename] ASC, [ID] ASC)
);






GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f4e6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DETAIL_ROWS_DEFINITIONS', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_DETAIL_ROWS_DEFINITIONS_databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f5e6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DETAIL_ROWS_DEFINITIONS', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_DETAIL_ROWS_DEFINITIONS';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '89c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DETAIL_ROWS_DEFINITIONS', @level2type = N'COLUMN', @level2name = N'ErrorMessage';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '88c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DETAIL_ROWS_DEFINITIONS', @level2type = N'COLUMN', @level2name = N'State';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '87c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DETAIL_ROWS_DEFINITIONS', @level2type = N'COLUMN', @level2name = N'ModifiedTime';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '86c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DETAIL_ROWS_DEFINITIONS', @level2type = N'COLUMN', @level2name = N'Expression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '85c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DETAIL_ROWS_DEFINITIONS', @level2type = N'COLUMN', @level2name = N'ObjectType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '84c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DETAIL_ROWS_DEFINITIONS', @level2type = N'COLUMN', @level2name = N'ObjectID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '83c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DETAIL_ROWS_DEFINITIONS', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '82c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DETAIL_ROWS_DEFINITIONS', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f3e6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DETAIL_ROWS_DEFINITIONS';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DETAIL_ROWS_DEFINITIONS', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_DETAIL_ROWS_DEFINITIONS';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DETAIL_ROWS_DEFINITIONS', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_DETAIL_ROWS_DEFINITIONS';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DETAIL_ROWS_DEFINITIONS', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_DETAIL_ROWS_DEFINITIONS_databasename';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DETAIL_ROWS_DEFINITIONS', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_DETAIL_ROWS_DEFINITIONS_databasename';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'databasename,ID', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DETAIL_ROWS_DEFINITIONS';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'nvarchar(128),numeric(20, 0)', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DETAIL_ROWS_DEFINITIONS';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'F5E6A70A-8A06-EC11-8515-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DETAIL_ROWS_DEFINITIONS';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DETAIL_ROWS_DEFINITIONS';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_DETAIL_ROWS_DEFINITIONS';

