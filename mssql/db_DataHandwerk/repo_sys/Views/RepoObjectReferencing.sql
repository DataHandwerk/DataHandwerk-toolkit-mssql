-- Alter View RepoObjectReferencing

/*
this view can be used to check if SysObject renaming is safe or if exists referencing objects and refactoring is required
*/
CREATE VIEW [repo_sys].[RepoObjectReferencing]
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
     , [referencing].[referencing_schema_name]
     , [referencing].[referencing_entity_name]
     , [referencing].[referencing_id]
     , [referencing].[referencing_class]
     , [referencing].[referencing_class_desc]
     , [referencing].[is_caller_dependent]
FROM
     repo.RepoObject AS ro
     CROSS APPLY
     sys.dm_sql_referencing_entities(SysObject_fullname , 'OBJECT') AS referencing
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5e98637b-974b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferencing', @level2type = N'COLUMN', @level2name = N'is_caller_dependent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6198637b-974b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferencing', @level2type = N'COLUMN', @level2name = N'referencing_class_desc';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6098637b-974b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferencing', @level2type = N'COLUMN', @level2name = N'referencing_class';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6398637b-974b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferencing', @level2type = N'COLUMN', @level2name = N'referencing_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6298637b-974b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferencing', @level2type = N'COLUMN', @level2name = N'referencing_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6498637b-974b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferencing', @level2type = N'COLUMN', @level2name = N'referencing_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6798637b-974b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferencing', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6598637b-974b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferencing', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5d98637b-974b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferencing', @level2type = N'COLUMN', @level2name = N'has_different_sys_names';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5f98637b-974b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferencing', @level2type = N'COLUMN', @level2name = N'is_repo_managed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6998637b-974b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferencing', @level2type = N'COLUMN', @level2name = N'SysObject_modify_date';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6a98637b-974b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferencing', @level2type = N'COLUMN', @level2name = N'SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6898637b-974b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferencing', @level2type = N'COLUMN', @level2name = N'SysObject_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6698637b-974b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferencing', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a75ce76a-954b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'RepoObjectReferencing';

