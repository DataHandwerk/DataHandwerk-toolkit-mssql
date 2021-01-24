CREATE VIEW [repo].[RepoObject_SqlModules_33_object_normalized]
AS
--
SELECT [RepoObject_guid]
 , [normalized]
 , MAX([T1].[SysObject_fullname]) AS [SysObject_fullname]
 , [Min_RowNumber_per_normalized] = MIN([RowNumber_per_Object])
FROM [repo].[RepoObject_SqlModules_20_statement_children] AS T1
GROUP BY [RepoObject_guid]
 , [normalized]
