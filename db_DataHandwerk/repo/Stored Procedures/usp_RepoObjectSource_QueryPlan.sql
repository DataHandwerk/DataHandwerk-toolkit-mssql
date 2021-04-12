/*
references on column level
target: repo.RepoObjectSource__QueryPlan
source: query plan analysis of the execution of a query like
`Vselect top (1) * into #foo from (SELECT * FROM sss.aaa)`

First update query plan and write them into repo.RepoObject_QueryPlan
then analyse the query plans and update results into 

EXEC [repo].[usp_RepoObject__update_SysObject_query_plan]
EXEC [repo].[usp_RepoObjectSource_from_query_plan__update]

some query plans can't be extracted, some can be extracted but not analyzed
in this case mark the RepoObject in repo.RepoObject
SET [has_execution_plan_issue] = 1

*/
Create Procedure repo.usp_RepoObjectSource_QueryPlan
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
  , @execution_log_id = @current_execution_log_id Output;

--
----START
--
Declare @message NVarchar(1000);

-- delete outdated entries, which need to be analyzed again
Delete From
repo.RepoObjectSource_QueryPlan
From
    repo.RepoObject_gross As ro
    Inner Join
        repo.RepoObjectSource_QueryPlan
            On
            ro.RepoObject_guid                 = repo.RepoObjectSource_QueryPlan.RepoObject_guid
            And ro.SysObject_query_executed_dt > repo.RepoObjectSource_QueryPlan.SysObject_query_executed_dt;

Set @rows = @@RowCount;
Set @step_id = @step_id + 1;
Set @step_name = N'DELETE outdated entries, which need to be analyzed again';
Set @source_object = N'[repo].[RepoObject]';
Set @target_object = N'[repo].[RepoObjectSource__query_plan]';

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

Declare object_cursor Cursor Read_Only For
--
Select
    ro.RepoObject_guid
  , ro.SysObject_fullname
--, [ro].[SysObject_query_executed_dt]
--, [ro].SysObject_query_plan
From
    repo.RepoObject_gross As ro
Where
    Not ro.SysObject_query_plan Is Null
    --only views
    And ro.SysObject_type                         = 'V'
    --exclude objects with has_execution_plan_issue
    And IsNull ( ro.has_execution_plan_issue, 0 ) = 0
    And Not Exists
(
    Select
        RepoObject_guid
    From
        repo.RepoObjectSource_QueryPlan As TFilter
    Where
        ro.RepoObject_guid                 = TFilter.RepoObject_guid
        And ro.SysObject_query_executed_dt = TFilter.SysObject_query_executed_dt
)
Order By
    ro.RepoObject_guid;

Declare
    @RepoObject_guid    UniqueIdentifier
  , @SysObject_fullname NVarchar(500);

--, @SysObject_query_executed_dt datetime
--, @SysObject_query_plan xml
Open object_cursor;

Fetch Next From object_cursor
Into
    @RepoObject_guid
  , @SysObject_fullname;

