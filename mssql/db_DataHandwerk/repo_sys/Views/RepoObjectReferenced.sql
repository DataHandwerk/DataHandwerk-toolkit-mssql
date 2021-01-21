-- Alter View RepoObjectReferenced

/*
this view can be used to check if SysObject renaming is safe or if exists referenced objects and refactoring is required
*/

CREATE VIEW [repo_sys].[RepoObjectReferenced]
AS
--
SELECT
       [ro].[RepoObject_guid]
       --, [ro].[RepoObject_schema_name]
       --, [ro].[RepoObject_name]
       --, [ro].[RepoObject_type]
     , [ro].[SysObject_id]
       --, [ro].[SysObject_schema_name]
       --, [ro].[SysObject_name]
     , [ro].[SysObject_type]
     , [ro].[SysObject_modify_date]
       --, [ro].[SysObject_query_plan]
       --, [ro].[SysObject_query_executed_dt]
       --, [ro].[has_execution_plan_issue]
     , [ro].[is_repo_managed]
       --, [ro].[modify_dt]
     , [ro].[has_different_sys_names]
     , [ro].[RepoObject_fullname]
       --, [ro].[SysObject_query_sql]
     , [ro].[SysObject_fullname]
     , [referenced].[referencing_minor_id] AS                              [referencing_minor_id]
     , [referenced].[referenced_server_name] COLLATE DATABASE_DEFAULT AS   [referenced_server_name]
     , [referenced].[referenced_database_name] COLLATE DATABASE_DEFAULT AS [referenced_database_name]
     , [referenced].[referenced_schema_name] COLLATE DATABASE_DEFAULT AS   [referenced_schema_name]
     , [referenced].[referenced_entity_name] COLLATE DATABASE_DEFAULT AS   [referenced_entity_name]
     , [referenced].[referenced_minor_name] COLLATE DATABASE_DEFAULT AS    [referenced_minor_name]
     , [referenced].[referenced_id] AS                                     [referenced_id]
     , [referenced].[referenced_minor_id] AS                               [referenced_minor_id]
     , [referenced].[referenced_class] AS                                  [referenced_class]
     , [referenced].[referenced_class_desc] COLLATE DATABASE_DEFAULT AS    [referenced_class_desc]
     , [referenced].[is_caller_dependent] AS                               [is_caller_dependent]
     , [referenced].[is_ambiguous] AS                                      [is_ambiguous]
     , [referenced].[is_selected] AS                                       [is_selected]
     , [referenced].[is_updated] AS                                        [is_updated]
     , [referenced].[is_select_all] AS                                     [is_select_all]
     , [referenced].[is_all_columns_found] AS                              [is_all_columns_found]
     , [referenced].[is_insert_all] AS                                     [is_insert_all]
     , [referenced].[is_incomplete] AS                                     [is_incomplete]
FROM
     repo.RepoObject AS ro
     CROSS APPLY
     sys_dwh.dm_sql_referenced_entities(SysObject_fullname , 'OBJECT') AS referenced
WHERE  ISNULL([ro].[has_get_referenced_issue] , 0) = 0
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '56e4634c-304c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferenced', @level2type = N'COLUMN', @level2name = N'is_incomplete';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '57e4634c-304c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferenced', @level2type = N'COLUMN', @level2name = N'is_insert_all';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '53e4634c-304c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferenced', @level2type = N'COLUMN', @level2name = N'is_all_columns_found';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '59e4634c-304c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferenced', @level2type = N'COLUMN', @level2name = N'is_select_all';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5be4634c-304c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferenced', @level2type = N'COLUMN', @level2name = N'is_updated';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5ae4634c-304c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferenced', @level2type = N'COLUMN', @level2name = N'is_selected';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '54e4634c-304c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferenced', @level2type = N'COLUMN', @level2name = N'is_ambiguous';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '55e4634c-304c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferenced', @level2type = N'COLUMN', @level2name = N'is_caller_dependent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5de4634c-304c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferenced', @level2type = N'COLUMN', @level2name = N'referenced_class_desc';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5ce4634c-304c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferenced', @level2type = N'COLUMN', @level2name = N'referenced_class';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '61e4634c-304c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferenced', @level2type = N'COLUMN', @level2name = N'referenced_minor_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '60e4634c-304c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferenced', @level2type = N'COLUMN', @level2name = N'referenced_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '62e4634c-304c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferenced', @level2type = N'COLUMN', @level2name = N'referenced_minor_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5fe4634c-304c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferenced', @level2type = N'COLUMN', @level2name = N'referenced_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '63e4634c-304c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferenced', @level2type = N'COLUMN', @level2name = N'referenced_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5ee4634c-304c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferenced', @level2type = N'COLUMN', @level2name = N'referenced_database_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '64e4634c-304c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferenced', @level2type = N'COLUMN', @level2name = N'referenced_server_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '65e4634c-304c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferenced', @level2type = N'COLUMN', @level2name = N'referencing_minor_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '68e4634c-304c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferenced', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '66e4634c-304c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferenced', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '52e4634c-304c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferenced', @level2type = N'COLUMN', @level2name = N'has_different_sys_names';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '58e4634c-304c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferenced', @level2type = N'COLUMN', @level2name = N'is_repo_managed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6ae4634c-304c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferenced', @level2type = N'COLUMN', @level2name = N'SysObject_modify_date';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6be4634c-304c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferenced', @level2type = N'COLUMN', @level2name = N'SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '69e4634c-304c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferenced', @level2type = N'COLUMN', @level2name = N'SysObject_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '67e4634c-304c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferenced', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '4ee4634c-304c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferenced';

