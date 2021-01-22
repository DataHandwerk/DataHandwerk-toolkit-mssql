﻿
CREATE VIEW [repo].[IndexColumn__union]
AS
--
SELECT
       [index_guid]
     , [index_column_id]
     , [is_descending_key]
     , [RepoObjectColumn_guid]
     , [parent_RepoObject_guid]
     , [index_name]
     , [parent_schema_name]
     , [parent_SysObject_name]
     , [SysObject_column_name]
     , [SysObject_column_user_type_fullname]
     , [is_index_unique]
     , [is_index_primary_key]
     , [is_index_real]
     , [parent_SysObject_fullname]
FROM
     repo_sys.IndexColumn__real_unique AS T1
UNION ALL
SELECT
       [index_guid]
     , [index_column_id]
     , [is_descending_key]
     , [RepoObjectColumn_guid]
     , [parent_RepoObject_guid]
     , [index_name]
     , [parent_schema_name]
     , [parent_SysObject_name]
     , [SysObject_column_name]
     , [SysObject_column_user_type_fullname]
     , [is_index_unique]
     , [is_index_primary_key]
     , [is_index_real]
     , [parent_SysObject_fullname]
FROM
     repo.IndexColumn__virtual_gross AS T2
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


