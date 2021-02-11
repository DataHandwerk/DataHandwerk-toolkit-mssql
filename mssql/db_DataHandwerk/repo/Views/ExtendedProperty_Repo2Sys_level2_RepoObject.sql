
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