﻿CREATE VIEW [repo_sys].[ColumnReference]
AS
--
--muss / kann noch angereichert werden
SELECT [so].SysObject_fullname AS SysObject_full_name
 , [sdsre].[referencing_minor_id]
 , [sdsre].[referenced_server_name]
 , [sdsre].[referenced_database_name]
 , [sdsre].[referenced_schema_name]
 , [sdsre].[referenced_entity_name]
 , [sdsre].[referenced_minor_name]
 , [sdsre].[referenced_id]
 , [sdsre].[referenced_minor_id]
 , [sdsre].[referenced_class]
 , [sdsre].[referenced_class_desc]
 , [sdsre].[is_caller_dependent]
 , [sdsre].[is_ambiguous]
 , [sdsre].[is_selected]
 , [sdsre].[is_updated]
 , [sdsre].[is_select_all]
 , [sdsre].[is_all_columns_found]
 , [sdsre].[is_insert_all]
 , [sdsre].[is_incomplete]
FROM repo_sys.SysObject AS so
CROSS APPLY sys_dwh.dm_sql_referenced_entities(so.SysObject_fullname, 'OBJECT') AS sdsre
WHERE [so].[type] IN (
  'U'
  , 'V'
  )

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5c90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e6f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'SysObject_full_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e7f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'referencing_minor_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e8f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'referenced_server_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eaf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'referenced_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ecf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'referenced_minor_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eef47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'referenced_minor_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'edf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'referenced_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ebf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'referenced_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e9f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'referenced_database_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f0f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'referenced_class_desc';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eff47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'referenced_class';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f4f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'is_updated';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f3f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'is_selected';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f5f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'is_select_all';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f7f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'is_insert_all';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f8f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'is_incomplete';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f1f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'is_caller_dependent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f2f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'is_ambiguous';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f6f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'is_all_columns_found';


GO


