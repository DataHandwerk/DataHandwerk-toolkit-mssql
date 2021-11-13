Create Function dbo.crlf
()
Returns Char(2)
As
Begin
    Return Char ( 13 ) + Char ( 10 )
End;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f562bf6a-0042-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'FUNCTION', @level1name = N'crlf';