--, @SysObject_query_executed_dt, @SysObject_query_plan
While @@Fetch_Status <> -1
Begin
    If @@Fetch_Status <> -2
    Begin
        --information about the current RepoObject in case of error
        --some query plans can't be extracted, some can be extracted but not analyzed
        --in this case mark the RepoObject in repo.RepoObject
        --SET [has_execution_plan_issue] = 1
        Print Concat ( @RepoObject_guid, ' ', @SysObject_fullname );

        Begin Try
            Insert Into repo.RepoObjectSource_QueryPlan
            (
                RepoObject_guid
              , SysObject_query_executed_dt
              , target_column_name
              , source_server_name
              , source_database_name
              , source_schema_name
              , source_table_name
              , source_column_name
              , const_value
              , target_column_info
              , source_column_info
              , const_info
            )
            Select
                ro.RepoObject_guid
              , ro.SysObject_query_executed_dt
              , sc.target_column_name
              , sc.source_server_name
              , sc.source_database_name
              , sc.source_schema_name
              , sc.source_table_name
              , sc.source_column_name
              , sc.const_value
              , sc.target_column_info
              , sc.source_column_info
              , sc.const_info
            From
                repo.RepoObject_gross                                                   As ro
                Cross Apply repo.ftv_query_plan_extract_source ( SysObject_query_plan ) As sc
            Where
                ro.RepoObject_guid = @RepoObject_guid
            Option ( MaxRecursion 100 );

            --WHERE  NOT [ro].[SysObject_query_plan] IS NULL
            --       AND NOT EXISTS
            --(
            --    SELECT
            --           [RepoObject_guid]
            --    FROM
            --         [repo].[RepoObjectSource_from_query_plan] AS [TFilter]
            --    WHERE  [ro].[RepoObject_guid] = [TFilter].[RepoObject_guid]
            --           AND [ro].[SysObject_query_executed_dt] = [TFilter].[SysObject_query_executed_dt]
            --) OPTION(
            --         MAXRECURSION 20)
            Set @rows = @@RowCount;
            Set @message = Null;
        End Try
        Begin Catch
            Set @rows = 0;
            Set @message = N'CATCH - can not analyze query plan';

            Update
                ro
            Set
                has_execution_plan_issue = 1
            From
                repo.RepoObject As ro
            Where
                ro.RepoObject_guid = @RepoObject_guid;
        End Catch;

        Set @step_id = @step_id + 1;
        Set @step_name = N'CROSS APPLY repo.ftv_query_plan_extract_source(SysObject_query_plan)';
        Set @source_object = N'[repo].[RepoObject]';
        Set @target_object = N'[repo].[RepoObjectSource__query_plan]';

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
          , @info_01 = @RepoObject_guid
          , @info_02 = @SysObject_fullname
          , @info_03 = @message
          , @info_04 = Null
          , @info_05 = Null
          , @info_06 = Null
          , @info_07 = Null
          , @info_08 = Null
          , @info_09 = Null;
    End;

    Fetch Next From object_cursor
    Into
        @RepoObject_guid
      , @SysObject_fullname;
--, @SysObject_query_executed_dt, @SysObject_query_plan
End;

Close object_cursor;

Deallocate object_cursor;

Insert Into repo.RepoObjectColumn
(
    RepoObject_guid
  , SysObjectColumn_name
  , SysObjectColumn_column_id
  , is_query_plan_expression
)
Select
    RepoObject_guid
  , SysObjectColumn_name
  , SysObjectColumn_column_id
  , 1 As is_query_plan_expression
From
    repo.SysObjectColumn_QueryPlanExpression As T1
Where
    Not Exists
(
    Select
        SysObjectColumn_name
    From
        repo.RepoObjectColumn As roc
    Where
        roc.RepoObject_guid          = T1.RepoObject_guid
        And roc.SysObjectColumn_name = T1.SysObjectColumn_name
);

Set @rows = @@RowCount;
Set @step_id = @step_id + 1;
Set @step_name = N'INSERT missing';
Set @source_object = N'[repo].[SysObjectColumn__query_plan_expression]';
Set @target_object = N'[repo].[RepoObjectColumn]';

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

Delete
roc
From
    repo.RepoObjectColumn As roc
Where
    is_query_plan_expression = 1
    And Not Exists
(
    Select
        SysObjectColumn_name
    From
        repo.SysObjectColumn_QueryPlanExpression As T1
    Where
        roc.RepoObject_guid          = T1.RepoObject_guid
        And roc.SysObjectColumn_name = T1.SysObjectColumn_name
);

Set @rows = @@RowCount;
Set @step_id = @step_id + 1;
Set @step_name = N'DELETE not existing';
Set @source_object = N'[repo].[SysObjectColumn__query_plan_expression]';
Set @target_object = N'[repo].[RepoObjectColumn]';

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
  , @value = '8f90291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'PROCEDURE'
  , @level1name = N'usp_RepoObjectSource_QueryPlan';


Go


