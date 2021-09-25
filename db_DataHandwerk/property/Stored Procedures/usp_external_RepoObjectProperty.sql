CREATE Procedure property.usp_external_RepoObjectProperty
As
Declare @RepoDatabaseName NVarchar(128)
Declare @command NVarchar(4000)

Truncate Table property.external_RepoObjectProperty

Declare db_cursor Cursor Local Fast_Forward For
Select
    RepoDatabaseName
From
    reference.additional_Reference_database_T
Where
    Not RepoDatabaseName Is Null

Open db_cursor

Fetch Next From db_cursor
Into
    @RepoDatabaseName

While @@Fetch_Status = 0
Begin
    Set @command
        = N'
Insert Into property.external_RepoObjectProperty
(
    RepoObject_guid
  , property_name
  , property_value
  , repo_database
  , dwh_database
  , AntoraComponent
  , AntoraModule
  , RepoObject_schema_name
  , RepoObject_name
)
Select
    aro.RepoObject_guid
  , src.property_name
  , src.property_value
  , src.repo_database
  , src.dwh_database
  , src.AntoraComponent
  , src.AntoraModule
  , src.RepoObject_schema_name
  , src.RepoObject_name
From
    ----[RepoDatabaseName] needs to used dynamicaly from reference.additional_Reference_database_T.[RepoDatabaseName]
    --dhw_self.property.RepoObjectProperty_ForUpdate As src
' + @RepoDatabaseName
          + N'.property.RepoObjectProperty_ForUpdate As src
    Left Join
        property.PropertyName_RepoObject_T         As pn
            On
            pn.property_name        = src.property_name

    Left Join
        reference.additional_Reference_Object_T    As aro
            On
            aro.SchemaName          = src.RepoObject_schema_name
            And aro.ObjectName      = src.RepoObject_name
            And aro.AntoraComponent = src.AntoraComponent
            And aro.AntoraModule    = src.AntoraModule
--database is also important, it will be set when generating the dynamic sql
--and one combination (AntoraComponent, AntoraModule) hs only one [DatabaseName] and [RepoDatabaseName]
Where
    pn.has_inheritance = 1
    And Not aro.RepoObject_guid Is Null
'

    Print @command

    Execute sys.sp_executesql @command

    Fetch Next From db_cursor
    Into
        @RepoDatabaseName
End

Close db_cursor
Deallocate db_cursor

Exec property.usp_PERSIST_RepoObjectProperty_external_tgt

Truncate Table property.external_RepoObjectColumnProperty

Declare db_cursor Cursor Local Fast_Forward For
Select
    RepoDatabaseName
From
    reference.additional_Reference_database_T
Where
    Not RepoDatabaseName Is Null

Open db_cursor

Fetch Next From db_cursor
Into
    @RepoDatabaseName

While @@Fetch_Status = 0
Begin
    Set @command
        = N'
Insert Into property.external_RepoObjectColumnProperty
(
    RepoObjectColumn_guid
  , property_name
  , property_value
  , repo_database
  , dwh_database
  , AntoraComponent
  , AntoraModule
  , RepoObject_schema_name
  , RepoObject_name
  , RepoObjectColumn_name
)
Select
    aroc.RepoObjectColumn_guid
  , src.property_name
  , src.property_value
  , src.repo_database
  , src.dwh_database
  , src.AntoraComponent
  , src.AntoraModule
  , src.RepoObject_schema_name
  , src.RepoObject_name
  , src.RepoObjectColumn_name
From
    ----[RepoDatabaseName] needs to used dynamicaly from reference.additional_Reference_database_T.[RepoDatabaseName]
    --dhw_self.property.RepoObjectColumnProperty_ForUpdate As src
' + @RepoDatabaseName
          + N'.property.RepoObjectColumnProperty_ForUpdate As src
    Left Join
        property.PropertyName_RepoObjectColumn_T         As pn
            On
            pn.property_name        = src.property_name

    Left Join
        reference.additional_Reference_ObjectColumn_T    As aroc
            On
            aroc.SchemaName          = src.RepoObject_schema_name
            And aroc.ObjectName      = src.RepoObject_name
            And aroc.ColumnName      = src.RepoObjectColumn_name
            And aroc.AntoraComponent = src.AntoraComponent
            And aroc.AntoraModule    = src.AntoraModule
--database is also important, it will be set when generating the dynamic sql
--and one combination (AntoraComponent, AntoraModule) hs only one [DatabaseName] and [RepoDatabaseName]
Where
    pn.has_inheritance = 1
    And Not aroc.RepoObjectColumn_guid Is Null
'

    Print @command

    Execute sys.sp_executesql @command

    Fetch Next From db_cursor
    Into
        @RepoDatabaseName
End

Close db_cursor
Deallocate db_cursor

Exec property.usp_PERSIST_RepoObjectColumnProperty_external_tgt
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'e743462f-471c-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'PROCEDURE', @level1name = N'usp_external_RepoObjectProperty';

