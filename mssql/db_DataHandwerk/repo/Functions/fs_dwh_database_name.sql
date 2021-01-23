CREATE FUNCTION [repo].[fs_dwh_database_name] ()
RETURNS NVARCHAR(128)
AS
BEGIN
 RETURN (
   SELECT CAST([Parameter_value__result_nvarchar] AS NVARCHAR(128)) AS [dwh_database_name]
   FROM [repo].[Parameter]
   WHERE [Parameter_name] = 'dwh_database_name'
    AND [sub_Parameter] = ''
   )
END
