
/*
<<property_start>>MS_Description 
insert entries into xref:sqldb:reference.RepoObjectColumnSource_virtual.adoc[], using guid, fullname or fullname2
<<property_end>> 

<<property_start>>exampleUsage
EXEC reference.usp_RepoObjectColumnSource_virtual_set
    @RepoObjectColumn_fullname2 = 'SchemaName.ObjectName.ColumnName'
  , @Source_RepoObjectColumn_fullname2 = 'SourceSchemaName.SourceObjectName.SourceColumnName';

EXEC reference.usp_RepoObjectColumnSource_virtual_set
    @RepoObjectColumn_fullname = '[SchemaName].[ObjectName].[ColumnName]'
  , @Source_RepoObjectColumn_fullname = '[SourceSchemaName].[SourceObjectName].[SourceColumnName]';
<<property_end>>
*/
create Procedure reference.usp_RepoObjectColumnSource_virtual_set
    --
    @RepoObjectColumn_guid             UniqueIdentifier = Null --if @RepoObjectColumn_guid is NULL, then @RepoObjectColumn_fullname or @RepoObjectColumn_fullname2 are used
  , @RepoObjectColumn_fullname         NVarchar(520)    = Null --can be used to define @RepoObjectColumn_guid; use '[SchemaName].[ObjectName].[ColumnName]'
  , @RepoObjectColumn_fullname2        NVarchar(386)    = Null --can be used to define @RepoObjectColumn_guid; use 'SchemaName.ObjectName.ColumnName'
  , @Source_RepoObjectColumn_guid      UniqueIdentifier = Null --if @Source_RepoObjectColumn_guid is NULL, then @Source_RepoObjectColumn_fullname or @Source_RepoObjectColumn_fullname2 are used
  , @Source_RepoObjectColumn_fullname  NVarchar(520)    = Null --can be used to define @Source_RepoObjectColumn_guid; use '[SchemaName].[ObjectName].[ColumnName]'
  , @Source_RepoObjectColumn_fullname2 NVarchar(386)    = Null --can be used to define @Source_RepoObjectColumn_guid; use 'SchemaName.ObjectName.ColumnName'
As
Begin
    Declare @step_name NVarchar(1000) = Null;

    If @RepoObjectColumn_guid Is Null
        Set @RepoObjectColumn_guid =
    (
        Select
            RepoObjectColumn_guid
        From
            repo.RepoObjectColumn_gross roc
        Where
            roc.RepoObjectColumn_fullname = @RepoObjectColumn_fullname
    )   ;

    If @RepoObjectColumn_guid Is Null
        Set @RepoObjectColumn_guid =
    (
        Select
            RepoObjectColumn_guid
        From
            repo.RepoObjectColumn_gross roc
        Where
            roc.RepoObjectColumn_fullname2 = @RepoObjectColumn_fullname2
    )   ;

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
                       , @RepoObjectColumn_fullname
                       , ';'
                       , @RepoObjectColumn_fullname2
                     );

        Throw 51001, @step_name, 1;
    End;

    If @Source_RepoObjectColumn_guid Is Null
        Set @Source_RepoObjectColumn_guid =
    (
        Select
            RepoObjectColumn_guid
        From
            repo.RepoObjectColumn_gross roc
        Where
            roc.RepoObjectColumn_fullname = @Source_RepoObjectColumn_fullname
    )   ;

    If @Source_RepoObjectColumn_guid Is Null
        Set @Source_RepoObjectColumn_guid =
    (
        Select
            RepoObjectColumn_guid
        From
            repo.RepoObjectColumn_gross roc
        Where
            roc.RepoObjectColumn_fullname2 = @Source_RepoObjectColumn_fullname2
    )   ;

    --check existence of @RepoObjectColumn_guid
    If Not Exists
    (
        Select
            1
        From
            repo.RepoObjectColumn
        Where
            RepoObjectColumn_guid = @Source_RepoObjectColumn_guid
    )
    Begin
        Set @step_name
            = Concat (
                         'Source_RepoObjectColumn_guid does not exist;'
                       , @Source_RepoObjectColumn_guid
                       , ';'
                       , @Source_RepoObjectColumn_fullname
                       , ';'
                       , @Source_RepoObjectColumn_fullname2
                     );

        Throw 51002, @step_name, 1;
    End;

    If Not Exists
    (
        Select
            1
        From
            reference.RepoObjectColumnSource_virtual
        Where
            RepoObjectColumn_guid            = @RepoObjectColumn_guid
            And Source_RepoObjectColumn_guid = @Source_RepoObjectColumn_guid
    )
        Insert Into reference.RepoObjectColumnSource_virtual
        Values
            (
                @RepoObjectColumn_guid
              , @Source_RepoObjectColumn_guid
            );
End;