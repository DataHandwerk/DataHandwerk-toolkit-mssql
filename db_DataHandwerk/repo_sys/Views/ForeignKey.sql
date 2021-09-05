


CREATE View repo_sys.ForeignKey
As
Select
    fk.name
  , fk.object_id
  , fk.principal_id
  , fk.schema_id
  , fk.parent_object_id
  , fk.type
  , fk.type_desc
  , fk.create_date
  , fk.modify_date
  , fk.is_ms_shipped
  , fk.is_published
  , fk.is_schema_published
  , fk.referenced_object_id
  , fk.key_index_id
  , fk.is_disabled
  , fk.is_not_for_replication
  , fk.is_not_trusted
  , fk.delete_referential_action
  , fk.delete_referential_action_desc
  , fk.update_referential_action
  , fk.update_referential_action_desc
  , fk.is_system_named
  , ForeignKey_guid            = ro.RepoObject_guid
  , ForeignKey_fullname        = ro.RepoObject_fullname
  , parent_RepoObject_guid     = parent_ro.RepoObject_guid
  , parent_RepoObject_fullname = parent_ro.RepoObject_fullname
  , parent_SysObject_fullname  = parent_ro.SysObject_fullname
From
    sys_dwh.foreign_keys As fk
    Left Join
        repo.RepoObject  As ro
            On
            ro.SysObject_id        = fk.object_id

    Left Join
        repo.RepoObject  As parent_ro
            On
            parent_ro.SysObject_id = fk.parent_object_id
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


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[RepoObject]
* [sys_dwh].[foreign_keys]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.ForeignKey_IndexPattern.adoc[]
* xref:repo_sys.ForeignKeyColumn.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.RepoObject.adoc[]
* xref:sys_dwh.foreign_keys.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[SysObject_fullname]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'parent_SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[SysObject_schema_name],''].['',[SysObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'parent_SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'parent_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_fullname]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'parent_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'parent_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'ForeignKey_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_fullname]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'ForeignKey_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey', @level2type = N'COLUMN', @level2name = N'ForeignKey_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKey';

