


CREATE VIEW [repo].[RepoObject_SqlModules_Repo_Sys]
AS
--
SELECT [ro].[RepoObject_guid]
 ----when outdated, use original [sql_modules_definition], otherwise use saved [sql_modules_definition]
 --, [sql_modules_definition] = CASE 
 -- WHEN (
 --   [ros].[sql_modules_dt] IS NULL
 --   OR [ros].[sql_modules_dt] < [so].[modify_date]
 --   )
 --  THEN [so].[sql_modules_definition]
 -- ELSE [ros].[sql_modules_definition]
 -- END
 , [so].[sql_modules_definition]
 , [ros].[sql_modules_dt]
 --, [ros].[sql_modules_antora]
 , [ros].[sql_modules_formatted]
 , [ros].[sql_modules_formatted2]
 , [ros].[sql_modules_json]
 , [ros].[is_json_sql_modules_json]
 , [so].[modify_date]
 , [ro].[SysObject_type]
 , [is_outdated] = CAST(CASE 
   WHEN (
     [ros].[sql_modules_dt] IS NULL
     OR [ros].[sql_modules_dt] < [so].[modify_date]
     )
    THEN 1
   ELSE 0
   END AS BIT)
FROM repo.RepoObject AS ro
INNER JOIN repo_sys.SysObject AS so
 ON ro.RepoObject_guid = so.SysObject_RepoObject_guid
LEFT JOIN [repo].[RepoObject_SqlModules] AS ros
 ON ros.[RepoObject_guid] = ro.[RepoObject_guid]
WHERE NOT [so].[sql_modules_definition] IS NULL

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5390291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8bf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys', @level2type = N'COLUMN', @level2name = N'SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '88f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys', @level2type = N'COLUMN', @level2name = N'sql_modules_json';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '87f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys', @level2type = N'COLUMN', @level2name = N'sql_modules_formatted2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '86f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys', @level2type = N'COLUMN', @level2name = N'sql_modules_formatted';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '85f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys', @level2type = N'COLUMN', @level2name = N'sql_modules_dt';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '84f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys', @level2type = N'COLUMN', @level2name = N'sql_modules_definition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '83f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8af47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys', @level2type = N'COLUMN', @level2name = N'modify_date';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8cf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys', @level2type = N'COLUMN', @level2name = N'is_outdated';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '89f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys', @level2type = N'COLUMN', @level2name = N'is_json_sql_modules_json';


GO



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject].[SysObject_type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys', @level2type = N'COLUMN', @level2name = N'SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'reference in [repo_sys].[type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys', @level2type = N'COLUMN', @level2name = N'SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject_SqlModules].[sql_modules_json]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys', @level2type = N'COLUMN', @level2name = N'sql_modules_json';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject_SqlModules].[sql_modules_formatted2]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys', @level2type = N'COLUMN', @level2name = N'sql_modules_formatted2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject_SqlModules].[sql_modules_formatted]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys', @level2type = N'COLUMN', @level2name = N'sql_modules_formatted';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject_SqlModules].[sql_modules_dt]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys', @level2type = N'COLUMN', @level2name = N'sql_modules_dt';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo_sys].[SysObject].[sql_modules_definition]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys', @level2type = N'COLUMN', @level2name = N'sql_modules_definition';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo_sys].[SysObject].[modify_date]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys', @level2type = N'COLUMN', @level2name = N'modify_date';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject_SqlModules].[is_json_sql_modules_json]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys', @level2type = N'COLUMN', @level2name = N'is_json_sql_modules_json';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(isjson([sql_modules_json]))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys', @level2type = N'COLUMN', @level2name = N'is_json_sql_modules_json';

