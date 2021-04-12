/*
EXEC [sys_self].usp_dropextendedproperty_level_1
     @name = 'RepoObject_guid'
*/
Create Procedure sys_self.usp_dropextendedproperty_level_1 @name Varchar(128)
As
Declare @DbName sysname = Db_Name ();

Print @DbName;

Declare @module_name_var_drop NVarchar(500) = QuoteName ( @DbName ) + N'.sys.sp_dropextendedproperty';

Print @module_name_var_drop;

Declare delete_cursor Cursor Read_Only For
Select
    property_name
  , property_value
  , level0type
  , level0name
  , level1type
  , level1name
From
    sys_self.ExtendedProperties_ParameterForAddUpdateDrop
Where
    property_name = @name
    And Not level1type Is Null
    And Not level1name Is Null
    And level2type Is Null
    And level2name Is Null;

Declare
    @property_name  Varchar(128)
  , @property_value Sql_Variant
  , @level0type     Varchar(128)
  , @level0name     Varchar(128)
  , @level1type     Varchar(128)
  , @level1name     Varchar(128);

Open delete_cursor;

Fetch Next From delete_cursor
Into
    @property_name
  , @property_value
  , @level0type
  , @level0name
  , @level1type
  , @level1name;

While @@Fetch_Status <> -1
Begin
    If @@Fetch_Status <> -2
    Begin
        Print Concat (
                         @module_name_var_drop
                       , ';'
                       , @name
                       , ';'
                       , @level0type
                       , ';'
                       , @level0name
                       , ';'
                       , @level1type
                       , ';'
                       , @level1name
                     );

        --EXEC sp_dropextendedproperty
        Exec @module_name_var_drop
            @name = @property_name
          , @level0type = @level0type
          , @level0name = @level0name
          , @level1type = @level1type
          , @level1name = @level1name;
    End;

    Fetch Next From delete_cursor
    Into
        @property_name
      , @property_value
      , @level0type
      , @level0name
      , @level1type
      , @level1name;
End;

Close delete_cursor;
Deallocate delete_cursor;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'ab90291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sys_self'
  , @level1type = N'PROCEDURE'
  , @level1name = N'usp_dropextendedproperty_level_1';
Go