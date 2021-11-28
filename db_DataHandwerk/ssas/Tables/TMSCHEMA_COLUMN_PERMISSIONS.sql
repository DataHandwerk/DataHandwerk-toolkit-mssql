CREATE TABLE [ssas].[TMSCHEMA_COLUMN_PERMISSIONS] (
    [databasename]       NVARCHAR (128) CONSTRAINT [DF_TMSCHEMA_COLUMN_PERMISSIONS_database] DEFAULT (N'mydatabase') NOT NULL,
    [ID]                 NUMERIC (20)   NOT NULL,
    [TablePermissionID]  NUMERIC (20)   NULL,
    [ColumnID]           NUMERIC (20)   NULL,
    [ModifiedTime]       DATETIME       NULL,
    [MetadataPermission] BIGINT         NULL,
    CONSTRAINT [PK_TMSCHEMA_COLUMN_PERMISSIONS] PRIMARY KEY CLUSTERED ([databasename] ASC, [ID] ASC) WITH (DATA_COMPRESSION = PAGE)
);






GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'eee6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMN_PERMISSIONS', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_COLUMN_PERMISSIONS_database';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'efe6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMN_PERMISSIONS', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_COLUMN_PERMISSIONS';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7ac70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMN_PERMISSIONS', @level2type = N'COLUMN', @level2name = N'MetadataPermission';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '79c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMN_PERMISSIONS', @level2type = N'COLUMN', @level2name = N'ModifiedTime';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '78c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMN_PERMISSIONS', @level2type = N'COLUMN', @level2name = N'ColumnID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '77c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMN_PERMISSIONS', @level2type = N'COLUMN', @level2name = N'TablePermissionID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '76c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMN_PERMISSIONS', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '75c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMN_PERMISSIONS', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ede6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMN_PERMISSIONS';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMN_PERMISSIONS', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_COLUMN_PERMISSIONS';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMN_PERMISSIONS', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_COLUMN_PERMISSIONS';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMN_PERMISSIONS', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_COLUMN_PERMISSIONS_database';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMN_PERMISSIONS', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_COLUMN_PERMISSIONS_database';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'databasename,ID', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMN_PERMISSIONS';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'nvarchar(128),numeric(20, 0)', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMN_PERMISSIONS';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'EFE6A70A-8A06-EC11-8515-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMN_PERMISSIONS';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMN_PERMISSIONS';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMN_PERMISSIONS';

