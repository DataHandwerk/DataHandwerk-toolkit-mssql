
/*
<<property_start>>MS_Description 
insert entries into xref:sqldb:reference.repoobjectsource_virtual.adoc[], using guid, fullname or fullname2
<<property_end>> 

<<property_start>>exampleUsage
EXEC reference.usp_RepoObjectSource_virtual_set
    @RepoObject_fullname2 = 'SchemaName.ObjectName'
  , @Source_RepoObject_fullname2 = 'SourceSchemaName.SourceObjectName';

EXEC reference.usp_RepoObjectSource_virtual_set
    @RepoObject_fullname = '[SchemaName].[ObjectName]'
  , @Source_RepoObject_fullname = '[SourceSchemaName].[SourceObjectName]';
<<property_end>>
*/
CREATE Procedure [reference].[usp_RepoObjectSource_virtual_set]
    --
    @RepoObject_guid             UniqueIdentifier = Null --if @RepoObject_guid is NULL, then @RepoObject_fullname or @RepoObject_fullname2 are used
  , @RepoObject_fullname         NVarchar(520)    = Null --can be used to define @RepoObject_guid; use '[SchemaName].[ObjectName]'
  , @RepoObject_fullname2        NVarchar(386)    = Null --can be used to define @RepoObject_guid; use 'SchemaName.ObjectName'
  , @Source_RepoObject_guid      UniqueIdentifier = Null --if @Source_RepoObject_guid is NULL, then @Source_RepoObject_fullname or @Source_RepoObject_fullname2 are used
  , @Source_RepoObject_fullname  NVarchar(520)    = Null --can be used to define @Source_RepoObject_guid; use '[SchemaName].[ObjectName]'
  , @Source_RepoObject_fullname2 NVarchar(386)    = Null --can be used to define @Source_RepoObject_guid; use 'SchemaName.ObjectName'
As
Begin
    Declare @step_name NVarchar(1000) = Null;

    If @RepoObject_guid Is Null
        Set @RepoObject_guid =
    (
        Select
            RepoObject_guid
        From
            repo.RepoObject roc
        Where
            roc.RepoObject_fullname = @RepoObject_fullname
    )   ;

    If @RepoObject_guid Is Null
        Set @RepoObject_guid =
    (
        Select
            RepoObject_guid
        From
            repo.RepoObject roc
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

    If @Source_RepoObject_guid Is Null
        Set @Source_RepoObject_guid =
    (
        Select
            RepoObject_guid
        From
            repo.RepoObject roc
        Where
            roc.RepoObject_fullname = @Source_RepoObject_fullname
    )   ;

    If @Source_RepoObject_guid Is Null
        Set @Source_RepoObject_guid =
    (
        Select
            RepoObject_guid
        From
            repo.RepoObject roc
        Where
            roc.RepoObject_fullname2 = @Source_RepoObject_fullname2
    )   ;

    --check existence of @RepoObject_guid
    If Not Exists
    (
        Select
            1
        From
            repo.RepoObject
        Where
            RepoObject_guid = @Source_RepoObject_guid
    )
    Begin
        Set @step_name
            = Concat (
                         'Source_RepoObject_guid does not exist;'
                       , @Source_RepoObject_guid
                       , ';'
                       , @Source_RepoObject_fullname
                       , ';'
                       , @Source_RepoObject_fullname2
                     );

        Throw 51002, @step_name, 1;
    End;

    If Not Exists
    (
        Select
            1
        From
            reference.RepoObjectSource_virtual
        Where
            RepoObject_guid            = @RepoObject_guid
            And Source_RepoObject_guid = @Source_RepoObject_guid
    )
        Insert Into reference.RepoObjectSource_virtual
        Values
            (
                @RepoObject_guid
              , @Source_RepoObject_guid
            );
End;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7e9a3468-7da6-eb11-84fb-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'PROCEDURE', @level1name = N'usp_RepoObjectSource_virtual_set';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [reference].[RepoObjectSource_virtual]
* [repo].[RepoObject]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'PROCEDURE', @level1name = N'usp_RepoObjectSource_virtual_set';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'
insert entries into xref:sqldb:reference.RepoObjectSource_virtual.adoc[], using guid, fullname or fullname2', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'PROCEDURE', @level1name = N'usp_RepoObjectSource_virtual_set';


GO
EXECUTE sp_addextendedproperty @name = N'exampleUsage', @value = N'
EXEC reference.usp_RepoObjectSource_virtual_set
    @RepoObject_fullname2 = ''SchemaName.ObjectName''
  , @Source_RepoObject_fullname2 = ''SourceSchemaName.SourceObjectName'';

EXEC reference.usp_RepoObjectSource_virtual_set
    @RepoObject_fullname = ''[SchemaName].[ObjectName]''
  , @Source_RepoObject_fullname = ''[SourceSchemaName].[SourceObjectName]'';', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'PROCEDURE', @level1name = N'usp_RepoObjectSource_virtual_set';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:reference.RepoObjectSource_virtual.adoc[]
* xref:repo.RepoObject.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'PROCEDURE', @level1name = N'usp_RepoObjectSource_virtual_set';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'PROCEDURE', @level1name = N'usp_RepoObjectSource_virtual_set';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'PROCEDURE', @level1name = N'usp_RepoObjectSource_virtual_set';

