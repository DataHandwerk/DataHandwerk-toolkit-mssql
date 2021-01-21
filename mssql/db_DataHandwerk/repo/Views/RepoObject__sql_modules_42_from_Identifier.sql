﻿
--todo exclude union
--todo IdentifierList

CREATE VIEW [repo].[RepoObject__sql_modules_42_from_Identifier]
AS
--
SELECT
       [T1].[RepoObject_guid]
     , [T1].[key]
     , [T1].[RowNumber_per_Object]
       --we need extra handling for IdentifierList and need to exclude them here
     , [name] = COALESCE([T1].[identifier_name] , [T1].[normalized_wo_nolock])
     , [alias] = COALESCE([T1].[identifier_alias] , [post].[normalized_wo_nolock])
--, [pre_is_join] = pre.[is_join]
--, [pre_is_from] = pre.[is_from]
--, T1.[patindex_nolock]
--, [post_patindex_nolock] = post.[patindex_nolock]
--, [post_normalized_wo_nolock] = post.[normalized_wo_nolock]
--   ,T1.[SysObject_fullname]
--   ,T1.[class]
--   ,T1.[is_group]
--   ,T1.[is_keyword]
--   ,T1.[is_whitespace]
--   ,T1.[normalized]
--   --,T1.[children]
--   ,T1.[normalized_wo_nolock]
--   ,T1.[Min_RowNumber_From]
--   ,T1.[Min_RowNumber_Where]
--   ,T1.[identifier_name]
--   ,T1.[identifier_alias]
--   ,T1.[join_type]
--, T1.[is_join]
--, T1.[is_from]
FROM
     [repo].[RepoObject__sql_modules_41_from] AS T1
     --predecessor of T1: is_from or is_join
     --then T1 should contain an identifier
     --sometimes it contains IdentifierList (if no join operator is used, but comma), they require extra handling
     INNER JOIN
     [repo].[RepoObject__sql_modules_41_from] AS pre
     ON pre.[RepoObject_guid] = T1.[RepoObject_guid]
        AND pre.[RowNumber_per_Object] + 1 = T1.[RowNumber_per_Object]
        AND (pre.[is_join] = 1
             OR pre.[is_from] = 1)
     LEFT OUTER JOIN
     [repo].[RepoObject__sql_modules_41_from] AS post
     ON post.[RepoObject_guid] = T1.[RepoObject_guid]
        AND post.[RowNumber_per_Object] - 1 = T1.[RowNumber_per_Object]
        AND post.patindex_nolock > 0
WHERE  [T1].[class] = 'Identifier'
       --exclude UNION
       AND NOT EXISTS
(
    SELECT
           1
    FROM
         [repo].[RepoObject__sql_modules_26_object__union] AS [filter]
    WHERE  [filter].[RepoObject_guid] = [T1].[RepoObject_guid]
)