
CREATE VIEW [repo].[IndexColumn_virtual_gross]
AS
--
SELECT [icv].[index_guid]
 , [icv].[index_column_id]
 , [icv].[is_descending_key]
 , icv.[RepoObjectColumn_guid]
 , [iv].[parent_RepoObject_guid]
 , [iv].[index_name]
 , [parent_schema_name] = COALESCE(ro.SysObject_schema_name, ro.[RepoObject_schema_name])
 , [parent_Object_name] = iif(NOT ro.[SysObject_name] IS NULL
  AND ro.[is_SysObject_name_uniqueidentifier] = 0, ro.[SysObject_name], ro.[RepoObject_name])
 , [Object_column_name] = iif(NOT roc.[SysObjectColumn_name] IS NULL
  AND roc.[is_SysObjectColumn_name_uniqueidentifier] = 0, roc.[SysObjectColumn_name], roc.[RepoObjectColumn_name])
 , [column_user_type_fullname] = roc.[Repo_user_type_fullname]
 , [iv].[is_index_unique]
 , [iv].[is_index_primary_key]
 , [parent_Object_fullname] = iif(NOT ro.[SysObject_fullname] IS NULL
  AND ro.[is_SysObject_name_uniqueidentifier] = 0, ro.[SysObject_fullname], ro.[RepoObject_fullname])
 , [is_index_real] = CAST(0 AS BIT)
FROM repo.[IndexColumn_virtual] AS icv
INNER JOIN repo.[Index_virtual] AS iv
 ON icv.index_guid = iv.index_guid
INNER JOIN [repo].[RepoObjectColumn] roc
 ON roc.[RepoObjectColumn_guid] = icv.[RepoObjectColumn_guid]
LEFT JOIN repo.RepoObject AS ro
 ON ro.RepoObject_guid = [iv].[parent_RepoObject_guid]
