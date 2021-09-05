
/*
Source - Sys names will be used
to create
Target - Repo names (because a persistence is per definition defined as 

if ro_s columns are empty, then the entry in [rop].[source_RepoObject_guid] is wrong and should be corrected or the entry should be deleted

SELECT
       *
FROM
     repo.RepoObject_persistence_ObjectNames AS T1
WHERE  [T1].[SysObject_name_s] IS NULL

*/
CREATE View repo.RepoObject_persistence_ObjectNames
As
--
Select
    rop.target_RepoObject_guid
  , rop.source_RepoObject_guid
  , SysObject_schema_name_s  = ro_s.SysObject_schema_name
  , SysObject_name_s         = ro_s.SysObject_name
  , SysObject_type_s         = ro_s.SysObject_type
  , RepoObject_schema_name_t = ro_t.RepoObject_schema_name
  , RepoObject_name_t        = ro_t.RepoObject_name
  , RepoObject_type_t        = ro_t.RepoObject_type
  , is_repo_managed_t        = ro_t.is_repo_managed
  , rop.is_persistence_truncate
  , rop.is_persistence_delete_missing
  , rop.is_persistence_delete_changed
  , rop.is_persistence_update_changed
  , rop.is_persistence_insert
  , rop.has_history
  , rop.has_history_columns
  , rop.is_persistence_check_for_empty_source
  , rop.history_schema_name
  , rop.history_table_name
  , rop.is_persistence
From
    repo.RepoObject_persistence As rop
    Inner Join
        repo.RepoObject         As ro_t
            On
            rop.target_RepoObject_guid = ro_t.RepoObject_guid

    Left Outer Join
        repo.RepoObject         As ro_s
            On
            rop.source_RepoObject_guid = ro_s.RepoObject_guid
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '0590291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_ObjectNames';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '5cf27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_ObjectNames'
  , @level2type = N'COLUMN'
  , @level2name = N'target_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '60f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_ObjectNames'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_type_s';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '5ef27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_ObjectNames'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_schema_name_s';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '5ff27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_ObjectNames'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_name_s';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '5df27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_ObjectNames'
  , @level2type = N'COLUMN'
  , @level2name = N'source_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '63f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_ObjectNames'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_type_t';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '61f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_ObjectNames'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_schema_name_t';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '62f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_ObjectNames'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_name_t';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '64f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_ObjectNames'
  , @level2type = N'COLUMN'
  , @level2name = N'is_repo_managed_t';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '68f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_ObjectNames'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_update_changed';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '65f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_ObjectNames'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_truncate';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '69f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_ObjectNames'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_insert';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '66f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_ObjectNames'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_delete_missing';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '67f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_ObjectNames'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_delete_changed';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6cf27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_ObjectNames'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_check_for_empty_source';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6ff27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_ObjectNames'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6ef27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_ObjectNames'
  , @level2type = N'COLUMN'
  , @level2name = N'history_table_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6df27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_ObjectNames'
  , @level2type = N'COLUMN'
  , @level2name = N'history_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6bf27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_ObjectNames'
  , @level2type = N'COLUMN'
  , @level2name = N'has_history_columns';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6af27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_persistence_ObjectNames'
  , @level2type = N'COLUMN'
  , @level2name = N'has_history';
