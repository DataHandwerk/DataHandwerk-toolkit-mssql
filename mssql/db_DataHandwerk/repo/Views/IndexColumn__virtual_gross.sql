
CREATE VIEW [repo].[IndexColumn__virtual_gross]
AS
--
SELECT
       [icv].[index_guid]
     , [icv].[index_column_id]
     , [icv].[is_descending_key]
     , [sc_roc].[RepoObjectColumn_guid] --could by empty for new Objects, execute [repo].[usp_sync_guid]
     , [iv].[parent_RepoObject_guid]
     , [iv].[index_name]
     , [parent_schema_name] = [sc_roc].[SysObject_schema_name]
     , [parent_SysObject_name] = [sc_roc].[SysObject_name]
     , [sc_roc].[SysObject_column_name]
     , [sc_roc].[user_type_fullname] AS [SysObject_column_user_type_fullname]
     , [iv].[is_index_unique]
     , [iv].[is_index_primary_key]
     , [parent_SysObject_fullname] = [sc_roc].[SysObject_fullname]
     , [is_index_real] = CAST(0 AS BIT)
FROM
     repo.IndexColumn__virtual AS icv
     INNER JOIN
     repo.Index__virtual AS iv
     ON icv.index_guid = iv.index_guid
     INNER JOIN
     repo.SysColumn_RepoObjectColumn_via_guid AS sc_roc
     ON icv.RepoObjectColumn_guid = sc_roc.RepoObjectColumn_guid
     LEFT JOIN
     repo.SysObject_RepoObject_via_guid AS sc_ro
     ON sc_ro.RepoObject_guid = iv.parent_RepoObject_guid

--WHERE  [iv].[is_index_unique] = 1
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


