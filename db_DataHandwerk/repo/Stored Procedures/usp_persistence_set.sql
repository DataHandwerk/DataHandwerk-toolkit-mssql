
/*
<<property_start>>MS_Description
create or update code (table and procedure) for persistence

* create or update RepoObject in xref:sqldb:repo.RepoObject.adoc[] for a new persistence target table, based on a given persistence source (view or table)
* create or update entries in xref:sqldb:repo.RepoObject_persistence.adoc[]
** default properties are used, defined in this table
*** [is_persistence_truncate] = 1
*** [is_persistence_insert] = 1
*** all others bit values = 0

TIP: see details for usage in xref:manual:persistence-generator.adoc[]

[NOTE]
.How does it work:
--
* insert or update xref:sqldb:repo.RepoObject_persistence.adoc[]
** update existing RepoObject which should be a table and will be marked as persistence
** create new RepoObject which will be a table and will be marked as persistence
* persistence source
** uses @source_RepoObject_guid, if not empty
** tries to get @source_RepoObject_guid from @source_fullname
* persistence target
** if the persistene *target table* is not defined, defaults are used:
*** same schema as persistence source
*** name of persistence source + suffix (`FROM [repo].[Parameter] WHERE [Parameter_name] = 'persistence_name_suffix'`)
** persistence target not NULL
*** use the given persistence targe
* persistence source NULL, persistence target NULL
** => error
--

[NOTE]
.pesistence procedure naming
--
the default name for the *persistence procedure* is

* 'persistence target schema'.'usp_PERSIST_' + 'persistence target name'
+
[source,sql]
------
[SchemaName].[usp_PERSIST_SourceViewName_T]
------
--

[NOTE]
--
after executing xref:sqldb:repo.usp_persistence_set.adoc[] you need

* EXEC xref:sqldb:repo.usp_main.adoc[]
* check and update attributes in xref:sqldb:repo.RepoObject_persistence.adoc[]
* physically create the persistence table (the procedure xref:sqldb:repo.usp_persistence_set.adoc[] will only create the code)
+
[source,sql]
------
SELECT
    [RepoObject_guid]
  , [DbmlTable]
  , [RepoObject_fullname]
  , [SqlCreateTable]
  , [ConList]
  , [persistence_source_RepoObject_fullname]
  , [persistence_source_RepoObject_guid]
  , [persistence_source_SysObject_fullname]
FROM
    [repo].[RepoObject_SqlCreateTable]
WHERE
    NOT [persistence_source_RepoObject_fullname] IS NULL
ORDER BY
    [RepoObject_fullname];
------
** Use the sql statement in column [SqlCreateTable] to create the table
* get the usp code in xref:sqldb:uspgenerator.GeneratorUsp_SqlUsp.adoc[] and execute it
--
<<property_end>>

<<property_start>>exampleUsage
--create new default persistence [SchemaName].[SourceViewName_T], 
--using default properties, defined in [repo].[RepoObject_persistence]

EXEC repo.[usp_persistence_set] @source_fullname = '[SchemaName].[SourceViewName]';

EXEC repo.usp_main

--get the code for the new table

SELECT
    [RepoObject_guid]
  , [RepoObject_fullname]
  , [SqlCreateTable]
FROM
    [repo].[RepoObject_SqlCreateTable]
WHERE
    [RepoObject_fullname] = '[SchemaName].[SourceViewName_T]';

--Execute the code from column [SqlCreateTable]

--get the code for the persistence procedure, you can limit using WHERE

SELECT
    [usp_id]
  , [SqlUsp]
  , [usp_fullname]
  , [usp_name]
  , [usp_schema]
FROM
    [uspgenerator].[GeneratorUsp_SqlUsp];

-- execute the code from column [SqlUsp]

--try to execute the generated procedure

EXEC [SchemaName].[usp_PERSIST_SourceViewName_T];
<<property_end>>

<<property_start>>exampleUsage_2
--mark an existing table as persistence of a source
--or update persistence properties
--  if the entry already exists in [repo].[RepoObject_persistence]
--we don't need @source_RepoObject_guid, we could use @source_fullname instead
--we NEED to obtain @persistence_RepoObject_guid


DECLARE
    @source_RepoObject_guid      UNIQUEIDENTIFIER
  , @persistence_RepoObject_guid UNIQUEIDENTIFIER;

SET @source_RepoObject_guid =
(
    SELECT
        [RepoObject_guid]
    FROM
        [repo].[RepoObject]
    WHERE
        [SysObject_fullname] = '[SchemaName].[SourceViewName]'
);

PRINT @source_RepoObject_guid;

SET @persistence_RepoObject_guid =
(
    SELECT
        [RepoObject_guid]
    FROM
        [repo].[RepoObject]
    WHERE
        [RepoObject_fullname] = '[SchemaName].[SourceViewName_T]'
);

PRINT @persistence_RepoObject_guid;

EXEC repo.[usp_persistence_set]
    @source_RepoObject_guid = @source_RepoObject_guid
  , @persistence_RepoObject_guid = @persistence_RepoObject_guid
  , @has_history = 1 --this will create a temporal table, a table with history
  , @is_persistence_check_for_empty_source = 1
  , @is_persistence_truncate = 0
  , @is_persistence_delete_missing = 1
  , @is_persistence_delete_changed = 0
  , @is_persistence_update_changed = 1
  , @is_persistence_insert = 1;
<<property_end>>

<<property_start>>exampleUsage_3
--create new persistence [SchemaName].[SourceViewName_T], 
--use explicite parameters

EXEC repo.[usp_persistence_set] 
    @source_fullname = '[SchemaName].[SourceViewName]'
  , @has_history = 0
  , @has_history_columns = 0
  , @is_persistence_check_for_empty_source = 0
  , @is_persistence_truncate = 0
  , @is_persistence_delete_missing = 1
  , @is_persistence_delete_changed = 0
  , @is_persistence_update_changed = 1
  , @is_persistence_insert = 1
<<property_end>>

<<property_start>>exampleWrong_Usage
---this will NOT work, because there is no @persistence_schema_name
---(it is  not implemented)

EXEC repo.[usp_persistence_set]
    --
    @source_fullname = '[graph].[Index_S]'
  , @persistence_table_name = 'Index'
  , @is_persistence_check_for_empty_source = 1
  , @is_persistence_truncate = 1
  , @is_persistence_insert = 1;
<<property_end>>
*/
CREATE Procedure [repo].[usp_persistence_set]
    @source_RepoObject_guid                UniqueIdentifier = Null        --
  , @source_fullname                       NVarchar(261)    = Null        --it is possible to use @source_RepoObject_guid OR @source_fullname; use: "[schema].[object_name]"
  , @persistence_RepoObject_guid           UniqueIdentifier = Null Output --if this parameter is not null then an existing RepoObject is used to modify, if it is null then a RepoObject will be created, don't use brackts: "object_name_T"
  , @persistence_table_name                NVarchar(128)    = Null        --default: @source_table_name + @persistence_name_suffix; default schema is @source_schema_name; example: 'aaa_T'
  , @is_persistence_check_for_empty_source Bit              = Null
  , @is_persistence_truncate               Bit              = Null
  , @is_persistence_delete_missing         Bit              = Null
  , @is_persistence_delete_changed         Bit              = Null
  , @is_persistence_update_changed         Bit              = Null
  , @is_persistence_insert                 Bit              = Null
  , @has_history_columns                   Bit              = Null
  , @has_history                           Bit              = Null
  , @history_schema_name                   NVarchar(128)    = Null
  , @history_table_name                    NVarchar(128)    = Null
                                                                          --todo
                                                                          --think about an additional parameter
                                                                          --@is_remove_target_column_not_in_source
                                                                          --don't remove: persistence columns, calculated columns
                                                                          --but there could be dependencies from these columns
                                                                          --these should be checked
                                                                          --maybe som kind of maintenance procedure would be better then to integrate this here
                                                                          --
                                                                          --by default the source schema is used and the source name with prefix '_T' for table
                                                                          --todo: use general parameters to define this
                                                                          -- some optional parameters, used for logging
  , @execution_instance_guid               UniqueIdentifier = Null        --SSIS system variable ExecutionInstanceGUID could be used, but other any other guid
  , @ssis_execution_id                     BigInt           = Null        --only SSIS system variable ServerExecutionID should be used, or any other consistent number system, do not mix
  , @sub_execution_id                      Int              = Null
  , @parent_execution_log_id               BigInt           = Null
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
  , @parameter_01 = @source_RepoObject_guid
  , @parameter_02 = @source_fullname
  , @parameter_03 = @persistence_RepoObject_guid
  , @parameter_04 = @persistence_table_name
  , @parameter_05 = @is_persistence_check_for_empty_source
  , @parameter_06 = @is_persistence_truncate
  , @parameter_07 = @is_persistence_delete_missing
  , @parameter_08 = @is_persistence_delete_changed
  , @parameter_09 = @is_persistence_update_changed
  , @parameter_10 = @is_persistence_insert
  , @parameter_11 = @has_history_columns
  , @parameter_12 = @has_history
  , @parameter_13 = @history_schema_name
  , @parameter_14 = @history_table_name;

