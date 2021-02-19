CREATE VIEW repo.ExtendedProperty_Repo2Sys_level2_RepoObjectColumn
AS
SELECT [prop].[property_name]
 , [prop].[property_value]
 , [level0type] = N'Schema'
 , [level0name] = [ro_parent].[RepoObject_schema_name]
 , [lev_parent].[level1type]
 , [level1name] = [ro_parent].[RepoObject_name]
 , [level2type] = N'COLUMN'
 , [level2name] = [roc].[RepoObjectColumn_name]
 , [prop].[RepoObjectColumn_guid]
 , [roc].[Repo_user_type_fullname]
 , [parent_RepoObject_guid] = [ro_parent].[RepoObject_guid]
 , [parent_RepoObject_type] = [ro_parent].[RepoObject_type]
FROM [repo].[RepoObjectColumnProperty] AS prop
INNER JOIN [repo].[RepoObjectColumn] AS roc
 ON roc.[RepoObjectColumn_guid] = prop.[RepoObjectColumn_guid]
INNER JOIN repo.RepoObject AS ro_parent
 ON ro_parent.[RepoObject_guid] = roc.[RepoObject_guid]
INNER JOIN [repo].[type_level1type_level2type] AS lev_parent
 ON lev_parent.type = ro_parent.RepoObject_type
WHERE [is_RepoObjectColumn_name_uniqueidentifier] = 0
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '57b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '94b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '95b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'Repo_user_type_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8db33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8cb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '97b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'parent_RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '96b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'parent_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '92b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'level2type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '93b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'level2name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '90b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'level1type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '91b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'level1name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8eb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'level0type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8fb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'level0name';

