
/*
references on column level
target: repo.RepoObjectSource_from_query_plan
source: query plan analysis of the execution of a query like
`Vselect top (1) * into #foo from (SELECT * FROM sss.aaa)`

First update query plan and write them into repo.RepoObject
then analyse the query plans and update results into 

EXEC [repo_sys].[usp_RepoObject_update_SysObjectQueryPlan]
EXEC [repo].[usp_RepoObjectSource_QueryPlan]

some query plans can't be extracted, some can be extracted but not analyzed
in this case mark the RepoObject in repo.RepoObject
SET [has_execution_plan_issue] = 1

*/
CREATE Procedure [reference].[usp_RepoObject_update_SysObjectQueryPlan]
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
Declare
    @RepoObject_guid             UniqueIdentifier
  , @SysObject_query_sql         NVarchar(4000)
  , @SysObject_query_plan        Xml
  , @SysObject_query_executed_dt DateTime
  , @select_into_query           As Varchar(4000);

Declare view_cursor Cursor Local Fast_Forward For
--
Select
    ro.RepoObject_guid
  , ro.SysObject_query_sql
  , ro.SysObject_query_plan
  , ro.SysObject_query_executed_dt
--, ro.[SysObject_modify_date]
From
    repo.RepoObject_gross As ro
Where
    --   --only views and tables (for calculated columns)
    ----we don't need tables, references for calculated columns we have in [repo].[RepoObjectColumn_reference__sql_expression_dependencies]
    --   [ro].[SysObject_type] IN
    --                            (
    --                            'V' , 'U'
    --                            )
    --only views
    ro.SysObject_type                             = 'V'
    And ro.SysObject_query_sql                    <> ''
    And
    (
        ro.SysObject_query_plan Is Null
        Or ro.SysObject_query_executed_dt Is Null
        --query plan could be outdated
        Or ro.SysObject_query_executed_dt         < ro.SysObject_modify_date
    )
    --we can't catch some issues with sys.dm_exec_query_stats
    --thats why as an workaround we exclude them
    And IsNull ( ro.has_execution_plan_issue, 0 ) = 0
Order By
    ro.RepoObject_guid;

--FOR UPDATE OF [SysObject_query_plan]
-- , [SysObject_query_executed_dt]
Open view_cursor;

Fetch Next From view_cursor
Into
    @RepoObject_guid
  , @SysObject_query_sql
  , @SysObject_query_plan
  , @SysObject_query_executed_dt;

While @@Fetch_Status <> -1
Begin
    If @@Fetch_Status <> -2
    Begin
        Set @select_into_query = 'select top (1) * into #foo from (' + @SysObject_query_sql + ') as src';

        --information about the current RepoObject in case of error
        --some query plans can't be extracted, some can be extracted but not analyzed
        --in this case mark the RepoObject in repo.RepoObject
        --SET [has_execution_plan_issue] = 1
        Print Concat ( @RepoObject_guid, ' ', @SysObject_query_sql );
        Print 'if you get issues and TRY CATCH doesn''t solve them, then execute this:';
        Print Concat (
                         'UPDATE [repo].[RepoObject] SET [has_execution_plan_issue] = 1 WHERE [RepoObject_guid] = '''
                       , @RepoObject_guid
                       , ''''
                     );

        Declare
            @xml_plan             As Xml     = Null
          , @xml_generation_tries As TinyInt = 10;

        While @xml_plan Is Null And @xml_generation_tries > 0 -- There is no guaranty that plan will be cached.
        Begin
            Print @select_into_query;

            Execute ( @select_into_query );

            --most time TRY CATCH doesn't work
            --sometimes any select from sys.dm_exec_query_stats results in an error:
            --Msg 681, Level 16, State 3, Line 1
            --Attempting to set a non-NULL-able column's value to NULL.
            --sometimes we get other errors
            Begin Try
                Select
                    @xml_plan = pln.query_plan
                From
                    sys.dm_exec_query_stats                             As qry
                    Cross Apply sys.dm_exec_sql_text ( qry.sql_handle ) As txt
                    Cross Apply sys.dm_exec_query_plan ( qry.plan_handle ) As pln
                Where
                    txt.text = @select_into_query;
            End Try
            Begin Catch
                Print 'Can''t get query_plan';

                Update
                    ro
                Set
                    has_execution_plan_issue = 1
                From
                    repo.RepoObject As ro
                Where
                    ro.RepoObject_guid = @RepoObject_guid;
            End Catch;

            Set @xml_generation_tries = @xml_generation_tries - 1;
        End;

        --PRINT 'IF @xml_plan IS NULL';
        --IF @xml_plan IS NULL
        --    BEGIN
        --        --RAISERROR(N'Can''t extract XML query plan from cache.' , 15 , 0);
        --        RAISERROR(N'Can''t extract XML query plan from cache.' , 10 , 0);
        --        RETURN;
        --END;
        Merge Into [reference].RepoObject_QueryPlan T
        Using
        (
            Select
                @RepoObject_guid
              , @xml_plan
        ) As S
        ( RepoObject_guid, SysObject_query_plan )
        On S.RepoObject_guid = T.RepoObject_guid
        When Matched
            Then Update Set
                     SysObject_query_plan = S.SysObject_query_plan
                   , SysObject_query_executed_dt = GetDate ()
        When Not Matched
            Then Insert
                 (
                     RepoObject_guid
                   , SysObject_query_plan
                   , SysObject_query_executed_dt
                 )
                 Values
                     (
                         S.RepoObject_guid
                       , S.SysObject_query_plan
                       , GetDate ()
                     );

        --UPDATE repo.RepoObject
        --SET [SysObject_query_plan] = @xml_plan
        -- , [SysObject_query_executed_dt] = GETDATE()
        --WHERE [RepoObject_guid] = @RepoObject_guid
        Set @rows = @@RowCount;
        Set @step_id = @step_id + 1;
        Set @step_name = N'UPDATE SET [SysObject_query_plan] = @xml_plan, [SysObject_query_executed_dt] = GETDATE()';
        Set @source_object = N'[repo].[RepoObject]';
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
          , @info_01 = @RepoObject_guid
          , @info_02 = @SysObject_query_sql
          , @info_03 = Null
          , @info_04 = Null
          , @info_05 = Null
          , @info_06 = Null
          , @info_07 = Null
          , @info_08 = Null
          , @info_09 = Null;
    End;

    Fetch Next From view_cursor
    Into
        @RepoObject_guid
      , @SysObject_query_sql
      , @SysObject_query_plan
      , @SysObject_query_executed_dt;
End;

Close view_cursor;
Deallocate view_cursor;

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
  , @value = '9d90291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'PROCEDURE'
  , @level1name = N'usp_RepoObject_update_SysObjectQueryPlan';


Go


