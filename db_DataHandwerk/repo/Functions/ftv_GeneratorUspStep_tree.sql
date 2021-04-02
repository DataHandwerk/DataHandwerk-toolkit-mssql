
/*
[repo].[GeneratorUspStep] has a parent child structure
here we try to get the numbers in the right order

it is not perfect if the tree is to deep and some "deep" numbers are lower
check the result per [usp_id]
and if it not fits try to use better sorted numbers


----usage
----and how to get required_Begin_count and required_Begin_count for conditions
--
--get all steps per Usp, recursively:
SELECT u.*
 , t.*
FROM [repo].[GeneratorUsp] u
CROSS APPLY [repo].[ftv_GeneratorUspStep_tree]([id], NULL) t
ORDER BY [u].id
 , t.[RowNumber_PerUsp]

----and now about conditions
----all this is done because we need to encapsulate condition THEN and ELSE statement in BEGIN...END blocks
----but need to explore the first and last step per condition THEN- or ELSE-block
--
--get all (is_condition = 1) statements and their recursive children
SELECT [s].[usp_id]
 , [s].[Number] AS [Condition_Number]
 --, [s].[Parent_Number]
 --, [s].[Name]
 --, [s].[has_logging]
 --, [s].[is_condition]
 --, [s].[is_inactive]
 --, [s].[is_SubProcedure]
 --, [s].[Statement]
 --, [s].[log_source_object]
 --, [s].[log_target_object]
 --, [s].[log_flag_InsertUpdateDelete]
 --, [s].[info_01]
 --, [s].[info_02]
 --, [s].[info_03]
 --, [s].[info_04]
 --, [s].[info_05]
 --, [s].[info_06]
 --, [s].[info_07]
 --, [s].[info_08]
 --, [s].[info_09]
 --, [t].[usp_id]
 , [t].[child_PerParent]
 , [t].[RowNumber_PerUsp] AS [RowNumber_PerUspAndCondition]
 , [t].[Number]
 , [t].[Asc_PerParentChild]
 , [t].[Desc_PerParentChild]
 , [t].[is_required_ELSE]
--, [t].[Depth]
--, [t].[is_condition]
--, [t].[Root_Sort]
--, [t].[Parent_Number]
--, [t].[Parent_Sort]
--, [t].[Sort]
FROM [repo].[GeneratorUspStep] AS s
CROSS APPLY [repo].[ftv_GeneratorUspStep_tree]([usp_id], [Number]) AS t
WHERE [s].[is_condition] = 1
ORDER BY [s].[usp_id]
 , [Condition_Number]
 , [t].[child_PerParent]
 , [RowNumber_PerUspAndCondition]


--evaluate the count and place of BEGIN and END for condition statements:
--t: all recursive children of any step which is a condition
--this should also work for recursive conditions, because ([s].[is_condition] = 1) will filter any conditions
--([t].[Asc_PerParentChild] = 1) indicates a required BEGIN, these are first children of conditions
--([t].[Desc_PerParentChild] = 1) indicates a required BEGIN, these are last children of condition steps

SELECT [s].[usp_id]
 , [t].[Number]
 , required_Begin_count = SUM(IIF([t].[Asc_PerParentChild] = 1, 1, 0))
 , required_End_count = sum(iif([t].[Desc_PerParentChild] = 1, 1, 0))
 , [is_required_ELSE] = MAX([t].[is_required_ELSE])
FROM [repo].[GeneratorUspStep] AS s
CROSS APPLY [repo].[ftv_GeneratorUspStep_tree]([usp_id], [Number]) AS t
WHERE [s].[is_condition] = 1
GROUP BY [s].[usp_id]
 , [t].[Number]


 --combine all active steps per usp with required_Begin_count and required_End_count:

SELECT [u].[id]
 --, [u].[usp_schema]
 --, [u].[usp_name]
 , [u].[has_logging]
 --, [u].[usp_Comment]
 , [u].[usp_fullname]
 --, [t].[usp_id]
 , [t].[Number]
 , [t].[RowNumber_PerUsp]
 , [t].[Depth]
 , [t].[is_condition]
 , [t].[Root_Sort]
 --, [t].[Parent_Number]
 --, [t].[Parent_Sort]
 --, [t].[Sort]
 --, [t].[child_PerParent]
 --, [t].[Asc_PerParentChild]
 --, [t].[Desc_PerParentChild]
 , [BeginEnd].[required_Begin_count]
 , [BeginEnd].[required_End_count]
 , [BeginEnd].[is_required_ELSE]
FROM [repo].[GeneratorUsp] AS u
CROSS APPLY [repo].[ftv_GeneratorUspStep_tree]([id], NULL) AS t
LEFT JOIN (
 SELECT [s].[usp_id]
  , [t].[Number]
  , [required_Begin_count] = SUM(IIF([t].[Asc_PerParentChild] = 1, 1, 0))
  , [required_End_count] = SUM(IIF([t].[Desc_PerParentChild] = 1, 1, 0))
  , [is_required_ELSE] = MAX([t].[is_required_ELSE])
 FROM [repo].[GeneratorUspStep] AS s
 CROSS APPLY [repo].[ftv_GeneratorUspStep_tree]([usp_id], [Number]) AS t
 WHERE [s].[is_condition] = 1
 GROUP BY [s].[usp_id]
  , [t].[Number]
 ) AS BeginEnd
 ON BeginEnd.usp_id = u.id
  AND BeginEnd.Number = t.Number
ORDER BY [u].[id]
 , [t].[RowNumber_PerUsp]

--and finaly use [repo].[ftv_GeneratorUspStep_sql] to create the statement per step

SELECT [u].[id]
 , [t].[Number]
 , [u].[has_logging]
 , [BeginEnd].[required_Begin_count]
 , [BeginEnd].[required_End_count]
 , [BeginEnd].[is_required_ELSE]
 --only information
 , [u].[usp_fullname]
 , [t].[RowNumber_PerUsp]
 --, [t].[Depth]
 --, [t].[is_condition]
 --, [t].[Root_Sort]
 --, [t].[Parent_Number]
 --, [t].[Parent_Sort]
 --, [t].[Sort]
 --, [t].[child_PerParent]
 --, [t].[Asc_PerParentChild]
 --, [t].[Desc_PerParentChild]
 , sql.SqlStep
FROM [repo].[GeneratorUsp] AS u
CROSS APPLY [repo].[ftv_GeneratorUspStep_tree]([id], NULL) AS t
LEFT JOIN (
 SELECT [s].[usp_id]
  , [t].[Number]
  , [required_Begin_count] = SUM(IIF([t].[Asc_PerParentChild] = 1, 1, 0))
  , [required_End_count] = SUM(IIF([t].[Desc_PerParentChild] = 1, 1, 0))
  , [is_required_ELSE] = MAX([t].[is_required_ELSE])
 FROM [repo].[GeneratorUspStep] AS s
 CROSS APPLY [repo].[ftv_GeneratorUspStep_tree]([usp_id], [Number]) AS t
 WHERE [s].[is_condition] = 1
 GROUP BY [s].[usp_id]
  , [t].[Number]
 ) AS BeginEnd
 ON BeginEnd.usp_id = u.id
  AND BeginEnd.Number = t.Number
CROSS APPLY [repo].[ftv_GeneratorUspStep_sql]([u].[id], [t].[Number], [u].[has_logging], [BeginEnd].[required_Begin_count], [BeginEnd].[required_End_count], [BeginEnd].[is_required_ELSE]) sql
ORDER BY [u].[id]
 , [t].[RowNumber_PerUsp]


*/
CREATE FUNCTION [repo].[ftv_GeneratorUspStep_tree] (
 @usp_id INT
 , @Parent_Number INT
 --, @usp_has_logging TINYINT = 0
 )
