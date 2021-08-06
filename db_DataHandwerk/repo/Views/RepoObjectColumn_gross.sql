
CREATE View [repo].[RepoObjectColumn_gross]
As
--
Select
    --
    roc.RepoObjectColumn_guid
  , roc.Column_name
  , roc.has_different_sys_names
  , roc.Inheritance_StringAggSeparatorSql
  , roc.InheritanceDefinition
  , roc.InheritanceType
  , roc.is_persistence_no_check
  , roc.is_persistence_no_include
  , roc.is_persistence_no_update
  , roc.is_query_plan_expression
  , roc.is_RepoObjectColumn_name_uniqueidentifier
  , roc.is_required_ColumnMerge
  , roc.is_SysObjectColumn_missing
  , roc.is_SysObjectColumn_name_uniqueidentifier
  , roc.persistence_source_RepoObjectColumn_guid
  , roc.Referencing_Count
  , roc.Repo_default_definition
  , roc.Repo_default_is_system_named
  , roc.Repo_default_name
  , roc.Repo_definition
  , roc.Repo_generated_always_type
  , roc.Repo_graph_type
  , roc.Repo_is_computed
  , roc.Repo_is_identity
  , roc.Repo_is_nullable
  , roc.Repo_is_persisted
  , roc.Repo_seed_value
  , roc.Repo_increment_value
  , roc.Repo_user_type_fullname
  , roc.Repo_user_type_name
  , roc.Repo_uses_database_collation
  , roc.RepoObject_guid
  , roc.RepoObjectColumn_column_id
  , RepoObjectColumn_fullname  = Concat ( ro.RepoObject_fullname, '.', QuoteName ( roc.RepoObjectColumn_name ))
  , RepoObjectColumn_fullname2 = Concat ( ro.RepoObject_fullname2, '.', roc.RepoObjectColumn_name )
  , roc.RepoObjectColumn_name
  , roc.SysObjectColumn_column_id
  , roc.SysObjectColumn_name
  , ro.has_get_referenced_issue
  , ro.is_repo_managed
  , ro.is_RepoObject_name_uniqueidentifier
  , ro.is_SysObject_missing
  , ro.is_SysObject_name_uniqueidentifier
  , ro.modify_dt
  , ro.node_id
  , ro.pk_index_guid
  , ro.RepoObject_fullname
  , ro.RepoObject_fullname2
  , ro.RepoObject_name
  , ro.RepoObject_Referencing_Count
  , ro.RepoObject_schema_name
  , ro.RepoObject_type
  , ro.SysObject_fullname
  , ro.SysObject_fullname2
  , ro.SysObject_id
  , ro.SysObject_modify_date
  , ro.SysObject_name
  , ro.SysObject_schema_name
  , ro.SysObject_type
  , ro.SysObject_parent_object_id
  , ic.index_column_id
  , ic.index_name
  , ic.is_index_primary_key
  , Property_ms_description    = [property].fs_get_RepoObjectColumnProperty_nvarchar (
                                                                                   roc.RepoObjectColumn_guid
                                                                                 , 'ms_description'
                                                                               )
  , roc_referenced.AntoraReferencedColumnList
  , roc_referencing.AntoraReferencingColumnList
From
    repo.RepoObjectColumn                     As roc
    Inner Join
        repo.RepoObject                       As ro
            On
            roc.RepoObject_guid             = ro.RepoObject_guid

    Left Outer Join
        repo.IndexColumn_union                As ic
            On
            ic.index_guid                   = ro.pk_index_guid
            And ic.RepoObjectColumn_guid    = roc.RepoObjectColumn_guid

    Left Join
        [reference].RepoObjectColumn_ReferencedList  As roc_referenced
            On
            roc_referenced.Referencing_guid = roc.RepoObjectColumn_guid

    Left Join
        [reference].RepoObjectColumn_ReferencingList As roc_referencing
            On
            roc_referencing.Referenced_guid = roc.RepoObjectColumn_guid;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '6990291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '31f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObjectColumn_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '30f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObjectColumn_column_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '44f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '43f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '45f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_parent_object_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '42f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '41f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_modify_date';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '40f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3ff67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '2ff67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '13f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '2ef67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_column_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3ef67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3df67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3cf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_Referencing_Count';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3bf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '2df67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3af67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '2cf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_uses_database_collation';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '2bf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_user_type_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '2af67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_user_type_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '28f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_seed_value';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '27f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_is_persisted';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '26f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_is_nullable';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '25f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_is_identity';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '24f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_is_computed';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '29f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_increment_value';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '23f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_graph_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '22f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_generated_always_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '21f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_definition';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '20f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_default_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1ff67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_default_is_system_named';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1ef67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_default_definition';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1df67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Referencing_Count';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '39f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'pk_index_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1cf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'persistence_source_RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '38f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'node_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '37f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'modify_dt';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1bf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_SysObjectColumn_name_uniqueidentifier';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1af67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_SysObjectColumn_missing';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '36f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_SysObject_name_uniqueidentifier';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '35f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_SysObject_missing';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '19f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_RepoObjectColumn_name_uniqueidentifier';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '34f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_RepoObject_name_uniqueidentifier';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '33f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_repo_managed';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '18f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_query_plan_expression';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '17f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_no_update';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '16f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_no_include';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '15f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_no_check';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '48f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_index_primary_key';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '47f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'index_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '46f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'index_column_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '32f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'has_get_referenced_issue';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '14f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'has_different_sys_names';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd2b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'InheritanceType';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd1b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'InheritanceDefinition';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd0b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Inheritance_StringAggSeparatorSql';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd3b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3bdf2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Property_ms_description';
