
-- Create Procedure usp_RepoObjectSource_QueryPlan
-- Alter Procedure usp_RepoObjectSource_QueryPlan
-- Alter Procedure usp_RepoObjectSource__update_query_plan
-- Alter Procedure usp_RepoObjectSource__update_query_plan

-- Create Procedure usp_RepoObjectSource__query_plan__update
-- Create Procedure usp_RepoObjectSource__query_plan__update
-- Create Procedure usp_RepoObjectSource__query_plan__update
-- Alter Procedure usp_RepoObjectSource__query_plan__update
-- Alter Procedure usp_RepoObjectSource_from_query_plan__update
-- Create Procedure usp_RepoObjectSource_from_query_plan__update
-- Create Procedure usp_RepoObjectSource_from_query_plan__update
-- Create Procedure usp_RepoObjectSource_from_query_plan__update
-- Create Procedure usp_RepoObjectSource_from_query_plan__update
/*
references on column level
target: repo.RepoObjectSource__QueryPlan
source: query plan analysis of the execution of a query like
`Vselect top (1) * into #foo from (SELECT * FROM sss.aaa)`

First update query plan and write them into repo.RepoObject
then analyse the query plans and update results into 

EXEC [repo].[usp_RepoObject__update_SysObject_query_plan]
EXEC [repo].[usp_RepoObjectSource_from_query_plan__update]

some query plans can't be extracted, some can be extracted but not analyzed
in this case mark the RepoObject in repo.RepoObject
SET [has_execution_plan_issue] = 1

*/
CREATE PROCEDURE [repo].[usp_RepoObjectSource_QueryPlan]
-- some optional parameters, used for logging
     @execution_instance_guid UNIQUEIDENTIFIER = NULL --SSIS system variable ExecutionInstanceGUID could be used, but other any other guid
   , @ssis_execution_id       BIGINT           = NULL --only SSIS system variable ServerExecutionID should be used, or any other consistent number system, do not mix
   , @sub_execution_id        INT              = NULL
   , @parent_execution_log_id BIGINT           = NULL
AS
DECLARE
     @current_execution_log_id BIGINT
   , @current_execution_guid   UNIQUEIDENTIFIER = NEWID()
   , @source_object            NVARCHAR(261)    = NULL
   , @target_object            NVARCHAR(261)    = NULL
   , @proc_id                  INT              = @@procid
   , @proc_schema_name         NVARCHAR(128)    = OBJECT_SCHEMA_NAME(@@procid)
   , @proc_name                NVARCHAR(128)    = OBJECT_NAME(@@PROCID)
   , @event_info               NVARCHAR(MAX)
   , @step_id                  INT              = 0
   , @step_name                NVARCHAR(1000)   = NULL
   , @rows                     INT

SET @event_info =
(
    SELECT
           [event_info]
    FROM
         sys.dm_exec_input_buffer(@@spid , CURRENT_REQUEST_ID())
)

IF @execution_instance_guid IS NULL
    SET @execution_instance_guid = NEWID();

--SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1
SET @step_name = 'start'
SET @source_object = NULL
SET @target_object = NULL

EXEC repo.usp_ExecutionLog_insert
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
   , @inserted = NULL
   , @updated = NULL
   , @deleted = NULL
   , @info_01 = NULL
   , @info_02 = NULL
   , @info_03 = NULL
   , @info_04 = NULL
   , @info_05 = NULL
   , @info_06 = NULL
   , @info_07 = NULL
   , @info_08 = NULL
   , @info_09 = NULL
   , @execution_log_id = @current_execution_log_id OUTPUT

--
----START
--
DECLARE
     @message NVARCHAR(1000)
-- delete outdated entries, which need to be analyzed again
DELETE FROM repo.RepoObjectSource_QueryPlan
FROM [repo].[RepoObject] AS [ro]
     INNER JOIN
     [repo].[RepoObjectSource_QueryPlan]
     ON [ro].[RepoObject_guid] = [repo].[RepoObjectSource_QueryPlan].[RepoObject_guid]
        AND [ro].[SysObject_query_executed_dt] > [repo].[RepoObjectSource_QueryPlan].[SysObject_query_executed_dt]

SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1
SET @step_name = 'DELETE outdated entries, which need to be analyzed again'
SET @source_object = '[repo].[RepoObject]'
SET @target_object = '[repo].[RepoObjectSource__query_plan]'

EXEC repo.usp_ExecutionLog_insert
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
   , @inserted = NULL
   , @updated = NULL
   , @deleted = @rows
   , @info_01 = NULL
   , @info_02 = NULL
   , @info_03 = NULL
   , @info_04 = NULL
   , @info_05 = NULL
   , @info_06 = NULL
   , @info_07 = NULL
   , @info_08 = NULL
   , @info_09 = NULL

DECLARE object_cursor CURSOR READ_ONLY
FOR
    --
    SELECT
           [ro].[RepoObject_guid]
         , [ro].[SysObject_fullname]
    --, [ro].[SysObject_query_executed_dt]
    --, [ro].SysObject_query_plan
    FROM
         repo.RepoObject AS ro
    WHERE  NOT [ro].[SysObject_query_plan] IS NULL
           --only views
           AND [ro].[SysObject_type] = 'V'
           --exclude objects with has_execution_plan_issue
           AND ISNULL([ro].[has_execution_plan_issue] , 0) = 0
           AND NOT EXISTS
    (
        SELECT
               [RepoObject_guid]
        FROM
             [repo].[RepoObjectSource_QueryPlan] AS [TFilter]
        WHERE  [ro].[RepoObject_guid] = [TFilter].[RepoObject_guid]
               AND [ro].[SysObject_query_executed_dt] = [TFilter].[SysObject_query_executed_dt]
    )
    ORDER BY
             [ro].[RepoObject_guid]

DECLARE
     @RepoObject_guid    UNIQUEIDENTIFIER
   , @SysObject_fullname NVARCHAR(500)
--, @SysObject_query_executed_dt datetime
--, @SysObject_query_plan xml
OPEN object_cursor

FETCH NEXT FROM object_cursor INTO
     @RepoObject_guid
   , @SysObject_fullname
--, @SysObject_query_executed_dt, @SysObject_query_plan
WHILE @@fetch_status <> -1
    BEGIN
        IF @@fetch_status <> -2
            BEGIN

                --information about the current RepoObject in case of error
                --some query plans can't be extracted, some can be extracted but not analyzed
                --in this case mark the RepoObject in repo.RepoObject
                --SET [has_execution_plan_issue] = 1
                PRINT CONCAT(@RepoObject_guid , ' ' , @SysObject_fullname)

                BEGIN TRY

                    INSERT INTO repo.RepoObjectSource_QueryPlan
                    (
                           [RepoObject_guid]
                         , [SysObject_query_executed_dt]
                         , [target_column_name]
                         , [source_server_name]
                         , [source_database_name]
                         , [source_schema_name]
                         , [source_table_name]
                         , [source_column_name]
                         , [const_value]
                         , [target_column_info]
                         , [source_column_info]
                         , [const_info]
                    )
                    SELECT
                           [ro].[RepoObject_guid]
                         , [ro].[SysObject_query_executed_dt]
                         , [sc].[target_column_name]
                         , [sc].[source_server_name]
                         , [sc].[source_database_name]
                         , [sc].[source_schema_name]
                         , [sc].[source_table_name]
                         , [sc].[source_column_name]
                         , [sc].[const_value]
                         , [sc].[target_column_info]
                         , [sc].[source_column_info]
                         , [sc].[const_info]
                    FROM
                         repo.RepoObject AS ro
                         CROSS APPLY
                         repo.ftv_query_plan_extract_source(SysObject_query_plan) AS sc
                    WHERE  [ro].[RepoObject_guid] = @RepoObject_guid OPTION(
                                                                            MAXRECURSION 100)

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
                    SET @rows = @@ROWCOUNT;
                    SET @message = NULL
        END TRY
                BEGIN CATCH
                    SET @rows = 0;
                    SET @message = 'CATCH - can not analyze query plan'

                    UPDATE ro
                      SET
                          [has_execution_plan_issue] = 1
                    FROM   [repo].[RepoObject] AS [ro]
                    WHERE
                          [ro].[RepoObject_guid] = @RepoObject_guid
        END CATCH
                SET @step_id = @step_id + 1
                SET @step_name = 'CROSS APPLY repo.ftv_query_plan_extract_source(SysObject_query_plan)'
                SET @source_object = '[repo].[RepoObject]'
                SET @target_object = '[repo].[RepoObjectSource__query_plan]'

                EXEC repo.usp_ExecutionLog_insert
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
                   , @updated = NULL
                   , @deleted = NULL
                   , @info_01 = @RepoObject_guid
                   , @info_02 = @SysObject_fullname
                   , @info_03 = @message
                   , @info_04 = NULL
                   , @info_05 = NULL
                   , @info_06 = NULL
                   , @info_07 = NULL
                   , @info_08 = NULL
                   , @info_09 = NULL

        END
        FETCH NEXT FROM object_cursor INTO
             @RepoObject_guid
           , @SysObject_fullname
        --, @SysObject_query_executed_dt, @SysObject_query_plan
    END

