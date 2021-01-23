CREATE FUNCTION [repo].[ftv_dwh_database] ()
--returns nvarchar(128)
RETURNS TABLE
AS
	RETURN (SELECT
			CAST([Parameter_value__result_nvarchar] AS NVARCHAR(128)) AS [dwh_database_name]
		   ,DB_ID(CAST([Parameter_value__result_nvarchar] AS NVARCHAR(128))) AS [dwh_database_id]
		FROM [repo].[Parameter]
		WHERE [Parameter_name] = 'dwh_database_name'
		AND [sub_Parameter] = N'')
