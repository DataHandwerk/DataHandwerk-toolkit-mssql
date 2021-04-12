Create Function repo.fs_get_RepoObjectProperty_nvarchar
(
    @RepoObject_guid UniqueIdentifier
  , @property_name   NVarchar(128)
)
Returns NVarchar(4000)
As
Begin
    Return
    (
        Select
            property_nvarchar
        From
            repo.RepoObjectProperty
        Where
            RepoObject_guid   = @RepoObject_guid
            And property_name = @property_name
    );
End;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '67b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'FUNCTION'
  , @level1name = N'fs_get_RepoObjectProperty_nvarchar';
