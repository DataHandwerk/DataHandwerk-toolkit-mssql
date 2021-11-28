
/*
<<property_start>>Description
* truncate tables in a given schema
<<property_end>>

<<property_start>>exampleUsage
EXEC [dbo].[usp_AlterTablesDataCompression]
@Schema = 'MySchema'
<<property_end>>
*/
CREATE Procedure dbo.usp_AlterTablesDataCompression
(
    @Schema           NVarchar(128) Null
  , @Data_Compression NVarchar(50) = 'Page'
)
As
Declare @Table_Schema Varchar(100);
Declare @Table_Name Varchar(100);
Declare @Table_Name_Full Varchar(100);
Declare @cmd As NVarchar(4000);

If @Schema Is Not Null
Begin
    Declare cur Cursor For
    Select
        TABLE_SCHEMA
      , TABLE_NAME
    From
        INFORMATION_SCHEMA.TABLES
    Where
        TABLE_TYPE       = 'BASE TABLE'
        And TABLE_SCHEMA = @Schema;
End;

Open cur;

Fetch Next From cur
Into
    @Table_Schema
  , @Table_Name;

While @@Fetch_Status = 0
Begin
    Set @cmd = N''
    Set @Table_Name_Full = Concat ( QuoteName ( @Table_Schema ), '.', QuoteName ( @Table_Name ))
    Set @cmd
        = Concat (
                     'Alter Table '
                   , @Table_Name_Full
                   , ' Rebuild Partition = All WITH ( Data_Compression = '
                   , @Data_Compression
                   , ')'
                 );

    Exec sys.sp_executesql @cmd;

    Print Concat ( @cmd, '    Executed' );

    Fetch Next From cur
    Into
        @Table_Schema
      , @Table_Name;
End;

Close cur;
Deallocate cur;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f21ea651-464d-ec11-8531-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'PROCEDURE', @level1name = N'usp_AlterTablesDataCompression';

