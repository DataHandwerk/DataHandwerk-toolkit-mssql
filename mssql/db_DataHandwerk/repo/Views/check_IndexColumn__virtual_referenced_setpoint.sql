
CREATE VIEW [repo].[check_IndexColumn__virtual_referenced_setpoint]
AS SELECT
          [T1].[index_guid]
        , [T1].[index_column_id]
        , [T1].[referencing_RepoObjectColumn_guid]
        , [T1].[referenced_index_guid]
        , [T1].[referenced_RepoObjectColumn_guid]
        , [ro_s].[SysObject_fullname] AS     [SysObject_fullname_s]
        , [ro_t].[SysObject_fullname] AS     [SysObject_fullname_t]
        , [roc_s].[SysObjectColumn_name] AS  [SysObjectColumn_name_s]
        , [roc_t].[SysObjectColumn_name] AS  [SysObjectColumn_name_t]
        , [T1].[referenced_RepoObject_guid]
        , [roc_s].[RepoObject_guid] AS       [RepoObject_guid_s]
        , [T1].[referencing_RepoObject_guid]
        , [roc_t].[RepoObject_guid] AS       [RepoObject_guid_t]
        , [roc_t].[RepoObjectColumn_guid] AS [RepoObjectColumn_guid_t]
   --    , [roc_s].[RepoObjectColumn_guid] AS [RepoObjectColumn_guid_s]
   --, [roc_s].[RepoObjectColumn_name] AS [RepoObjectColumn_name_s]
   --, [roc_t].[RepoObjectColumn_name] AS [RepoObjectColumn_name_t]
   FROM
        repo.IndexColumn__virtual_referenced_setpoint AS T1
        LEFT OUTER JOIN
        repo.RepoObjectColumn AS roc_t
        ON T1.referencing_RepoObjectColumn_guid = roc_t.RepoObjectColumn_guid
        LEFT OUTER JOIN
        repo.RepoObjectColumn AS roc_s
        ON T1.referenced_RepoObjectColumn_guid = roc_s.RepoObjectColumn_guid
        LEFT OUTER JOIN
        repo.RepoObject AS ro_t
        ON T1.referencing_RepoObject_guid = ro_t.RepoObject_guid
        LEFT OUTER JOIN
        repo.RepoObject AS ro_s
        ON T1.referenced_RepoObject_guid = ro_s.RepoObject_guid
   --WHERE  [T1].[index_guid] = '9731BB8B-CB50-EB11-84D5-A81E8446D5B0'
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


