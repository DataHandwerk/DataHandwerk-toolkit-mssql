
/*
<<property_start>>Description
* delete entry from xref:sqldb:repo.repoobject_persistence.adoc[]
* delete entry from xref:sqldb:uspgenerator.generatorusp.adoc[]
<<property_end>>

<<property_start>>exampleUsage
EXEC repo.usp_persistence_delete
@target_fullname = '[aaa].[bbb_T]'

EXEC repo.usp_persistence_delete
@usp_persistence_fullname = '[aaa].[usp_PERSIST_bbb_T]'

EXEC repo.usp_persistence_delete
@usp_persistence_uspid = 4711
<<property_end>>


*/
CREATE Procedure [repo].[usp_persistence_delete]
    @usp_persistence_uspid    Int              = Null
  , @usp_persistence_fullname NVarchar(261)    = Null
  , @source_RepoObject_guid   UniqueIdentifier = Null --
  , @source_fullname          NVarchar(261)    = Null --
  , @target_RepoObject_guid   UniqueIdentifier = Null --
  , @target_fullname          NVarchar(261)    = Null --

                                                      -- some optional parameters, used for logging
  , @execution_instance_guid  UniqueIdentifier = Null --SSIS system variable ExecutionInstanceGUID could be used, but other any other guid
  , @ssis_execution_id        BigInt           = Null --only SSIS system variable ServerExecutionID should be used, or any other consistent number system, do not mix
  , @sub_execution_id         Int              = Null
  , @parent_execution_log_id  BigInt           = Null
As
Declare
    @current_execution_log_id BigInt
  , @current_execution_guid   UniqueIdentifier = NewId ()
  , @source_object            NVarchar(261)    = Null
  , @target_object            NVarchar(261)    = Null
  , @proc_id                  Int              = @@ProcId
  , @proc_schema_name         NVarchar(128)    = Object_Schema_Name ( @@ProcId )
  , @proc_name                NVarchar(128)    = Object_Name ( @@ProcId )
  , @event_info               NVarchar(Max)
  , @step_id                  Int              = 0
  , @step_name                NVarchar(1000)   = Null
  , @rows                     Int;

Set @event_info =
(
    Select
        event_info
    From
        sys.dm_exec_input_buffer ( @@Spid, Current_Request_Id ())
);

If @execution_instance_guid Is Null
    Set @execution_instance_guid = NewId ();

--SET @rows = @@ROWCOUNT;
Set @step_id = @step_id + 1;
Set @step_name = N'start';
Set @source_object = Null;
Set @target_object = Null;

Exec logs.usp_ExecutionLog_insert
    @execution_instance_guid = @execution_instance_guid
  , @ssis_execution_id = @ssis_execution_id
  , @sub_execution_id = @sub_execution_id
  , @parent_execution_log_id = @parent_execution_log_id
  , @current_execution_guid = @current_execution_guid
  , @proc_id = @proc_id
  , @proc_schema_name = @proc_schema_name
  , @proc_name = @proc_name
  , @event_info = @event_info
  , @step_id = @step_id
  , @step_name = @step_name
  , @source_object = @source_object
  , @target_object = @target_object
  , @inserted = Null
  , @updated = Null
  , @deleted = Null
  , @info_01 = Null
  , @info_02 = Null
  , @info_03 = Null
  , @info_04 = Null
  , @info_05 = Null
  , @info_06 = Null
  , @info_07 = Null
  , @info_08 = Null
  , @info_09 = Null
  , @execution_log_id = @current_execution_log_id Output
  , @parameter_01 = @usp_persistence_uspid
  , @parameter_02 = @usp_persistence_fullname
  , @parameter_03 = @source_RepoObject_guid
  , @parameter_04 = @source_fullname
  , @parameter_05 = @target_RepoObject_guid
  , @parameter_06 = @target_fullname


--
----START
--
Declare @info_01_message NVarchar(4000);

