
/*
database_id required in
- OBJECT_SCHEMA_NAME
- OBJECT_NAME
*/
CREATE View repo_sys.ExtendedProperties
As
--
Select
    sep.class
  , sep.major_id
  , sep.minor_id
  , sep.name Collate Database_Default As property_name
  , sep.class_desc
  , sep.value                         As property_value
  , Case
        When sep.class In
        ( 1, 2, 7 )
            Then
            Object_Schema_Name ( sep.major_id, db.dwh_database_id )
        When sep.class = 3
            Then
            sch.name
    End Collate Database_Default      As SysObject_schema_name
  , Case
        When sep.class In
        ( 1, 2, 7 )
            Then
            Object_Name ( sep.major_id, db.dwh_database_id )
    End                               As SysObject_name
  , Case sep.class
        When 1
            Then
            sc.name
        When 2
            Then
            sp.name
        When 3
            Then
            si.name
    End Collate Database_Default      As minor_name
  , Case
        When sep.class = 1
            Then
            sc.name
    End Collate Database_Default      As entity_column_name
  , Case
        When sep.class = 2
            Then
            sp.name
    End Collate Database_Default      As entity_parameter_name
  , Case
        When sep.class = 7
            Then
            si.name
    End Collate Database_Default      As entity_index_name
  , level2type                        = Case
                                            When sep.class = 1
                                                 And sep.minor_id > 0
                                                Then
                                                'COLUMN'
                                            When sep.class = 2
                                                 And sep.minor_id > 0
                                                Then
                                                'PARAMETER'
                                            When sep.class = 7
                                                 And sep.minor_id > 0
                                                Then
                                                'INDEX'
                                        End
  , property_basetype                 = Sql_Variant_Property ( sep.value, 'BaseType' )
  , property_nvarchar                 = Try_Cast(sep.value As NVarchar(4000))
  , so.parent_object_id
  , parent_name                       = parent.name
  , parent_type                       = parent.type
-- Explicit conversion from data type int to uniqueidentifier is not allowed.
--, [property_value_uniqueidentifier] = TRY_CAST([sep].value As UniqueIdentifier)
From
    sys_dwh.extended_properties            As sep
    Left Outer Join
        sys_dwh.columns                    As sc
            On
            sep.major_id = sc.object_id
            And sep.minor_id = sc.column_id

    Left Outer Join
        sys_dwh.parameters                 As sp
            On
            sep.major_id = sp.object_id
            And sep.minor_id = sp.parameter_id

    Left Outer Join
        sys_dwh.indexes                    As si
            On
            sep.major_id = si.object_id
            And sep.minor_id = si.index_id

    Left Outer Join
        sys_dwh.objects                    As so
            On
            sep.major_id = so.object_id

    Left Outer Join
        sys_dwh.objects                    As parent
            On
            parent.object_id = so.parent_object_id

    Left Outer Join
        sys_dwh.schemas                    As sch
            On
            sch.schema_id = sep.major_id
            And sep.minor_id = 0
            And sep.class = 3
    --
    Cross Apply config.ftv_dwh_database () As db;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '4b90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '47f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '48f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '46f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4ff47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'property_nvarchar';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '44f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4ef47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'property_basetype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '52f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'parent_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '50f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'parent_object_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '51f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'parent_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '49f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'minor_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '43f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'minor_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '42f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'major_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4df47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'level2type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4bf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'entity_parameter_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4cf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'entity_index_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4af47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'entity_column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '45f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'class_desc';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '41f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'class';


GO


