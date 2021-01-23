
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
   ,[ro].[SysObject_id]
	--, [ro].[SysObject_schema_name]
	--, [ro].[SysObject_name]
   ,[ro].[SysObject_type]
   ,[ro].[SysObject_modify_date]
	--, [ro].[SysObject_query_plan]
	--, [ro].[SysObject_query_executed_dt]
	--, [ro].[has_execution_plan_issue]
   ,[ro].[is_repo_managed]
	--, [ro].[modify_dt]
   ,[ro].[has_different_sys_names]
   ,[ro].[RepoObject_fullname]
	--, [ro].[SysObject_query_sql]
   ,[ro].[SysObject_fullname]
   ,[referenced].[referencing_minor_id] AS [referencing_minor_id]
   ,[referenced].[referenced_server_name] COLLATE database_default AS [referenced_server_name]
   ,[referenced].[referenced_database_name] COLLATE database_default AS [referenced_database_name]
   ,[referenced].[referenced_schema_name] COLLATE database_default AS [referenced_schema_name]
   ,[referenced].[referenced_entity_name] COLLATE database_default AS [referenced_entity_name]
   ,[referenced].[referenced_minor_name] COLLATE database_default AS [referenced_minor_name]
   ,[referenced].[referenced_id] AS [referenced_id]
   ,[referenced].[referenced_minor_id] AS [referenced_minor_id]
   ,[referenced].[referenced_class] AS [referenced_class]
   ,[referenced].[referenced_class_desc] COLLATE database_default AS [referenced_class_desc]
   ,[referenced].[is_caller_dependent] AS [is_caller_dependent]
   ,[referenced].[is_ambiguous] AS [is_ambiguous]
   ,[referenced].[is_selected] AS [is_selected]
   ,[referenced].[is_updated] AS [is_updated]
   ,[referenced].[is_select_all] AS [is_select_all]
   ,[referenced].[is_all_columns_found] AS [is_all_columns_found]
   ,[referenced].[is_insert_all] AS [is_insert_all]
   ,[referenced].[is_incomplete] AS [is_incomplete]
FROM repo.RepoObject AS ro
CROSS APPLY sys_dwh.dm_sql_referenced_entities(SysObject_fullname, 'OBJECT') AS referenced
WHERE ISNULL([ro].[has_get_referenced_issue], 0) = 0
GO
