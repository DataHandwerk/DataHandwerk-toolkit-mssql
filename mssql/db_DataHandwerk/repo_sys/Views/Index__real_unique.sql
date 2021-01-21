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
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'53a2cfa8-bb4e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'Index__real_unique', @level2type = N'COLUMN', @level2name = N'parent_SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'54a2cfa8-bb4e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'Index__real_unique', @level2type = N'COLUMN', @level2name = N'parent_SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'52a2cfa8-bb4e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'Index__real_unique', @level2type = N'COLUMN', @level2name = N'parent_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'51a2cfa8-bb4e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'Index__real_unique', @level2type = N'COLUMN', @level2name = N'parent_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'4da2cfa8-bb4e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'Index__real_unique', @level2type = N'COLUMN', @level2name = N'index_type_desc';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'4ca2cfa8-bb4e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'Index__real_unique', @level2type = N'COLUMN', @level2name = N'index_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'd0910dde-914f-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'Index__real_unique', @level2type = N'COLUMN', @level2name = N'is_index_disabled';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'50a2cfa8-bb4e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'Index__real_unique', @level2type = N'COLUMN', @level2name = N'is_index_unique_constraint';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'4ea2cfa8-bb4e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'Index__real_unique', @level2type = N'COLUMN', @level2name = N'is_index_primary_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'4fa2cfa8-bb4e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'Index__real_unique', @level2type = N'COLUMN', @level2name = N'is_index_unique';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'4aa2cfa8-bb4e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'Index__real_unique', @level2type = N'COLUMN', @level2name = N'index_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'4ba2cfa8-bb4e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'Index__real_unique', @level2type = N'COLUMN', @level2name = N'index_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'49a2cfa8-bb4e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'Index__real_unique', @level2type = N'COLUMN', @level2name = N'index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = N'45a2cfa8-bb4e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'Index__real_unique';

