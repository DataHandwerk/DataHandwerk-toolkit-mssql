
/*
<<property_start>>Description
* use @CmdPattern to create Cmd for all tables of a schema
* inside @CmdPattern use thise placeholder to be replaced
** @Table_Name_Full
** @Table_Schema
** @Table_Name
<<property_end>>

<<property_start>>exampleUsage
Exec dbo.usp_GenerateCmd
@Schema = 'Integration'
, @CmdPattern =
'SELECT * from @Table_Name_Full
'

Exec dbo.usp_GenerateCmd
@Schema = 'Integration'
, @CmdPattern =
'ALTER TABLE @Table_Name_Full ADD execution_log_id bigint NULL
'

Exec dbo.usp_GenerateCmd
@Schema = 'dm'
, @TABLE_TYPE = 'VIEW'
, @CmdPattern =
'Select Top ( 0 ) *
Into @Table_Name_Full
From EventAnalytics_stvinzenz.@Table_Name_Full

'
<<property_end>>
*/
Create   Procedure dbo.usp_GenerateCmd
(
    @Schema     NVarchar(128) Null
  , @CmdPattern NVarchar(Max) = Null
  --possibele values:
  --'BASE TABLE'
  --'VIEW'
  , @TABLE_TYPE NVarchar(50)  = 'BASE TABLE'
)
As
Declare @Table_Schema Varchar(128);
Declare @Table_Name Varchar(128);
Declare @Table_Name_Full Varchar(300);
Declare @cmd As NVarchar(Max);

--Print anything
Print ''

If @Schema Is Not Null
Begin
    Declare cur Cursor For
    Select
        TABLE_SCHEMA
      , TABLE_NAME
    From
        INFORMATION_SCHEMA.TABLES
    Where
        TABLE_TYPE       = @TABLE_TYPE
        And TABLE_SCHEMA = @Schema;
End;

Open cur;

Fetch Next From cur
Into
    @Table_Schema
  , @Table_Name;

While @@Fetch_Status = 0
Begin
    Set @Table_Name_Full = Concat ( QuoteName ( @Table_Schema ), '.', QuoteName ( @Table_Name ))
    Set @cmd
        = Replace (
                      Replace (
                                  Replace ( @CmdPattern, '@Table_Name_Full', @Table_Name_Full )
                                , '@Table_Schema'
                                , @Table_Schema
                              )
                    , '@Table_Name'
                    , @Table_Name
                  )

    Print @cmd

    --Exec dbo.usp_longprint @cmd
    Fetch Next From cur
    Into
        @Table_Schema
      , @Table_Name;
End;

Close cur;
Deallocate cur;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'c61dca55-ae7b-ec11-8541-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'PROCEDURE', @level1name = N'usp_GenerateCmd';

