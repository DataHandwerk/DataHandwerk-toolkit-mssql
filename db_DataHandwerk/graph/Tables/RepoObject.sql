CREATE TABLE [graph].[RepoObject] (
    [RepoObject_guid]      UNIQUEIDENTIFIER NOT NULL,
    [RepoObject_fullname]  NVARCHAR (261)   NOT NULL,
    [RepoObject_type]      CHAR (2)         NOT NULL,
    [RepoObject_fullname2] NVARCHAR (257)   NULL,
    CONSTRAINT [UK_RepoObject] UNIQUE NONCLUSTERED ([RepoObject_guid] ASC),
    INDEX [ix_graphid] UNIQUE NONCLUSTERED ($node_id)
) AS NODE;



GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '2bc1e60f-ed66-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'CONSTRAINT', @level2name = N'UK_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '88efc212-b764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f762548b-3865-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9cefc212-b764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f662548b-3865-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[graph].[RepoObject_S].[RepoObject_type]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'reference in [repo_sys].[type]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[graph].[RepoObject_S].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[graph].[RepoObject_S].[RepoObject_fullname]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0139cf17-0592-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'usp_persistence_RepoObject_guid', @value = N'BD364096-6065-EB11-84DD-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [graph].[RepoObject_S]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_xref', @value = N'xref:graph.RepoObject_S.adoc[]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_guid', @value = N'A89FCDB3-3265-EB11-84DD-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_fullname2', @value = N'graph.RepoObject_S', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_fullname', @value = N'[graph].[RepoObject_S]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'1', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_update_changed', @value = N'1', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_truncate', @value = N'0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_insert', @value = N'1', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_missing', @value = N'1', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_changed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_for_empty_source', @value = N'1', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_duplicate_per_pk', @value = N'0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence', @value = N'1', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'has_history_columns', @value = N'0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'has_history', @value = N'0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:graph.usp_PERSIST_RepoObject.adoc[]
* xref:reference.Match_RepoObject_referenced_UspPersistence.adoc[]
* xref:reference.RepoObject_referenced_level.adoc[]
* xref:reference.RepoObject_referencing_level.adoc[]
* xref:repo.usp_main.adoc[]
* xref:repo.usp_sync_guid_RepoObject.adoc[]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:graph.RepoObject_S.adoc[]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [graph].[RepoObject_S].[RepoObject_fullname2]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';