Go

Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_persistence].[target_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames', @level2type = N'COLUMN', @level2name = N'target_RepoObject_guid';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_persistence].[source_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames', @level2type = N'COLUMN', @level2name = N'source_RepoObject_guid';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_persistence].[is_persistence_update_changed]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames', @level2type = N'COLUMN', @level2name = N'is_persistence_update_changed';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_persistence].[is_persistence_truncate]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames', @level2type = N'COLUMN', @level2name = N'is_persistence_truncate';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_persistence].[is_persistence_insert]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames', @level2type = N'COLUMN', @level2name = N'is_persistence_insert';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_persistence].[is_persistence_delete_missing]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames', @level2type = N'COLUMN', @level2name = N'is_persistence_delete_missing';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_persistence].[is_persistence_delete_changed]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames', @level2type = N'COLUMN', @level2name = N'is_persistence_delete_changed';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_persistence].[is_persistence_check_for_empty_source]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames', @level2type = N'COLUMN', @level2name = N'is_persistence_check_for_empty_source';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_persistence].[is_persistence]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames', @level2type = N'COLUMN', @level2name = N'is_persistence';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_persistence].[history_table_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames', @level2type = N'COLUMN', @level2name = N'history_table_name';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_persistence].[history_schema_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames', @level2type = N'COLUMN', @level2name = N'history_schema_name';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_persistence].[has_history_columns]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames', @level2type = N'COLUMN', @level2name = N'has_history_columns';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_persistence].[has_history]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames', @level2type = N'COLUMN', @level2name = N'has_history';



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[RepoObject]
* [repo].[RepoObject_persistence]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'target_RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'FA89A10A-AB97-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.RepoObject.adoc[]
* xref:repo.RepoObject_persistence.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'reference in [repo_sys].[type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames', @level2type = N'COLUMN', @level2name = N'SysObject_type_s';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'reference in [repo_sys].[type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames', @level2type = N'COLUMN', @level2name = N'RepoObject_type_t';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'changed columns should be updated in persistence target +
An alternative option is ''is_persistence_delete_changed'' +
This requires a (real or virtual) PK defined in the source', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames', @level2type = N'COLUMN', @level2name = N'is_persistence_update_changed';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'missing columns or all columns should be inserted into persistence target +
The final result depends on other settings

* ''is_persistence_truncate'' = 1 and ''is_persistence_insert'' = 1 will just truncate the persistence target and insert all entries from persistence source
* if a (real or virtual) PK is defined in the source, the insert can be combined with delete and update
', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames', @level2type = N'COLUMN', @level2name = N'is_persistence_insert';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'missing columns should be deleted in persistence target +
This requires a (real or virtual) PK defined in the source', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames', @level2type = N'COLUMN', @level2name = N'is_persistence_delete_missing';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'changed columns should be deleted in persistence target +
An alternative option is ''is_persistence_update_changed'' +
This requires a (real or virtual) PK defined in the source', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames', @level2type = N'COLUMN', @level2name = N'is_persistence_delete_changed';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'persistence source should be checked empty source, empty source should not be persisted', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames', @level2type = N'COLUMN', @level2name = N'is_persistence_check_for_empty_source';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'the final history_table_name will be defined in xref:sqldb:repo.RepoObject_SqlCreateTable.adoc[] +
it looks like this column here is currently not used and should or could be deleted', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames', @level2type = N'COLUMN', @level2name = N'history_table_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'the final history_schema_name will be defined in xref:sqldb:repo.RepoObject_SqlCreateTable.adoc[] +
it looks like this column here is currently not used and should or could be deleted', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames', @level2type = N'COLUMN', @level2name = N'history_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'history columns are created. Can be used if only these columns are required, but not the related history table', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames', @level2type = N'COLUMN', @level2name = N'has_history_columns';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'temporal table should be created, it will also automatically create the columns required for the history', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames', @level2type = N'COLUMN', @level2name = N'has_history';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[SysObject_type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames', @level2type = N'COLUMN', @level2name = N'SysObject_type_s';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[SysObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames', @level2type = N'COLUMN', @level2name = N'SysObject_schema_name_s';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[SysObject_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames', @level2type = N'COLUMN', @level2name = N'SysObject_name_s';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames', @level2type = N'COLUMN', @level2name = N'RepoObject_type_t';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name_t';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames', @level2type = N'COLUMN', @level2name = N'RepoObject_name_t';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[is_repo_managed]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ObjectNames', @level2type = N'COLUMN', @level2name = N'is_repo_managed_t';

