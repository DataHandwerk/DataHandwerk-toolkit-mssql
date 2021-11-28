CREATE TABLE [ssas].[TMSCHEMA_MEASURES] (
    [databasename]           NVARCHAR (128) CONSTRAINT [DF_TMSCHEMA_MEASURES_databasename] DEFAULT (N'mydatabase') NOT NULL,
    [ID]                     NUMERIC (20)   NOT NULL,
    [TableID]                NUMERIC (20)   NOT NULL,
    [Name]                   NVARCHAR (MAX) NOT NULL,
    [Description]            NVARCHAR (MAX) NULL,
    [DataType]               BIGINT         NOT NULL,
    [Expression]             NVARCHAR (MAX) NOT NULL,
    [FormatString]           NVARCHAR (MAX) NULL,
    [IsHidden]               BIT            NOT NULL,
    [State]                  BIGINT         NOT NULL,
    [ModifiedTime]           DATETIME       NOT NULL,
    [StructureModifiedTime]  DATETIME       NOT NULL,
    [KPIID]                  NUMERIC (20)   NULL,
    [IsSimpleMeasure]        BIT            NOT NULL,
    [ErrorMessage]           NVARCHAR (MAX) NULL,
    [DisplayFolder]          NVARCHAR (MAX) NULL,
    [DetailRowsDefinitionID] NUMERIC (20)   NULL,
    CONSTRAINT [PK_TMSCHEMA_MEASURES] PRIMARY KEY CLUSTERED ([databasename] ASC, [ID] ASC) WITH (DATA_COMPRESSION = PAGE)
);








GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a6e6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MEASURES', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_MEASURES_databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a7e6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MEASURES', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_MEASURES';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8ac60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MEASURES', @level2type = N'COLUMN', @level2name = N'DetailRowsDefinitionID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '89c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MEASURES', @level2type = N'COLUMN', @level2name = N'DisplayFolder';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '88c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MEASURES', @level2type = N'COLUMN', @level2name = N'ErrorMessage';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '87c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MEASURES', @level2type = N'COLUMN', @level2name = N'IsSimpleMeasure';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '86c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MEASURES', @level2type = N'COLUMN', @level2name = N'KPIID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '85c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MEASURES', @level2type = N'COLUMN', @level2name = N'StructureModifiedTime';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '84c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MEASURES', @level2type = N'COLUMN', @level2name = N'ModifiedTime';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '83c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MEASURES', @level2type = N'COLUMN', @level2name = N'State';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '82c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MEASURES', @level2type = N'COLUMN', @level2name = N'IsHidden';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '81c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MEASURES', @level2type = N'COLUMN', @level2name = N'FormatString';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '80c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MEASURES', @level2type = N'COLUMN', @level2name = N'Expression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7fc60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MEASURES', @level2type = N'COLUMN', @level2name = N'DataType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7ec60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MEASURES', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7dc60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MEASURES', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7cc60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MEASURES', @level2type = N'COLUMN', @level2name = N'TableID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7bc60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MEASURES', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7ac60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MEASURES', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a5e6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MEASURES';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MEASURES', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_MEASURES';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MEASURES', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_MEASURES';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MEASURES', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_MEASURES_databasename';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MEASURES', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_MEASURES_databasename';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'databasename,ID', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MEASURES';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'nvarchar(128),numeric(20, 0)', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MEASURES';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'A7E6A70A-8A06-EC11-8515-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MEASURES';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MEASURES';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_MEASURES';

