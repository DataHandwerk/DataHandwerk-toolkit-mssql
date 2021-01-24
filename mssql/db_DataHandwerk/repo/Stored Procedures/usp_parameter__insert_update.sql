CREATE PROCEDURE [repo].[usp_parameter__insert_update] (
 @Parameter_name VARCHAR(100)
 , @sub_Parameter NVARCHAR(128) = ''
 , @Parameter_value SQL_VARIANT
 )
AS
--
UPDATE p
SET [Parameter_value] = @Parameter_value
FROM [repo].[Parameter] [p]
WHERE [p].[Parameter_name] = @Parameter_name
 AND [p].[sub_Parameter] = @sub_Parameter

--IF NOT EXISTS
--(
--    SELECT
--           [col]
--    FROM
--         [repo].[Parameter] AS p
--    WHERE  [p].[Parameter_name] = @Parameter_name
--           AND [p].[sub_Parameter] = @sub_Parameter
--)
INSERT INTO [repo].[Parameter] (
 [Parameter_name]
 , [sub_Parameter]
 , [Parameter_value]
 )
SELECT @Parameter_name
 , @sub_Parameter
 , @Parameter_value
WHERE NOT EXISTS (
  SELECT 1
  FROM [repo].[Parameter] AS [p]
  WHERE [p].[Parameter_name] = @Parameter_name
   AND [p].[sub_Parameter] = @sub_Parameter
  )
