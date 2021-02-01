

--todo IdentifierList
--done: bad performance => Persistence of [repo].[RepoObject_SqlModules_41_from]
CREATE VIEW [repo].[RepoObject_SqlModules_42_from_Identifier]
AS
--
SELECT [T1].[RepoObject_guid]
 , [T1].[SysObject_fullname]
 , [T1].[class]
 , [T1].[json_key]
 , [T1].[RowNumber_per_Object]
 --todo: we need extra handling when the result of [name] is an IdentifierList and need to exclude them here
 , [name] = COALESCE([T1].[identifier_name], [T1].[normalized_wo_nolock])
 , [name_charindex_dot] = CHARINDEX('.', COALESCE([T1].[identifier_name], [T1].[normalized_wo_nolock]))
 --some alias we can get from [T1].[identifier_alias]
 --but in case of aaa (NOLOCK) the alias is on the next row: [lag].[normalized_wo_nolock]
 , [alias] = COALESCE([T1].[identifier_alias], [lag].[normalized_wo_nolock])
 , [T1_identifier_alias] = [T1].[identifier_alias]
 , [lag_normalized_wo_nolock] = [lag].[normalized_wo_nolock]
--, [pre_is_join] = [pre].[is_join]
--, [pre_is_from] = [pre].[is_from]
--, [T1].[patindex_nolock]
--, [lag_patindex_nolock] = [lag].[patindex_nolock]
--, [T1].[SysObject_fullname]
--, [T1].[is_group]
--, [T1].[is_keyword]
--, [T1].[is_whitespace]
--, [T1].[normalized]
--  --,T1.[children]
--, [T1].[normalized_wo_nolock]
--, [T1].[Min_RowNumber_From]
--, [T1].[Min_RowNumber_Where]
--, [T1].[identifier_name]
--, [T1].[identifier_alias]
--, [T1].[join_type]
--, [T1].[is_join]
--, [T1].[is_from]
FROM [repo].[RepoObject_SqlModules_41_from_T] AS T1
--required filter
--the predecessor (by [RowNumber_per_Object]) of T1 should be (is_from or is_join)
--then often T1 contains an identifier
--todo: sometimes an Identifier is a SELECT statement like '(SELECT ... FROM ...) as abc'
INNER JOIN [repo].[RepoObject_SqlModules_41_from_T] AS pre
 ON pre.[RepoObject_guid] = T1.[RepoObject_guid]
  AND pre.[RowNumber_per_Object] + 1 = T1.[RowNumber_per_Object]
  AND (
   pre.[is_join] = 1
   OR pre.[is_from] = 1
   )
--to extract some alias we need the folowing entry (lag 1)
LEFT OUTER JOIN (
 SELECT [T1].[RepoObject_guid]
  , [T1].[RowNumber_per_Object]
  , [T1].[normalized_wo_nolock]
 --, [T1].[json_key]
 --, [T1].[SysObject_fullname]
 --, [T1].[class]
 --, [T1].[is_group]
 --, [T1].[is_keyword]
 --, [T1].[is_whitespace]
 --, [T1].[normalized]
 --, [T1].[children]
 --, [T1].[Min_RowNumber_From]
 --, [T1].[Min_RowNumber_GroupBy]
 --, [T1].[Min_RowNumber_Where]
 --, [T1].[identifier_name]
 --, [T1].[identifier_alias]
 --, [T1].[join_type]
 --, [T1].[is_join]
 --, [T1].[is_from]
 --, [T1].[patindex_nolock]
 FROM [repo].[RepoObject_SqlModules_41_from_T] AS T1
 WHERE [T1].[patindex_nolock] > 0
 ) AS [lag]
 ON [lag].[RepoObject_guid] = T1.[RepoObject_guid]
  AND [lag].[RowNumber_per_Object] - 1 = T1.[RowNumber_per_Object]
WHERE
 --we can extract only 'Identifier'
 [T1].[class] = 'Identifier'
 --but even using this filter sometimes we get something different, for exampe a select statement
 --we will not handle them
 AND [T1].[normalized_PatIndex_Select] = 0
 --exclude UNION
 AND NOT EXISTS (
  SELECT 1
  FROM [repo].[RepoObject_SqlModules_29_1_object_is_union] AS [filter]
  WHERE [filter].[RepoObject_guid] = [T1].[RepoObject_guid]
  )

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '4190291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_42_from_Identifier';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '12f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_42_from_Identifier', @level2type = N'COLUMN', @level2name = N'T1_identifier_alias';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0ff47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_42_from_Identifier', @level2type = N'COLUMN', @level2name = N'RowNumber_per_Object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0df47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_42_from_Identifier', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '10f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_42_from_Identifier', @level2type = N'COLUMN', @level2name = N'name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '13f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_42_from_Identifier', @level2type = N'COLUMN', @level2name = N'lag_normalized_wo_nolock';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '11f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_42_from_Identifier', @level2type = N'COLUMN', @level2name = N'alias';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '005cfbad-f063-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_42_from_Identifier', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '025cfbad-f063-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_42_from_Identifier', @level2type = N'COLUMN', @level2name = N'name_charindex_dot';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '015cfbad-f063-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_42_from_Identifier', @level2type = N'COLUMN', @level2name = N'class';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '38813ebd-7764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_42_from_Identifier', @level2type = N'COLUMN', @level2name = N'json_key';

