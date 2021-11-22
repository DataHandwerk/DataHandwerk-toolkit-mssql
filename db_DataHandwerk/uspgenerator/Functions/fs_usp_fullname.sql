
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