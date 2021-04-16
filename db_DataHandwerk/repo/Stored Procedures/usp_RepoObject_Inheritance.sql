
CREATE Procedure [repo].[usp_RepoObject_Inheritance]
    ----keep the code between logging parameters and "START" unchanged!
    ---- parameters, used for logging; you don't need to care about them, but you can use them, wenn calling from SSIS or in your workflow to log the context of the procedure call
    @execution_instance_guid UniqueIdentifier = Null --SSIS system variable ExecutionInstanceGUID could be used, any other unique guid is also fine. If NULL, then NEWID() is used to create one
  , @ssis_execution_id       BigInt           = Null --only SSIS system variable ServerExecutionID should be used, or any other consistent number system, do not mix different number systems
  , @sub_execution_id        Int              = Null --in case you log some sub_executions, for example in SSIS loops or sub packages
  , @parent_execution_log_id BigInt           = Null --in case a sup procedure is called, the @current_execution_log_id of the parent procedure should be propagated here. It allowes call stack analyzing
As
Declare
    --
    @current_execution_log_id BigInt                                           --this variable should be filled only once per procedure call, it contains the first logging call for the step 'start'.
  , @current_execution_guid   UniqueIdentifier
    = NewId ()                                                                 --a unique guid for any procedure call. It should be propagated to sub procedures using "@parent_execution_log_id = @current_execution_log_id"
  , @source_object            NVarchar(261)  = Null                            --use it like '[schema].[object]', this allows data flow vizualizatiuon (include square brackets)
  , @target_object            NVarchar(261)  = Null                            --use it like '[schema].[object]', this allows data flow vizualizatiuon (include square brackets)
  , @proc_id                  Int            = @@ProcId
  , @proc_schema_name         NVarchar(128)  = Object_Schema_Name ( @@ProcId ) --schema ande name of the current procedure should be automatically logged
  , @proc_name                NVarchar(128)  = Object_Name ( @@ProcId )        --schema ande name of the current procedure should be automatically logged
  , @event_info               NVarchar(Max)
  , @step_id                  Int            = 0
  , @step_name                NVarchar(1000) = Null
  , @rows                     Int;

--[event_info] get's only the information about the "outer" calling process
--wenn the procedure calls sub procedures, the [event_info] will not change
Set @event_info =
(
    Select
        event_info
    From
        sys.dm_exec_input_buffer ( @@Spid, Current_Request_Id ())
);

If @execution_instance_guid Is Null
    Set @execution_instance_guid = NewId ();

--
--SET @rows = @@ROWCOUNT;
Set @step_id = @step_id + 1;
Set @step_name = N'start';
Set @source_object = Null;
Set @target_object = Null;

Exec logs.usp_ExecutionLog_insert
    --these parameters should be the same for all logging execution
    @execution_instance_guid = @execution_instance_guid
  , @ssis_execution_id = @ssis_execution_id
  , @sub_execution_id = @sub_execution_id
  , @parent_execution_log_id = @parent_execution_log_id
  , @current_execution_guid = @current_execution_guid
  , @proc_id = @proc_id
  , @proc_schema_name = @proc_schema_name
  , @proc_name = @proc_name
  , @event_info = @event_info
                            --the following parameters are individual for each call
  , @step_id = @step_id     --@step_id should be incremented before each call
  , @step_name = @step_name --assign individual step names for each call
                            --only the "start" step should return the log id into @current_execution_log_id
                            --all other calls should not overwrite @current_execution_log_id
  , @execution_log_id = @current_execution_log_id Output;

----you can log the content of your own parameters, do this only in the start-step
----data type is sql_variant
--
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
Declare inheritance_cursor Cursor Local Fast_Forward For
Select
    resulting_InheritanceDefinition
From
    repo.RepoObjectProperty_InheritanceType_resulting_InheritanceDefinition
Group By
    resulting_InheritanceDefinition
Having
    ( Not ( resulting_InheritanceDefinition Is Null ));

