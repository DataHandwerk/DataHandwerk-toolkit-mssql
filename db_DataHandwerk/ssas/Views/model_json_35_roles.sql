
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

