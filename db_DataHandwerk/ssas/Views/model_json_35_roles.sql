﻿
/*
--check

Select
    Distinct
    j2.[Key]
  , j2.Type
From
    ssas.model_json_20                      As T1
    Cross Apply OpenJson ( T1.l2_roles_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
order by
    j2.[Key]
  , j2.Type
Go
*/
CREATE View ssas.model_json_35_roles
As
Select
    T1.databasename
  , j2.roles_name
  , j2.roles_members_ja
  , j2.roles_modelPermission
  , j2.roles_tablePermissions_ja
From
    ssas.model_json_20                      As T1
    Cross Apply OpenJson ( T1.l2_roles_ja ) As j1
    Cross Apply
    OpenJson ( j1.Value )
    With
    (
        roles_name NVarchar ( 500 ) N'$.name'
      , roles_members_ja NVarchar ( Max ) N'$.members' As Json
      , roles_modelPermission NVarchar ( 500 ) N'$.modelPermission'
      , roles_tablePermissions_ja NVarchar ( Max ) N'$.tablePermissions' As Json
    ) As j2
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5c60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_35_roles', @level2type = N'COLUMN', @level2name = N'roles_tablePermissions_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5b60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_35_roles', @level2type = N'COLUMN', @level2name = N'roles_modelPermission';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5a60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_35_roles', @level2type = N'COLUMN', @level2name = N'roles_members_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5960d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_35_roles', @level2type = N'COLUMN', @level2name = N'roles_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5860d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_35_roles', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ff5fd8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_35_roles';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [ssas].[model_json_20]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_35_roles';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'databasename,roles_name', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_35_roles';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'nvarchar(128),nvarchar(500)', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_35_roles';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'10B0C093-EC0A-EC11-8516-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_35_roles';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_35_roles';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_35_roles';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:ssas.model_json_351_roles_members.adoc[]
* xref:ssas.model_json_352_roles_tablePermissions.adoc[]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_35_roles';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:ssas.model_json_20.adoc[]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_35_roles';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_20].[databasename]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_35_roles', @level2type = N'COLUMN', @level2name = N'databasename';

