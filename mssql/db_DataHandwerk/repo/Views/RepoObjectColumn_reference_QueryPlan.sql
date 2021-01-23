
-- Alter View RepoObjectColumn_reference__query_plan

-- Alter View RepoObjectColumn_reference__query_plan
CREATE VIEW [repo].[RepoObjectColumn_reference_QueryPlan]
AS
--
SELECT
       [ro].[SysObject_id] AS                                                                [referencing_id]
     , [roc].[SysObjectColumn_column_id] AS                                                  [referencing_minor_id]
     , CAST([ro].[SysObject_id] AS BIGINT) * 10000 + [roc].[SysObjectColumn_column_id] AS    [referencing_node_id]
     , [roc2].[SysObject_id] AS                                                              [referenced_id]
     , [roc2].[SysObjectColumn_column_id] AS                                                 [referenced_minor_id]
     , CAST([roc2].[SysObject_id] AS BIGINT) * 10000 + [roc2].[SysObjectColumn_column_id] AS [referenced_node_id]
     , [ros].[RepoObject_guid] AS                                                            [referencing_RepoObject_guid]
     , [roc].[RepoObjectColumn_guid] AS                                                      [referencing_RepoObjectColumn_guid]
     , [roc2].[RepoObject_guid] AS                                                           [referenced_RepoObject_guid]
     , [roc2].[RepoObjectColumn_guid] AS                                                     [referenced_RepoObjectColumn_guid]
     , [ro].[SysObject_type] AS                                                              [referencing_type]
     , [ro].[SysObject_schema_name] AS                                                       [referencing_schema_name]
     , [ro].[SysObject_name] AS                                                              [referencing_entity_name]
     , [ros].[target_column_name] AS                                                         [referencing_column_name]
     , [roc2].[SysObject_schema_name] AS                                                     [referenced_schema_name]
     , [roc2].[SysObject_name] AS                                                            [referenced_entity_name]
     , [ros].[source_column_name] AS                                                         [referenced_column_name]
     , [roc2].[SysObject_type] AS                                                            [referenced_type]
     , [InformationSource] = 'query plan'
       ----, [ros].[source_server_name] AS      [source_server_name]
       ----, [repo].[fs_dwh_database_name]() AS [source_database_name]
       --, [ros].[source_database_name] AS      [source_database_name_quoted]
     , [ros].[source_schema_name] AS                                                         [source_schema_name_quoted]
     , [ros].[source_table_name] AS                                                          [source_table_name_quoted]
     , [ros].[is_target_column_name_expression]
     , [ros].[is_source_column_name_expression]
     , [is_computed] = CAST(CASE
                                WHEN [ros].[is_target_column_name_expression] = 1
                                     OR [ros].[is_source_column_name_expression] = 1
                                THEN 1
                                ELSE 0
                            END AS BIT)
     , [definition] = CAST(NULL AS NVARCHAR(MAX))
     , [is_referencing_object_equal_referenced_object] = CAST(CASE
                                                                 WHEN [ros].[RepoObject_guid] = [roc2].[RepoObject_guid]
                                                                 THEN 1
                                                                 ELSE 0
                                                             END AS BIT)
     , [is_referenced_object] =
(
    SELECT TOP 1
           CAST(1 AS BIT)
    FROM
         [repo].[RepoObject_reference_union] AS [ro_r]
    WHERE  [ro_r].[referencing_RepoObject_guid] = [ros].[RepoObject_guid]
           AND [ro_r].[referenced_RepoObject_guid] = [roc2].[RepoObject_guid]
)
FROM
     repo.RepoObjectSource_QueryPlan AS ros
     INNER JOIN
     repo.RepoObject AS ro
     ON ros.RepoObject_guid = ro.RepoObject_guid
     LEFT JOIN
     repo.[RepoObjectColumn_gross] AS roc
     ON ro.SysObject_schema_name = roc.SysObject_schema_name
        AND ro.SysObject_name = roc.SysObject_name
        AND ros.target_column_name = roc.SysObjectColumn_name
     LEFT JOIN
     repo.[RepoObjectColumn_gross] AS roc2
     ON ros.source_column_name = roc2.SysObjectColumn_name
        AND ros.source_server_name IS NULL
        AND ((ros.source_database_name = QUOTENAME([repo].[fs_dwh_database_name]())
              AND ros.source_schema_name = QUOTENAME(roc2.SysObject_schema_name)
              AND ros.source_table_name = QUOTENAME(roc2.SysObject_name))
             --if source_column is expression like 'Expr1006' then these are missing: ros.source_schema_name, ros.source_table_name
             --we should use these names from the target column (which is in the same object)
             OR (ros.[is_source_column_name_expression] = 1
                 AND [ro].[SysObject_schema_name] = roc2.SysObject_schema_name
                 AND [ro].[SysObject_name] = roc2.SysObject_name
             --
             )
        --
        )
WHERE

--exclude reference on self (target column = source column)
NOT([ro].[SysObject_schema_name] = [roc2].[SysObject_schema_name]
    AND [ro].[SysObject_name] = [roc2].[SysObject_name]
    AND [ros].[target_column_name] = [ros].[source_column_name])

------
--AND --
--[ros].[RepoObject_guid] = '6076940B-2B57-EB11-84D8-A81E8446D5B0'
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


