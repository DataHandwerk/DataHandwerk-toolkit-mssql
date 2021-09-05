

CREATE View property.ExtendedProperty_Repo2Sys_level0
As
Select
    property_name  = 'MS_Description'
  , property_value = rs.RepoSchema_ms_description
  , level0type     = N'Schema'
  , level0name     = rs.RepoSchema_name
  , level1type     = Cast(Null As NVarchar(128))
  , level1name     = Cast(Null As NVarchar(128))
  , level2type     = Cast(Null As NVarchar(128))
  , level2name     = Cast(Null As Varchar(128))
From
    repo.RepoSchema As rs
Where
    Not rs.RepoSchema_ms_description Is Null

--Select
--    prop.property_name
--  , prop.property_value
--  , level0type = N'Schema'
--  , level0name = RepoSchema_name
--  , level1type = Cast(Null As NVarchar(128))
--  , level1name = Cast(Null As NVarchar(128))
--  , level2type = Cast(Null As NVarchar(128))
--  , level2name = Cast(Null As Varchar(128))
--From
--    [property].RepoSchemaProperty               As prop
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '87e30b53-11a4-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level0', @level2type = N'COLUMN', @level2name = N'level2name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '86e30b53-11a4-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level0', @level2type = N'COLUMN', @level2name = N'level2type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '85e30b53-11a4-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level0', @level2type = N'COLUMN', @level2name = N'level1name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '84e30b53-11a4-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level0', @level2type = N'COLUMN', @level2name = N'level1type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '83e30b53-11a4-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level0', @level2type = N'COLUMN', @level2name = N'level0name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '82e30b53-11a4-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level0', @level2type = N'COLUMN', @level2name = N'level0type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '81e30b53-11a4-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level0', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '80e30b53-11a4-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level0', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7fe30b53-11a4-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level0';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[RepoSchema]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level0';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:property.usp_sync_ExtendedProperties_Repo2Sys_Delete.adoc[]
* xref:property.usp_sync_ExtendedProperties_Repo2Sys_InsertUpdate.adoc[]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level0';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.RepoSchema.adoc[]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level0';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoSchema].[RepoSchema_ms_description]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level0', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoSchema].[RepoSchema_name]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level0', @level2type = N'COLUMN', @level2name = N'level0name';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level0';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level0';

