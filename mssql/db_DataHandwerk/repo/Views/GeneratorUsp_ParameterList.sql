

/*
List of parameters without trailing comma
*/
CREATE VIEW [repo].[GeneratorUsp_ParameterList]
AS
SELECT [up].[usp_id]
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
 SELECT [par].[usp_id]
  , [par].[Number]
  , [par].[Name]
  , [par].[UserTypeFullname]
  , [par].[is_inactive]
  , [par].[is_out]
  , [par].[has_DefaultValue]
  , [par].[DefaultValue]
  , RowNumber_PerUsp = ROW_NUMBER() OVER (
   PARTITION BY [usp_id] ORDER BY [Number]
   )
 FROM [repo].[GeneratorUspParameter] AS par
 ) AS up
WHERE [up].[is_inactive] = 0
GROUP BY [up].[usp_id]

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'e18f291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_ParameterList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8cf17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_ParameterList', @level2type = N'COLUMN', @level2name = N'usp_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8ef17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_ParameterList', @level2type = N'COLUMN', @level2name = N'ParameterListLogging';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8df17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_ParameterList', @level2type = N'COLUMN', @level2name = N'ParameterList';

