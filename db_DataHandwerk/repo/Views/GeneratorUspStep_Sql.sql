
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
 ----this list is  too wide, we need a smaller list
 --, AdocStep = CONCAT (
 -- '|'
 -- , step.Number
 -- , CHAR(13)
 -- , CHAR(10)
 -- , '|'
 -- , step.[Name]
 -- , CHAR(13)
 -- , CHAR(10)
 -- , '|'
 -- , step.[is_condition]
 -- , CHAR(13)
 -- , CHAR(10)
 -- , '|'
 -- , step.[log_source_object]
 -- , CHAR(13)
 -- , CHAR(10)
 -- , '|'
 -- , step.[log_target_object]
 -- , CHAR(13)
 -- , CHAR(10)
 -- , '|'
 -- , step.[log_flag_InsertUpdateDelete]
 -- , CHAR(13)
 -- , CHAR(10)
 -- )
 , AdocStep = CONCAT (
  '|'
  , step.Number
  , CHAR(13) + CHAR(10)
  , '|'
  , CHAR(13) + CHAR(10)
  , '*'
  , step.[Name]
  , '*'
  , CHAR(13) + CHAR(10)
  , CHAR(13) + CHAR(10)
  , IIF(step.[log_flag_InsertUpdateDelete] <> '', '* ' + step.[log_flag_InsertUpdateDelete] + CHAR(13) + CHAR(10), NULL)
  , IIF(step.[log_source_object] <> '', '* ' + step.[log_source_object] + CHAR(13) + CHAR(10), NULL)
  , IIF(step.[log_target_object] <> '', '* ' + step.[log_target_object] + CHAR(13) + CHAR(10), NULL)
  , CHAR(13) + CHAR(10)
  , '|'
  , step.[is_condition]
  , CHAR(13) + CHAR(10)
  )
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
LEFT JOIN [repo].[GeneratorUspStep] step
 ON step.usp_id = u.id
  AND step.Number = [t].[Number]
CROSS APPLY [repo].[ftv_GeneratorUspStep_sql]([u].[id], [t].[Number], [u].[has_logging], [BeginEnd].[required_Begin_count], [BeginEnd].[required_End_count], [BeginEnd].[is_required_ELSE]) sql
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '4590291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Sql';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1af47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Sql', @level2type = N'COLUMN', @level2name = N'usp_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '20f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Sql', @level2type = N'COLUMN', @level2name = N'usp_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '22f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Sql', @level2type = N'COLUMN', @level2name = N'SqlStep';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '21f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Sql', @level2type = N'COLUMN', @level2name = N'RowNumber_PerUsp';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1ef47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Sql', @level2type = N'COLUMN', @level2name = N'required_End_count';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1df47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Sql', @level2type = N'COLUMN', @level2name = N'required_Begin_count';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1bf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Sql', @level2type = N'COLUMN', @level2name = N'Number';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1ff47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Sql', @level2type = N'COLUMN', @level2name = N'is_required_ELSE';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1cf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Sql', @level2type = N'COLUMN', @level2name = N'has_logging';


GO



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[GeneratorUsp].[usp_fullname]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Sql', @level2type = N'COLUMN', @level2name = N'usp_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[usp_schema],''].['',[usp_name],'']''))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Sql', @level2type = N'COLUMN', @level2name = N'usp_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[GeneratorUsp].[has_logging]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Sql', @level2type = N'COLUMN', @level2name = N'has_logging';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '271a8d58-e08f-eb11-84f1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Sql', @level2type = N'COLUMN', @level2name = N'AdocStep';