--try to sync @target_RepoObject_guid and @target_fullname
If @target_RepoObject_guid Is Null
   And Not @target_fullname Is Null
    --try to get @target_RepoObject_guid from @target_fullname
    Set @target_RepoObject_guid =
(
    Select
        Top 1
        RepoObject_guid
    From
        repo.RepoObject
    Where
        SysObject_fullname     = @target_fullname
        Or RepoObject_fullname = @target_fullname
)

If Not @target_RepoObject_guid Is Null
   And @target_fullname Is Null
    Set @target_fullname =
(
    Select
        Top 1
        RepoObject_fullname
    From
        repo.RepoObject
    Where
        RepoObject_guid = @target_RepoObject_guid
)

If Not @target_RepoObject_guid Is Null
   And @source_RepoObject_guid Is Null
    Set @source_RepoObject_guid =
(
    Select
        Top 1
        source_RepoObject_guid
    From
        repo.RepoObject_persistence
    Where
        target_RepoObject_guid = @target_RepoObject_guid
)

--try to sync @source_RepoObject_guid and @source_fullname
If @source_RepoObject_guid Is Null
   And Not @source_fullname Is Null
    --try to get @source_RepoObject_guid from @source_fullname
    Set @source_RepoObject_guid =
(
    Select
        Top 1
        RepoObject_guid
    From
        repo.RepoObject
    Where
        SysObject_fullname     = @source_fullname
        Or RepoObject_fullname = @source_fullname
)

If Not @source_RepoObject_guid Is Null
   And @source_fullname Is Null
    Set @source_fullname =
(
    Select
        Top 1
        RepoObject_fullname
    From
        repo.RepoObject
    Where
        RepoObject_guid = @source_RepoObject_guid
)

If @target_RepoObject_guid Is Null
   And Not @source_RepoObject_guid Is Null
    Set @target_RepoObject_guid =
(
    Select
        Top 1
        target_RepoObject_guid
    From
        repo.RepoObject_persistence
    Where
        source_RepoObject_guid = @source_RepoObject_guid
)

If Not @target_RepoObject_guid Is Null
   And @target_fullname Is Null
    Set @target_fullname =
(
    Select
        Top 1
        RepoObject_fullname
    From
        repo.RepoObject
    Where
        RepoObject_guid = @target_RepoObject_guid
)

--get possible @usp_persistence_fullname from @target_RepoObject_guid
If Not @target_RepoObject_guid Is Null
   And @usp_persistence_fullname Is Null
    Set @usp_persistence_fullname =
(
    Select
        Top 1
        usp_persistence_fullname
    From
        repo.RepoObject
    Where
        RepoObject_guid = @target_RepoObject_guid
)

--try to sync @usp_persistence_uspid and @usp_persistence_fullname
If @usp_persistence_uspid Is Null
   And Not @usp_persistence_fullname Is Null
    Set @usp_persistence_uspid =
(
    Select
        Top 1
        id
    From
        uspgenerator.GeneratorUsp
    Where
        usp_fullname = @usp_persistence_fullname
)

If Not @usp_persistence_uspid Is Null
   And @usp_persistence_fullname Is Null
    Set @usp_persistence_fullname =
(
    Select
        Top 1
        usp_fullname
    From
        uspgenerator.GeneratorUsp
    Where
        id = @usp_persistence_uspid
)

If @usp_persistence_uspid Is Null
   Or @usp_persistence_fullname Is Null
Begin
    Set @info_01_message
        = Concat (
                     N'can not detect @usp_persistence_uspid '
                   , @usp_persistence_uspid
                   , ' or @usp_persistence_fullname '
                   , @usp_persistence_fullname
                 );

    Throw 51001, @info_01_message, 1;
End;

If Not @usp_persistence_uspid Is Null
   And Not @usp_persistence_fullname Is Null
   And Not @usp_persistence_fullname =
       (
           Select
               Top 1
               usp_fullname
           From
               uspgenerator.GeneratorUsp
           Where
               id = @usp_persistence_uspid
       )
