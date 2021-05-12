
create Function [docs].[fs_cleanStringForLabel]
(
    @source_string NVarchar(4000)
)
Returns NVarchar(4000)
As
Begin
    Return Replace ( @source_string, '__', '++__++' );
End;