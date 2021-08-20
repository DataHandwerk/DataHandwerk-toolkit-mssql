

/*
ATTENTION:
[SysObject_RepoObject_guid] has prefix SysObject, because it it the RepoObject_guid stored in repo_sys.extended_properties
but some objects havn't extended properties, for example Triggers
These objects have RepoObject_guid only in [repo].[RepoObject].RepoObject_guid, but they have no SysObject_RepoObject_guid

ATTENTION:
when using synonyms
SCHEMA_NAME([so].schema_id) doesn't return the original schema_name but it runs in the current database 

OBJECT_SCHEMA_NAME muss verwendet werden und die database_id der DWH-Datenbank muss verwendet werden
oder über synonym [sys_dwh].schemas
*/
CREATE View repo_sys.SysObject
As
--
Select
    SysObject_id              = so.object_id
  , SysObject_schema_name     = sch.name Collate Database_Default
  --, OBJECT_SCHEMA_NAME([so].object_id) AS [SysObject_schema_name_]
  , SysObject_name            = so.name Collate Database_Default
  , SysObject_fullname        = Concat ( QuoteName ( sch.name ), '.', QuoteName ( so.name )) Collate Database_Default
  , SysObject_fullname2       = Concat ( sch.name, '.', so.name ) Collate Database_Default
  , SysObject_RepoObject_guid = Try_Cast(ep.property_value As UniqueIdentifier)
  , so.principal_id
  , so.schema_id
  , so.parent_object_id
  , type                      = so.type Collate Database_Default
  , so.type_desc
  , so.create_date
  , so.modify_date
  , so.is_ms_shipped
  , so.is_published
  , so.is_schema_published
  , st.temporal_type
  , st.temporal_type_desc
  , st.history_table_id
  , st.max_column_id_used
  , sql_modules_definition    = sm.definition
From
    sys_dwh.objects                 As so
    Left Outer Join
        sys_dwh.schemas             As sch
            On
            sch.schema_id        = so.schema_id

    Left Outer Join
        repo_sys.ExtendedProperties As ep
            On
            ep.major_id          = so.object_id
            And ep.minor_id      = 0
            And ep.property_name = N'RepoObject_guid'

    Left Outer Join
        sys_dwh.tables              As st
            On
            st.object_id         = so.object_id

    Left Outer Join
        sys_dwh.sql_modules         As sm
            On
            sm.object_id         = so.object_id
Where
    sch.name <> 'sys'
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '4f90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '73f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'type_desc';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '72f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7af47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'temporal_type_desc';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '79f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'temporal_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6bf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6ef47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'SysObject_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6cf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6af47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'SysObject_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6df47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7df47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'sql_modules_definition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '70f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'schema_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6ff47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'principal_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '71f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'parent_object_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '75f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'modify_date';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7cf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'max_column_id_used';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '78f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'is_schema_published';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '77f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'is_published';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '76f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'is_ms_shipped';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7bf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'history_table_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '74f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'create_date';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '137e7a91-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'SysObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo_sys].[ExtendedProperties]
* [sys_dwh].[objects]
* [sys_dwh].[schemas]
* [sys_dwh].[sql_modules]
* [sys_dwh].[tables]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.SysObject_RepoObject_via_guid.adoc[]
* xref:repo.SysObject_RepoObject_via_name.adoc[]
* xref:repo.usp_sync_guid_RepoObject.adoc[]
* xref:repo_sys.ColumnReference.adoc[]
* xref:repo_sys.parameters.adoc[]
* xref:repo_sys.SysColumn.adoc[]
* xref:sqlparse.RepoObject_SqlModules_Repo_Sys.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo_sys.ExtendedProperties.adoc[]
* xref:sys_dwh.objects.adoc[]
* xref:sys_dwh.schemas.adoc[]
* xref:sys_dwh.sql_modules.adoc[]
* xref:sys_dwh.tables.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject';