--
----START
--
Declare @info_01_message NVarchar(1000);

--this table is used for OUTPUT to get the new assigned [RepoObject_guid] when inserting new values
Declare @table Table
(
    guid UniqueIdentifier
);

Declare
    @source_schema_name      NVarchar(128)
  , @source_table_name       NVarchar(128)
  , @persistence_schema_name NVarchar(128)
  , @persistence_name_suffix NVarchar(10);

--   , @new_RepoObject_guid     UNIQUEIDENTIFIER
Set @persistence_name_suffix =
(
    Select
        Parameter_value__result_nvarchar
    From
        [config].Parameter
    Where
        Parameter_name = 'persistence_name_suffix'
);

----the following should not happen
--SET @persistence_name_suffix = (
--  SELECT ISNULL(@persistence_name_suffix, '_T')
--  )
If @persistence_name_suffix Is Null
Begin
    Throw 51001, '@persistence_name_suffix is null, check repo.Parameter, EXEC [repo].[usp_init_parameter]', 1;
End;

If @source_RepoObject_guid Is Null
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
)   ;

If @source_RepoObject_guid Is Null
   And @persistence_RepoObject_guid Is Null
Begin
    Throw 51002, '@source_RepoObject_guid is null and @persistence_RepoObject_guid is null, @source_fullname can''t be solved', 1;
