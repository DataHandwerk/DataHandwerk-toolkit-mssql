
CREATE VIEW [repo].[RepoObjectColumn_MissingSource_TypeV]
AS
--
SELECT
       [roc].[RepoObjectColumn_guid]
     , [roc].[RepoObject_guid]
     , [roc].[RepoObjectColumn_name]
     , [roc].[SysObjectColumn_name]
     , [roc].[SysObjectColumn_column_id]
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
     , [roc].[Repo_user_type_name]
     , [roc].[Repo_user_type_fullname]
     , [roc].[Repo_uses_database_collation]
     , [roc].[is_SysObjectColumn_missing]
     , [roc].[persistence_source_RepoObjectColumn_guid]
     , [roc].[Referencing_Count]
     , [roc].[is_query_plan_expression]
     , [roc].[has_different_sys_names]
     , [roc].[is_RepoObjectColumn_name_uniqueidentifier]
     , [roc].[is_SysObjectColumn_name_uniqueidentifier]
     , [ro].[RepoObject_fullname]
     , [ro].[SysObject_fullname]
FROM
     [repo].[RepoObjectColumn] AS roc
     INNER JOIN
     [repo].[RepoObject] AS ro
     ON ro.[RepoObject_guid] = roc.[RepoObject_guid]
WHERE
--view
[ro].[SysObject_type] = 'V'
AND NOT EXISTS
(
    SELECT
           1
    FROM
         [repo].[RepoObjectColumn_reference_union] AS [roc_r]
    WHERE  [roc_r].[referencing_RepoObject_guid] = [roc].[RepoObject_guid]
           AND [roc_r].[referencing_RepoObjectColumn_guid] = [roc].[RepoObjectColumn_guid]
           AND ([roc_r].[is_referenced_object] = 1
                OR [roc_r].[is_referencing_object_equal_referenced_object] = 1)
)