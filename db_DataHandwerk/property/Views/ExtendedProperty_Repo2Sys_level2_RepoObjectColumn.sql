CREATE View [property].ExtendedProperty_Repo2Sys_level2_RepoObjectColumn
As
Select
    prop.property_name
  , prop.property_value
  , level0type             = N'Schema'
  , level0name             = ro_parent.RepoObject_schema_name
  , lev_parent.level1type
  , level1name             = ro_parent.RepoObject_name
  , level2type             = N'COLUMN'
  , level2name             = roc.RepoObjectColumn_name
  , prop.RepoObjectColumn_guid
  , roc.Repo_user_type_fullname
  , parent_RepoObject_guid = ro_parent.RepoObject_guid
  , parent_RepoObject_type = ro_parent.RepoObject_type
From
    [property].RepoObjectColumnProperty         As prop
    Inner Join
        repo.RepoObjectColumn             As roc
            On
            roc.RepoObjectColumn_guid = prop.RepoObjectColumn_guid

    Inner Join
        repo.RepoObject                   As ro_parent
            On
            ro_parent.RepoObject_guid = roc.RepoObject_guid

    Inner Join
        [configT].type_level1type_level2type As lev_parent
            On
            lev_parent.type           = ro_parent.RepoObject_type
Where
    is_RepoObjectColumn_name_uniqueidentifier = 0
    --SchemaCompare has issues comparing extended properties for graph table columns, we need to exclude them
    And roc.Repo_graph_type Is Null;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '57b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '94b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '95b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_user_type_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8db33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn'
  , @level2type = N'COLUMN'
  , @level2name = N'property_value';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8cb33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn'
  , @level2type = N'COLUMN'
  , @level2name = N'property_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '97b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_RepoObject_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '96b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '92b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn'
  , @level2type = N'COLUMN'
  , @level2name = N'level2type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '93b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn'
  , @level2type = N'COLUMN'
  , @level2name = N'level2name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '90b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn'
  , @level2type = N'COLUMN'
  , @level2name = N'level1type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '91b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn'
  , @level2type = N'COLUMN'
  , @level2name = N'level1name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8eb33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn'
  , @level2type = N'COLUMN'
  , @level2name = N'level0type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8fb33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn'
  , @level2type = N'COLUMN'
  , @level2name = N'level0name';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [config].[type_level1type_level2type]
* [property].[RepoObjectColumnProperty]
* [repo].[RepoObject]
* [repo].[RepoObjectColumn]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'level0type,level0name,level1type,level1name,level2type,level2name,property_name', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'nvarchar(6),nvarchar(128),varchar(9),nvarchar(128),nvarchar(6),nvarchar(128),nvarchar(128)', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'D7B7CBB0-0596-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:property.ExtendedProperty_Repo2Sys_level2_Union.adoc[]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:configT.type_level1type_level2type.adoc[]
* xref:property.RepoObjectColumnProperty.adoc[]
* xref:repo.RepoObject.adoc[]
* xref:repo.RepoObjectColumn.adoc[]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoObjectColumnProperty].[RepoObjectColumn_guid]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[Repo_user_type_fullname]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'Repo_user_type_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoObjectColumnProperty].[property_value]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'datatype of property_value is `sql_variant`, because it should be possible to synchronize the property_value in the repository with property_value in extended properties in the dwh database, which is `sql_variant` +
therefore the maximum content is nvarchar(4000) or varchar(8000)', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoObjectColumnProperty].[property_name]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_type]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'parent_RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'reference in [repo_sys].[type]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'parent_RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'parent_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[RepoObjectColumn_name]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'level2name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of the column. Is unique within the object.', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'level2name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [config].[type_level1type_level2type].[level1type]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'level1type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_name]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'level1name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'level0name';