End;

If Not @persistence_RepoObject_guid Is Null
   And @source_RepoObject_guid Is Null
Begin
    --try to get @source_RepoObject_guid
    Set @source_RepoObject_guid =
    (
        Select
            source_RepoObject_guid
        From
            repo.RepoObject_persistence As ro
        Where
            target_RepoObject_guid = @persistence_RepoObject_guid
    );

    If @source_RepoObject_guid Is Null
    Begin
        Set @info_01_message
            = N'@source_RepoObject_guid IS NULL; @persistence_RepoObject_guid is not NULL but [source_RepoObject_guid] can''t be obtained';
        --SET @rows = @@ROWCOUNT;
        Set @step_id = @step_id + 1;
        Set @step_name = N'error';
        Set @source_object = N'[repo].[RepoObject_persistence]';
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
          , @info_01 = @info_01_message
          , @info_02 = @persistence_RepoObject_guid
          , @info_03 = Null
          , @info_04 = Null
          , @info_05 = Null
          , @info_06 = Null
          , @info_07 = Null
          , @info_08 = Null
          , @info_09 = Null;

        --RETURN 3
        Throw 51003, @info_01_message, 1;
    End; --IF @source_RepoObject_guid IS NULL
End;

--IF NOT @persistence_RepoObject_guid IS NULL IF NOT @persistence_RepoObject_guid IS NULL AND @source_RepoObject_guid IS NULL 

--now @source_RepoObject_guid should not be NULL, because it was assigned before
If Not @source_RepoObject_guid Is Null
   And @persistence_RepoObject_guid Is Null
Begin
    --create new @persistence_RepoObject_guid
    --check, if @source_RepoObject_guid exists and it is a view or table
    Select
        @source_schema_name = SysObject_schema_name
      , @source_table_name  = SysObject_name
    From
        repo.RepoObject As ro
    Where
        ro.SysObject_type In
        ( 'V', 'U' )
        And RepoObject_guid = @source_RepoObject_guid;

    If @source_schema_name Is Null
    Begin
        Set @info_01_message
            = Concat (
                         @source_RepoObject_guid
                       , ': Source object is missing in [repo].[RepoObject] or type is not U or V'
                     );
        --SET @rows = @@ROWCOUNT;
        Set @step_id = @step_id + 1;
        Set @step_name = N'error';
        Set @source_object = N'[repo].[RepoObject]';
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
          , @info_01 = @info_01_message
          , @info_02 = @source_RepoObject_guid
          , @info_03 = Null
          , @info_04 = Null
          , @info_05 = Null
          , @info_06 = Null
          , @info_07 = Null
          , @info_08 = Null
          , @info_09 = Null;

        --RETURN 4
        Throw 51004, @info_01_message, 1;
    End;

    --IF @source_schema_name IS NULL

    --insert new entry for persistence table into [repo].[RepoObject]
    --@source_schema_name is used also as @persistence_schema_name
    --but if required this can be changed later in repo.RepoObject
    --todo: if required, we could implement a procedure parameter @persistence_schema_name
    Set @persistence_schema_name = @source_schema_name;
    Set @persistence_table_name
        = IsNull ( @persistence_table_name, Concat ( @source_table_name, @persistence_name_suffix ));

    If Exists
    (
        Select
            RepoObject_guid
        From
            repo.RepoObject
        Where
            RepoObject_schema_name = @persistence_schema_name
            And RepoObject_name    = @persistence_table_name
    )
    Begin
        Set @info_01_message
            = N'WARNING: Persistence Table already exists by ([RepoObject_schema_name], [RepoObject_name]) in repo.RepoObject';
        --SET @rows = @@ROWCOUNT;
        Set @step_id = @step_id + 1;
        Set @step_name = N'warning Persistence Table already exists';
        Set @source_object = N'[repo].[RepoObject]';
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
          , @info_01 = @info_01_message
          , @info_02 = @persistence_schema_name
          , @info_03 = @persistence_table_name
          , @info_04 = Null
          , @info_05 = Null
          , @info_06 = Null
          , @info_07 = Null
          , @info_08 = Null
          , @info_09 = Null;

        ----RETURN 5
        --THROW 51005
        -- , @info_01_message
        -- , 1;
        --
        Set @persistence_RepoObject_guid =
        (
            Select
                RepoObject_guid
            From
                repo.RepoObject
            Where
                RepoObject_schema_name = @persistence_schema_name
                And RepoObject_name    = @persistence_table_name
        );
    End;
    Else
    Begin
        --create new @persistence_RepoObject_guid
        --make sure the @table table is empty
        Delete
        @table;

        Insert Into repo.RepoObject
        (
            RepoObject_schema_name
          , RepoObject_name
          , RepoObject_type
          , SysObject_schema_name --can't be NULL
          , is_repo_managed
        )
        Output
            INSERTED.RepoObject_guid
        Into @table
        Values
            (
                @persistence_schema_name
              , @persistence_table_name
              , 'U'
              , @persistence_schema_name
              , 1
            );

        Set @persistence_RepoObject_guid =
        (
            Select guid From @table
        );
    End; --IF Persistence Table exists
