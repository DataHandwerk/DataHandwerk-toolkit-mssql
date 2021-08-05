/*
EXEC [repo_sys].usp_dropextendedproperty_level_2
     @name = 'RepoObject_guid'

EXEC [repo_sys].usp_dropextendedproperty_level_2
     @name = 'RepoObjectColumn_guid'
*/
CREATE Procedure [repo_sys].[usp_dropextendedproperty_level_2] @name Varchar(128)
As
Declare @DbName sysname = [config].fs_dwh_database_name ();

Print @DbName;

Declare @module_name_var_drop NVarchar(500) = QuoteName ( @DbName ) + N'.sys.sp_dropextendedproperty';

Print @module_name_var_drop;

Declare delete_cursor Cursor Local Fast_Forward For
Select
    property_name
  , property_value
  , level0type
  , level0name
  , level1type
  , level1name
  , level2type
  , level2name
From
    sys_self.ExtendedProperties_ParameterForAddUpdateDrop
Where
    property_name = @name
    And Not level1type Is Null
    And Not level1name Is Null
    And Not level2type Is Null
    And Not level2name Is Null;

Declare
    @property_name  Varchar(128)
  , @property_value Sql_Variant
  , @level0type     Varchar(128)
  , @level0name     Varchar(128)
  , @level1type     Varchar(128)
  , @level1name     Varchar(128)
  , @level2type     Varchar(128)
  , @level2name     Varchar(128);

Open delete_cursor;

Fetch Next From delete_cursor
Into
    @property_name
  , @property_value
  , @level0type
  , @level0name
  , @level1type
  , @level1name
  , @level2type
  , @level2name;

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
                       , ';'
                       , @level2type
                       , ';'
                       , @level2name
                     );

        --EXEC sp_dropextendedproperty
        Exec @module_name_var_drop
            @name = @property_name
          , @level0type = @level0type
          , @level0name = @level0name
          , @level1type = @level1type
          , @level1name = @level1name
          , @level2type = @level2type
          , @level2name = @level2name;
    End;

    Fetch Next From delete_cursor
    Into
        @property_name
      , @property_value
      , @level0type
      , @level0name
      , @level1type
      , @level1name
      , @level2type
      , @level2name;
End;

Close delete_cursor;
Deallocate delete_cursor;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'a990291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo_sys'
  , @level1type = N'PROCEDURE'
  , @level1name = N'usp_dropextendedproperty_level_2';
Go
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [config].[fs_dwh_database_name]
* [sys_self].[ExtendedProperties_ParameterForAddUpdateDrop]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'PROCEDURE', @level1name = N'usp_dropextendedproperty_level_2';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:config.fs_dwh_database_name.adoc[]
* xref:sys_self.ExtendedProperties_ParameterForAddUpdateDrop.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'PROCEDURE', @level1name = N'usp_dropextendedproperty_level_2';

