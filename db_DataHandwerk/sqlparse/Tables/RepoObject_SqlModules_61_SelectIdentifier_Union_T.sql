CREATE TABLE [sqlparse].[RepoObject_SqlModules_61_SelectIdentifier_Union_T] (
    [alias_QuoteName]         NVARCHAR (MAX)   NULL,
    [class]                   NVARCHAR (500)   NULL,
    [normalized]              NVARCHAR (MAX)   NULL,
    [RepoObject_guid]         UNIQUEIDENTIFIER NOT NULL,
    [RowNumber_per_Object]    BIGINT           NULL,
    [source_column_QuoteName] NVARCHAR (MAX)   NULL,
    [source_table_QuoteName]  NVARCHAR (MAX)   NULL,
    [SysObject_fullname]      NVARCHAR (261)   NULL
);
















GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '86efc212-b764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '99efc212-b764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '98efc212-b764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T', @level2type = N'COLUMN', @level2name = N'source_table_QuoteName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '97efc212-b764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T', @level2type = N'COLUMN', @level2name = N'source_column_QuoteName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '96efc212-b764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T', @level2type = N'COLUMN', @level2name = N'RowNumber_per_Object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '95efc212-b764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '94efc212-b764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T', @level2type = N'COLUMN', @level2name = N'normalized';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '93efc212-b764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T', @level2type = N'COLUMN', @level2name = N'class';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '92efc212-b764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T', @level2type = N'COLUMN', @level2name = N'alias_QuoteName';


GO



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_61_SelectIdentifier_Union].[SysObject_fullname]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_61_SelectIdentifier_Union].[source_table_QuoteName]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T', @level2type = N'COLUMN', @level2name = N'source_table_QuoteName';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_61_SelectIdentifier_Union].[source_column_QuoteName]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T', @level2type = N'COLUMN', @level2name = N'source_column_QuoteName';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_61_SelectIdentifier_Union].[RowNumber_per_Object]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T', @level2type = N'COLUMN', @level2name = N'RowNumber_per_Object';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_61_SelectIdentifier_Union].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_61_SelectIdentifier_Union].[normalized]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T', @level2type = N'COLUMN', @level2name = N'normalized';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_61_SelectIdentifier_Union].[class]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T', @level2type = N'COLUMN', @level2name = N'class';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_61_SelectIdentifier_Union].[alias_QuoteName]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T', @level2type = N'COLUMN', @level2name = N'alias_QuoteName';




GO
EXECUTE sp_addextendedproperty @name = N'usp_persistence_RepoObject_guid', @value = N'677581A6-3C9C-EB11-84F6-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [sqlparse].[RepoObject_SqlModules_61_SelectIdentifier_Union]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_xref', @value = N'xref:sqlparse.RepoObject_SqlModules_61_SelectIdentifier_Union.adoc[]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_guid', @value = N'127E4BE1-8F64-EB11-84DD-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_fullname2', @value = N'sqlparse.RepoObject_SqlModules_61_SelectIdentifier_Union', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_fullname', @value = N'[sqlparse].[RepoObject_SqlModules_61_SelectIdentifier_Union]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_update_changed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_truncate', @value = N'1', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_insert', @value = N'1', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_missing', @value = N'0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_changed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_for_empty_source', @value = N'0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_duplicate_per_pk', @value = N'0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence', @value = N'1', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T';


GO
EXECUTE sp_addextendedproperty @name = N'has_history_columns', @value = N'0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T';


GO
EXECUTE sp_addextendedproperty @name = N'has_history', @value = N'0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:sqlparse.RepoObject_SqlModules_71_reference_ExpliciteTableAlias.adoc[]
* xref:sqlparse.RepoObject_SqlModules_72_reference_NoTableAlias.adoc[]
* xref:sqlparse.usp_PERSIST_RepoObject_SqlModules_61_SelectIdentifier_Union_T.adoc[]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:sqlparse.RepoObject_SqlModules_61_SelectIdentifier_Union.adoc[]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_61_SelectIdentifier_Union_T';


GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_RepoObject_SqlModules_61_SelectIdentifier_Union_T]
    ON [sqlparse].[RepoObject_SqlModules_61_SelectIdentifier_Union_T];

