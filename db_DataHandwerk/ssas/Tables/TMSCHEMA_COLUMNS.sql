CREATE TABLE [ssas].[TMSCHEMA_COLUMNS] (
    [databasename]          NVARCHAR (128) CONSTRAINT [DF_TMSCHEMA_COLUMNS_database] DEFAULT (N'mydatabase') NOT NULL,
    [ID]                    NUMERIC (20)   NOT NULL,
    [TableID]               NUMERIC (20)   NOT NULL,
    [ExplicitName]          NVARCHAR (MAX) NOT NULL,
    [InferredName]          NVARCHAR (MAX) NULL,
    [ExplicitDataType]      BIGINT         NOT NULL,
    [InferredDataType]      BIGINT         NOT NULL,
    [DataCategory]          NVARCHAR (MAX) NULL,
    [Description]           NVARCHAR (MAX) NULL,
    [IsHidden]              BIT            NOT NULL,
    [State]                 BIGINT         NOT NULL,
    [IsUnique]              BIT            NOT NULL,
    [IsKey]                 BIT            NOT NULL,
    [IsNullable]            BIT            NOT NULL,
    [Alignment]             BIGINT         NOT NULL,
    [TableDetailPosition]   INT            NOT NULL,
    [IsDefaultLabel]        BIT            NOT NULL,
    [IsDefaultImage]        BIT            NOT NULL,
    [SummarizeBy]           BIGINT         NOT NULL,
    [ColumnStorageID]       NUMERIC (20)   NOT NULL,
    [Type]                  BIGINT         NOT NULL,
    [SourceColumn]          NVARCHAR (MAX) NULL,
    [ColumnOriginID]        NUMERIC (20)   NULL,
    [Expression]            NVARCHAR (MAX) NULL,
    [FormatString]          NVARCHAR (MAX) NULL,
    [IsAvailableInMDX]      BIT            NOT NULL,
    [SortByColumnID]        NUMERIC (20)   NULL,
    [AttributeHierarchyID]  NUMERIC (20)   NOT NULL,
    [ModifiedTime]          DATETIME       NOT NULL,
    [StructureModifiedTime] DATETIME       NOT NULL,
    [RefreshedTime]         NVARCHAR (MAX) NULL,
    [SystemFlags]           BIGINT         NOT NULL,
    [KeepUniqueRows]        BIT            NOT NULL,
    [DisplayOrdinal]        INT            NOT NULL,
    [ErrorMessage]          NVARCHAR (MAX) NULL,
    [SourceProviderType]    NVARCHAR (MAX) NULL,
    [DisplayFolder]         NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_TMSCHEMA_COLUMNS] PRIMARY KEY CLUSTERED ([databasename] ASC, [ID] ASC)
);




GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'd2e6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_COLUMNS_database';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'd3e6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_COLUMNS';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '15c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'DisplayFolder';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '14c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'SourceProviderType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '13c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'ErrorMessage';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '12c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'DisplayOrdinal';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '11c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'KeepUniqueRows';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '10c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'SystemFlags';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0fc70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'RefreshedTime';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0ec70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'StructureModifiedTime';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0dc70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'ModifiedTime';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0cc70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'AttributeHierarchyID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0bc70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'SortByColumnID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0ac70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'IsAvailableInMDX';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '09c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'FormatString';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '08c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'Expression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '07c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'ColumnOriginID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '06c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'SourceColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '05c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'Type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '04c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'ColumnStorageID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '03c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'SummarizeBy';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '02c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'IsDefaultImage';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '01c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'IsDefaultLabel';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '00c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'TableDetailPosition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ffc60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'Alignment';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fec60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'IsNullable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fdc60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'IsKey';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fcc60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'IsUnique';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fbc60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'State';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fac60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'IsHidden';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f9c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f8c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'DataCategory';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f7c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'InferredDataType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f6c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'ExplicitDataType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f5c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'InferredName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f4c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'ExplicitName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f3c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'TableID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f2c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f1c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'd1e6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS';

