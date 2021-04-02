CREATE FUNCTION [repo].[ftv_dwh_database] ()
 --returns nvarchar(128)
RETURNS TABLE
AS
RETURN (
  SELECT CAST([Parameter_value__result_nvarchar] AS NVARCHAR(128)) AS [dwh_database_name]
   , DB_ID(CAST([Parameter_value__result_nvarchar] AS NVARCHAR(128))) AS [dwh_database_id]
  FROM [repo].[Parameter]
  WHERE [Parameter_name] = 'dwh_database_name'
   AND [sub_Parameter] = N''
  )

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '2790291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'FUNCTION', @level1name = N'ftv_dwh_database';


GO


