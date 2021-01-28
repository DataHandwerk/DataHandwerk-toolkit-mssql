

/*
SQL for the list of all steps
*/
CREATE
 

 VIEW [repo].[GeneratorUsp_StepList]
AS
SELECT [Usp_id]
 , StepList = STRING_AGG(CONCAT (
   CAST('' AS NVARCHAR(max))
   , [SqlStep]
   , CHAR(13)
   , CHAR(10)
   ), '') WITHIN
GROUP (
  ORDER BY [RowNumber_PerUsp]
  )
FROM [repo].[GeneratorUspStep_Sql] AS us
GROUP BY [us].[Usp_id]