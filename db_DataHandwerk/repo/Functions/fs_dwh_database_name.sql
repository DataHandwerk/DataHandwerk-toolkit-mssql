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

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'e78f291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'FUNCTION', @level1name = N'fs_dwh_database_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'[repo].[Parameter]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'FUNCTION', @level1name = N'fs_dwh_database_name';

