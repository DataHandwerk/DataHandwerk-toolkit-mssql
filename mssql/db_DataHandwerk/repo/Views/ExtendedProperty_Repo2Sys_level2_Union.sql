CREATE VIEW repo.ExtendedProperty_Repo2Sys_level2_Union
AS
SELECT
 --
 [property_name]
 , [property_value]
 , [level0type]
 , [level0name]
 , [level1type]
 , [level1name]
 , [level2type]
 , [level2name]
FROM [repo].[ExtendedProperty_Repo2Sys_level2_RepoObject]

UNION ALL

SELECT
 --
 [property_name]
 , [property_value]
 , [level0type]
 , [level0name]
 , [level1type]
 , [level1name]
 , [level2type]
 , [level2name]
FROM [repo].ExtendedProperty_Repo2Sys_level2_RepoObjectColumn
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '58b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_Union';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '99b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_Union', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '98b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_Union', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9eb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_Union', @level2type = N'COLUMN', @level2name = N'level2type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9fb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_Union', @level2type = N'COLUMN', @level2name = N'level2name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9cb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_Union', @level2type = N'COLUMN', @level2name = N'level1type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9db33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_Union', @level2type = N'COLUMN', @level2name = N'level1name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9ab33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_Union', @level2type = N'COLUMN', @level2name = N'level0type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9bb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_Union', @level2type = N'COLUMN', @level2name = N'level0name';

