
-- Alter View Index__real_unique
CREATE VIEW [repo_sys].[Index__real_unique]
AS
--
SELECT
       [index_guid] = [ro_index].[RepoObject_guid]
     , [index_name] = [si].[name] COLLATE DATABASE_DEFAULT
     , [si].[index_id]
     , [si].[is_unique] AS            [is_index_unique]
     , [si].[is_primary_key] AS       [is_index_primary_key]
     , [si].[is_unique_constraint] AS [is_index_unique_constraint]
     , [si].[is_disabled] AS          [is_index_disabled]
     , [si].[type] AS                 [index_type]
     , [si].[type_desc] AS            [index_type_desc]
     , [parent_RepoObject_guid] = [ro_parent].[RepoObject_guid]
     , [parent_schema_name] = [ro_parent].[SysObject_schema_name]
     , [parent_SysObject_name] = [ro_parent].[SysObject_name]
     , [parent_SysObject_fullname] = [ro_parent].[SysObject_fullname]
FROM
     sys_dwh.indexes AS si
     LEFT JOIN
     repo.RepoObject AS ro_index
     ON ro_index.SysObject_name = si.name COLLATE DATABASE_DEFAULT
        AND ro_index.SysObject_parent_object_id = si.object_id
     LEFT JOIN
     repo.RepoObject AS ro_parent
     ON ro_parent.SysObject_id = si.object_id
WHERE  [si].[is_unique] = 1
       AND NOT [ro_index].[RepoObject_guid] IS NULL
GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO


