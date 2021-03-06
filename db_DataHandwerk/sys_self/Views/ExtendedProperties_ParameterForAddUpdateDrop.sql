﻿Create View sys_self.ExtendedProperties_ParameterForAddUpdateDrop
As
--
Select
    sep.property_name
  , sep.property_value
  , 'SCHEMA'                  As level0type
  , sep.SysObject_schema_name As level0name
  , level1type                = Iif(stl.level2type = 'CONSTRAINT', 'TABLE', stl.level1type)
  , level1name                = Iif(stl.level2type = 'CONSTRAINT', sep.parent_name, sep.SysObject_name)
  , level2type                = Iif(stl.level2type = 'CONSTRAINT', stl.level2type, sep.level2type)
  , level2name                = Iif(stl.level2type = 'CONSTRAINT', sep.SysObject_name, sep.minor_name)
  , sep.minor_id
  , sep.class
  , sep.class_desc
  , so.type
  , type_level1type           = stl.level1type
  , type_level2type           = stl.level2type
From
    sys_self.ExtendedProperties           As sep
    Inner Join
        sys.objects                       As so
            On
            sep.major_id                     = so.object_id

    Inner Join
        config.type_level1type_level2type As stl
            On
            so.type Collate Database_Default = stl.type;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'e58f291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'aef17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop'
  , @level2type = N'COLUMN'
  , @level2name = N'type_level2type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'adf17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop'
  , @level2type = N'COLUMN'
  , @level2name = N'type_level1type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'acf17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop'
  , @level2type = N'COLUMN'
  , @level2name = N'type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a2f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop'
  , @level2type = N'COLUMN'
  , @level2name = N'property_value';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a1f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop'
  , @level2type = N'COLUMN'
  , @level2name = N'property_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a9f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop'
  , @level2type = N'COLUMN'
  , @level2name = N'minor_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a7f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop'
  , @level2type = N'COLUMN'
  , @level2name = N'level2type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a8f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop'
  , @level2type = N'COLUMN'
  , @level2name = N'level2name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a5f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop'
  , @level2type = N'COLUMN'
  , @level2name = N'level1type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a6f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop'
  , @level2type = N'COLUMN'
  , @level2name = N'level1name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a3f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop'
  , @level2type = N'COLUMN'
  , @level2name = N'level0type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a4f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop'
  , @level2type = N'COLUMN'
  , @level2name = N'level0name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'abf17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop'
  , @level2type = N'COLUMN'
  , @level2name = N'class_desc';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'aaf17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop'
  , @level2type = N'COLUMN'
  , @level2name = N'class';
Go

Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[type_level1type_level2type].[level2type]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop'
  , @level2type = N'COLUMN'
  , @level2name = N'type_level2type';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[type_level1type_level2type].[level1type]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop'
  , @level2type = N'COLUMN'
  , @level2name = N'type_level1type';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[sys_self].[ExtendedProperties].[property_value]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop'
  , @level2type = N'COLUMN'
  , @level2name = N'property_value';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[sys_self].[ExtendedProperties].[property_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop'
  , @level2type = N'COLUMN'
  , @level2name = N'property_name';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[sys_self].[ExtendedProperties].[minor_id]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop'
  , @level2type = N'COLUMN'
  , @level2name = N'minor_id';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[sys_self].[ExtendedProperties].[class_desc]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop'
  , @level2type = N'COLUMN'
  , @level2name = N'class_desc';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[sys_self].[ExtendedProperties].[class]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop'
  , @level2type = N'COLUMN'
  , @level2name = N'class';
