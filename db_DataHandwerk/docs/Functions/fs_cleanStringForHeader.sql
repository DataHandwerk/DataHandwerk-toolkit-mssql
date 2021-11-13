
CREATE Function docs.fs_cleanStringForHeader
(
    @source_string NVarchar(4000)
)
Returns NVarchar(4000)
As
Begin
    Return Replace ( Replace ( @source_string, '__', '++__++' ), '\', '{backslash}' )
End;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7e9a07f7-c23c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'FUNCTION', @level1name = N'fs_cleanStringForHeader';