RETURNS TABLE
AS
RETURN (
  WITH tree AS
   --tree is recursive to solve parent child hierarchies
   (
    SELECT [usp_id]
     , [Number]
     , [Parent_Number]
     , 0 AS [Depth]
     , [Number] AS [Sort]
     , [Number] AS [Parent_Sort]
     , [Number] AS [Root_Sort]
     , [is_condition]
     , [child_PerParent] = IIF(NOT [Parent_Number] IS NULL, ROW_NUMBER() OVER (
       PARTITION BY [usp_id]
       , [Parent_Number] ORDER BY [Number]
       ), NULL)
    --ROW_NUMBER() OVER(Partition by [usp_id], [Parent_Number] ORDER BY [Number])
    FROM [repo].[GeneratorUspStep]
    WHERE
     --
     [usp_id] = @usp_id
     AND [is_inactive] = 0
     AND (
      [Parent_Number] = @Parent_Number
      OR @Parent_Number IS NULL
      AND [Parent_Number] IS NULL
      )
    
    UNION ALL
    
    SELECT [child].[usp_id]
     , [child].[Number]
     , [child].[Parent_Number]
     , [parent].[Depth] + 1
     , [child].[Parent_Number] AS [sort]
     , [parent].[Sort] AS [Parent_sort]
     , [parent].[Root_Sort] AS [Root_Sort]
     , [child].[is_condition]
     , [child_PerParent] = [parent].[child_PerParent]
    FROM [repo].[GeneratorUspStep] AS child
    INNER JOIN tree AS parent
     ON child.[Parent_Number] = parent.Number
    WHERE
     --
     [child].[usp_id] = @usp_id
     AND [child].[is_inactive] = 0
    )
   , tree_2 AS
   --tree_2 is required to calculate the correct step order: [RowNumber_PerUsp]
   (
    SELECT
     --
     [tree].[usp_id]
     , [tree].[Number]
     , [RowNumber_PerUsp] = ROW_NUMBER() OVER (
      PARTITION BY [tree].[usp_id] ORDER BY [tree].[Root_Sort]
       , [tree].[Parent_Number]
       , [tree].[Parent_Sort]
       , [tree].[Sort]
      )
     , [tree].[Depth]
     , [tree].[is_condition]
     , [tree].[Root_Sort]
     , [tree].[Parent_Number]
     , [tree].[Parent_Sort]
     , [tree].[Sort]
     , [tree].[child_PerParent]
    FROM tree
    )
   , tree_3 AS
   --final query is used to calculate Asc_PerParentChild and Desc_PerParentChild
   --Asc_PerParentChild is the first step per [child_PerParent]
   --if the @Parent_Number has [is_condition] = 1
   --then [child_PerParent] = 1 is the THEN block an [child_PerParent] = 2 is the ELSE block
   --to encapsulate THEN and ELSE block:
   --a 'BEGIN' is required before Asc_PerParentChild = 1
   --a 'END' is required after Desc_PerParentChild = 1
   (
    SELECT
     --
     *
     , [Asc_PerParentChild] = ROW_NUMBER() OVER (
      PARTITION BY [usp_id]
      , [child_PerParent] ORDER BY [RowNumber_PerUsp]
      )
     , [Desc_PerParentChild] = ROW_NUMBER() OVER (
      PARTITION BY [usp_id]
      , [child_PerParent] ORDER BY [RowNumber_PerUsp] DESC
      )
    FROM tree_2
    )
  SELECT
   --
   *
   --[child_PerParent] = 2 is the ELSE-block, if the parent is a condition
   --in front of the ELSE block the 'ELSE' is required
   , is_required_ELSE = IIF([child_PerParent] = 2
    AND [Asc_PerParentChild] = 1, 1, 0)
  FROM tree_3
  )
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '3390291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'FUNCTION', @level1name = N'ftv_GeneratorUspStep_tree';


GO


