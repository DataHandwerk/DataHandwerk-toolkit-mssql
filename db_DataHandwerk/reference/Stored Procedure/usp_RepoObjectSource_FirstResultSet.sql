/*
references on column level
target: repo.RepoObjectSource
source: sys.dm_exec_describe_first_result_set


sometimes required
truncate table [repo].[RepoObjectSource__dm_exec_describe_first_result_set]
*/
Create Procedure [reference].usp_RepoObjectSource_FirstResultSet
    -- some optional parameters, used for logging
    @execution_instance_guid UniqueIdentifier = Null --SSIS system variable ExecutionInstanceGUID could be used, but other any other guid
  , @ssis_execution_id       BigInt           = Null --only SSIS system variable ServerExecutionID should be used, or any other consistent number system, do not mix
  , @sub_execution_id        Int              = Null
  , @parent_execution_log_id BigInt           = Null
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

--SET @source_object = NULL
--SET @target_object = NULL
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
  , @execution_log_id = @current_execution_log_id Output;

--
----START
--
----Make sure that the metadata is up to date
--EXEC repo.usp_sync_guid
--     @execution_instance_guid = @execution_instance_guid
--   , @ssis_execution_id = @ssis_execution_id
--   , @sub_execution_id = @sub_execution_id
--   , @parent_execution_log_id = @current_execution_log_id
--delete FROM repo.RepoObjectSource where query_sql was updated
Delete From
[reference].RepoObjectSource_FirstResultSet
From
    [reference].RepoObjectSource_FirstResultSet
    Left Outer Join
        repo.RepoObject As ro
            On
            [reference].RepoObjectSource_FirstResultSet.RepoObject_guid = ro.RepoObject_guid
Where
    [reference].RepoObjectSource_FirstResultSet.created_dt < ro.SysObject_modify_date
    Or ro.SysObject_modify_date Is Null
    --wrong inserts from prev execution
    Or target_column_name Is Null;

Set @rows = @@RowCount;
Set @step_id = @step_id + 1;
Set @step_name = N'DELETE modified after last created:dt';
Set @source_object = Null;
Set @target_object = N'[repo].[RepoObjectSource_FirstResultSet]';

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
  , @deleted = @rows
  , @info_01 = Null
  , @info_02 = Null
  , @info_03 = Null
  , @info_04 = Null
  , @info_05 = Null
  , @info_06 = Null
  , @info_07 = Null
  , @info_08 = Null
  , @info_09 = Null;

Insert Into [reference].RepoObjectSource_FirstResultSet
(
    RepoObject_guid
  , column_ordinal
  , target_column_name
  , system_type_id
  , system_type_name
  , source_server_name
  , source_database_name
  , source_schema_name
  , source_table_name
  , source_column_name
  , is_hidden
  , created_dt
)
Select
    ro_filtered.RepoObject_guid
  , ref.column_ordinal
  , ref.name
  , ref.system_type_id
  , ref.system_type_name
  , ref.source_server
  , ref.source_database
  , ref.source_schema
  , ref.source_table
  , ref.source_column
  , ref.is_hidden
  , GetDate () As created_dt
From
(
    Select
        ro.RepoObject_guid
      , ro.SysObject_query_sql
    From
        repo.RepoObject_gross As ro
        Left Join
        (
            Select
                RepoObject_guid
              , Min ( created_dt ) As created_dt_min
            From
                [reference].RepoObjectSource_FirstResultSet As ros
            Group By
                RepoObject_guid
        )                     As ros
            On
            ro.RepoObject_guid = ros.RepoObject_guid
    Where
        Not ro.SysObject_query_sql Is Null
        --only tables and views
        And ro.SysObject_type In
            ( 'U', 'V' )
        And
        (
            ros.created_dt_min Is Null
            Or ro.SysObject_modify_date Is Null
            Or ros.created_dt_min < ro.SysObject_modify_date
        )
)                                                                                      As ro_filtered
    Cross Apply
    --schema sys should be OK here because SysObject_query_sql has a full qualified query including database_name 
    sys.dm_exec_describe_first_result_set ( ro_filtered.SysObject_query_sql, Null, 1 ) As ref
Where
    --skip invalid entries
    Not ref.name Is Null;

Set @rows = @@RowCount;
Set @step_id = @step_id + 1;
Set @step_name = N'CROSS APPLY sys.dm_exec_describe_first_result_set(ro_filtered.SysObject_query_sql , NULL , 1)';
Set @source_object = N'[repo].[RepoObject]';
Set @target_object = N'[repo].[RepoObjectSource_FirstResultSet]';

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
  , @info_01 = Null
  , @info_02 = Null
  , @info_03 = Null
  , @info_04 = Null
  , @info_05 = Null
  , @info_06 = Null
  , @info_07 = Null
  , @info_08 = Null
  , @info_09 = Null;

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
  , @value = '9390291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'PROCEDURE'
  , @level1name = N'usp_RepoObjectSource_FirstResultSet';


Go


