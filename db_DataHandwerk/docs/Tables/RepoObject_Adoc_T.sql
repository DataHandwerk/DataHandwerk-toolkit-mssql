CREATE TABLE [docs].[RepoObject_Adoc_T] (
    [RepoObject_guid]             UNIQUEIDENTIFIER NOT NULL,
    [cultures_name]               NVARCHAR (10)    CONSTRAINT [DF_RepoObject_Adoc_T_cultures_name] DEFAULT ('') NOT NULL,
    [AdocContent]                 NVARCHAR (MAX)   CONSTRAINT [DF_RepoObject_Adoc_T_AdocContent] DEFAULT ('') NOT NULL,
    [is_DocsOutput]               INT              NULL,
    [PropertyCount]               INT              NULL,
    [RepoObject_fullname]         NVARCHAR (261)   NULL,
    [RepoObject_fullname2]        NVARCHAR (257)   NULL,
    [RepoObject_FullDisplayName2] NVARCHAR (257)   NULL,
    [RepoObject_DisplayName]      NVARCHAR (128)   NULL,
    [RepoObject_translation]      NVARCHAR (128)   NULL,
    [RepoObject_schema_name]      NVARCHAR (128)   NULL,
    [SysObject_fullname]          NVARCHAR (261)   NULL,
    [SysObject_fullname2]         NVARCHAR (257)   NULL,
    [SysObject_schema_name]       NVARCHAR (128)   NULL,
    [SysObject_type]              CHAR (2)         NULL,
    [SysObject_type_name]         NVARCHAR (128)   NULL,
    CONSTRAINT [PK_RepoObject_Adoc_T] PRIMARY KEY CLUSTERED ([RepoObject_guid] ASC, [cultures_name] ASC) WITH (DATA_COMPRESSION = PAGE)
);




















GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f4d1303b-0993-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fdd1303b-0993-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T', @level2type = N'COLUMN', @level2name = N'SysObject_type_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fcd1303b-0993-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T', @level2type = N'COLUMN', @level2name = N'SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a18b79d5-b993-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T', @level2type = N'COLUMN', @level2name = N'SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fbd1303b-0993-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T', @level2type = N'COLUMN', @level2name = N'SysObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fad1303b-0993-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a08b79d5-b993-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f9d1303b-0993-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f8d1303b-0993-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f7d1303b-0993-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f6d1303b-0993-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T', @level2type = N'COLUMN', @level2name = N'PropertyCount';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f5d1303b-0993-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T', @level2type = N'COLUMN', @level2name = N'AdocContent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '46e90a1e-7495-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T', @level2type = N'COLUMN', @level2name = N'is_DocsOutput';




GO
EXECUTE sp_addextendedproperty @name = N'usp_persistence_RepoObject_guid', @value = N'9456D491-0B93-EB11-84F2-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [docs].[RepoObject_Adoc]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'2D899DB0-6298-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_xref', @value = N'xref:docs.RepoObject_Adoc.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_guid', @value = N'D5E0B563-4291-EB11-84F2-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_fullname2', @value = N'docs.RepoObject_Adoc', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_fullname', @value = N'[docs].[RepoObject_Adoc]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'1', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_update_changed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_truncate', @value = N'1', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_insert', @value = N'1', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_missing', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_changed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_for_empty_source', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_duplicate_per_pk', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence', @value = N'1', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T';


GO
EXECUTE sp_addextendedproperty @name = N'has_history_columns', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T';


GO
EXECUTE sp_addextendedproperty @name = N'has_history', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.usp_PERSIST_RepoObject_Adoc_T.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:docs.RepoObject_Adoc.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Adoc].[SysObject_type_name]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T', @level2type = N'COLUMN', @level2name = N'SysObject_type_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Adoc].[SysObject_type]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T', @level2type = N'COLUMN', @level2name = N'SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Adoc].[SysObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T', @level2type = N'COLUMN', @level2name = N'SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Adoc].[SysObject_fullname2]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T', @level2type = N'COLUMN', @level2name = N'SysObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Adoc].[SysObject_fullname]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Adoc].[RepoObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Adoc].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Adoc].[RepoObject_fullname2]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Adoc].[RepoObject_fullname]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Adoc].[PropertyCount]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T', @level2type = N'COLUMN', @level2name = N'PropertyCount';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Adoc].[is_DocsOutput]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T', @level2type = N'COLUMN', @level2name = N'is_DocsOutput';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_Adoc].[AdocContent]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T', @level2type = N'COLUMN', @level2name = N'AdocContent';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a8a507d5-0622-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObject_Adoc_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a2a507d5-0622-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_Adoc_T_cultures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a1a507d5-0622-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_Adoc_T_AdocContent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4e0389e1-0622-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T', @level2type = N'COLUMN', @level2name = N'cultures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '67871b6d-cf22-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T', @level2type = N'COLUMN', @level2name = N'RepoObject_translation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '69871b6d-cf22-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T', @level2type = N'COLUMN', @level2name = N'RepoObject_FullDisplayName2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '68871b6d-cf22-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Adoc_T', @level2type = N'COLUMN', @level2name = N'RepoObject_DisplayName';

