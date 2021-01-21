
CREATE VIEW [repo_sys].[ColumnReference]
as
--
--muss / kann noch angereichert werden
Select
       [so].SysObject_fullname AS SysObject_full_name
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
From
     repo_sys.SysObject As so
     Cross Apply
     sys_dwh.dm_sql_referenced_entities(so.SysObject_fullname , 'OBJECT') As sdsre
Where  [so].[type] In
                      (
                      'U' , 'V'
                      )
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'd0638bfc-7948-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'is_incomplete';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'd1638bfc-7948-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'is_insert_all';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'cd638bfc-7948-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'is_all_columns_found';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'd2638bfc-7948-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'is_select_all';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'd4638bfc-7948-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'is_updated';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'd3638bfc-7948-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'is_selected';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'ce638bfc-7948-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'is_ambiguous';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'cf638bfc-7948-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'is_caller_dependent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'd6638bfc-7948-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'referenced_class_desc';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'd5638bfc-7948-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'referenced_class';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'da638bfc-7948-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'referenced_minor_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'd9638bfc-7948-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'referenced_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'db638bfc-7948-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'referenced_minor_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'd8638bfc-7948-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'referenced_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'dc638bfc-7948-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'referenced_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'd7638bfc-7948-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'referenced_database_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'dd638bfc-7948-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'referenced_server_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'de638bfc-7948-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'referencing_minor_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'df638bfc-7948-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference', @level2type = N'COLUMN', @level2name = N'SysObject_full_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = N'ca638bfc-7948-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ColumnReference';

