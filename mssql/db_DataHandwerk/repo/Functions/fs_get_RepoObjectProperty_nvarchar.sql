
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