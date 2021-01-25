
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