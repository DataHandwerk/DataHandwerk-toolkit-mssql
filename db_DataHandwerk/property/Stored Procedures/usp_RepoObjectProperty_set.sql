
/*
<<property_start>>exampleUsage
EXEC [property].[usp_RepoObjectProperty_set]
@RepoObject_fullname2 = 'SchemaName.ObjectName'
, @property_name = 'MS_Description'
, @property_value =
'description for SchemaName.ObjectName

see details in xref:user-guide:create-update-connect-repo-db.adoc[]
'
<<property_end>>
*/
CREATE Procedure [property].[usp_RepoObjectProperty_set]
    --
    @RepoObject_guid      UniqueIdentifier = Null --if @RepoObject_guid is NULL, then @RepoObject_fullname or @RepoObject_fullname2 is used
  , @RepoObject_fullname  NVarchar(261)    = Null --will be used to find matching @RepoObject_guid, if @RepoObject_guid is NULL; use [schema].[TableOrView]
  , @RepoObject_fullname2 NVarchar(257)    = Null --will be used to find matching @RepoObject_guid, if @RepoObject_guid is NULL; use schema.TableOrView
  , @property_name        NVarchar(128)
  , @property_value       NVarchar(MAX)
As
Begin
    Declare @step_name NVarchar(1000) = Null;

    If @RepoObject_guid Is Null
        Set @RepoObject_guid =
    (
        Select
            RepoObject_guid
        From
            repo.RepoObject
        Where
            RepoObject_fullname = @RepoObject_fullname
    )   ;

    If @RepoObject_guid Is Null
        Set @RepoObject_guid =
    (
        Select
            RepoObject_guid
        From
            repo.RepoObject
        Where
            RepoObject_fullname2 = @RepoObject_fullname2
    )   ;

    --check existence of @RepoObject_guid
    If Not Exists
    (
        Select
            1
        From
            repo.RepoObject
        Where
            RepoObject_guid = @RepoObject_guid
    )
    Begin
        Set @step_name
            = Concat (
                         'RepoObject_guid does not exist;'
                       , @RepoObject_guid
                       , ';'
                       , @RepoObject_fullname
                       , ';'
                       , @RepoObject_fullname2
                     );

        Throw 51001, @step_name, 1;
    End;

    Merge [property].RepoObjectProperty T
    Using
    (
        Select
            @RepoObject_guid
          , @property_name
          , @property_value
    ) As S
    ( RepoObject_guid, property_name, property_value )
    On (
           T.RepoObject_guid = S.RepoObject_guid
           And T.property_name = S.property_name
       )
    When Matched
        Then Update Set
                 property_value = S.property_value
    When Not Matched
        Then Insert
             (
                 RepoObject_guid
               , property_name
               , property_value
             )
             Values
                 (
                     S.RepoObject_guid
                   , S.property_name
                   , S.property_value
                 )
    Output
        deleted.*
      , $ACTION
      , inserted.*;
End;
Go
Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '9edfbe88-ca97-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'PROCEDURE'
  , @level1name = N'usp_RepoObjectProperty_set';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [property].[RepoObjectProperty]
* [repo].[RepoObject]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'PROCEDURE', @level1name = N'usp_RepoObjectProperty_set';


GO
EXECUTE sp_addextendedproperty @name = N'exampleUsage', @value = N'
EXEC [property].[usp_RepoObjectProperty_set]
@RepoObject_fullname2 = ''SchemaName.ObjectName''
, @property_name = ''MS_Description''
, @property_value =
''description for SchemaName.ObjectName

see details in xref:user-guide:create-update-connect-repo-db.adoc[]
''', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'PROCEDURE', @level1name = N'usp_RepoObjectProperty_set';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:property.RepoObjectProperty.adoc[]
* xref:repo.RepoObject.adoc[]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'PROCEDURE', @level1name = N'usp_RepoObjectProperty_set';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'PROCEDURE', @level1name = N'usp_RepoObjectProperty_set';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'PROCEDURE', @level1name = N'usp_RepoObjectProperty_set';

