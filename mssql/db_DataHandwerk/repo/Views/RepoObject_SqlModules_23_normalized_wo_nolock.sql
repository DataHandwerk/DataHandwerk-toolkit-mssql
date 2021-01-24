/*
resolve Function 'T1 (NOLOCK)'
=> normalized_wo_nolock = 'T1'

(NOLOCK) needs to be extracted from children
*/
CREATE VIEW [repo].[RepoObject_SqlModules_23_normalized_wo_nolock]
AS
--
SELECT [T1].[RepoObject_guid]
 , [T1].[key]
 , [T1].[SysObject_fullname]
 , [T1].[normalized]
 , [normalized_wo_nolock] = [T2].[child0_normalized]
FROM repo.[RepoObject_SqlModules_20_statement_children] AS T1
CROSS APPLY [repo].[ftv_sqlparse_children_pivot]([T1].[children]) AS T2
WHERE [T1].[class] = 'Function'
 AND [T1].[is_group] = 1
 AND [T2].[child1_normalized] = '(NOLOCK)'
 --
 --SELECT
 --       [RepoObject_guid]
 --     , [key]
 --     , [SysObject_fullname]
 --     , [normalized_wo_nolock] = [0]
 --     --, [1]
 --FROM
 --(
 --    SELECT
 --           [T1].[RepoObject_guid]
 --         , [T1].[key]
 --         , [T1].[SysObject_fullname]
 --         , [T1].[normalized]
 --         , [T2_normalized] = [T2].[normalized]
 --         , [T2_json_key] = [T2].[json_key]
 --    FROM
 --         repo.RepoObject__sql_modules_20_statement_children AS T1
 --         CROSS APPLY
 --         [repo].[ftv_sqlparse]([T1].[children]) AS T2
 --    WHERE  [T1].[class] = 'Function'
 --           AND [T1].[is_group] = 1
 --) AS sourcetable PIVOT(MAX(T2_normalized) FOR T2_json_key IN(
 --                                                             [0]
 --                                                           , [1])) AS PivotTable
 --WHERE [1] = '(NOLOCK)'