CLOSE object_cursor
DEALLOCATE object_cursor

INSERT INTO repo.RepoObjectColumn
(
       [RepoObject_guid]
     , [SysObjectColumn_name]
     , [SysObjectColumn_column_id]
     , [is_query_plan_expression]
)
SELECT
       [RepoObject_guid]
     , [SysObjectColumn_name]
     , [SysObjectColumn_column_id]
     , 1 AS [is_query_plan_expression]
FROM
     repo.[SysObjectColumn_QueryPlanExpression] AS T1
WHERE  NOT EXISTS
(
    SELECT
           [SysObjectColumn_name]
    FROM
         [repo].[RepoObjectColumn] AS [roc]
    WHERE  [roc].[RepoObject_guid] = [T1].[RepoObject_guid]
           AND [roc].[SysObjectColumn_name] = [T1].[SysObjectColumn_name]
)

SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1
SET @step_name = 'INSERT missing'
SET @source_object = '[repo].[SysObjectColumn__query_plan_expression]'
SET @target_object = '[repo].[RepoObjectColumn]'

EXEC repo.usp_ExecutionLog_insert
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
   , @updated = NULL
   , @deleted = NULL
   , @info_01 = NULL
   , @info_02 = NULL
   , @info_03 = NULL
   , @info_04 = NULL
   , @info_05 = NULL
   , @info_06 = NULL
   , @info_07 = NULL
   , @info_08 = NULL
   , @info_09 = NULL

DELETE roc
FROM [repo].[RepoObjectColumn] AS [roc]
WHERE
      [is_query_plan_expression] = 1
      AND NOT EXISTS
(
    SELECT
           [SysObjectColumn_name]
    FROM
         [repo].[SysObjectColumn_QueryPlanExpression] AS [T1]
    WHERE  [roc].[RepoObject_guid] = [T1].[RepoObject_guid]
           AND [roc].[SysObjectColumn_name] = [T1].[SysObjectColumn_name]
)

SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1
SET @step_name = 'DELETE not existing'
SET @source_object = '[repo].[SysObjectColumn__query_plan_expression]'
SET @target_object = '[repo].[RepoObjectColumn]'

EXEC repo.usp_ExecutionLog_insert
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
   , @inserted = NULL
   , @updated = NULL
   , @deleted = @rows
   , @info_01 = NULL
   , @info_02 = NULL
   , @info_03 = NULL
   , @info_04 = NULL
   , @info_05 = NULL
   , @info_06 = NULL
   , @info_07 = NULL
   , @info_08 = NULL
   , @info_09 = NULL

--
--END
--
--SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1;
SET @step_name = 'end'
SET @source_object = NULL
SET @target_object = NULL

EXEC repo.usp_ExecutionLog_insert
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
   , @inserted = NULL
   , @updated = NULL
   , @deleted = NULL
   , @info_01 = NULL
   , @info_02 = NULL
   , @info_03 = NULL
   , @info_04 = NULL
   , @info_05 = NULL
   , @info_06 = NULL
   , @info_07 = NULL
   , @info_08 = NULL
   , @info_09 = NULL