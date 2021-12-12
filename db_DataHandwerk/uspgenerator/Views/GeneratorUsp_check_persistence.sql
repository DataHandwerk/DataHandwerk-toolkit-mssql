/*
<<property_start>>Description
Sometimes it can happen that a persistence was created with the Persistence Generator and still exists in xref:sqldb:uspgenerator.generatorusp.adoc[], 
although the persistence has already been removed from xref:sqldb:repo.repoobject_persistence.adoc[].

This view helps to identify such entries and then remove such legacy entries from xref:sqldb:uspgenerator.generatorusp.adoc[]

If the last columns of the xref:sqldb:uspgenerator.generatorusp_check_persistence.adoc[] view have the value NULL, then there is no persistence anymore. The corresponding entries can then be removed from xref:sqldb:uspgenerator.generatorusp.adoc[] after careful checking.
<<property_end>>
*/
CREATE View uspgenerator.GeneratorUsp_check_persistence
As
Select
    T1.id
  , T1.usp_schema
  , T1.usp_name
  , T1.has_logging
  , T1.usp_Description
  , T1.usp_Examples
  , T1.usp_fullname
  , T2.RepoObject_guid
  , T2.RepoObject_fullname
  , T3.target_RepoObject_guid
  , T3.has_history
  , T3.has_history_columns
  , T3.history_schema_name
  , T3.history_table_name
  , T3.is_persistence_check_duplicate_per_pk
  , T3.is_persistence_check_for_empty_source
  , T3.is_persistence_delete_changed
  , T3.is_persistence_delete_missing
  , T3.is_persistence_insert
  , T3.is_persistence_truncate
  , T3.is_persistence_update_changed
  , T3.is_persistence_persist_source
  , T3.is_persistence_merge_delete_missing
  , T3.is_persistence_merge_insert
  , T3.is_persistence_merge_update_changed
  , T3.source_RepoObject_guid
  , T3.source_RepoObject_name
  , T3.is_persistence
  , T3.temporal_type
From
    uspgenerator.GeneratorUsp       As T1
    Left Outer Join
        repo.RepoObject             As T2
            On
            T2.usp_persistence_fullname = T1.usp_fullname

    Left Outer Join
        repo.RepoObject_persistence As T3
            On
            T3.target_RepoObject_guid   = T2.RepoObject_guid
Where
    ( Left(T1.usp_name, 12) = 'usp_PERSIST_' )
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3c6be88f-2055-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_check_persistence', @level2type = N'COLUMN', @level2name = N'temporal_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3b6be88f-2055-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_check_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3a6be88f-2055-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_check_persistence', @level2type = N'COLUMN', @level2name = N'source_RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '396be88f-2055-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_check_persistence', @level2type = N'COLUMN', @level2name = N'source_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '386be88f-2055-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_check_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_merge_update_changed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '376be88f-2055-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_check_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_merge_insert';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '366be88f-2055-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_check_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_merge_delete_missing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '356be88f-2055-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_check_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_persist_source';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '346be88f-2055-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_check_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_update_changed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '336be88f-2055-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_check_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_truncate';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '326be88f-2055-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_check_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_insert';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '316be88f-2055-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_check_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_delete_missing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '306be88f-2055-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_check_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_delete_changed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2f6be88f-2055-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_check_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_check_for_empty_source';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2e6be88f-2055-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_check_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_check_duplicate_per_pk';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2d6be88f-2055-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_check_persistence', @level2type = N'COLUMN', @level2name = N'history_table_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2c6be88f-2055-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_check_persistence', @level2type = N'COLUMN', @level2name = N'history_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2b6be88f-2055-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_check_persistence', @level2type = N'COLUMN', @level2name = N'has_history_columns';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2a6be88f-2055-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_check_persistence', @level2type = N'COLUMN', @level2name = N'has_history';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '296be88f-2055-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_check_persistence', @level2type = N'COLUMN', @level2name = N'target_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '286be88f-2055-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_check_persistence', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '276be88f-2055-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_check_persistence', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '266be88f-2055-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_check_persistence', @level2type = N'COLUMN', @level2name = N'usp_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '256be88f-2055-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_check_persistence', @level2type = N'COLUMN', @level2name = N'usp_Examples';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '246be88f-2055-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_check_persistence', @level2type = N'COLUMN', @level2name = N'usp_Description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '236be88f-2055-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_check_persistence', @level2type = N'COLUMN', @level2name = N'has_logging';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '226be88f-2055-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_check_persistence', @level2type = N'COLUMN', @level2name = N'usp_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '216be88f-2055-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_check_persistence', @level2type = N'COLUMN', @level2name = N'usp_schema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '206be88f-2055-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_check_persistence', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f604f585-2055-ec11-8533-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_check_persistence';

