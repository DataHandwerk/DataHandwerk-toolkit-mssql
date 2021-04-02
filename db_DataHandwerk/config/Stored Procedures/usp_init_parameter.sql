CREATE PROCEDURE [config].[usp_init_parameter]
AS
--
INSERT INTO [repo].[Parameter] (
 [Parameter_name]
 , [sub_Parameter]
 , [Parameter_desciption]
 , [Parameter_default_value]
 )
SELECT [Parameter_name]
 , [sub_Parameter]
 , [Parameter_desciption]
 , [Parameter_default_value]
FROM [config].[Parameter_default] AS T1
WHERE NOT EXISTS (
  SELECT 1
  FROM [repo].[Parameter] AS [target]
  WHERE [target].[Parameter_name] = [T1].[Parameter_name]
   AND [target].[sub_Parameter] = [T1].[sub_Parameter]
  )

UPDATE T2
SET [T2].[Parameter_desciption] = [source].[Parameter_desciption]
 , [T2].[Parameter_default_value] = [source].[Parameter_default_value]
FROM [repo].[Parameter] AS [T2]
INNER JOIN [config].[Parameter_default] AS [source]
 ON [source].[Parameter_name] = [T2].[Parameter_name]
  AND [source].[sub_Parameter] = [T2].[sub_Parameter]
WHERE [T2].[Parameter_desciption] <> [source].[Parameter_desciption]
 OR (
  [T2].[Parameter_desciption] IS NULL
  AND NOT [source].[Parameter_desciption] IS NULL
  )
 OR (
  NOT [T2].[Parameter_desciption] IS NULL
  AND [source].[Parameter_desciption] IS NULL
  )
 OR [T2].[Parameter_default_value] <> [source].[Parameter_default_value]
 OR (
  [T2].[Parameter_default_value] IS NULL
  AND NOT [source].[Parameter_default_value] IS NULL
  )
 OR (
  NOT [T2].[Parameter_default_value] IS NULL
  AND [source].[Parameter_default_value] IS NULL
  )

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '8d90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'PROCEDURE', @level1name = N'usp_init_parameter';


GO


