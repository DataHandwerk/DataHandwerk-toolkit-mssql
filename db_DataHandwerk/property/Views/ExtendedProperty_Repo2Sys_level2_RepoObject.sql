

CREATE View property.ExtendedProperty_Repo2Sys_level2_RepoObject
As
Select
    prop.property_name
  , property_value         = Cast(prop.property_value As NVarchar(4000))
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
    property.RepoObjectProperty            As prop
    Inner Join
        repo.RepoObject                    As ro
            On
            ro.RepoObject_guid     = prop.RepoObject_guid

    Inner Join
        configT.type_level1type_level2type As lev
            On
            lev.type               = ro.RepoObject_type

    Inner Join
        repo.RepoObject                    As ro_parent
            On
            ro_parent.SysObject_id = ro.SysObject_parent_object_id

    Inner Join
        configT.type_level1type_level2type As lev_parent
            On
            lev_parent.type        = ro_parent.RepoObject_type
Where
    Not lev.level2type Is Null
    And ro_parent.SysObject_id > 0
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '56b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '89b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '88b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '81b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject'
  , @level2type = N'COLUMN'
  , @level2name = N'property_value';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '80b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject'
  , @level2type = N'COLUMN'
  , @level2name = N'property_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8bb33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_RepoObject_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8ab33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '86b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject'
  , @level2type = N'COLUMN'
  , @level2name = N'level2type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '87b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject'
  , @level2type = N'COLUMN'
  , @level2name = N'level2name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '84b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject'
  , @level2type = N'COLUMN'
  , @level2name = N'level1type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '85b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject'
  , @level2type = N'COLUMN'
  , @level2name = N'level1name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '82b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject'
  , @level2type = N'COLUMN'
  , @level2name = N'level0type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '83b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject'
  , @level2type = N'COLUMN'
  , @level2name = N'level0name';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [configT].[type_level1type_level2type]
* [property].[RepoObjectProperty]
* [repo].[RepoObject]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject';




GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'level0type,level0name,level1type,level1name,level2type,level2name,property_name', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'nvarchar(6),nvarchar(128),varchar(9),nvarchar(128),varchar(10),nvarchar(128),nvarchar(128)', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'3BD85099-0596-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:property.ExtendedProperty_Repo2Sys_level2_Union.adoc[]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:configT.type_level1type_level2type.adoc[]
* xref:property.RepoObjectProperty.adoc[]
* xref:repo.RepoObject.adoc[]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_type]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'reference in [repo_sys].[type]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoObjectProperty].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoObjectProperty].[property_value]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'datatype of property_value is `sql_variant`, because it should be possible to synchronize the property_value in the repository with property_value in extended properties in the dwh database, which is `sql_variant` +
therefore the maximum content is nvarchar(4000) or varchar(8000)', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoObjectProperty].[property_name]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_type]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject', @level2type = N'COLUMN', @level2name = N'parent_RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'reference in [repo_sys].[type]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject', @level2type = N'COLUMN', @level2name = N'parent_RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject', @level2type = N'COLUMN', @level2name = N'parent_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [configT].[type_level1type_level2type].[level2type]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject', @level2type = N'COLUMN', @level2name = N'level2type';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_name]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject', @level2type = N'COLUMN', @level2name = N'level2name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [configT].[type_level1type_level2type].[level1type]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject', @level2type = N'COLUMN', @level2name = N'level1type';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_name]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject', @level2type = N'COLUMN', @level2name = N'level1name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject', @level2type = N'COLUMN', @level2name = N'level0name';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject';

