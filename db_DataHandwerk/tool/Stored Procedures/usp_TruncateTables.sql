/*
<<property_start>>Description
* truncate tables in a given schema
<<property_end>>

<<property_start>>exampleUsage
EXEC [tool].[usp_TruncateTables]
@Schema = 'MySchema'
<<property_end>>
*/
Create Procedure [tool].[usp_TruncateTables]
( @Schema Varchar(100) Null )
As
Declare @Table_Schema Varchar(100);
Declare @Table_Name Varchar(100);
Declare @Table_Name_Full Varchar(100);
Declare @cmd As NVarchar(500);

If @Schema Is Not Null
Begin
    Declare cur Cursor For
    Select
        TABLE_SCHEMA
      , TABLE_NAME
    From
        [INFORMATION_SCHEMA].[TABLES]
    Where
        TABLE_TYPE       = 'BASE TABLE'
        And TABLE_SCHEMA = @Schema;
End;

--else
--    begin
--    DECLARE cur CURSOR FOR  
--    select Table_SCHEMA,Table_Name from [INFORMATION_SCHEMA].[TABLES]
--    end
Open cur;

Fetch Next From cur
Into
    @Table_Schema
  , @Table_Name;

While @@Fetch_Status = 0
Begin
    Set @cmd = N'';
    Set @Table_Name_Full = Concat ( QuoteName ( @Table_Schema ), '.', QuoteName ( @Table_Name ));
    Set @cmd = Concat ( 'TRUNCATE TABLE ', @Table_Name_Full );

    Exec sp_executesql @cmd;

    Print Concat ( @cmd, '    Executed' );

    Fetch Next From cur
    Into
        @Table_Schema
      , @Table_Name;
End;

Close cur;
Deallocate cur;
Go
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '1cacb147-4af5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'tool', @level1type = N'PROCEDURE', @level1name = N'usp_TruncateTables';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'
* truncate tables in a given schema', @level0type = N'SCHEMA', @level0name = N'tool', @level1type = N'PROCEDURE', @level1name = N'usp_TruncateTables';


GO
EXECUTE sp_addextendedproperty @name = N'exampleUsage', @value = N'
EXEC [tool].[usp_TruncateTables]
@Schema = ''MySchema''', @level0type = N'SCHEMA', @level0name = N'tool', @level1type = N'PROCEDURE', @level1name = N'usp_TruncateTables';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'tool', @level1type = N'PROCEDURE', @level1name = N'usp_TruncateTables';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'tool', @level1type = N'PROCEDURE', @level1name = N'usp_TruncateTables';

