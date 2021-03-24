
CREATE VIEW [repo].[ExtendedProperty_Repo2Sys_level2_RepoObject]
AS
SELECT [prop].[property_name]
 , [prop].[property_value]
 , [level0type] = N'Schema'
 , [level0name] = [ro_parent].[RepoObject_schema_name]
 , [lev_parent].[level1type]
 , [level1name] = [ro_parent].[RepoObject_name]
 , [lev].[level2type]
 , [level2name] = [ro].[RepoObject_name]
 , [prop].[RepoObject_guid]
 , [ro].[RepoObject_type]
 , [parent_RepoObject_guid] = [ro_parent].[RepoObject_guid]
 , [parent_RepoObject_type] = [ro_parent].[RepoObject_type]
FROM repo.RepoObjectProperty AS prop
INNER JOIN repo.RepoObject AS ro
 ON ro.RepoObject_guid = prop.RepoObject_guid
INNER JOIN [repo].[type_level1type_level2type] AS lev
 ON lev.type = ro.RepoObject_type
INNER JOIN repo.RepoObject AS ro_parent
 ON ro_parent.[SysObject_id] = ro.[SysObject_parent_object_id]
INNER JOIN [repo].[type_level1type_level2type] AS lev_parent
 ON lev_parent.type = ro_parent.RepoObject_type
WHERE NOT [lev].[level2type] IS NULL
 AND [ro_parent].[SysObject_id] > 0
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '56b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '89b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '88b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '81b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '80b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8bb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject', @level2type = N'COLUMN', @level2name = N'parent_RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8ab33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject', @level2type = N'COLUMN', @level2name = N'parent_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '86b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject', @level2type = N'COLUMN', @level2name = N'level2type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '87b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject', @level2type = N'COLUMN', @level2name = N'level2name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '84b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject', @level2type = N'COLUMN', @level2name = N'level1type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '85b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject', @level2type = N'COLUMN', @level2name = N'level1name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '82b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject', @level2type = N'COLUMN', @level2name = N'level0type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '83b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ExtendedProperty_Repo2Sys_level2_RepoObject', @level2type = N'COLUMN', @level2name = N'level0name';

