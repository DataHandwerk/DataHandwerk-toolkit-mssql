
/*
<<property_start>>MS_Description 
insert entries into xref:sqldb:reference.external_object.adoc[]
<<property_end>> 

<<property_start>>exampleUsage
EXEC reference.usp_external_object_set
    @RepoObject_fullname2 = 'SchemaName.ObjectName'
  , @external_AntoraModulName = 'sqldb2'
  , @external_SchemaName = 'aaa'
  , @external_ObjectName = 'tableName'
  , @isReferenced = 1      --optional
  , @external_Type = 'U'   --optional

EXEC reference.usp_external_object_set
    @RepoObject_fullname = '[SchemaName].[ObjectName]'
  , @external_AntoraModulName = 'sqldb2'
  , @external_SchemaName = 'aaa'
  , @external_ObjectName = 'tableName'
  , @isReferenced = 1
  , @external_Type = 'U'
<<property_end>>
*/
Create Procedure reference.usp_external_object_set
    --
    @RepoObject_guid          UniqueIdentifier = Null --if @RepoObject_guid is NULL, then @RepoObject_fullname or @RepoObject_fullname2 are used
  , @RepoObject_fullname      NVarchar(520)    = Null --can be used to define @RepoObject_guid; use '[SchemaName].[ObjectName]'
  , @RepoObject_fullname2     NVarchar(386)    = Null --can be used to define @RepoObject_guid; use 'SchemaName.ObjectName'
  , @external_AntoraModulName NVarchar(128)
  , @external_SchemaName      NVarchar(128)
  , @external_ObjectName      NVarchar(128)
  , @isReferenced             Bit              = 1
  , @external_Type            Char(2)          = Null
As
Begin
    Declare @step_name NVarchar(1000) = Null;

    If @RepoObject_guid Is Null
        Set @RepoObject_guid =
    (
        Select
            roc.RepoObject_guid
        From
            repo.RepoObject As roc
        Where
            roc.RepoObject_fullname = @RepoObject_fullname
    )   ;

    If @RepoObject_guid Is Null
        Set @RepoObject_guid =
    (
        Select
            roc.RepoObject_guid
        From
            repo.RepoObject As roc
        Where
            roc.RepoObject_fullname2 = @RepoObject_fullname2
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

    Merge Into reference.external_object As T
    Using
    (
        Select
            @RepoObject_guid
          , @external_AntoraModulName
          , @external_SchemaName
          , @external_ObjectName
          , @isReferenced
          , @external_Type
    ) As src
    ( RepoObject_guid, external_AntoraModulName, external_SchemaName, external_ObjectName, isReferenced, external_Type )
    On T.RepoObject_guid = src.RepoObject_guid
       And T.external_AntoraModulName = src.external_AntoraModulName
       And T.external_SchemaName = src.external_SchemaName
       And T.external_ObjectName = src.external_ObjectName
    When Matched
        Then Update Set
                 T.isReferenced = src.isReferenced
               --when src.[external_Type] is null then keep existing entry
               , T.external_Type = Coalesce ( src.external_Type, T.external_Type )
    When Not Matched
        Then Insert
             (
                 RepoObject_guid
               , external_AntoraModulName
               , external_SchemaName
               , external_ObjectName
               , isReferenced
               , external_Type
             )
             Values
                 (
                     src.RepoObject_guid
                   , src.external_AntoraModulName
                   , src.external_SchemaName
                   , src.external_ObjectName
                   , src.isReferenced
                   , src.external_Type
                 )
    Output
        $action
      , inserted.*;
End;