Begin
    Set @info_01_message
        = Concat (
                     N'@usp_persistence_uspid '
                   , @usp_persistence_uspid
                   , N' and @usp_persistence_fullname '
                   , @usp_persistence_fullname
                   , N' does not match'
                 );

    Throw 51002, @info_01_message, 1;
End;

If Not @usp_persistence_uspid Is Null
   And Not @usp_persistence_fullname Like '%usp_PERSIST_%'
Begin
    Set @info_01_message
        = Concat (
                     N'@usp_persistence_uspid '
                   , @usp_persistence_uspid
                   , N'; @usp_persistence_fullname '
                   , @usp_persistence_fullname
                   , N' not LIKE ''%usp_PERSIST_%'''
                 );

    Throw 51004, @info_01_message, 1;
End;

--@target_RepoObject_guid and @source_RepoObject_guid could still be empty

--get @target_RepoObject_guid from @usp_persistence_fullname
If @target_RepoObject_guid Is Null
   And Not @usp_persistence_fullname Is Null
    Set @target_RepoObject_guid =
(
    Select
        Top 1
        RepoObject_guid
    From
        repo.RepoObject
    Where
        usp_persistence_fullname = @usp_persistence_fullname
)

If @target_RepoObject_guid Is Null
Begin
    Set @info_01_message = N'@target_RepoObject_guid is NULL';

    Throw 51005, @info_01_message, 1;
End;

Set @info_01_message
    = Concat (
                 ''
               , '@usp_persistence_uspid:    '
               , @usp_persistence_uspid
               , Char ( 13 ) + Char ( 10 )
               , '@usp_persistence_fullname: '
               , @usp_persistence_fullname
               , Char ( 13 ) + Char ( 10 )
               , '@source_RepoObject_guid:   '
               , @source_RepoObject_guid
               , Char ( 13 ) + Char ( 10 )
               , '@source_fullname:          '
               , @source_fullname
               , Char ( 13 ) + Char ( 10 )
               , '@target_RepoObject_guid:   '
               , @target_RepoObject_guid
               , Char ( 13 ) + Char ( 10 )
               , '@target_fullname:          '
               , @target_fullname
               , Char ( 13 ) + Char ( 10 )
             )

Print @info_01_message

Set @info_01_message = Concat ( N'Delete
uspgenerator.GeneratorUsp
Where
    id = ', @usp_persistence_uspid )

Print @info_01_message

Delete
uspgenerator.GeneratorUsp
Where
    id = @usp_persistence_uspid

Set @info_01_message = Concat ( N'Delete
repo.RepoObject_persistence
Where
    target_RepoObject_guid = ', @usp_persistence_uspid )

Print @info_01_message

Delete
repo.RepoObject_persistence
Where
    target_RepoObject_guid = @target_RepoObject_guid

--
--END
--
--SET @rows = @@ROWCOUNT;
Set @step_id = @step_id + 1;
Set @step_name = N'end';
Set @source_object = Null;
Set @target_object = Null;

Exec logs.usp_ExecutionLog_insert
    @execution_instance_guid = @execution_instance_guid
  , @ssis_execution_id = @ssis_execution_id
  , @sub_execution_id = @sub_execution_id
  , @parent_execution_log_id = @parent_execution_log_id
  , @current_execution_guid = @current_execution_guid
  , @proc_id = @proc_id
  , @proc_schema_name = @proc_schema_name
  , @proc_name = @proc_name
  , @event_info = @event_info
  , @step_id = @step_id
  , @step_name = @step_name
  , @source_object = @source_object
  , @target_object = @target_object
  , @inserted = Null
  , @updated = Null
  , @deleted = Null
  , @info_01 = Null
  , @info_02 = Null
  , @info_03 = Null
  , @info_04 = Null
  , @info_05 = Null
  , @info_06 = Null
  , @info_07 = Null
  , @info_08 = Null
  , @info_09 = Null;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f9759af2-7150-ec11-8532-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_persistence_delete';

