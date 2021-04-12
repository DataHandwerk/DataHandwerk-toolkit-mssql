Create View sys_self.ExtendedProperties
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
            Object_Schema_Name ( sep.major_id /*, [db].[dwh_database_id]*/ )
    End                               As SysObject_schema_name
  , Case
        When sep.class In
        ( 1, 2, 7 )
            Then
            Object_Name ( sep.major_id /*, [db].[dwh_database_id]*/ )
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
    sys.extended_properties As sep
    Left Outer Join
        sys.columns         As sc
            On
            sep.major_id     = sc.object_id
            And sep.minor_id = sc.column_id

    Left Outer Join
        sys.parameters      As sp
            On
            sep.major_id     = sp.object_id
            And sep.minor_id = sp.parameter_id

    Left Outer Join
        sys.indexes         As si
            On
            sep.major_id     = si.object_id
            And sep.minor_id = si.index_id

    Left Outer Join
        sys.objects         As so
            On
            sep.major_id     = so.object_id

    Left Outer Join
        sys.objects         As parent
            On
            parent.object_id = so.parent_object_id;
----
--CROSS APPLY
--repo.ftv_dwh_database() AS db
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'e38f291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '95f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '96f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '94f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties'
  , @level2type = N'COLUMN'
  , @level2name = N'property_value';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '9df17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties'
  , @level2type = N'COLUMN'
  , @level2name = N'property_nvarchar';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '92f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties'
  , @level2type = N'COLUMN'
  , @level2name = N'property_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '9cf17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties'
  , @level2type = N'COLUMN'
  , @level2name = N'property_basetype';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a0f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '9ef17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_object_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '9ff17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '97f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties'
  , @level2type = N'COLUMN'
  , @level2name = N'minor_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '91f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties'
  , @level2type = N'COLUMN'
  , @level2name = N'minor_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '90f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties'
  , @level2type = N'COLUMN'
  , @level2name = N'major_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '9bf17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties'
  , @level2type = N'COLUMN'
  , @level2name = N'level2type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '99f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties'
  , @level2type = N'COLUMN'
  , @level2name = N'entity_parameter_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '9af17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties'
  , @level2type = N'COLUMN'
  , @level2name = N'entity_index_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '98f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties'
  , @level2type = N'COLUMN'
  , @level2name = N'entity_column_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '93f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties'
  , @level2type = N'COLUMN'
  , @level2name = N'class_desc';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8ff17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties'
  , @level2type = N'COLUMN'
  , @level2name = N'class';
