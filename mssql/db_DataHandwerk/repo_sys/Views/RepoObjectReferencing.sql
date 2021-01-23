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
   ,[referencing].[referencing_schema_name]
   ,[referencing].[referencing_entity_name]
   ,[referencing].[referencing_id]
   ,[referencing].[referencing_class]
   ,[referencing].[referencing_class_desc]
   ,[referencing].[is_caller_dependent]
FROM repo.RepoObject AS ro
CROSS APPLY sys.dm_sql_referencing_entities(SysObject_fullname, 'OBJECT') AS referencing
GO
