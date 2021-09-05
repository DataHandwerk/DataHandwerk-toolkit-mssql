CREATE TABLE [repo].[RepoObject_persistence] (
    [target_RepoObject_guid]                UNIQUEIDENTIFIER NOT NULL,
    [has_history]                           BIT              CONSTRAINT [DF__RepoObjec__has_h__29AC2CE0] DEFAULT ((0)) NOT NULL,
    [has_history_columns]                   BIT              CONSTRAINT [DF__RepoObjec__has_h__2AA05119] DEFAULT ((0)) NOT NULL,
    [history_schema_name]                   NVARCHAR (128)   NULL,
    [history_table_name]                    NVARCHAR (128)   NULL,
    [is_persistence_check_duplicate_per_pk] BIT              CONSTRAINT [DF_RepoObject_persistence_is_persistence_check_for_empty_source1] DEFAULT ((0)) NOT NULL,
    [is_persistence_check_for_empty_source] BIT              CONSTRAINT [DF__RepoObjec__is_hi__2B947552] DEFAULT ((0)) NOT NULL,
    [is_persistence_delete_changed]         BIT              CONSTRAINT [DF__RepoObjec__is_pe__2C88998B] DEFAULT ((0)) NOT NULL,
    [is_persistence_delete_missing]         BIT              CONSTRAINT [DF__RepoObjec__is_pe__2D7CBDC4] DEFAULT ((0)) NOT NULL,
    [is_persistence_insert]                 BIT              CONSTRAINT [DF__RepoObjec__is_pe__2E70E1FD] DEFAULT ((1)) NOT NULL,
    [is_persistence_truncate]               BIT              CONSTRAINT [DF__RepoObjec__is_pe__2F650636] DEFAULT ((1)) NOT NULL,
    [is_persistence_update_changed]         BIT              CONSTRAINT [DF__RepoObjec__is_pe__30592A6F] DEFAULT ((0)) NOT NULL,
    [is_persistence_merge_delete_missing]   BIT              CONSTRAINT [DF_RepoObject_persistence_is_persistence_delete_missing1] DEFAULT ((0)) NOT NULL,
    [is_persistence_merge_insert]           BIT              CONSTRAINT [DF_RepoObject_persistence_is_persistence_insert1] DEFAULT ((0)) NOT NULL,
    [is_persistence_merge_update_changed]   BIT              CONSTRAINT [DF_RepoObject_persistence_is_persistence_update_changed1] DEFAULT ((0)) NOT NULL,
    [source_RepoObject_guid]                UNIQUEIDENTIFIER NULL,
    [source_filter]                         NVARCHAR (4000)  NULL,
    [target_filter]                         NVARCHAR (4000)  NULL,
    [is_persistence]                        AS               (CONVERT([bit],(1))),
    [temporal_type]                         AS               (CONVERT([tinyint],case [has_history] when (1) then (2) else (0) end)),
    CONSTRAINT [PK_RepoObject_persistence] PRIMARY KEY CLUSTERED ([target_RepoObject_guid] ASC),
    CONSTRAINT [FK_RepoObject_persistence__RepoObject__target] FOREIGN KEY ([target_RepoObject_guid]) REFERENCES [repo].[RepoObject] ([RepoObject_guid]) ON DELETE CASCADE ON UPDATE CASCADE
);


























GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'extra table is required to allow FK with
ON UPDATE CASCADE
ON DELETE CASCADE', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '1590291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObject_persistence__RepoObject__target';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9090291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_persistence_is_persistence_check_for_empty_source1';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9c90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF__RepoObjec__is_pe__30592A6F';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9a90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF__RepoObjec__is_pe__2F650636';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9890291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF__RepoObjec__is_pe__2E70E1FD';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9690291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF__RepoObjec__is_pe__2D7CBDC4';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9490291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF__RepoObjec__is_pe__2C88998B';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9290291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF__RepoObjec__is_hi__2B947552';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '8e90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF__RepoObjec__has_h__2AA05119';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '8c90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF__RepoObjec__has_h__29AC2CE0';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '4690291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '23f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'target_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2ff47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'source_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2ef47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_update_changed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2df47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_truncate';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2cf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_insert';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2bf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_delete_missing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2af47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_delete_changed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '29f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_check_for_empty_source';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '28f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_check_duplicate_per_pk';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '27f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'history_table_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '26f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'history_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '25f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'has_history_columns';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '24f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'has_history';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '31f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'temporal_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '30f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '4890291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObject_persistence';


