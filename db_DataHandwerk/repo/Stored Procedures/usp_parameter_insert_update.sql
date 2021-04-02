CREATE PROCEDURE [repo].[usp_parameter_insert_update] (
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

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9990291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_parameter_insert_update';


GO


