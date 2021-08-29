
Create Function docs.[fs_cleanStringForPuml]
(
    @source_string NVarchar(4000)
)
Returns NVarchar(4000)
As
Begin
    Return ( Replace ( @source_string, ' ', '_' ))
End
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '41bbcce5-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'FUNCTION', @level1name = N'fs_cleanStringForPuml';

