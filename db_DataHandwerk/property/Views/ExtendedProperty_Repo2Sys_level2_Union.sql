

CREATE View [property].[ExtendedProperty_Repo2Sys_level2_Union]
As
Select
    --
    property_name
  , property_value
  , level0type
  , level0name
  , level1type
  , level1name
  , level2type
  , level2name
From
    [property].ExtendedProperty_Repo2Sys_level2_RepoObject
Union All
Select
    --
    property_name
  , property_value
  , level0type
  , level0name
  , level1type
  , level1name
  , level2type
  , level2name
From
    [property].ExtendedProperty_Repo2Sys_level2_RepoObjectColumn;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '58b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_Union';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '99b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_Union'
  , @level2type = N'COLUMN'
  , @level2name = N'property_value';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '98b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_Union'
  , @level2type = N'COLUMN'
  , @level2name = N'property_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '9eb33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_Union'
  , @level2type = N'COLUMN'
  , @level2name = N'level2type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '9fb33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_Union'
  , @level2type = N'COLUMN'
  , @level2name = N'level2name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '9cb33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_Union'
  , @level2type = N'COLUMN'
  , @level2name = N'level1type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '9db33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_Union'
  , @level2type = N'COLUMN'
  , @level2name = N'level1name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '9ab33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_Union'
  , @level2type = N'COLUMN'
  , @level2name = N'level0type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '9bb33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_Union'
  , @level2type = N'COLUMN'
  , @level2name = N'level0name';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [property].[ExtendedProperty_Repo2Sys_level2_RepoObject]
* [property].[ExtendedProperty_Repo2Sys_level2_RepoObjectColumn]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_Union';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'level0type,level0name,level1type,level1name,level2type,level2name,property_name', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_Union';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'nvarchar(6),nvarchar(128),varchar(9),nvarchar(128),nvarchar(10),nvarchar(128),nvarchar(128)', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_Union';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'B6C87AC3-0596-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_Union';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:property.usp_sync_ExtendedProperties_Repo2Sys_Delete.adoc[]
* xref:property.usp_sync_ExtendedProperties_Repo2Sys_InsertUpdate.adoc[]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_Union';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:property.ExtendedProperty_Repo2Sys_level2_RepoObject.adoc[]
* xref:property.ExtendedProperty_Repo2Sys_level2_RepoObjectColumn.adoc[]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_Union';

