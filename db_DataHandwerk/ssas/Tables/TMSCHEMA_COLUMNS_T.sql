CREATE TABLE [ssas].[TMSCHEMA_COLUMNS_T] (
    [databasename]          NVARCHAR (128)   CONSTRAINT [DF__TMSCHEMA___datab__54C1736E] DEFAULT (N'mydatabase') NOT NULL,
    [ID]                    NUMERIC (20)     NOT NULL,
    [Alignment]             BIGINT           NOT NULL,
    [AttributeHierarchyID]  NUMERIC (20)     NOT NULL,
    [ColumnOriginID]        NUMERIC (20)     NULL,
    [ColumnStorageID]       NUMERIC (20)     NOT NULL,
    [DataCategory]          NVARCHAR (MAX)   NULL,
    [Description]           NVARCHAR (MAX)   NULL,
    [DisplayFolder]         NVARCHAR (MAX)   NULL,
    [DisplayOrdinal]        INT              NOT NULL,
    [ErrorMessage]          NVARCHAR (MAX)   NULL,
    [ExplicitDataType]      BIGINT           NOT NULL,
    [ExplicitName]          NVARCHAR (MAX)   NOT NULL,
    [Expression]            NVARCHAR (MAX)   NULL,
    [FormatString]          NVARCHAR (MAX)   NULL,
    [InferredDataType]      BIGINT           NOT NULL,
    [InferredName]          NVARCHAR (MAX)   NULL,
    [IsAvailableInMDX]      BIT              NOT NULL,
    [IsDefaultImage]        BIT              NOT NULL,
    [IsDefaultLabel]        BIT              NOT NULL,
    [IsHidden]              BIT              NOT NULL,
    [IsKey]                 BIT              NOT NULL,
    [IsNullable]            BIT              NOT NULL,
    [IsUnique]              BIT              NOT NULL,
    [KeepUniqueRows]        BIT              NOT NULL,
    [ModifiedTime]          DATETIME         NOT NULL,
    [RefreshedTime]         NVARCHAR (MAX)   NULL,
    [SortByColumnID]        NUMERIC (20)     NULL,
    [SourceColumn]          NVARCHAR (MAX)   NULL,
    [SourceProviderType]    NVARCHAR (MAX)   NULL,
    [State]                 BIGINT           NOT NULL,
    [StructureModifiedTime] DATETIME         NOT NULL,
    [SummarizeBy]           BIGINT           NOT NULL,
    [SystemFlags]           BIGINT           NOT NULL,
    [TableDetailPosition]   INT              NOT NULL,
    [TableID]               NUMERIC (20)     NOT NULL,
    [Type]                  BIGINT           NOT NULL,
    [RepoObjectColumn_guid] UNIQUEIDENTIFIER CONSTRAINT [DF_TMSCHEMA_COLUMNS_T_RepoObjectColumn_guid] DEFAULT (newsequentialid()) NOT NULL,
    CONSTRAINT [PK_TMSCHEMA_COLUMNS_T] PRIMARY KEY CLUSTERED ([databasename] ASC, [ID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '164559f6-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'CONSTRAINT', @level2name = N'DF__TMSCHEMA___datab__54C1736E';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '094559f6-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_COLUMNS_T_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0a4559f6-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_COLUMNS_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1cf6bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4bab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'Type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4eab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'TableID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '49ab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'TableDetailPosition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4cab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'SystemFlags';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '46ab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'SummarizeBy';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5aab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'StructureModifiedTime';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '59ab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'State';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '43ab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'SourceProviderType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '41ab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'SourceColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5bab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'SortByColumnID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '52ab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'RefreshedTime';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '56ab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'ModifiedTime';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4fab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'KeepUniqueRows';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '53ab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'IsUnique';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4aab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'IsNullable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '55ab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'IsKey';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '57ab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'IsHidden';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '58ab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'IsDefaultLabel';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4dab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'IsDefaultImage';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '60ab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'IsAvailableInMDX';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3cab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'InferredName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '42ab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'InferredDataType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5fab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'FormatString';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5dab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'Expression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '44ab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'ExplicitName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5eab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'ExplicitDataType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '47ab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'ErrorMessage';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3dab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'DisplayOrdinal';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '45ab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'DisplayFolder';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5cab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '51ab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'DataCategory';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '40ab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'ColumnStorageID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3eab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'ColumnOriginID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '54ab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'AttributeHierarchyID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '50ab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'Alignment';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3fab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '48ab9265-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9348865d-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_COLUMNS_T';

