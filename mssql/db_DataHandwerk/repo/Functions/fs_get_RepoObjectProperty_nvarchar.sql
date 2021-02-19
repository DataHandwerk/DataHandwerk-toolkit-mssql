
CREATE FUNCTION [repo].fs_get_RepoObjectProperty_nvarchar (
 @RepoObject_guid uniqueidentifier
 , @property_name NVARCHAR(128)
 )
RETURNS nvarchar(4000)
AS
BEGIN
 RETURN (
   SELECT [property_nvarchar]
   FROM [repo].[RepoObjectProperty]
   WHERE [RepoObject_guid] = @RepoObject_guid
    AND [property_name] = @property_name
   )
END
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '67b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'FUNCTION', @level1name = N'fs_get_RepoObjectProperty_nvarchar';

