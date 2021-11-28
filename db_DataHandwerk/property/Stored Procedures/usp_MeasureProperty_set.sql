
/*
<<property_start>>exampleUsage
EXEC [property].[usp_MeasureProperty_set]
@Measure_fullname2 = 'SchemaName.ObjectName'
, @property_name = 'My own property'
, @property_value =
'this additional informations should be part of the documentation
'
<<property_end>>
*/
create Procedure [property].[usp_MeasureProperty_set]
    --
    @Measure_guid      UniqueIdentifier = Null --if @Measure_guid is NULL, then @Measure_fullname or @Measure_fullname2 is used
  , @Measure_fullname  NVarchar(261)    = Null --will be used to find matching @Measure_guid, if @Measure_guid is NULL; use [schema].[TableOrView]
  , @Measure_fullname2 NVarchar(257)    = Null --will be used to find matching @Measure_guid, if @Measure_guid is NULL; use schema.TableOrView
  , @property_name        NVarchar(128)
  , @property_value       NVarchar(Max)
As
Begin
    Declare @step_name NVarchar(1000) = Null;

    If @Measure_guid Is Null
        Set @Measure_guid =
    (
        Select
            Measure_guid
        From
            repo.Measure
        Where
            Measure_fullname = @Measure_fullname
    )   ;

    If @Measure_guid Is Null
        Set @Measure_guid =
    (
        Select
            Measure_guid
        From
            repo.Measure
        Where
            Measure_fullname2 = @Measure_fullname2
    )   ;

    --check existence of @Measure_guid
    If Not Exists
    (
        Select
            1
        From
            repo.Measure
        Where
            Measure_guid = @Measure_guid
    )
    Begin
        Set @step_name
            = Concat (
                         'Measure_guid does not exist;'
                       , @Measure_guid
                       , ';'
                       , @Measure_fullname
                       , ';'
                       , @Measure_fullname2
                     );

        Throw 51001, @step_name, 1;
    End;

    ----insert missing
    --Insert property.MeasureProperty
    --(
    --    Measure_guid
    --  , property_name
    --  , property_value
    --)
    --Select
    --    S.Measure_guid
    --  , S.property_name
    --  , S.property_value
    --From
    --(
    --    Select
    --        Measure_guid = @Measure_guid
    --      , property_name   = @property_name
    --      , property_value  = @property_value
    --) As S
    --Where
    --    Not Exists
    --(
    --    Select
    --        1
    --    From
    --        property.MeasureProperty As T
    --    Where
    --        T.Measure_guid   = S.Measure_guid
    --        And T.property_name = S.property_name
    --);

    ----update changed
    --Update
    --    T
    --Set
    --    T.property_value = S.property_value
    --From
    --(
    --    Select
    --        Measure_guid = @Measure_guid
    --      , property_name   = @property_name
    --      , property_value  = @property_value
    --)                                   As S
    --    Inner Join
    --        property.MeasureProperty As T
    --            On
    --            T.Measure_guid    = S.Measure_guid
    --            And T.property_name  = S.property_name
    --            And
    --            (
    --                T.property_value <> S.property_name
    --                Or T.property_value Is Null
    --                Or S.property_value Is Null
    --            )
    Merge property.MeasureProperty As T
    Using
    (
        Select
            @Measure_guid
          , @property_name
          , @property_value
    ) As S
    ( Measure_guid, property_name, property_value )
    On (
           T.Measure_guid = S.Measure_guid
           And T.property_name = S.property_name
       )
    When Matched
        Then Update Set
                 T.property_value = S.property_value
    When Not Matched
        Then Insert
             (
                 Measure_guid
               , property_name
               , property_value
             )
             Values
                 (
                     S.Measure_guid
                   , S.property_name
                   , S.property_value
                 )
    ----Output issue because of calculated column in target table
    --Output
    --    deleted.*
    --  , $ACTION
    --  , inserted.*
    ;
End;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '318d889d-3250-ec11-8532-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'PROCEDURE', @level1name = N'usp_MeasureProperty_set';

