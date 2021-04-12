Create View repo.SysColumn_RepoObjectColumn_via_name
As
--
Select
    sc.SysObject_id
  , sc.SysObject_column_id
  , ro.is_repo_managed
  , ro.RepoObject_fullname
  , ro.SysObject_fullname
  , roc.has_different_sys_names
  , roc.is_query_plan_expression
  , roc.is_RepoObjectColumn_name_uniqueidentifier
  , roc.is_SysObjectColumn_missing
  , roc.is_SysObjectColumn_name_uniqueidentifier
  , roc.persistence_source_RepoObjectColumn_guid
  , roc.Referencing_Count
  , roc.Repo_default_definition
  , roc.Repo_default_name
  , roc.Repo_default_is_system_named
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
  , roc.RepoObjectColumn_guid
  , roc.RepoObjectColumn_name
  , roc.SysObjectColumn_column_id
  , roc.SysObjectColumn_name
  , sc.default_definition
  , sc.default_is_system_named
  , sc.default_name
  , sc.definition
  , sc.generated_always_type
  , sc.graph_type
  , sc.is_computed
  , sc.is_identity
  , sc.is_nullable
  , sc.is_persisted
  , sc.seed_value
  , sc.increment_value
  , sc.SysObject_column_name
  , sc.SysObject_name
  , sc.SysObject_RepoObject_guid
  , sc.SysObject_RepoObjectColumn_guid
  , sc.SysObject_schema_name
  , sc.SysObject_type
  , sc.user_type_fullname
  , sc.user_type_name
  , sc.uses_database_collation
  --sometimes by error we have same named columns in repo.RepoObjectColumn, additinal columns should be deleted in [repo].[usp_sync_guid_RepoObjectColumn]
  , RowNumberOverName = Row_Number () Over ( Partition By
                                                 sc.SysObject_RepoObject_guid
                                               , sc.SysObject_column_name
                                             Order By
                                                 roc.RepoObjectColumn_guid
                                           )
From
    repo_sys.SysColumn        As sc
    Left Join
        repo.RepoObjectColumn As roc
            On
            sc.SysObject_RepoObject_guid = roc.RepoObject_guid
            And sc.SysObject_column_name = roc.SysObjectColumn_name

    Left Join
        repo.RepoObject       As ro
            On
            roc.RepoObject_guid          = ro.RepoObject_guid;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '5f90291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '99f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'uses_database_collation';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '98f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'user_type_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '97f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'user_type_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '84f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObjectColumn_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '83f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObjectColumn_column_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '96f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '95f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '94f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '93f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '92f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '65f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '69f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '91f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_column_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '66f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_column_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8ff57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'seed_value';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '9af57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'RowNumberOverName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '82f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '81f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '80f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '68f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '7ff57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_uses_database_collation';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '7ef57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_user_type_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '7df57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_user_type_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '7bf57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_seed_value';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '7af57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_is_persisted';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '79f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_is_nullable';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '78f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_is_identity';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '77f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_is_computed';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '7cf57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_increment_value';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '76f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_graph_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '75f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_generated_always_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '74f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_definition';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '72f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_default_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '73f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_default_is_system_named';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '71f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_default_definition';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '70f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'Referencing_Count';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6ff57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'persistence_source_RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6ef57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'is_SysObjectColumn_name_uniqueidentifier';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6df57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'is_SysObjectColumn_missing';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6cf57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'is_RepoObjectColumn_name_uniqueidentifier';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '67f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'is_repo_managed';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6bf57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'is_query_plan_expression';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8ef57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'is_persisted';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8df57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'is_nullable';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8cf57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'is_identity';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8bf57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'is_computed';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '90f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'increment_value';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6af57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'has_different_sys_names';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8af57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'graph_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '89f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'generated_always_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '88f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'definition';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '87f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'default_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '86f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'default_is_system_named';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '85f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'SysColumn_RepoObjectColumn_via_name'
  , @level2type = N'COLUMN'
  , @level2name = N'default_definition';
Go