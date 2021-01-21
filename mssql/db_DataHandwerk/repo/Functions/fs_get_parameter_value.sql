﻿/*

select [repo].[fs_get_parameter_value]('dwh_database_name')

*/

CREATE FUNCTION [repo].[fs_get_parameter_value](
     @Parameter_name VARCHAR(100)
   , @sub_Parameter  NVARCHAR(128) = N'')
RETURNS SQL_VARIANT
AS
BEGIN
    RETURN
    (
        SELECT
               [Parameter_value__result_nvarchar] AS [dwh_database_name]
        FROM
             [repo].[Parameter]
        WHERE  [Parameter_name] = @Parameter_name
               AND [sub_Parameter] = @sub_Parameter
    )
END