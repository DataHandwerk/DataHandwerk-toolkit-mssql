
/*
<<property_start>>exampleUsage
EXEC property.usp_RepoObjectColumnProperty_set
    @RepoObject_fullname2 = 'SchemaName.TableName'
  , @RepoObjectColumn_name = 'ColumnName'
  , @property_name = 'MS_Description'
  , @property_value = 'some text, multiples lines are OK';
<<property_end>>
*/
CREATE Procedure [property].[usp_RepoObjectColumnProperty_set]
    --
    @RepoObjectColumn_guid UniqueIdentifier = Null --if @RepoObjectColumn_guid is NULL, then @RepoObjectColumn_name, @RepoObject_guid, @RepoObject_fullname or @RepoObject_fullname2 are used
  , @RepoObjectColumn_name NVarchar(128)    = Null --can be used to define @RepoObjectColumn_guid; use 'ColumnName'
  , @RepoObject_guid       UniqueIdentifier = Null --can be used to define @RepoObjectColumn_guid
  , @RepoObject_fullname   NVarchar(261)    = Null --can be used to define @RepoObjectColumn_guid; use '[schema].[TableOrView]'
  , @RepoObject_fullname2  NVarchar(257)    = Null --can be used to define @RepoObjectColumn_guid; use 'schema.TableOrView'
  , @property_name         NVarchar(128)
  , @property_value        NVarchar(Max)
As
Begin
    Declare @step_name NVarchar(1000) = Null;

    If @RepoObjectColumn_guid Is Null
    Begin
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

        Set @RepoObjectColumn_guid =
        (
            Select
                RepoObjectColumn_guid
            From
                repo.RepoObjectColumn roc
            Where
                roc.RepoObject_guid           = @RepoObject_guid
                And roc.RepoObjectColumn_name = @RepoObjectColumn_name
        );
    End;

    --check existence of @RepoObjectColumn_guid
    If Not Exists
    (
        Select
            1
        From
            repo.RepoObjectColumn
        Where
            RepoObjectColumn_guid = @RepoObjectColumn_guid
    )
    Begin
        Set @step_name
            = Concat (
                         'RepoObjectColumn_guid does not exist;'
                       , @RepoObjectColumn_guid
                       , ';'
                       , @RepoObjectColumn_name
                       , ';'
                       , @RepoObject_guid
                       , ';'
                       , @RepoObject_fullname
                       , ';'
                       , @RepoObject_fullname2
                     );

        Throw 51002, @step_name, 1;
    End;

    Merge [property].[RepoObjectColumnProperty] T
    Using
    (
        Select
            @RepoObjectColumn_guid
          , @property_name
          , @property_value
    ) As S
    ( RepoObjectColumn_guid, property_name, property_value )
    On (
           T.RepoObjectColumn_guid = S.RepoObjectColumn_guid
           And T.property_name = S.property_name
       )
    When Matched
        Then Update Set
                 property_value = S.property_value
    When Not Matched
        Then Insert
             (
                 RepoObjectColumn_guid
               , property_name
               , property_value
             )
             Values
                 (
                     S.RepoObjectColumn_guid
                   , S.property_name
                   , S.property_value
                 )
    Output
        deleted.*
      , $ACTION
      , inserted.*;
End;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '2f12ce32-0e9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'PROCEDURE', @level1name = N'usp_RepoObjectColumnProperty_set';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [property].[RepoObjectColumnProperty]
* [repo].[RepoObject]
* [repo].[RepoObjectColumn]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'PROCEDURE', @level1name = N'usp_RepoObjectColumnProperty_set';


GO
EXECUTE sp_addextendedproperty @name = N'exampleUsage', @value = N'
EXEC property.usp_RepoObjectColumnProperty_set
    @RepoObject_fullname2 = ''SchemaName.TableName''
  , @RepoObjectColumn_name = ''ColumnName''
  , @property_name = ''MS_Description''
  , @property_value = ''some text, multiples lines are OK'';', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'PROCEDURE', @level1name = N'usp_RepoObjectColumnProperty_set';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:property.RepoObjectColumnProperty.adoc[]
* xref:repo.RepoObject.adoc[]
* xref:repo.RepoObjectColumn.adoc[]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'PROCEDURE', @level1name = N'usp_RepoObjectColumnProperty_set';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'PROCEDURE', @level1name = N'usp_RepoObjectColumnProperty_set';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'PROCEDURE', @level1name = N'usp_RepoObjectColumnProperty_set';

