CREATE VIEW [repo].[RepoObject_SqlModules_Repo_Sys]
AS
--
SELECT [ro].[RepoObject_guid]
 , [so].[sql_modules_definition]
 , [ros].[sql_modules_dt]
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