End;

--IF NOT @source_RepoObject_guid IS NULL AND @persistence_RepoObject_guid IS NULL

--now both @source_RepoObject_guid and @persistence_RepoObject_guid should be not empty and exists in [repo].[RepoObject]
--check this to be sure
If @source_RepoObject_guid Is Null
   Or @persistence_RepoObject_guid Is Null
Begin
    Set @info_01_message
        = Concat (
                     'source and persistence not matching, still: @source_RepoObject_guid is null OR @persistence_RepoObject_guid is null: '
                   , @source_RepoObject_guid
                   , '; '
                   , @persistence_RepoObject_guid
                   , ';'
                 );

    Throw 51011, @info_01_message, 1;
End;

--now [repo].[RepoObject] should contain the @persistence_RepoObject_guid
--
--check if @persistence_RepoObject_guid is a table
If Not Exists
(
    Select
        RepoObject_type
    From
        repo.RepoObject
    Where
        RepoObject_guid     = @persistence_RepoObject_guid
        And RepoObject_type = 'U'
)
Begin
    Set @info_01_message = N'@persistence_RepoObject_guid has not [RepoObject_type] = ''U''';
    --SET @rows = @@ROWCOUNT;
    Set @step_id = @step_id + 1;
    Set @step_name = N'error';
    Set @source_object = N'[repo].[RepoObject]';
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
      , @info_01 = @info_01_message
      , @info_02 = @persistence_RepoObject_guid
      , @info_03 = Null
      , @info_04 = Null
      , @info_05 = Null
      , @info_06 = Null
      , @info_07 = Null
      , @info_08 = Null
      , @info_09 = Null;

    --RETURN 6
    Throw 51006, @info_01_message, 1;
End;

--
--[repo].[RepoObject_persistence]
--ensure @persistence_RepoObject_guid is in [repo].[RepoObject_persistence]
--we will not insert other parameters because they can be NULL
--instead of the defaults from the table will be used and we will update later in a separate step
Insert Into repo.RepoObject_persistence
(
    target_RepoObject_guid
  , source_RepoObject_guid
)
Select
    @persistence_RepoObject_guid
  , @source_RepoObject_guid
Where
    Not Exists
(
    Select
        target_RepoObject_guid
    From
        repo.RepoObject_persistence As rop
    Where
        rop.target_RepoObject_guid = @persistence_RepoObject_guid
);

Set @rows = @@RowCount;
Set @step_id = @step_id + 1;
Set @step_name = N'INSERT SELECT @persistence_RepoObject_guid, @source_RepoObject_guid';
Set @source_object = Null;
Set @target_object = N'[repo].[RepoObject_persistence]';

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
  , @inserted = @rows
  , @updated = Null
  , @deleted = Null
  , @info_01 = @persistence_RepoObject_guid
  , @info_02 = Null
  , @info_03 = Null
  , @info_04 = Null
  , @info_05 = Null
  , @info_06 = Null
  , @info_07 = Null
  , @info_08 = Null
  , @info_09 = Null;

--update only, if procedure parameters are not NULL
Update
    repo.RepoObject_persistence
Set
    source_RepoObject_guid = @source_RepoObject_guid
  , is_persistence_truncate = IsNull ( @is_persistence_truncate, is_persistence_truncate )
  , is_persistence_delete_missing = IsNull ( @is_persistence_delete_missing, is_persistence_delete_missing )
  , is_persistence_delete_changed = IsNull ( @is_persistence_delete_changed, is_persistence_delete_changed )
  , is_persistence_update_changed = IsNull ( @is_persistence_update_changed, is_persistence_update_changed )
  , is_persistence_insert = IsNull ( @is_persistence_insert, is_persistence_insert )
  , has_history_columns = IsNull ( @has_history_columns, has_history_columns )
  , has_history = IsNull ( @has_history, has_history )
  , is_persistence_check_for_empty_source = IsNull (
                                                       @is_persistence_check_for_empty_source
                                                     , is_persistence_check_for_empty_source
                                                   )
  , history_schema_name = IsNull ( @history_schema_name, history_schema_name )
  , history_table_name = IsNull ( @history_table_name, history_table_name )
