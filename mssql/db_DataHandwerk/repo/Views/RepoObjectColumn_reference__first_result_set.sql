
-- Alter View RepoObjectColumn_reference__first_result_set
--"common" references
--these should be "common" columns in views, not containing expressions
--Attention: views on views are "resolved" like views on the underlaying tables!
--it looks like we don't get references between views here!
CREATE VIEW [repo].[RepoObjectColumn_reference__first_result_set]
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
     , [ros].[source_schema_name] AS                                                         [referenced_schema_name]
     , [ros].[source_table_name] AS                                                          [referenced_entity_name]
     , [ros].[source_column_name] AS                                                         [referenced_column_name]
     , [roc2].[SysObject_type] AS                                                            [referenced_type]
     , [InformationSource] = 'sys.dm_exec_describe_first_result_set'
     , [is_referencing_object_equal_referenced_object] = CAST(CASE
                                                                  WHEN [ros].[RepoObject_guid] = [roc2].[RepoObject_guid]
                                                                  THEN 1
                                                                  ELSE 0
                                                              END AS BIT)
       --Flag, if the [referenced_RepoObject_guid] is a referenced object in [repo].[RepoObject_reference__union]
     , [is_referenced_object] =
(
    SELECT TOP 1
           CAST(1 AS BIT)
    FROM
         [repo].[RepoObject_reference__union] AS [ro_r]
    WHERE  [ro_r].[referencing_RepoObject_guid] = [ros].[RepoObject_guid]
           AND [ro_r].[referenced_RepoObject_guid] = [roc2].[RepoObject_guid]
)
     , [ros].[is_hidden]
FROM
     repo.RepoObjectSource__first_result_set AS ros
     INNER JOIN
     repo.RepoObject AS ro
     ON ros.RepoObject_guid = ro.RepoObject_guid
     LEFT JOIN
     repo.RepoObjectColumn__gross AS roc
     ON ro.SysObject_schema_name = roc.SysObject_schema_name
        AND ro.SysObject_name = roc.SysObject_name
        AND ros.target_column_name = roc.SysObjectColumn_name
     LEFT JOIN
     repo.RepoObjectColumn__gross AS roc2
     ON ros.source_schema_name = roc2.SysObject_schema_name
        AND ros.source_table_name = roc2.SysObject_name
        AND ros.source_column_name = roc2.SysObjectColumn_name
        AND ros.source_server_name IS NULL

--exclude reference on self (target column = source column)
WHERE NOT([ro].[SysObject_schema_name] = [ros].[source_schema_name]
          AND [ro].[SysObject_name] = [ros].[source_table_name]
          AND [ros].[target_column_name] = [ros].[source_column_name])
      --exclude source 'sys 
      --todo: make this an option via parameter
      AND NOT [ros].[source_schema_name] = 'sys'
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


