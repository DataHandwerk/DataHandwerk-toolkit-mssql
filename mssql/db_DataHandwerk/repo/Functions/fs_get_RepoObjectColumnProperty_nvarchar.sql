
CREATE FUNCTION [repo].fs_get_RepoObjectColumnProperty_nvarchar (
 @RepoObjectColumn_guid uniqueidentifier
 , @property_name NVARCHAR(128)
 )
RETURNS nvarchar(4000)
AS
BEGIN
 RETURN (
   SELECT [property_nvarchar]
   FROM [repo].[RepoObjectColumnProperty]
   WHERE [RepoObjectColumn_guid] = @RepoObjectColumn_guid
    AND [property_name] = @property_name
   )
END