CREATE TABLE [repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T] (
    [index_guid]                        UNIQUEIDENTIFIER NULL,
    [is_descending_key]                 BIT              NULL,
    [referenced_RepoObject_guid]        UNIQUEIDENTIFIER NULL,
    [index_column_id]                   INT              NOT NULL,
    [referenced_RepoObjectColumn_guid]  UNIQUEIDENTIFIER NULL,
    [RowNumberInReferencing]            BIGINT           NULL,
    [referencing_RepoObject_guid]       UNIQUEIDENTIFIER NULL,
    [referencing_RepoObjectColumn_guid] UNIQUEIDENTIFIER NULL,
    [ColumnsPerIndex]                   INT              NULL
)
WITH (DATA_COMPRESSION = PAGE);
















GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b47ed154-6b62-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T', @level2type = N'COLUMN', @level2name = N'referencing_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b37ed154-6b62-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b27ed154-6b62-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T', @level2type = N'COLUMN', @level2name = N'RowNumberInReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b17ed154-6b62-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T', @level2type = N'COLUMN', @level2name = N'referenced_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b07ed154-6b62-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T', @level2type = N'COLUMN', @level2name = N'index_column_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'af7ed154-6b62-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ae7ed154-6b62-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T', @level2type = N'COLUMN', @level2name = N'is_descending_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ad7ed154-6b62-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T', @level2type = N'COLUMN', @level2name = N'index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ab7ed154-6b62-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T';


GO



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing].[RowNumberInReferencing]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T', @level2type = N'COLUMN', @level2name = N'RowNumberInReferencing';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing].[referencing_RepoObjectColumn_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T', @level2type = N'COLUMN', @level2name = N'referencing_RepoObjectColumn_guid';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing].[referencing_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing].[referenced_RepoObjectColumn_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T', @level2type = N'COLUMN', @level2name = N'referenced_RepoObjectColumn_guid';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing].[referenced_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing].[is_descending_key]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T', @level2type = N'COLUMN', @level2name = N'is_descending_key';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing].[index_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T', @level2type = N'COLUMN', @level2name = N'index_guid';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing].[index_column_id]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T', @level2type = N'COLUMN', @level2name = N'index_column_id';




GO
EXECUTE sp_addextendedproperty @name = N'usp_persistence_RepoObject_guid', @value = N'AC7ED154-6B62-EB11-84DC-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T';


GO



GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'index_guid,index_column_id,RowNumberInReferencing', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier,int,bigint', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'4BFECAF3-1196-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_xref', @value = N'xref:repo.IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_guid', @value = N'7B90291C-9D61-EB11-84DC-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_fullname2', @value = N'repo.IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_fullname', @value = N'[repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_update_changed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_truncate', @value = N'1', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_insert', @value = N'1', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_missing', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_changed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_for_empty_source', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_duplicate_per_pk', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence', @value = N'1', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T';


GO
EXECUTE sp_addextendedproperty @name = N'has_history_columns', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T';


GO
EXECUTE sp_addextendedproperty @name = N'has_history', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.Index_referencing_IndexPatternColumnGuid.adoc[]
* xref:repo.IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check.adoc[]
* xref:repo.IndexColumn_virtual_referenced_setpoint.adoc[]
* xref:repo.IndexReferencedReferencing_HasFullColumnsInReferencing.adoc[]
* xref:repo.usp_PERSIST_IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dc7dc759-0f5d-ec11-8534-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T', @level2type = N'COLUMN', @level2name = N'ColumnsPerIndex';

