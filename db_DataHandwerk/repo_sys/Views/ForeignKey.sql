

CREATE View [repo_sys].[ForeignKey]
As
Select
    name
  , object_id
  , principal_id
  , schema_id
  , parent_object_id
  , type
  , type_desc
  , create_date
  , modify_date
  , is_ms_shipped
  , is_published
  , is_schema_published
  , referenced_object_id
  , key_index_id
  , is_disabled
  , is_not_for_replication
  , is_not_trusted
  , delete_referential_action
  , delete_referential_action_desc
  , update_referential_action
  , update_referential_action_desc
  , is_system_named
  , ForeignKey_guid = ro.RepoObject_guid
  , ForeignKey_fullname = ro.RepoObject_fullname
  , parent_RepoObject_guid     = parent_ro.RepoObject_guid
  , parent_RepoObject_fullname = parent_ro.RepoObject_fullname
  , parent_SysObject_fullname  = parent_ro.SysObject_fullname
From sys_dwh.foreign_keys     As fk
    Left Join repo.RepoObject As ro
        On ro.SysObject_id = fk.object_id
    Left Join repo.RepoObject As parent_ro
        On parent_ro.SysObject_id = fk.parent_object_id
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c556741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'parent_SysObject_fullname';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c456741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'parent_RepoObject_fullname';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c356741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'parent_RepoObject_guid';




GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c056741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'is_system_named';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bf56741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'update_referential_action_desc';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'be56741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'update_referential_action';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bd56741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'delete_referential_action_desc';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bc56741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'delete_referential_action';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bb56741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'is_not_trusted';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ba56741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'is_not_for_replication';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b956741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'is_disabled';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b856741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'key_index_id';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b756741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'referenced_object_id';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b656741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'is_schema_published';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b556741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'is_published';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b456741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'is_ms_shipped';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b356741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'modify_date';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b256741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'create_date';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b156741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'type_desc';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b056741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'type';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'af56741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'parent_object_id';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ae56741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'schema_id';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ad56741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'principal_id';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ac56741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'object_id';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ab56741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'name';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a356741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c156741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'ForeignKey_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c256741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'ForeignKey_fullname';

