
/*
SQL for the list of all steps
*/
CREATE VIEW [repo].[GeneratorUsp_StepList]
AS
SELECT [usp_id]
 , StepList = STRING_AGG(CONCAT (
   CAST('' AS NVARCHAR(max))
   , [SqlStep]
   ), CHAR(13) + CHAR(10)) WITHIN
GROUP (
  ORDER BY [RowNumber_PerUsp]
  )
 , AdocStepList = STRING_AGG(CONCAT (
   CAST('' AS NVARCHAR(max))
   , [AdocStep]
   ), CHAR(13) + CHAR(10)) WITHIN
GROUP (
  ORDER BY [RowNumber_PerUsp]
  )
FROM [repo].[GeneratorUspStep_Sql] AS us
GROUP BY [us].[usp_id]

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '4790291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_StepList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '32f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_StepList', @level2type = N'COLUMN', @level2name = N'usp_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '33f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_StepList', @level2type = N'COLUMN', @level2name = N'StepList';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '281a8d58-e08f-eb11-84f1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_StepList', @level2type = N'COLUMN', @level2name = N'AdocStepList';

