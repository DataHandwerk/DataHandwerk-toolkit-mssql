
/*
Added some lookup columns [repo].[RepoObject_persistence]
to simplify data entry in the frontend
*/
CREATE View repo.RepoObject_persistence_ForUpdate
As
Select
    ro_p.target_RepoObject_guid
  , target_RepoObject_fullname     = ro.RepoObject_fullname
  , target_RepoObject_fullname2    = ro.RepoObject_fullname2
  , target_name                    = ro.RepoObject_name
  , target_schema                  = ro.RepoObject_schema_name
  , ro_p.has_history
  , ro_p.has_history_columns
  , ro_p.history_schema_name
  , ro_p.history_table_name
  , ro_p.is_persistence_check_duplicate_per_pk
  , ro_p.is_persistence_check_for_empty_source
  , ro_p.is_persistence_delete_changed
  , ro_p.is_persistence_delete_missing
  , ro_p.is_persistence_insert
  , ro_p.is_persistence_truncate
  , ro_p.is_persistence_update_changed
  , ro_p.source_RepoObject_guid
  , ro_p.is_persistence
  , ro_p.temporal_type
  , ro_p.source_RepoObject_name
  , default_source_RepoObject_name = Iif(Right(ro.RepoObject_name, 2) = '_T'
                                         , Left(ro.RepoObject_name, Len ( ro.RepoObject_name ) - 2)
                                         , Null)
From
    repo.RepoObject_persistence As ro_p
    Inner Join
        repo.RepoObject         As ro
            On
            ro.RepoObject_guid = ro_p.target_RepoObject_guid
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '98813d1c-6662-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'temporal_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_persistence].[temporal_type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'temporal_type';




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(CONVERT([tinyint],case [has_history] when (1) then (2) else (0) end))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'temporal_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '97813d1c-6662-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'is_persistence';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_persistence].[is_persistence]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'is_persistence';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '96813d1c-6662-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'source_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_persistence].[source_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'source_RepoObject_guid';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '95813d1c-6662-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'is_persistence_update_changed';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_persistence].[is_persistence_update_changed]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'is_persistence_update_changed';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '94813d1c-6662-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'is_persistence_truncate';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_persistence].[is_persistence_truncate]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'is_persistence_truncate';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '93813d1c-6662-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'is_persistence_insert';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_persistence].[is_persistence_insert]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'is_persistence_insert';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '92813d1c-6662-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'is_persistence_delete_missing';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_persistence].[is_persistence_delete_missing]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'is_persistence_delete_missing';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '91813d1c-6662-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'is_persistence_delete_changed';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_persistence].[is_persistence_delete_changed]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'is_persistence_delete_changed';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_persistence].[is_persistence_check_for_empty_source]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'is_persistence_check_for_empty_source';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '90813d1c-6662-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'is_persistence_check_for_empty_source';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8f813d1c-6662-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'is_persistence_check_duplicate_per_pk';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_persistence].[is_persistence_check_duplicate_per_pk]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'is_persistence_check_duplicate_per_pk';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8e813d1c-6662-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'history_table_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_persistence].[history_table_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'history_table_name';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8d813d1c-6662-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'history_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_persistence].[history_schema_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'history_schema_name';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8c813d1c-6662-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'has_history_columns';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_persistence].[has_history_columns]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'has_history_columns';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8b813d1c-6662-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'has_history';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_persistence].[has_history]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'has_history';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8a813d1c-6662-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'target_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '89813d1c-6662-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'target_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_persistence].[target_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'target_RepoObject_guid';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '88813d1c-6662-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[RepoObject]
* [repo].[RepoObject_persistence]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'target_RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'118AA10A-AB97-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.RepoObject.adoc[]
* xref:repo.RepoObject_persistence.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'target_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'changed columns should be updated in persistence target +
An alternative option is ''is_persistence_delete_changed'' +
This requires a (real or virtual) PK defined in the source', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'is_persistence_update_changed';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'missing columns or all columns should be inserted into persistence target +
The final result depends on other settings

* ''is_persistence_truncate'' = 1 and ''is_persistence_insert'' = 1 will just truncate the persistence target and insert all entries from persistence source
* if a (real or virtual) PK is defined in the source, the insert can be combined with delete and update
', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'is_persistence_insert';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'missing columns should be deleted in persistence target +
This requires a (real or virtual) PK defined in the source', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'is_persistence_delete_missing';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'changed columns should be deleted in persistence target +
An alternative option is ''is_persistence_update_changed'' +
This requires a (real or virtual) PK defined in the source', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'is_persistence_delete_changed';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'persistence source should be checked empty source, empty source should not be persisted', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'is_persistence_check_for_empty_source';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'persistence source should be checked for duplicates per entry in the primary key. +
This requires a (real or virtual) PK defined in the source', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'is_persistence_check_duplicate_per_pk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'the final history_table_name will be defined in xref:sqldb:repo.RepoObject_SqlCreateTable.adoc[] +
it looks like this column here is currently not used and should or could be deleted', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'history_table_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'the final history_schema_name will be defined in xref:sqldb:repo.RepoObject_SqlCreateTable.adoc[] +
it looks like this column here is currently not used and should or could be deleted', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'history_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'history columns are created. Can be used if only these columns are required, but not the related history table', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'has_history_columns';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'temporal table should be created, it will also automatically create the columns required for the history', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'has_history';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_fullname]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'target_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ed2c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'target_schema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eb2c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'target_RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ec2c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'target_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ee2c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'source_RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ef2c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'default_source_RepoObject_name';

