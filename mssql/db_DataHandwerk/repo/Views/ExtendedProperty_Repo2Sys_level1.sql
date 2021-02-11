

CREATE VIEW [repo].[ExtendedProperty_Repo2Sys_level1]
AS
SELECT [prop].[property_name]
 , [prop].[property_value]
 , [level0type] = N'Schema'
 , [level0name] = [ro].[RepoObject_schema_name]
 , [lev].[level1type]
 , [level1name] = [ro].[RepoObject_name]
 , [lev].[level2type]
 , [level2name] = CAST(NULL AS VARCHAR(128))
 , [prop].[RepoObject_guid]
 , [ro].[RepoObject_type]
FROM repo.RepoObjectProperty AS prop
INNER JOIN repo.RepoObject AS ro
 ON ro.RepoObject_guid = prop.RepoObject_guid
INNER JOIN [repo].[type_level1type_level2type] AS lev
 ON lev.type = ro.RepoObject_type
WHERE NOT [lev].[level1type] IS NULL
 AND [lev].[level2type] IS NULL