--code idea from analyticscreator.com
CREATE Procedure tool.usp_longprint @Sql NVarchar(Max)
As
Begin
    Declare
        @len    Int
      , @CRpos  Int
      , @SqlOut NVarchar(4000);

    Set @len = 2000;

    While @Sql Is Not Null
    Begin
        If Len ( @Sql ) <= @len
        Begin
            Print @Sql;

            Break;
        End;
        Else
        Begin
            Set @CRpos = CharIndex ( Char ( 10 ), @Sql, @len );

            If @CRpos - @len < 2000
                Set @SqlOut = Left(@Sql, @CRpos);
            Else
            Begin
                Raiserror ( 'OOPS! The game is over :(', 16, 1 );
            End;

            Print @SqlOut;

            Set @Sql = Right(@Sql, Len ( @Sql ) - @CRpos);
        End;
    End;
End;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '63b8b46b-a08f-eb11-84f1-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'tool'
  , @level1type = N'PROCEDURE'
  , @level1name = N'usp_longprint';

GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'tool', @level1type = N'PROCEDURE', @level1name = N'usp_longprint';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'tool', @level1type = N'PROCEDURE', @level1name = N'usp_longprint';

