
CREATE VIEW [repo].[RepoObject_SqlModules_32_object_class]
AS
--
SELECT
       [RepoObject_guid]
     , [class]
     , MAX([T1].[SysObject_fullname]) AS [SysObject_fullname]
     , [Min_RowNumber_per_class] = MIN([RowNumber_per_Object])
FROM
     [repo].[RepoObject_SqlModules_20_statement_children] AS T1
GROUP BY
         [RepoObject_guid]
       , [class]