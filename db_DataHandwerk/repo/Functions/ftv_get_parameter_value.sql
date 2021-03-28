
CREATE FUNCTION [repo].[ftv_get_parameter_value] (
 @Parameter_name VARCHAR(100)
 , @sub_Parameter NVARCHAR(128) = N''
 )
RETURNS TABLE
AS
RETURN (
  SELECT [Parameter_value__result_nvarchar]
  FROM [repo].[Parameter]
  WHERE [Parameter_name] = @Parameter_name
   AND [sub_Parameter] = @sub_Parameter
  )
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '3190291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'FUNCTION', @level1name = N'ftv_get_parameter_value';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'[repo].[Parameter]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'FUNCTION', @level1name = N'ftv_get_parameter_value';

