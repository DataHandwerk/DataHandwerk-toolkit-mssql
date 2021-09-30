
/*
<<property_start>>MS_Description
this procedure will drop extended property with property_name = @name used in all "level 0 objects"

level 0 objects are: +
ASSEMBLY, CONTRACT, EVENT NOTIFICATION, FILEGROUP, MESSAGE TYPE, PARTITION FUNCTION, PARTITION SCHEME, REMOTE SERVICE BINDING, ROUTE, SCHEMA, SERVICE, USER, TRIGGER, TYPE
<<property_end>>

<<property_start>>exampleUsage
--detect existing 'property_name'

Select
    property_name
  , level0type
  , Expr1 = Count ( * )
From
    repo_sys.ExtendedProperties_ParameterForAddUpdateDrop
Where
    ( level1type Is Null )
    And ( level1name Is Null )
    And ( level2type Is Null )
    And ( level2name Is Null )
Group By
    property_name
  , level0type

--drop extended properties, depending on the result of the query above

Exec repo_sys.usp_dropextendedproperty_level_0 @name = 'RepoSchema_guid'

Exec repo_sys.usp_dropextendedproperty_level_0 @name = 'MS_Description'
<<property_end>>
*/

CREATE Procedure repo_sys.usp_dropextendedproperty_level_0 @name Varchar(128)
As
Begin
    Declare @DbName sysname = config.fs_dwh_database_name ();

    Print @DbName;

    Declare @module_name_var_drop NVarchar(500) = QuoteName ( @DbName ) + N'.sys.sp_dropextendedproperty';

    Declare delete_cursor Cursor Local Fast_Forward For
    Select
        property_name
      , property_value
      , level0type
      , level0name
    From
        repo_sys.ExtendedProperties_ParameterForAddUpdateDrop
    Where
        property_name = @name
        And level1type Is Null
        And level1name Is Null
        And level2type Is Null
        And level2name Is Null;

    Declare
        @property_name  Varchar(128)
      , @property_value Sql_Variant
      , @level0type     Varchar(128)
      , @level0name     Varchar(128)

    Open delete_cursor;

    Fetch Next From delete_cursor
    Into
        @property_name
      , @property_value
      , @level0type
      , @level0name

    While @@Fetch_Status <> -1
    Begin
        If @@Fetch_Status <> -2
        Begin
            --EXEC sp_dropextendedproperty
            Exec @module_name_var_drop
                @name = @property_name
              , @level0type = @level0type
              , @level0name = @level0name

            Print Concat ( @module_name_var_drop, ';', @name, ';', @level0type, ';', @level0name );
        End;

        Fetch Next From delete_cursor
        Into
            @property_name
          , @property_value
          , @level0type
          , @level0name
    End;

    Close delete_cursor;
    Deallocate delete_cursor;
End;