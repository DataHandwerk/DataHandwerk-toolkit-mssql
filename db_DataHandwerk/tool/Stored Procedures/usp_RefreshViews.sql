/*
<<property_start>>MS_Description
* refreshes views in a given schema or in all schemas
<<property_end>>

<<property_start>>exampleUsage
EXEC [tool].[usp_RefreshViews]
@Schema = 'MySchema'
<<property_end>>
*/
Create Procedure [tool].[usp_RefreshViews]
( @Schema Varchar(100) = Null )
As
Declare @View_Schema Varchar(100);
Declare @View_Name Varchar(100);
Declare @View_Name_Full Varchar(100);
Declare @cmd As NVarchar(500);

If @Schema Is Not Null
Begin
    Declare cur Cursor For
    Select
        TABLE_SCHEMA
      , TABLE_NAME
    From
        [INFORMATION_SCHEMA].[VIEWS]
    Where
        TABLE_SCHEMA = @Schema;
End;
Else
Begin
    Declare cur Cursor For
    Select
        TABLE_SCHEMA
      , TABLE_NAME
    From
        [INFORMATION_SCHEMA].[VIEWS];
End;

Open cur;

Fetch Next From cur
Into
    @View_Schema
  , @View_Name;

While @@Fetch_Status = 0
Begin
    Set @cmd = N'';
    Set @View_Name_Full = Concat ( QuoteName ( @View_Schema ), '.', QuoteName ( @View_Name ));
    Set @cmd = Concat ( 'sp_refreshview N''', @View_Name_Full, '''' );

    Exec sp_executesql @cmd;

    Print Concat ( @cmd, '    Executed' );

    Fetch Next From cur
    Into
        @View_Schema
      , @View_Name;
End;

Close cur;
Deallocate cur;
Go
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '1bacb147-4af5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'tool', @level1type = N'PROCEDURE', @level1name = N'usp_RefreshViews';

