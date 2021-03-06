﻿Create View [property].RepoObjectProperty_sys_repo
As
--
Select
    ro.RepoObject_guid
  , ses.property_name
  , ses.property_value
  , ses.SysObject_schema_name
  , ses.SysObject_name
  , link.RepoObjectProperty_id
  , link.property_value As RepoObjectProperty_property_value
From
    repo_sys.ExtendedProperties As ses
    Inner Join
        repo.RepoObject         As ro
            On
            ses.SysObject_schema_name = ro.SysObject_schema_name
            And ses.SysObject_name    = ro.SysObject_name
            And ses.minor_name Is Null
            And ses.class             = 1 --OBJECT_OR_COLUMN
            --todo: handle class = 3 SCHEMA
            --todo: handle class = 7 INDEX
            And ses.property_name     <> 'RepoObject_guid'

    Left Join
        [property].RepoObjectProperty As link
            On
            ro.RepoObject_guid        = link.RepoObject_guid
            And ses.property_name     = link.property_name;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '5790291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_sys_repo';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'aef47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_sys_repo'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'aff47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_sys_repo'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'b1f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_sys_repo'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectProperty_property_value';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'b0f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_sys_repo'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectProperty_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'abf47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_sys_repo'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'adf47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_sys_repo'
  , @level2type = N'COLUMN'
  , @level2name = N'property_value';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'acf47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_sys_repo'
  , @level2type = N'COLUMN'
  , @level2name = N'property_name';
Go

Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo_sys].[ExtendedProperties].[SysObject_schema_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_sys_repo'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo_sys].[ExtendedProperties].[SysObject_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_sys_repo'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_name';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[RepoObject_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_sys_repo'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo_sys].[ExtendedProperties].[property_value]'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_sys_repo'
  , @level2type = N'COLUMN'
  , @level2name = N'property_value';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo_sys].[ExtendedProperties].[property_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_sys_repo'
  , @level2type = N'COLUMN'
  , @level2name = N'property_name';
