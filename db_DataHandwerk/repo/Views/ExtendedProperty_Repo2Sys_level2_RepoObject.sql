Create View repo.ExtendedProperty_Repo2Sys_level2_RepoObject
As
Select
    prop.property_name
  , prop.property_value
  , level0type             = N'Schema'
  , level0name             = ro_parent.RepoObject_schema_name
  , lev_parent.level1type
  , level1name             = ro_parent.RepoObject_name
  , lev.level2type
  , level2name             = ro.RepoObject_name
  , prop.RepoObject_guid
  , ro.RepoObject_type
  , parent_RepoObject_guid = ro_parent.RepoObject_guid
  , parent_RepoObject_type = ro_parent.RepoObject_type
From
    repo.RepoObjectProperty               As prop
    Inner Join
        repo.RepoObject                   As ro
            On
            ro.RepoObject_guid     = prop.RepoObject_guid

    Inner Join
        config.type_level1type_level2type As lev
            On
            lev.type               = ro.RepoObject_type

    Inner Join
        repo.RepoObject                   As ro_parent
            On
            ro_parent.SysObject_id = ro.SysObject_parent_object_id

    Inner Join
        config.type_level1type_level2type As lev_parent
            On
            lev_parent.type        = ro_parent.RepoObject_type
Where
    Not lev.level2type Is Null
    And ro_parent.SysObject_id > 0;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '56b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '89b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '88b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '81b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject'
  , @level2type = N'COLUMN'
  , @level2name = N'property_value';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '80b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject'
  , @level2type = N'COLUMN'
  , @level2name = N'property_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8bb33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_RepoObject_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8ab33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '86b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject'
  , @level2type = N'COLUMN'
  , @level2name = N'level2type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '87b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject'
  , @level2type = N'COLUMN'
  , @level2name = N'level2name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '84b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject'
  , @level2type = N'COLUMN'
  , @level2name = N'level1type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '85b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject'
  , @level2type = N'COLUMN'
  , @level2name = N'level1name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '82b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject'
  , @level2type = N'COLUMN'
  , @level2name = N'level0type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '83b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject'
  , @level2type = N'COLUMN'
  , @level2name = N'level0name';
