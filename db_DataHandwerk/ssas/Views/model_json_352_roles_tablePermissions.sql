
/*
--get and check existing values

Select
    Distinct
    j2.[Key]
  , j2.Type
From
    ssas.model_json_35_roles                              As T1
    Cross Apply OpenJson ( T1.roles_tablePermissions_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
ORDER BY
    j2.[Key]
  , j2.Type
Go

Select
    T1.*
  , j2.*
From
    ssas.model_json_35_roles                              As T1
    Cross Apply OpenJson ( T1.roles_tablePermissions_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Go

Select
    DISTINCT
    j2.*
From
    ssas.model_json_35_roles                              As T1
    Cross Apply OpenJson ( T1.roles_tablePermissions_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Where
    j2.[Key] = 'filterExpression'
GO
*/
Create View ssas.model_json_352_roles_tablePermissions
As
Select
    T1.databasename
  , T1.roles_name
  , j2.roles_tablePermissions_name
  , j2.roles_tablePermissions_filterExpression
From
    ssas.model_json_35_roles                     As T1
    Cross Apply OpenJson ( T1.roles_tablePermissions_ja ) As j1
    Cross Apply
    OpenJson ( j1.Value )
    With
    (
        roles_tablePermissions_name NVarchar ( 500 ) N'$.name'
      , roles_tablePermissions_filterExpression NVarchar ( max ) N'$.filterExpression'
    ) As j2
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b560d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_352_roles_tablePermissions', @level2type = N'COLUMN', @level2name = N'roles_tablePermissions_filterExpression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b460d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_352_roles_tablePermissions', @level2type = N'COLUMN', @level2name = N'roles_tablePermissions_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b360d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_352_roles_tablePermissions', @level2type = N'COLUMN', @level2name = N'roles_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b260d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_352_roles_tablePermissions', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0160d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_352_roles_tablePermissions';

