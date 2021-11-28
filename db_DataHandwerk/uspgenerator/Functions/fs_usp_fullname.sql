
Create Function uspgenerator.fs_usp_fullname
(
    @usp_id Int
)
Returns NVarchar(261)
As
Begin
    Return
    (
        Select usp_fullname From uspgenerator.GeneratorUsp Where id = @usp_id
    )
End
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ee1ea651-464d-ec11-8531-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'FUNCTION', @level1name = N'fs_usp_fullname';

