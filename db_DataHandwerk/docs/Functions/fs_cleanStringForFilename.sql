CREATE Function [docs].[fs_cleanStringForFilename]
(
    @source_string NVarchar(4000)
)
Returns NVarchar(4000)
As
Begin
    Return 
	  Lower ( 
	    Replace ( Replace ( Replace ( Replace ( Replace (
		Trim ( @source_string )
		, ' ', 'blank' )
		, '/', 'slash' )
		, '\', 'backslash' )
		, '*', 'star' )
		, ':', 'colon' )
	)
End;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7ed7f831-fd22-ec11-8525-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'FUNCTION', @level1name = N'fs_cleanStringForFilename';