Where
    target_RepoObject_guid = @persistence_RepoObject_guid;

Set @rows = @@RowCount;
Set @step_id = @step_id + 1;
Set @step_name = N'SET parameters from procedure call';
Set @source_object = Null;
Set @target_object = N'[repo].[RepoObject_persistence]';

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
  , @updated = @rows
  , @deleted = Null
  , @info_01 = @persistence_RepoObject_guid
  , @info_02 = Null
  , @info_03 = Null
  , @info_04 = Null
  , @info_05 = Null
  , @info_06 = Null
  , @info_07 = Null
  , @info_08 = Null
  , @info_09 = Null;

--ensure @persistence_RepoObject_guid is marked as [is_repo_managed] = 1
Update
    repo.RepoObject
Set
    is_repo_managed = 1
Where
    IsNull ( is_repo_managed, 0 ) <> 1
    And RepoObject_guid           = @persistence_RepoObject_guid;

Set @rows = @@RowCount;
Set @step_id = @step_id + 1;
Set @step_name = N'SET [is_repo_managed] = 1 (WHERE [RepoObject_guid] = @persistence_RepoObject_guid)';
Set @source_object = Null;
Set @target_object = N'[repo].[RepoObject]';

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
  , @updated = @rows
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

--set temporal_type
--0 = NON_TEMPORAL_TABLE
--1 = HISTORY_TABLE
--2 = SYSTEM_VERSIONED_TEMPORAL_TABLE
Update
    ro
Set
    Repo_temporal_type = rop.temporal_type
From
    repo.RepoObject                 ro
    Inner Join
        repo.RepoObject_persistence rop
            On
            rop.target_RepoObject_guid = ro.RepoObject_guid
Where
    ro.RepoObject_guid        = @persistence_RepoObject_guid
    And
    (
        ro.Repo_temporal_type <> rop.temporal_type
        Or ro.Repo_temporal_type Is Null
    );

Set @rows = @@RowCount;
Set @step_id = @step_id + 1;
Set @step_name = N'SET [Repo_temporal_type]';
Set @source_object = N'[repo].[RepoObject_persistence]';
Set @target_object = N'[repo].[RepoObject]';

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
  , @updated = @rows
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

-------------------------------------------------
-------------  COLUMNS  -------------------------
-------------------------------------------------
--
--ensure all columns from source exists:
--the following already happens in [repo].[usp_sync_guid_RepoObjectColumn] and we don't need to repeat it here:
--
/*
--persistence: update RepoObjectColumn_name from SysObjecColumn_name of persistence_source_RepoObjectColumn_guid
UPDATE roc_p
	SET
	    [RepoObjectColumn_name] = [roc_s].[SysObjectColumn_name]
	, [Repo_user_type_name] = [roc_s].[Sys_user_type_name]
	, [Repo_user_type_fullname] = [roc_s].[Sys_user_type_fullname]
FROM   [repo].[RepoObjectColumn] [roc_p]
	    INNER JOIN
	    [repo].[RepoObjectColumn] [roc_s]
	    ON [roc_p].[persistence_source_RepoObjectColumn_guid] = [roc_s].[RepoObjectColumn_guid]
	    INNER JOIN
	    [repo].[RepoObject] [ro_p]
	    ON [roc_p].[RepoObject_guid] = [ro_p].[RepoObject_guid]
WHERE
	    [ro_p].[is_repo_managed] = 1
	    AND ([roc_p].[RepoObjectColumn_name] <> [roc_s].[SysObjectColumn_name]
	        OR [roc_p].[Repo_user_type_fullname] <> [roc_s].[Sys_user_type_fullname]
	        OR ([roc_p].[Repo_user_type_fullname] IS NULL
	            AND NOT [roc_s].[Sys_user_type_fullname] IS NULL)
	        OR (NOT [roc_p].[Repo_user_type_fullname] IS NULL
	            AND [roc_s].[Sys_user_type_fullname] IS NULL)
	    --we don't need to check user_type_name, it is included in user_type_fullname
	    --OR [roc_p].[Repo_user_type_name] <> [roc_s].[Sys_user_type_name]
	    --
	    )
*/

