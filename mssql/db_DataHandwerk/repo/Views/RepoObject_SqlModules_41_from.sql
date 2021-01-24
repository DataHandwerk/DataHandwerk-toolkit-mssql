/*
rows in [repo].[RepoObject__sql_modules_20_statement_children]
which define the first Block 
- between FROM and WHERE
- or between FROM and GROUP BY

Attention, this will not work for UNION to analyze all parts of the UNION
- we could get the first part
- we could get the part from the first from to a first where in another part of the UNION
*/
CREATE VIEW [repo].[RepoObject_SqlModules_41_from]
AS
--
SELECT [T1].[RepoObject_guid]
 , [T1].[key]
 , [T1].[SysObject_fullname]
 , [T1].[RowNumber_per_Object]
 , [T1].[class]
 , [T1].[is_group]
 , [T1].[is_keyword]
 , [T1].[is_whitespace]
 , [T1].[normalized]
 , [T1].[children]
 , [normalized_wo_nolock] = TRIM(REPLACE([T1].[normalized], '(NOLOCK)', ''))
 --, [T23_normalized_wo_nolock] = [T23].[normalized_wo_nolock]
 , [T2].[Min_RowNumber_From]
 , [T2].[Min_RowNumber_GroupBy]
 , [T2].[Min_RowNumber_Where]
 , [T22].[identifier_name]
 , [T22].[identifier_alias]
 , [t4].[join_type]
 , [is_join] = IIF(NOT [t4].[join_type] IS NULL, 1, 0)
 , [is_from] = IIF([T1].[normalized] = 'FROM'
  AND [T1].[is_keyword] = 1, 1, 0)
 , [patindex_nolock] = PATINDEX('%(NOLOCK)%', [T1].[normalized])
FROM [repo].[RepoObject_SqlModules_20_statement_children] AS T1
LEFT OUTER JOIN [repo].[RepoObject_SqlModules_39_object] AS T2
 ON T2.[RepoObject_guid] = T1.[RepoObject_guid]
LEFT OUTER JOIN [repo].[RepoObject_SqlModules_22_identifier_alias_AS] AS T22
 ON T22.[RepoObject_guid] = T1.[RepoObject_guid]
  AND T22.[key] = T1.[key]
--LEFT OUTER JOIN
--[repo].[RepoObject__sql_modules_23_normalized_wo_nolock] AS T23
--ON T23.[RepoObject_guid] = T1.[RepoObject_guid]
--   AND T23.[key] = T1.[key]
LEFT OUTER JOIN [repo].[join_type] AS T4
 ON T4.[join_type_variant] = T1.normalized
  AND T1.is_keyword = 1
WHERE
 --extract the FROM part:
 --start: [Min_RowNumber_From]
 [T2].[Min_RowNumber_From] <= [T1].[RowNumber_per_Object]
 --ende: [Min_RowNumber_Where] or [Min_RowNumber_GroupBy]
 AND (
  [T2].[Min_RowNumber_Where] IS NULL
  OR [T2].[Min_RowNumber_Where] > [T1].[RowNumber_per_Object]
  )
 AND (
  [T2].[Min_RowNumber_GroupBy] IS NULL
  OR [T2].[Min_RowNumber_GroupBy] > [T1].[RowNumber_per_Object]
  )
 --ORDER BY
 --         [T1].[RepoObject_guid]
 --       , [T1].[RowNumber_per_Object]
