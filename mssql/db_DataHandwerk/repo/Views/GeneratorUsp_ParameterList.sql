

/*
List of parameters without trailing comma
*/
CREATE VIEW [repo].[GeneratorUsp_ParameterList]
AS
SELECT [up].[Usp_id]
 , ParameterList = STRING_AGG(CONCAT (
   CAST('@' AS NVARCHAR(max))
   , [up].[Name]
   , ' '
   , [up].[UserTypeFullname]
   , IIF([up].[has_DefaultValue] = 1, CONCAT (
     ' = '
     , ISNULL([up].[DefaultValue], 'NULL')
     ), NULL)
   , IIF([up].[is_out] = 1, ' OUTPUT', NULL)
   , CHAR(13)
   , CHAR(10)
   ), ',') WITHIN
GROUP (
  ORDER BY [up].[Number]
  )
 , ParameterListLogging = STRING_AGG(CONCAT (
   CAST(' , @parameter_' AS NVARCHAR(max))
   , right(CONCAT (
     '0'
     , RowNumber_PerUsp
     ), 2)
   , CAST(' = @' AS NVARCHAR(max))
   , [up].[Name]
   , CHAR(13)
   , CHAR(10)
   ), '') WITHIN
GROUP (
  ORDER BY [up].[Number]
  )
FROM (
 SELECT [par].[Usp_id]
  , [par].[Number]
  , [par].[Name]
  , [par].[UserTypeFullname]
  , [par].[is_inactive]
  , [par].[is_out]
  , [par].[has_DefaultValue]
  , [par].[DefaultValue]
  , RowNumber_PerUsp = ROW_NUMBER() OVER (
   PARTITION BY [Usp_id] ORDER BY [Number]
   )
 FROM [repo].[GeneratorUspParameter] AS par
 ) AS up
WHERE [up].[is_inactive] = 0
GROUP BY [up].[Usp_id]