----try to find [persistence_source_RepoObjectColumn_guid] for existing persistence columns by Column name
--UPDATE roc_p
--SET [roc_p].[persistence_source_RepoObjectColumn_guid] = [roc_s].[RepoObjectColumn_guid]
----update attributes later in a separate step:
----, [roc_p].[Repo_user_type_name] = [roc_s].[Sys_user_type_name]
----, [roc_p].[Repo_user_type_fullname] = [roc_s].[Sys_user_type_fullname]
--FROM [repo].[RepoObjectColumn] AS [roc_p]
--INNER JOIN [repo].[RepoObjectColumn] AS [roc_s]
-- ON [roc_p].[RepoObjectColumn_name] = [roc_s].[RepoObjectColumn_name]
--WHERE [roc_p].[persistence_source_RepoObjectColumn_guid] IS NULL
-- AND [roc_p].[RepoObject_guid] = @persistence_RepoObject_guid
-- AND [roc_s].[RepoObject_guid] = @source_RepoObject_guid
-- --skip special table columns (ValidFrom, ValidTo) in target (= persistence)
-- AND (
--  [roc_p].[Repo_generated_always_type] = 0
--  OR [roc_p].[Repo_generated_always_type] IS NULL
--  )
-- --skip [is_query_plan_expression] in target
-- AND (
--  [roc_p].[is_query_plan_expression] = 0
--  OR [roc_p].[is_query_plan_expression] IS NULL
--  )
--SET @rows = @@rowcount;
--SET @step_id = @step_id + 1
--SET @step_name = '[roc_p].[persistence_source_RepoObjectColumn_guid] = [roc_s].[RepoObjectColumn_guid] (matching by column name)'
--SET @source_object = '[repo].[RepoObjectColumn]'
--SET @target_object = '[repo].[RepoObjectColumn]'
--EXEC repo.usp_ExecutionLog_insert @execution_instance_guid = @execution_instance_guid
-- , @ssis_execution_id = @ssis_execution_id
-- , @sub_execution_id = @sub_execution_id
-- , @parent_execution_log_id = @parent_execution_log_id
-- , @current_execution_guid = @current_execution_guid
-- , @proc_id = @proc_id
-- , @proc_schema_name = @proc_schema_name
-- , @proc_name = @proc_name
-- , @event_info = @event_info
-- , @step_id = @step_id
-- , @step_name = @step_name
-- , @source_object = @source_object
-- , @target_object = @target_object
-- , @inserted = NULL
-- , @updated = @rows
-- , @deleted = NULL
-- , @info_01 = NULL
-- , @info_02 = NULL
-- , @info_03 = NULL
-- , @info_04 = NULL
-- , @info_05 = NULL
-- , @info_06 = NULL
-- , @info_07 = NULL
-- , @info_08 = NULL
-- , @info_09 = NULL
----add missing (in target) persistence columns, existing in source
--INSERT INTO [repo].[RepoObjectColumn] (
-- [RepoObject_guid]
-- , [RepoObjectColumn_name]
-- , [persistence_source_RepoObjectColumn_guid]
-- )
----do this in a separate step:
----, [Repo_user_type_name]
----, [Repo_user_type_fullname]
--SELECT @persistence_RepoObject_guid
-- , [roc_s].[RepoObjectColumn_name]
-- , [roc_s].[RepoObjectColumn_guid]
----, [roc_s].[Sys_user_type_name]
----, [roc_s].[Sys_user_type_fullname]
--FROM [repo].[RepoObjectColumn] AS [roc_s]
--WHERE [roc_s].[RepoObject_guid] = @source_RepoObject_guid
-- AND NOT EXISTS (
--  SELECT 1
--  FROM [repo].[RepoObjectColumn] AS [roc_p]
--  WHERE [roc_p].[RepoObject_guid] = @persistence_RepoObject_guid
--   AND [roc_p].[persistence_source_RepoObjectColumn_guid] = [roc_s].[RepoObjectColumn_guid]
--  )
-- --skip special table columns (ValidFrom, ValidTo) in source
-- AND (
--  [roc_s].[Repo_generated_always_type] = 0
--  OR [roc_s].[Repo_generated_always_type] IS NULL
--  )
-- --skip [is_query_plan_expression] in source
-- AND (
--  [roc_s].[is_query_plan_expression] = 0
--  OR [roc_s].[is_query_plan_expression] IS NULL
--  )
--SET @rows = @@rowcount;
--SET @step_id = @step_id + 1
--SET @step_name = 'add missing persistence columns existing in source'
--SET @source_object = '[repo].[RepoObjectColumn]'
--SET @target_object = '[repo].[RepoObjectColumn]'
--EXEC repo.usp_ExecutionLog_insert @execution_instance_guid = @execution_instance_guid
-- , @ssis_execution_id = @ssis_execution_id
-- , @sub_execution_id = @sub_execution_id
-- , @parent_execution_log_id = @parent_execution_log_id
-- , @current_execution_guid = @current_execution_guid
-- , @proc_id = @proc_id
-- , @proc_schema_name = @proc_schema_name
-- , @proc_name = @proc_name
-- , @event_info = @event_info
-- , @step_id = @step_id
-- , @step_name = @step_name
-- , @source_object = @source_object
-- , @target_object = @target_object
-- , @inserted = @rows
-- , @updated = NULL
-- , @deleted = NULL
-- , @info_01 = NULL
-- , @info_02 = NULL
-- , @info_03 = NULL
-- , @info_04 = NULL
-- , @info_05 = NULL
-- , @info_06 = NULL
-- , @info_07 = NULL
-- , @info_08 = NULL
-- , @info_09 = NULL
--sync new columns, use existing procedure to manage the filling of Repo_... columns
Exec repo.usp_sync_guid
    @execution_instance_guid = @execution_instance_guid
  , @ssis_execution_id = @ssis_execution_id
  , @sub_execution_id = @sub_execution_id
  , @parent_execution_log_id = @current_execution_log_id;

