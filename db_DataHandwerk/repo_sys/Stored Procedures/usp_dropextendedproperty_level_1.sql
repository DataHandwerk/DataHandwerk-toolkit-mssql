﻿
-- Create Procedure usp_dropextendedproperty_level_1
/*
this procedure will drop extended property with property_name = @name used in all "level 1 objects"
level 1 objects are:
AGGREGATE, DEFAULT, FUNCTION, LOGICAL FILE NAME, PROCEDURE, QUEUE, RULE, SYNONYM, TABLE, TABLE_TYPE, TYPE, VIEW, XML SCHEMA COLLECTION

for example:
if there are tables, views and ohter level 1 objects containing properties like 'repo_guid' then the following execution will drop them all

EXEC repo_sys.usp_dropextendedproperty_level_1
     @name = 'RepoObject_guid'

*/

CREATE Procedure [repo_sys].[usp_dropextendedproperty_level_1] @name Varchar(128)
As
Begin
    Declare @DbName sysname = [config].fs_dwh_database_name ();

    Print @DbName;

    Declare @module_name_var_drop NVarchar(500) = QuoteName ( @DbName ) + N'.sys.sp_dropextendedproperty';

    Declare delete_cursor Cursor Local Fast_Forward For
    Select
        property_name
      , property_value
      , level0type
      , level0name
      , level1type
      , level1name
    From
        repo_sys.ExtendedProperties_ParameterForAddUpdateDrop
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
            --EXEC sp_dropextendedproperty
            Exec @module_name_var_drop
                @name = @property_name
              , @level0type = @level0type
              , @level0name = @level0name
              , @level1type = @level1type
              , @level1name = @level1name;

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
End;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'a790291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo_sys'
  , @level1type = N'PROCEDURE'
  , @level1name = N'usp_dropextendedproperty_level_1';
Go