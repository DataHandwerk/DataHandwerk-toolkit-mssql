
/*
<<property_start>>exampleUsage
EXEC [property].[usp_RepoSchemaProperty_set]
@RepoSchema_name = 'MySchema'
, @property_name = 'MS_Description'
, @property_value =
'description for SchemaName.ObjectName

see details in xref:user-guide:create-update-connect-repo-db.adoc[]
'
<<property_end>>
*/
CREATE Procedure property.usp_RepoSchemaProperty_set
    --
    @RepoSchema_guid UniqueIdentifier = Null --if @RepoSchema_guid is NULL, then @RepoSchema_name or @RepoSchema_name2 is used
  , @RepoSchema_name NVarchar(128)    = Null --will be used to find matching @RepoSchema_guid, if @RepoSchema_guid is NULL; use [schema].[TableOrView]
  , @property_name   NVarchar(128)
  , @property_value  NVarchar(Max)
As
Begin
    Declare @step_name NVarchar(1000) = Null;

    If @RepoSchema_guid Is Null
        Set @RepoSchema_guid =
    (
        Select
            RepoSchema_guid
        From
            repo.RepoSchema
        Where
            RepoSchema_name = @RepoSchema_name
    )   ;

    --check existence of @RepoSchema_guid
    If Not Exists
    (
        Select
            1
        From
            repo.RepoSchema
        Where
            RepoSchema_guid = @RepoSchema_guid
    )
    Begin
        Set @step_name = Concat ( 'RepoSchema_guid does not exist;', @RepoSchema_guid, ';', @RepoSchema_name );

        Throw 51001, @step_name, 1;
    End;

    Merge property.RepoSchemaProperty As T
    Using
    (
        Select
            @RepoSchema_guid
          , @property_name
          , @property_value
    ) As S
    ( RepoSchema_guid, property_name, property_value )
    On (
           T.RepoSchema_guid = S.RepoSchema_guid
           And T.property_name = S.property_name
       )
    When Matched
        Then Update Set
                 T.property_value = S.property_value
    When Not Matched
        Then Insert
             (
                 RepoSchema_guid
               , property_name
               , property_value
             )
             Values
                 (
                     S.RepoSchema_guid
                   , S.property_name
                   , S.property_value
                 )
    Output
        deleted.*
      , $ACTION
      , inserted.*;
End;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '8028f9b8-521d-ec11-8522-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'PROCEDURE', @level1name = N'usp_RepoSchemaProperty_set';