/*
	ensure all columns from source exists
	
	
	[has_history_columns]
	über [repo].[RepoObjectColumn] oder direkt im sql der Tabelle?
	wass passiert, wenn diese Spalten erst später hinzugefügt werden sollen?
	
	*/
-------------------------------------------------
-------------  SQL for table  -------------------
-------------------------------------------------
--
--
-------------------------------------------------
-------------  SQL for procedure  ---------------
-------------------------------------------------
--
--
----todo: which to use for persistence name? RepoObject names or SysObject names?
----SysObject Names could be still empty, if @persistence_RepoObject_guid exists only in repo but not yet in database
--SELECT
--       @persistence_schema_name = [RepoObject_schema_name]
--     , @persistence_table_name = [RepoObject_name]
--FROM
--     repo.RepoObject AS ro
--WHERE  [ro].[SysObject_type] = 'U'
--       AND [RepoObject_guid] = @persistence_RepoObject_guid
/*
	if not @persistence_RepoObject_guid is null
	check, if @persistence_RepoObject_guid exists and it is a user table
	
	check, if @persistence_RepoObject_guid is in [repo].[RepoObject_persistence]
	wenn nicht, dieses dort eintragen
	
	
	if @persistence_RepoObject_guid is null
	
	create new RepoObject and insert into [repo].[RepoObject_persistence]
	set @persistence_RepoObject_guid to the new RepoObject
	
	Spalten
	
	sql für create table
	
	nachdenken über
	- umbenannte Spalten
	- geänderter Datentyp
	- neue Spalten
	- nicht mehr existierende Spalten
	
	sql für Prozedure zum Befüllen der Persistierung 
	
	*/
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

Go
Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'ba90291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'PROCEDURE'
  , @level1name = N'usp_persistence_set';


