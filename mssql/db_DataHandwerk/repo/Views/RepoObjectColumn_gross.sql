﻿
-- Alter View RepoObjectColumn__gross
-- Alter View RepoObjectColumn__gross
CREATE VIEW [repo].[RepoObjectColumn_gross]
AS
--
SELECT
       [roc].[RepoObjectColumn_guid]
     , [roc].[has_different_sys_names]
     , [roc].[is_query_plan_expression]
     , [roc].[is_RepoObjectColumn_name_uniqueidentifier]
     , [roc].[is_SysObjectColumn_missing]
     , [roc].[is_SysObjectColumn_name_uniqueidentifier]
     , [roc].[persistence_source_RepoObjectColumn_guid]
     , [roc].[Referencing_Count]
     , [roc].[Repo_default_definition]
     , [roc].[Repo_default_is_system_named]
     , [roc].[Repo_default_name]
     , [roc].[Repo_definition]
     , [roc].[Repo_generated_always_type]
     , [roc].[Repo_graph_type]
     , [roc].[Repo_is_computed]
     , [roc].[Repo_is_identity]
     , [roc].[Repo_is_nullable]
     , [roc].[Repo_is_persisted]
     , [roc].[Repo_seed_value]
     , [roc].[Repo_increment_value]
     , [roc].[Repo_user_type_fullname]
     , [roc].[Repo_user_type_name]
     , [roc].[RepoObject_guid]
     , [roc].[RepoObjectColumn_name]
     , [roc].[SysObjectColumn_column_id]
     , [roc].[SysObjectColumn_name]
     , [ro].[has_get_referenced_issue]
     , [ro].[is_repo_managed]
     , [ro].[is_RepoObject_name_uniqueidentifier]
     , [ro].[is_SysObject_missing]
     , [ro].[is_SysObject_name_uniqueidentifier]
     , [ro].[modify_dt]
     , [ro].[node_id]
     , [ro].[pk_index_guid]
     , [ro].[RepoObject_fullname]
     , [ro].[RepoObject_name]
     , [ro].[RepoObject_Referencing_Count]
     , [ro].[RepoObject_schema_name]
     , [ro].[RepoObject_type]
     , [ro].[SysObject_fullname]
     , [ro].[SysObject_id]
     , [ro].[SysObject_modify_date]
     , [ro].[SysObject_name]
     , [ro].[SysObject_schema_name]
     , [ro].[SysObject_type]
     , [ro].[SysObject_parent_object_id]
--, [ro].[SysObject_history_table_id]
--, [ro].[SysObject_max_column_id_used]
--, [ro].[SysObject_temporal_type]
FROM
     repo.RepoObjectColumn AS roc
     INNER JOIN
     repo.RepoObject AS ro
     ON roc.RepoObject_guid = ro.RepoObject_guid
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