Go

Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[SysObjectColumn_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObjectColumn_name';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'Name of the column. Is unique within the object.
if it not exists in the database, the RepoObject_guid or any other guid is used, because this column should not be empty'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObjectColumn_name';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[SysObjectColumn_column_id]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObjectColumn_column_id';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'ID of the column. Is unique within the object.
Column IDs might not be sequential.'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObjectColumn_column_id';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[SysObject_type]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_type';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'reference in [repo_sys].[type]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_type';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[SysObject_schema_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[SysObject_parent_object_id]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_parent_object_id';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[SysObject_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_name';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[SysObject_modify_date]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_modify_date';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[SysObject_id]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_id';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[SysObject_fullname]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'(concat(''['',[SysObject_schema_name],''].['',[SysObject_name],'']''))'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[RepoObjectColumn_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_name';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'Name of the column. Is unique within the object.'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_name';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[RepoObjectColumn_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[RepoObjectColumn_column_id]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_column_id';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'ID of the column. Is unique within the object.
Column IDs might not be sequential.'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_column_id';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[RepoObject_type]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_type';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'reference in [repo_sys].[type]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_type';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[RepoObject_schema_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[RepoObject_Referencing_Count]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_Referencing_Count';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[RepoObject_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_name';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[RepoObject_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[RepoObject_fullname]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[Repo_uses_database_collation]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_uses_database_collation';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[Repo_user_type_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_user_type_name';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[Repo_user_type_fullname]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_user_type_fullname';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[Repo_seed_value]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_seed_value';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[Repo_is_persisted]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_is_persisted';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[Repo_is_nullable]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_is_nullable';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[Repo_is_identity]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_is_identity';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[Repo_is_computed]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_is_computed';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[Repo_increment_value]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_increment_value';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[Repo_graph_type]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_graph_type';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'https://docs.microsoft.com/en-us/sql/relational-databases/graphs/sql-graph-architecture

The sys.columns view contains additional columns graph_type and graph_type_desc, that indicate the type of the column in node and edge tables.

graph_type
int
Internal column with a set of values. The values are between 1-8 for graph columns and NULL for others.

graph_type_desc
nvarchar(60)
internal column with a set of values

Column Value	Description
1	GRAPH_ID
2	GRAPH_ID_COMPUTED
3	GRAPH_FROM_ID
4	GRAPH_FROM_OBJ_ID
5	GRAPH_FROM_ID_COMPUTED
6	GRAPH_TO_ID
7	GRAPH_TO_OBJ_ID
8	GRAPH_TO_ID_COMPUTED'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_graph_type';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[Repo_generated_always_type]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_generated_always_type';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'Applies to: SQL Server 2016 (13.x) and later, SQL Database.
Identifies when the column value is generated (will always be 0 for columns in system tables):
0 = NOT_APPLICABLE
1 = AS_ROW_START
2 = AS_ROW_END
For more information, see Temporal Tables (Relational databases).'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_generated_always_type';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[Repo_definition]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_definition';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[Repo_default_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_default_name';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[Repo_default_is_system_named]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_default_is_system_named';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[Repo_default_definition]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_default_definition';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[Referencing_Count]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Referencing_Count';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[pk_index_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'pk_index_guid';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[persistence_source_RepoObjectColumn_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'persistence_source_RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[node_id]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'node_id';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'(CONVERT([bigint],[SysObject_id])*(10000))'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'node_id';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[modify_dt]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'modify_dt';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[is_SysObjectColumn_name_uniqueidentifier]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_SysObjectColumn_name_uniqueidentifier';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'(case when TRY_CAST([SysObjectColumn_name] AS [uniqueidentifier]) IS NULL then (0) else (1) end)'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_SysObjectColumn_name_uniqueidentifier';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[is_SysObjectColumn_missing]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_SysObjectColumn_missing';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[is_SysObject_name_uniqueidentifier]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_SysObject_name_uniqueidentifier';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'(case when TRY_CAST([SysObject_name] AS [uniqueidentifier]) IS NULL then (0) else (1) end)'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_SysObject_name_uniqueidentifier';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[is_SysObject_missing]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_SysObject_missing';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[is_RepoObjectColumn_name_uniqueidentifier]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_RepoObjectColumn_name_uniqueidentifier';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'(case when TRY_CAST([RepoObjectColumn_name] AS [uniqueidentifier]) IS NULL then (0) else (1) end)'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_RepoObjectColumn_name_uniqueidentifier';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[is_RepoObject_name_uniqueidentifier]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_RepoObject_name_uniqueidentifier';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'(case when TRY_CAST([RepoObject_name] AS [uniqueidentifier]) IS NULL then (0) else (1) end)'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_RepoObject_name_uniqueidentifier';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[is_repo_managed]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_repo_managed';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[is_query_plan_expression]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_query_plan_expression';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[is_persistence_no_update]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_no_update';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[is_persistence_no_include]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_no_include';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[is_persistence_no_check]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persistence_no_check';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[IndexColumn_union].[is_index_primary_key]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_index_primary_key';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[IndexColumn_union].[index_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'index_name';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[IndexColumn_union].[index_column_id]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'index_column_id';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[has_get_referenced_issue]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'has_get_referenced_issue';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn].[has_different_sys_names]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'has_different_sys_names';
Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'(CONVERT([bit],case when [RepoObjectColumn_name]<>[SysObjectColumn_name] then (1) else (0) end))'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'has_different_sys_names';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0039cf17-0592-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fe38cf17-0592-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ff38cf17-0592-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'bb35b4cd-e093-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'AntoraReferencingColumnList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ba35b4cd-e093-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'AntoraReferencedColumnList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0bfb57e8-9f9b-eb11-84f6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_required_ColumnMerge';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [property].[fs_get_RepoObjectColumnProperty_nvarchar]
* [reference].[RepoObjectColumn_ReferencedList]
* [reference].[RepoObjectColumn_ReferencingList]
* [repo].[IndexColumn_union]
* [repo].[RepoObject]
* [repo].[RepoObjectColumn]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'RepoObjectColumn_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObjectColumn_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = '6e8aa10a-ab97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross';


GO
EXECUTE sp_addextendedproperty @name = N'has_execution_plan_issue', @value = N'1', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.RepoObject_ColumnList.adoc[]
* xref:graph.RepoObjectColumn_S.adoc[]
* xref:property.RepoObjectColumnProperty_ForUpdate.adoc[]
* xref:reference.RepoObjectColumn_reference_FirstResultSet.adoc[]
* xref:reference.RepoObjectColumn_reference_QueryPlan.adoc[]
* xref:reference.RepoObjectColumn_reference_virtual.adoc[]
* xref:reference.usp_RepoObjectColumnSource_virtual_set.adoc[]
* xref:repo.RepoObject_ColumnList.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:property.fs_get_RepoObjectColumnProperty_nvarchar.adoc[]
* xref:reference.RepoObjectColumn_ReferencedList.adoc[]
* xref:reference.RepoObjectColumn_ReferencingList.adoc[]
* xref:repo.IndexColumn_union.adoc[]
* xref:repo.RepoObject.adoc[]
* xref:repo.RepoObjectColumn.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[SysObject_fullname2]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'SysObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat([SysObject_schema_name],''.'',[SysObject_name]))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'SysObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_fullname2]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat([RepoObject_schema_name],''.'',[RepoObject_name]))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[is_required_ColumnMerge]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'is_required_ColumnMerge';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[InheritanceType]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[InheritanceDefinition]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[Inheritance_StringAggSeparatorSql]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'Inheritance_StringAggSeparatorSql';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_ReferencingList].[AntoraReferencingColumnList]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'AntoraReferencingColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_ReferencedList].[AntoraReferencedColumnList]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'AntoraReferencedColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4bae410c-d3f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'Column_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(case when TRY_CAST([RepoObjectColumn_name] AS [uniqueidentifier]) IS NULL then [RepoObjectColumn_name] else [SysObjectColumn_name] end)', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'Column_name';