Go
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [config].[Parameter]
* [logs].[usp_ExecutionLog_insert]
* [repo].[RepoObject]
* [repo].[RepoObject_persistence]
* [repo].[usp_sync_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_persistence_set';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'
create or update code (table and procedure) for persistence

* create or update RepoObject in xref:sqldb:repo.RepoObject.adoc[] for a new persistence target table, based on a given persistence source (view or table)
* create or update entries in xref:sqldb:repo.RepoObject_persistence.adoc[]
** default properties are used, defined in this table
*** [is_persistence_truncate] = 1
*** [is_persistence_insert] = 1
*** all others bit values = 0

TIP: see details for usage in xref:manual:persistence-generator.adoc[]

[NOTE]
.How does it work:
--
* insert or update xref:sqldb:repo.RepoObject_persistence.adoc[]
** update existing RepoObject which should be a table and will be marked as persistence
** create new RepoObject which will be a table and will be marked as persistence
* persistence source
** uses @source_RepoObject_guid, if not empty
** tries to get @source_RepoObject_guid from @source_fullname
* persistence target
** if the persistene *target table* is not defined, defaults are used:
*** same schema as persistence source
*** name of persistence source + suffix (`FROM [repo].[Parameter] WHERE [Parameter_name] = ''persistence_name_suffix''`)
** persistence target not NULL
*** use the given persistence targe
* persistence source NULL, persistence target NULL
** => error
--

[NOTE]
.pesistence procedure naming
--
the default name for the *persistence procedure* is

* ''persistence target schema''.''usp_PERSIST_'' + ''persistence target name''
+
[source,sql]
------
[SchemaName].[usp_PERSIST_SourceViewName_T]
------
--

[NOTE]
--
after executing xref:sqldb:repo.usp_persistence_set.adoc[] you need

* EXEC xref:sqldb:repo.usp_main.adoc[]
* check and update attributes in xref:sqldb:repo.RepoObject_persistence.adoc[]
* physically create the persistence table (the procedure xref:sqldb:repo.usp_persistence_set.adoc[] will only create the code)
+
[source,sql]
------
SELECT
    [RepoObject_guid]
  , [DbmlTable]
  , [RepoObject_fullname]
  , [SqlCreateTable]
  , [ConList]
  , [persistence_source_RepoObject_fullname]
  , [persistence_source_RepoObject_guid]
  , [persistence_source_SysObject_fullname]
FROM
    [repo].[RepoObject_SqlCreateTable]
WHERE
    NOT [persistence_source_RepoObject_fullname] IS NULL
ORDER BY
    [RepoObject_fullname];
------
** Use the sql statement in column [SqlCreateTable] to create the table
* get the usp code in xref:sqldb:uspgenerator.GeneratorUsp_SqlUsp.adoc[] and execute it
--', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_persistence_set';


GO
EXECUTE sp_addextendedproperty @name = N'exampleWrong_Usage', @value = N'
---this will NOT work, because there is no @persistence_schema_name
---(it is  not implemented)

EXEC repo.[usp_persistence_set]
    --
    @source_fullname = ''[graph].[Index_S]''
  , @persistence_table_name = ''Index''
  , @is_persistence_check_for_empty_source = 1
  , @is_persistence_truncate = 1
  , @is_persistence_insert = 1;', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_persistence_set';


GO
EXECUTE sp_addextendedproperty @name = N'exampleUsage_3', @value = N'
--create new persistence [SchemaName].[SourceViewName_T], 
--use explicite parameters

EXEC repo.[usp_persistence_set] 
    @source_fullname = ''[SchemaName].[SourceViewName]''
  , @has_history = 0
  , @has_history_columns = 0
  , @is_persistence_check_for_empty_source = 0
  , @is_persistence_truncate = 0
  , @is_persistence_delete_missing = 1
  , @is_persistence_delete_changed = 0
  , @is_persistence_update_changed = 1
  , @is_persistence_insert = 1', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_persistence_set';


GO
EXECUTE sp_addextendedproperty @name = N'exampleUsage_2', @value = N'
--mark an existing table as persistence of a source
--or update persistence properties
--  if the entry already exists in [repo].[RepoObject_persistence]
--we don''t need @source_RepoObject_guid, we could use @source_fullname instead
--we NEED to obtain @persistence_RepoObject_guid


DECLARE
    @source_RepoObject_guid      UNIQUEIDENTIFIER
  , @persistence_RepoObject_guid UNIQUEIDENTIFIER;

SET @source_RepoObject_guid =
(
    SELECT
        [RepoObject_guid]
    FROM
        [repo].[RepoObject]
    WHERE
        [SysObject_fullname] = ''[SchemaName].[SourceViewName]''
);

PRINT @source_RepoObject_guid;

SET @persistence_RepoObject_guid =
(
    SELECT
        [RepoObject_guid]
    FROM
        [repo].[RepoObject]
    WHERE
        [RepoObject_fullname] = ''[SchemaName].[SourceViewName_T]''
);

PRINT @persistence_RepoObject_guid;

EXEC repo.[usp_persistence_set]
    @source_RepoObject_guid = @source_RepoObject_guid
  , @persistence_RepoObject_guid = @persistence_RepoObject_guid
  , @has_history = 1 --this will create a temporal table, a table with history
  , @is_persistence_check_for_empty_source = 1
  , @is_persistence_truncate = 0
  , @is_persistence_delete_missing = 1
  , @is_persistence_delete_changed = 0
  , @is_persistence_update_changed = 1
  , @is_persistence_insert = 1;', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_persistence_set';


GO
EXECUTE sp_addextendedproperty @name = N'exampleUsage', @value = N'
--create new default persistence [SchemaName].[SourceViewName_T], 
--using default properties, defined in [repo].[RepoObject_persistence]

EXEC repo.[usp_persistence_set] @source_fullname = ''[SchemaName].[SourceViewName]'';

EXEC repo.usp_main

--get the code for the new table

SELECT
    [RepoObject_guid]
  , [RepoObject_fullname]
  , [SqlCreateTable]
FROM
    [repo].[RepoObject_SqlCreateTable]
WHERE
    [RepoObject_fullname] = ''[SchemaName].[SourceViewName_T]'';

--Execute the code from column [SqlCreateTable]

--get the code for the persistence procedure, you can limit using WHERE

SELECT
    [usp_id]
  , [SqlUsp]
  , [usp_fullname]
  , [usp_name]
  , [usp_schema]
FROM
    [uspgenerator].[GeneratorUsp_SqlUsp];

-- execute the code from column [SqlUsp]

--try to execute the generated procedure

EXEC [SchemaName].[usp_PERSIST_SourceViewName_T];', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_persistence_set';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:config.Parameter.adoc[]
* xref:logs.usp_ExecutionLog_insert.adoc[]
* xref:repo.RepoObject.adoc[]
* xref:repo.RepoObject_persistence.adoc[]
* xref:repo.usp_sync_guid.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_persistence_set';