GO



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_persistence].[has_history]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'temporal_type';




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(CONVERT([tinyint],case [has_history] when (1) then (2) else (0) end))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'temporal_type';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'target_RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'4890291C-9D61-EB11-84DC-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:reference.RepoObject_reference_persistence.adoc[]
* xref:reference.RepoObject_reference_T_bidirectional.adoc[]
* xref:reference.RepoObjectColumn_reference_Persistence.adoc[]
* xref:repo.RepoObject__after_delete.adoc[]
* xref:repo.RepoObject_gross.adoc[]
* xref:repo.RepoObject_persistence_column.adoc[]
* xref:repo.RepoObject_persistence_ForUpdate.adoc[]
* xref:repo.RepoObject_persistence_ObjectNames.adoc[]
* xref:repo.RepoObjectColumn_HistValidColums_setpoint.adoc[]
* xref:repo.usp_Index_finish.adoc[]
* xref:repo.usp_persistence_set.adoc[]
* xref:repo.usp_sync_guid_RepoObject.adoc[]
* xref:repo.usp_sync_guid_RepoObjectColumn.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence';




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'changed columns should be updated in persistence target +
An alternative option is ''is_persistence_delete_changed'' +
This requires a (real or virtual) PK defined in the source', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_update_changed';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'missing columns or all columns should be inserted into persistence target +
The final result depends on other settings

* ''is_persistence_truncate'' = 1 and ''is_persistence_insert'' = 1 will just truncate the persistence target and insert all entries from persistence source
* if a (real or virtual) PK is defined in the source, the insert can be combined with delete and update
', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_insert';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'missing columns should be deleted in persistence target +
This requires a (real or virtual) PK defined in the source', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_delete_missing';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'changed columns should be deleted in persistence target +
An alternative option is ''is_persistence_update_changed'' +
This requires a (real or virtual) PK defined in the source', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_delete_changed';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'persistence source should be checked empty source, empty source should not be persisted', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_check_for_empty_source';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'persistence source should be checked for duplicates per entry in the primary key. +
This requires a (real or virtual) PK defined in the source', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_check_duplicate_per_pk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'the final history_table_name will be defined in xref:sqldb:repo.RepoObject_SqlCreateTable.adoc[] +
it looks like this column here is currently not used and should or could be deleted', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'history_table_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'the final history_schema_name will be defined in xref:sqldb:repo.RepoObject_SqlCreateTable.adoc[] +
it looks like this column here is currently not used and should or could be deleted', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'history_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'history columns are created. Can be used if only these columns are required, but not the related history table', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'has_history_columns';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'temporal table should be created, it will also automatically create the columns required for the history', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'has_history';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'fe456058-8af6-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_persistence_is_persistence_update_changed1';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'fd456058-8af6-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_persistence_is_persistence_insert1';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'fc456058-8af6-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_persistence_is_persistence_delete_missing1';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5ad9c65f-8af6-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'target_filter';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '59d9c65f-8af6-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'source_filter';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '58d9c65f-8af6-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_merge_update_changed';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'changed columns should be updated in persistence target +
An alternative option is ''is_persistence_delete_changed'' +
This requires a (real or virtual) PK defined in the source', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_merge_update_changed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '57d9c65f-8af6-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_merge_insert';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'missing columns or all columns should be inserted into persistence target +
The final result depends on other settings

* ''is_persistence_truncate'' = 1 and ''is_persistence_insert'' = 1 will just truncate the persistence target and insert all entries from persistence source
* if a (real or virtual) PK is defined in the source, the insert can be combined with delete and update
', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_merge_insert';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '56d9c65f-8af6-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_merge_delete_missing';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'missing columns should be deleted in persistence target +
This requires a (real or virtual) PK defined in the source', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_merge_delete_missing';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObject_persistence';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObject_persistence';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObject_persistence__RepoObject__target';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObject_persistence__RepoObject__target';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_persistence_is_persistence_update_changed1';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_persistence_is_persistence_update_changed1';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_persistence_is_persistence_insert1';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_persistence_is_persistence_insert1';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_persistence_is_persistence_delete_missing1';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_persistence_is_persistence_delete_missing1';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_persistence_is_persistence_check_for_empty_source1';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_persistence_is_persistence_check_for_empty_source1';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF__RepoObjec__is_pe__30592A6F';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF__RepoObjec__is_pe__30592A6F';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF__RepoObjec__is_pe__2F650636';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF__RepoObjec__is_pe__2F650636';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF__RepoObjec__is_pe__2E70E1FD';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF__RepoObjec__is_pe__2E70E1FD';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF__RepoObjec__is_pe__2D7CBDC4';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF__RepoObjec__is_pe__2D7CBDC4';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF__RepoObjec__is_pe__2C88998B';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF__RepoObjec__is_pe__2C88998B';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF__RepoObjec__is_hi__2B947552';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF__RepoObjec__is_hi__2B947552';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF__RepoObjec__has_h__2AA05119';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF__RepoObjec__has_h__2AA05119';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF__RepoObjec__has_h__29AC2CE0';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence', @level2type = N'CONSTRAINT', @level2name = N'DF__RepoObjec__has_h__29AC2CE0';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_persistence';

