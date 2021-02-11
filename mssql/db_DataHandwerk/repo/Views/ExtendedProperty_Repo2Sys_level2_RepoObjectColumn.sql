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