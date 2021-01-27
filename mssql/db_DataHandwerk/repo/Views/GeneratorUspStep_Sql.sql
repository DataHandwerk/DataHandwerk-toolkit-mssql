

/*
--usage:

SELECT *
FROM [repo].[GeneratorUspStep_Sql]
ORDER BY [id]
 , [RowNumber_PerUsp]


*/
CREATE VIEW [repo].[GeneratorUspStep_Sql]
AS
SELECT [u].[id] AS usp_id
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
 SELECT [s].[Usp_id]
  , [t].[Number]
  , [required_Begin_count] = SUM(IIF([t].[Asc_PerParentChild] = 1, 1, 0))
  , [required_End_count] = SUM(IIF([t].[Desc_PerParentChild] = 1, 1, 0))
  , [is_required_ELSE] = MAX([t].[is_required_ELSE])
 FROM [repo].[GeneratorUspStep] AS s
 CROSS APPLY [repo].[ftv_GeneratorUspStep_tree]([Usp_id], [Number]) AS t
 WHERE [s].[is_condition] = 1
 GROUP BY [s].[Usp_id]
  , [t].[Number]
 ) AS BeginEnd
 ON BeginEnd.Usp_id = u.id
  AND BeginEnd.Number = t.Number
CROSS APPLY [repo].[ftv_GeneratorUspStep_sql]([u].[id], [t].[Number], [u].[has_logging], [BeginEnd].[required_Begin_count], [BeginEnd].[required_End_count], [BeginEnd].[is_required_ELSE]) sql