Declare
    @resulting_InheritanceDefinition        NVarchar(4000)
  , @resulting_InheritanceDefinition_ForSql NVarchar(4000);
Declare @stmt NVarchar(Max);

Open inheritance_cursor;

Fetch Next From inheritance_cursor
Into
    @resulting_InheritanceDefinition;

While ( @@Fetch_Status <> -1 )
Begin
    If ( @@Fetch_Status <> -2 )
    Begin
        Print @resulting_InheritanceDefinition;

        --replace "'" by "''" to be used in a string
        Set @resulting_InheritanceDefinition_ForSql = Replace ( @resulting_InheritanceDefinition, '''', '''''' );

        --PRINT @resulting_InheritanceDefinition_ForSql
        Truncate Table repo.RepoObject_Inheritance_temp;

        /*
INSERT INTO [repo].[RepoObject_Inheritance_temp] (
 [RepoObject_guid]
 , [property_name]
 , [property_value]
 , [property_value_new]
 , [InheritanceType]
 , [Inheritance_StringAggSeparatorSql]
 , [is_force_inherit_empty_source]
 , [is_StringAggAllSources]
 , [resulting_InheritanceDefinition]
 , [RowNumberSource]
 , [referenced_RepoObject_guid]
 , [referenced_RepoObject_fullname]
 , [referenced_RepoObject_name]
 , [referencing_RepoObject_fullname]
 , [referencing_RepoObject_name]
 )
SELECT
 --
 [T1].[RepoObject_guid]
 , [T1].[property_name]
 , [T1].[property_value]
 , [property_value_new] = COALESCE([referencing].[Repo_definition], [repo].[fs_get_RepoObjectProperty_nvarchar]([referenced].[RepoObject_guid], 'MS_Description'))
 , [T1].[InheritanceType]
 , [T1].[Inheritance_StringAggSeparatorSql]
 , [T1].[is_force_inherit_empty_source]
 , [T1].[is_StringAggAllSources]
 , [T1].[resulting_InheritanceDefinition]
 , [RowNumberSource] = ROW_NUMBER() OVER (
  PARTITION BY [T1].[RepoObject_guid] ORDER BY [referenced].[RepoObject_fullname]
   , [referenced].[RepoObject_name]
  )
 , [T2].[referenced_RepoObject_guid]
 , [referenced_RepoObject_fullname] = [referenced].[RepoObject_fullname]
 , [referenced_RepoObject_name] = [referenced].[RepoObject_name]
 , [referencing_RepoObject_fullname] = [referencing].[RepoObject_fullname]
 , [referencing_RepoObject_name] = [referencing].[RepoObject_name]
FROM [repo].[RepoObjectProperty_InheritanceType_resulting_InheritanceDefinition] AS T1
INNER JOIN [repo].[RepoObject_reference_union] AS T2
 ON T2.[referencing_RepoObject_guid] = T1.[RepoObject_guid]
INNER JOIN [repo].[RepoObject_gross] AS referencing
 ON referencing.[RepoObject_guid] = T1.[RepoObject_guid]
INNER JOIN [repo].[RepoObject_gross] AS referenced
 ON referenced.[RepoObject_guid] = T2.[referenced_RepoObject_guid]
WHERE [T1].[resulting_InheritanceDefinition] = 'COALESCE(referencing.[Repo_definition], repo.fs_get_RepoObjectProperty_nvarchar(referenced.[RepoObject_guid], ''MS_Description''))'

*/
        Set @stmt
            = N'
INSERT INTO [repo].[RepoObject_Inheritance_temp] (
 [RepoObject_guid]
 , [property_name]
 , [property_value]
 , [property_value_new]
 , [InheritanceType]
 , [Inheritance_StringAggSeparatorSql]
 , [is_force_inherit_empty_source]
 , [is_StringAggAllSources]
 , [resulting_InheritanceDefinition]
 , [RowNumberSource]
 , [referenced_RepoObject_guid]
 , [referenced_RepoObject_fullname]
 , [referenced_RepoObject_name]
 , [referencing_RepoObject_fullname]
 , [referencing_RepoObject_name]
 )
SELECT
 --
 [T1].[RepoObject_guid]
 , [T1].[property_name]
 , [T1].[property_value]
 , [property_value_new] = ' + @resulting_InheritanceDefinition
              + N' 
 , [T1].[InheritanceType]
 , [T1].[Inheritance_StringAggSeparatorSql]
 , [T1].[is_force_inherit_empty_source]
 , [T1].[is_StringAggAllSources]
 , [T1].[resulting_InheritanceDefinition]
 , [RowNumberSource] = ROW_NUMBER() OVER (
  PARTITION BY [T1].[RepoObject_guid] ORDER BY [referenced].[RepoObject_fullname]
  )
 , [T2].[referenced_RepoObject_guid]
 , [referenced_RepoObject_fullname] = [referenced].[RepoObject_fullname]
 , [referenced_RepoObject_name] = [referenced].[RepoObject_name]
 , [referencing_RepoObject_fullname] = [referencing].[RepoObject_fullname]
 , [referencing_RepoObject_name] = [referencing].[RepoObject_name]
FROM [repo].[RepoObjectProperty_InheritanceType_resulting_InheritanceDefinition] AS T1
INNER JOIN [repo].[RepoObject_reference_union] AS T2
 ON T2.[referencing_RepoObject_guid] = T1.[RepoObject_guid]
INNER JOIN [repo].[RepoObject_gross] AS referencing
 ON referencing.[RepoObject_guid] = T1.[RepoObject_guid]
INNER JOIN [repo].[RepoObject_gross] AS referenced
 ON referenced.[RepoObject_guid] = T2.[referenced_RepoObject_guid]
WHERE [T1].[resulting_InheritanceDefinition] = ''' + @resulting_InheritanceDefinition_ForSql + N'''
'       ;

        Print @stmt;

        Execute sp_executesql @stmt = @stmt;

        Declare separator_cursor Cursor Read_Only For
        Select
            Inheritance_StringAggSeparatorSql
        From
            repo.RepoObject_Inheritance_temp
        Group By
            Inheritance_StringAggSeparatorSql;

        Declare @Inheritance_StringAggSeparatorSql NVarchar(4000);

        Open separator_cursor;

        Fetch Next From separator_cursor
        Into
            @Inheritance_StringAggSeparatorSql;

        While ( @@Fetch_Status <> -1 )
        Begin
            If ( @@Fetch_Status <> -2 )
            Begin
                --PRINT @Inheritance_StringAggSeparatorSql
                If @Inheritance_StringAggSeparatorSql Is Null
                Begin
                    --[is_StringAggAllSources] = 0
                    --T.[property_value] can't be NULL
                    --not [property_value_new] IS NULL 
                    --we need to delete, when S.[property_value_new] IS NULL
                    Merge Into repo.RepoObjectProperty As T
                    Using
                    (
                        Select
                            RepoObject_guid
                          , property_name
                          , property_value
                          , property_value_new
                        --, [InheritanceType]
                        --, [Inheritance_StringAggSeparatorSql]
                        --, [is_force_inherit_empty_source]
                        --, [is_StringAggAllSources]
                        --, [resulting_InheritanceDefinition]
                        --, [RowNumberSource]
                        --, [referenced_RepoObject_guid]
                        --, [referenced_RepoObject_fullname]
                        --, [referenced_RepoObject_name]
                        --, [referencing_RepoObject_fullname]
                        --, [referencing_RepoObject_name]
                        From
                            repo.RepoObject_Inheritance_temp
                        Where
                            --
                            is_StringAggAllSources                    = 0
                            --only the first source
                            And RowNumberSource                       = 1
                            And
                            (
                                is_force_inherit_empty_source         = 1
                                Or Not property_value_new Is Null
                            )
                            And
                            (
                                property_value Is Null
                                Or property_value                     <> property_value_new
                                Or
                                (
                                    Not property_value Is Null
                                    And is_force_inherit_empty_source = 1
                                    And property_value_new Is Null
                                )
                            )
                    ) As S
                    On S.RepoObject_guid = T.RepoObject_guid
                       And S.property_name = T.property_name
                    When Matched And Not S.property_value_new Is Null
                        Then Update Set
                                 property_value = S.property_value_new
                    When Matched And S.property_value_new Is Null
                        Then Delete
                    When Not Matched By Target And Not S.property_value_new Is Null
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
                                   , S.property_value_new
                                 )
                    Output
                        deleted.*
                      , $ACTION
                      , inserted.*;
                End;
                Else
                Begin
                    Merge Into repo.RepoObjectProperty As T
                    Using
                    (
                        Select
                            RepoObject_guid
                          , property_name
                          , property_value
                          , property_value_new
                        --, [is_force_inherit_empty_source]
                        --, [RowNumberSource]
                        From
                    (
                        Select
                            RepoObject_guid
                          , property_name
                          , property_value                = Max ( property_value )
                          , property_value_new            = Cast(String_Agg (
                                                                                Cast(property_value_new As NVarchar(Max))
                                                                              , @Inheritance_StringAggSeparatorSql
                                                                            ) Within Group(Order By
                                                                                               RowNumberSource) As NVarchar(4000))
                          --, [property_value_new] = CAST(STRING_AGG(CAST([property_value_new] as NVARCHAR(MAX)), CHAR(13)+CHAR(10)) WITHIN GROUP ( ORDER BY [RowNumberSource]) as NVARCHAR(4000))
                          --, [property_value_new] = CAST(STRING_AGG(CAST([property_value_new] as NVARCHAR(MAX)), ';') WITHIN GROUP ( ORDER BY [RowNumberSource]) as NVARCHAR(4000))
                          --, [Inheritance_StringAggSeparatorSql]
                          , is_force_inherit_empty_source = Max ( is_force_inherit_empty_source )
                          --, [is_StringAggAllSources]
                          --, [resulting_InheritanceDefinition]
                          , RowNumberSource               = Max ( RowNumberSource )
                        --, [referenced_RepoObject_guid]
                        --, [referenced_RepoObject_fullname]
                        --, [referenced_RepoObject_name]
                        --, [referencing_RepoObject_fullname]
                        --, [referencing_RepoObject_name]
                        From
                            repo.RepoObject_Inheritance_temp
                        Where
                            --
                            is_StringAggAllSources = 1
                        Group By
                            RepoObject_guid
                          , property_name
                    ) T1
                        Where
                            (
                                is_force_inherit_empty_source         = 1
                                Or Not property_value_new Is Null
                            )
                            And
                            (
                                property_value Is Null
                                Or property_value                     <> property_value_new
                                Or
                                (
                                    Not property_value Is Null
                                    And is_force_inherit_empty_source = 1
                                    And property_value_new Is Null
                                )
                            )
                    ) As S
                    On S.RepoObject_guid = T.RepoObject_guid
                       And S.property_name = T.property_name
                    When Matched And Not S.property_value_new Is Null
                        Then Update Set
                                 property_value = S.property_value_new
                    When Matched And S.property_value_new Is Null
                        Then Delete
                    When Not Matched By Target And Not S.property_value_new Is Null
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
                                   , S.property_value_new
                                 )
                    Output
                        deleted.*
                      , $ACTION
                      , inserted.*;
                End;
            End;

            Fetch Next From separator_cursor
            Into
                @Inheritance_StringAggSeparatorSql;
        End;

        Close separator_cursor;
        Deallocate separator_cursor;
    End;

    Fetch Next From inheritance_cursor
    Into
        @resulting_InheritanceDefinition;
End;

Close inheritance_cursor;
Deallocate inheritance_cursor;

--
--finish your own code here
--keep the code between "END" and the end of the procedure unchanged!
--
--END
--
--SET @rows = @@ROWCOUNT
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
  , @target_object = @target_object;
Go
Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '63b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'PROCEDURE'
  , @level1name = N'usp_RepoObject_Inheritance';

