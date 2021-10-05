CREATE TABLE [docs].[RepoObject_ColumnList_T] (
    [RepoObject_guid]                  UNIQUEIDENTIFIER NOT NULL,
    [cultures_name]                    NVARCHAR (10)    CONSTRAINT [DF_RepoObject_ColumnList_T_cultures_name] DEFAULT ('') NOT NULL,
    [is_external]                      TINYINT          CONSTRAINT [DF_RepoObject_ColumnList_T_is_external] DEFAULT ((0)) NOT NULL,
    [AntoraColumnDetails]              NVARCHAR (MAX)   NULL,
    [AntoraPkColumnTableRows]          NVARCHAR (MAX)   NULL,
    [AntoraNonPkColumnTableRows]       NVARCHAR (MAX)   NULL,
    [PlantumlPkEntityColumns]          NVARCHAR (MAX)   NULL,
    [PlantumlNonPkEntityColumns]       NVARCHAR (MAX)   NULL,
    [PlantumlNonPkIndexColumns]        NVARCHAR (MAX)   NULL,
    [PlantumlNonPkHiddenEntityColumns] NVARCHAR (MAX)   NULL,
    [PlantumlIndexColumns]             NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_RepoObject_ColumnList_T] PRIMARY KEY CLUSTERED ([RepoObject_guid] ASC, [cultures_name] ASC) WITH (DATA_COMPRESSION = PAGE)
);










GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ed2038b5-270e-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObject_ColumnList_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ef851b1a-240e-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T', @level2type = N'COLUMN', @level2name = N'PlantumlIndexColumns';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eb851b1a-240e-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T', @level2type = N'COLUMN', @level2name = N'PlantumlNonPkHiddenEntityColumns';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ee851b1a-240e-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T', @level2type = N'COLUMN', @level2name = N'PlantumlNonPkIndexColumns';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ea851b1a-240e-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T', @level2type = N'COLUMN', @level2name = N'PlantumlNonPkEntityColumns';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ec851b1a-240e-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T', @level2type = N'COLUMN', @level2name = N'PlantumlPkEntityColumns';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e9851b1a-240e-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T', @level2type = N'COLUMN', @level2name = N'AntoraNonPkColumnTableRows';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e7851b1a-240e-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T', @level2type = N'COLUMN', @level2name = N'AntoraPkColumnTableRows';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ed851b1a-240e-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T', @level2type = N'COLUMN', @level2name = N'AntoraColumnDetails';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e8851b1a-240e-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7046890d-240e-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T';




GO
EXECUTE sp_addextendedproperty @name = N'usp_persistence_RepoObject_guid', @value = N'EF2038B5-270E-EC11-8518-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [docs].[RepoObject_ColumnList]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_xref', @value = N'xref:docs.RepoObject_ColumnList.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_guid', @value = N'9F8B79D5-B993-EB11-84F2-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_fullname2', @value = N'docs.RepoObject_ColumnList', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_fullname', @value = N'[docs].[RepoObject_ColumnList]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'1', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_update_changed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_truncate', @value = N'1', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_insert', @value = N'1', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_missing', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_changed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_for_empty_source', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_duplicate_per_pk', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence', @value = N'1', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T';


GO
EXECUTE sp_addextendedproperty @name = N'has_history_columns', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T';


GO
EXECUTE sp_addextendedproperty @name = N'has_history', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:docs.RepoObject_ColumnList.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_ColumnList].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_ColumnList].[PlantumlPkEntityColumns]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T', @level2type = N'COLUMN', @level2name = N'PlantumlPkEntityColumns';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_ColumnList].[PlantumlNonPkIndexColumns]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T', @level2type = N'COLUMN', @level2name = N'PlantumlNonPkIndexColumns';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_ColumnList].[PlantumlNonPkHiddenEntityColumns]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T', @level2type = N'COLUMN', @level2name = N'PlantumlNonPkHiddenEntityColumns';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_ColumnList].[PlantumlNonPkEntityColumns]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T', @level2type = N'COLUMN', @level2name = N'PlantumlNonPkEntityColumns';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_ColumnList].[PlantumlIndexColumns]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T', @level2type = N'COLUMN', @level2name = N'PlantumlIndexColumns';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_ColumnList].[AntoraPkColumnTableRows]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T', @level2type = N'COLUMN', @level2name = N'AntoraPkColumnTableRows';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_ColumnList].[AntoraNonPkColumnTableRows]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T', @level2type = N'COLUMN', @level2name = N'AntoraNonPkColumnTableRows';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_ColumnList].[AntoraColumnDetails]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T', @level2type = N'COLUMN', @level2name = N'AntoraColumnDetails';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObject_ColumnList_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObject_ColumnList_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'ED2038B5-270E-EC11-8518-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.RepoObject_Adoc.adoc[]
* xref:docs.RepoObject_Plantuml_Entity.adoc[]
* xref:docs.usp_PERSIST_RepoObject_ColumnList_T.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a3a507d5-0622-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_ColumnList_T_cultures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4f0389e1-0622-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T', @level2type = N'COLUMN', @level2name = N'cultures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7b7fdba0-5925-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_ColumnList_T_is_external';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '00d67baa-5925-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_ColumnList_T', @level2type = N'COLUMN', @level2name = N'is_external';

