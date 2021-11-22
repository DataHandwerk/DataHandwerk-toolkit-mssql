
Create Function repo.fs_RepoObject_fullname2
(
    @RepoObject_guid UniqueIdentifier
)
Returns NVarchar(257)
As
Begin
    Return
    (
        Select
            RepoObject_fullname2
        From
            repo.RepoObject
        Where
            RepoObject_guid = @RepoObject_guid
    );
End;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'afd2539e-cb47-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'FUNCTION', @level1name = N'fs_RepoObject_fullname2';

