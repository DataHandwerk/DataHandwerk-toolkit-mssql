
/*
resolve Function 'T1 (NOLOCK)'
=> normalized_wo_nolock = 'T1'
*/

CREATE   VIEW [repo].[RepoObject__sql_modules_23_normalized_wo_nolock]
AS
--
SELECT
       [RepoObject_guid]
     , [key]
     , [SysObject_fullname]
     , [normalized_wo_nolock] = [0]
--, [1]
FROM
(
    SELECT
           [T1].[RepoObject_guid]
         , [T1].[key]
         , [T1].[SysObject_fullname]
         , [T1].[normalized]
         , [T2_normalized] = [T2].[normalized]
         , [T2_json_key] = [T2].[json_key]
    FROM
         repo.RepoObject__sql_modules_20_statement_children AS T1
         CROSS APPLY
         [repo].[ftv_sqlparse]([T1].[children]) AS T2
    WHERE  [T1].[class] = 'Function'
           AND [T1].[is_group] = 1
) AS sourcetable PIVOT(MAX(T2_normalized) FOR T2_json_key IN(
                                                             [0]
                                                           , [1])) AS PivotTable
WHERE [1] = '(NOLOCK)'