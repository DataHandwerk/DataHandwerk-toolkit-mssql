
/*
--get and check existing values

Select
    Distinct
    j2.[Key]
  , j2.Type
From
    ssas.model_json_35_roles                     As T1
    Cross Apply OpenJson ( T1.roles_members_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
ORDER BY
    j2.[Key]
  , j2.Type
Go

Select
    T1.*
  , j2.*
From
    ssas.model_json_35_roles                     As T1
    Cross Apply OpenJson ( T1.roles_members_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Go

Select
    DISTINCT
    j2.*
From
    ssas.model_json_35_roles                     As T1
    Cross Apply OpenJson ( T1.roles_members_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Where
    j2.[Key] = 'memberName'
GO
*/
Create View ssas.model_json_351_roles_members
As
Select
    T1.databasename
  , T1.roles_name
  , j2.roles_members_memberId
  , j2.roles_members_memberName
From
    ssas.model_json_35_roles                     As T1
    Cross Apply OpenJson ( T1.roles_members_ja ) As j1
    Cross Apply
    OpenJson ( j1.Value )
    With
    (
        roles_members_memberId NVarchar ( 500 ) N'$.memberId'
      , roles_members_memberName NVarchar ( 500 ) N'$.memberName'
    ) As j2
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b160d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_351_roles_members', @level2type = N'COLUMN', @level2name = N'roles_members_memberName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b060d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_351_roles_members', @level2type = N'COLUMN', @level2name = N'roles_members_memberId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'af60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_351_roles_members', @level2type = N'COLUMN', @level2name = N'roles_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ae60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_351_roles_members', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0060d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_351_roles_members';

