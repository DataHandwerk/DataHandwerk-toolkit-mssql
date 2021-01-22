﻿
-- Alter View SysColumn_RepoObjectColumn_via_name
CREATE VIEW [repo].[SysColumn_RepoObjectColumn_via_name]
AS
--
SELECT
       [sc].[SysObject_id]
     , [sc].[SysObject_column_id]
     , [ro].[is_repo_managed]
     , [ro].[RepoObject_fullname]
     , [ro].[SysObject_fullname]
     , [roc].[has_different_sys_names]
     , [roc].[is_query_plan_expression]
     , [roc].[is_RepoObjectColumn_name_uniqueidentifier]
     , [roc].[is_SysObjectColumn_missing]
     , [roc].[is_SysObjectColumn_name_uniqueidentifier]
     , [roc].[persistence_source_RepoObjectColumn_guid]
     , [roc].[Referencing_Count]
     , [roc].[Repo_default_definition]
     , [roc].[Repo_default_name]
     , [roc].[Repo_default_is_system_named]
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
     , [roc].[Repo_uses_database_collation]
     , [roc].[RepoObject_guid]
     , [roc].[RepoObjectColumn_guid]
     , [roc].[RepoObjectColumn_name]
     , [roc].[SysObjectColumn_column_id]
     , [roc].[SysObjectColumn_name]
     , [sc].[default_definition]
     , [sc].[default_is_system_named]
     , [sc].[default_name]
     , [sc].[definition]
     , [sc].[generated_always_type]
     , [sc].[graph_type]
     , [sc].[is_computed]
     , [sc].[is_identity]
     , [sc].[is_nullable]
     , [sc].[is_persisted]
     , [sc].[seed_value]
     , [sc].[increment_value]
     , [sc].[SysObject_column_name]
     , [sc].[SysObject_name]
     , [sc].[SysObject_RepoObject_guid]
     , [sc].[SysObject_RepoObjectColumn_guid]
     , [sc].[SysObject_schema_name]
     , [sc].[SysObject_type]
     , [sc].[user_type_fullname]
     , [sc].[user_type_name]
     , [sc].[uses_database_collation]
       --sometimes by error we have same named columns in repo.RepoObjectColumn, additinal columns should be deleted in [repo].[usp_sync_guid_RepoObjectColumn]
     , [RowNumberOverName] = ROW_NUMBER() OVER(PARTITION BY [sc].[SysObject_RepoObject_guid]
                                                          , [sc].[SysObject_column_name]
       ORDER BY
                [roc].[RepoObjectColumn_guid])
FROM
     repo_sys.SysColumn AS sc
     LEFT JOIN
     repo.RepoObjectColumn AS roc
     ON sc.SysObject_RepoObject_guid = roc.RepoObject_guid
        AND sc.SysObject_column_name = roc.SysObjectColumn_name
     LEFT JOIN
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



GO



GO



GO


