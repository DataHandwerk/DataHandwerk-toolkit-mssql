

/*
Added some lookup columns [repo].[RepoObject_persistence]
to simplify data entry in the frontend
*/
CREATE View [repo].[RepoObject_persistence_ForUpdate]
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
  , ro_p.is_persistence_persist_source
  , ro_p.ColumnListIgnore
  , ro_p.ColumnListNoCompareButUpdate
  , ro_p.ColumnListNoCompareNoUpdate
  , ro_p.ColumnListNoInsert
  , ro_p.source_RepoObject_guid
  , ro_p.prescript
  , ro_p.postscript
  --, ro_p.is_persistence
  --, ro_p.temporal_type
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



GO





GO



GO



GO





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



GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.RepoObject.adoc[]
* xref:repo.RepoObject_persistence.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate';


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


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7addc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'is_persistence_persist_source';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f3fc3777-245f-ec11-8536-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'prescript';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f4fc3777-245f-ec11-8536-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'postscript';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '99034690-576e-ec11-8539-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'ColumnListNoCompareNoUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '98034690-576e-ec11-8539-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'ColumnListNoCompareButUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '97034690-576e-ec11-8539-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'ColumnListIgnore';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '26894b8d-2c2d-ed11-8577-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_ForUpdate', @level2type = N'COLUMN', @level2name = N'ColumnListNoInsert';

