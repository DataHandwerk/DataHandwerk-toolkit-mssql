CREATE
 

 VIEW [repo].[GeneratorUsp_filter_persistence]
AS
SELECT [u].[id]
 , [u].[usp_schema]
 , [u].[usp_name]
 , [u].[has_logging]
 , [u].[usp_Description]
 , [u].[usp_fullname]
FROM [repo].[GeneratorUsp] AS [u]
WHERE LEFT([u].[usp_name], 12) = 'usp_PERSIST_'