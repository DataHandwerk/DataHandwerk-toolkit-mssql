
CREATE VIEW [repo].[IndexColumn_union]
AS
--
SELECT [index_guid]
 , [index_column_id]
 , [is_descending_key]
 , [RepoObjectColumn_guid]
 , [parent_RepoObject_guid]
 , [index_name]
 , [parent_schema_name]
 , [parent_SysObject_name]
 , [SysObject_column_name]
 , [SysObject_column_user_type_fullname]
 , [is_index_unique]
 , [is_index_primary_key]
 , [is_index_real]
 , [parent_SysObject_fullname]
FROM repo_sys.[IndexColumn_real_unique] AS T1

UNION ALL

SELECT [index_guid]
 , [index_column_id]
 , [is_descending_key]
 , [RepoObjectColumn_guid]
 , [parent_RepoObject_guid]
 , [index_name]
 , [parent_schema_name]
 , [parent_Object_name]
 , [Object_column_name]
 , [column_user_type_fullname]
 , [is_index_unique]
 , [is_index_primary_key]
 , [is_index_real]
 , [parent_Object_fullname]
FROM repo.IndexColumn_virtual_gross AS T2

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '6790291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_union';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0af67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_union', @level2type = N'COLUMN', @level2name = N'SysObject_column_user_type_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '09f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_union', @level2type = N'COLUMN', @level2name = N'SysObject_column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '04f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_union', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '08f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_union', @level2type = N'COLUMN', @level2name = N'parent_SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0ef67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_union', @level2type = N'COLUMN', @level2name = N'parent_SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '07f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_union', @level2type = N'COLUMN', @level2name = N'parent_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '05f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_union', @level2type = N'COLUMN', @level2name = N'parent_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0bf67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_union', @level2type = N'COLUMN', @level2name = N'is_index_unique';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0df67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_union', @level2type = N'COLUMN', @level2name = N'is_index_real';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0cf67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_union', @level2type = N'COLUMN', @level2name = N'is_index_primary_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '03f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_union', @level2type = N'COLUMN', @level2name = N'is_descending_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '06f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_union', @level2type = N'COLUMN', @level2name = N'index_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '01f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_union', @level2type = N'COLUMN', @level2name = N'index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '02f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_union', @level2type = N'COLUMN', @level2name = N'index_column_id';

