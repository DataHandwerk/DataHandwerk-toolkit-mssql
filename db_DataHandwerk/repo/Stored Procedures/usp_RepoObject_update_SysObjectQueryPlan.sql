
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
CREATE PROCEDURE [repo].[usp_RepoObject_update_SysObjectQueryPlan]
 -- some optional parameters, used for logging
 @execution_instance_guid UNIQUEIDENTIFIER = NULL --SSIS system variable ExecutionInstanceGUID could be used, but other any other guid
 , @ssis_execution_id BIGINT = NULL --only SSIS system variable ServerExecutionID should be used, or any other consistent number system, do not mix
 , @sub_execution_id INT = NULL
 , @parent_execution_log_id BIGINT = NULL
AS
DECLARE @current_execution_log_id BIGINT
 , @current_execution_guid UNIQUEIDENTIFIER = NEWID()
 , @source_object NVARCHAR(261) = NULL
 , @target_object NVARCHAR(261) = NULL
 , @proc_id INT = @@procid
 , @proc_schema_name NVARCHAR(128) = OBJECT_SCHEMA_NAME(@@procid)
 , @proc_name NVARCHAR(128) = OBJECT_NAME(@@procid)
 , @event_info NVARCHAR(MAX)
 , @step_id INT = 0
 , @step_name NVARCHAR(1000) = NULL
 , @rows INT

SET @event_info = (
  SELECT [event_info]
  FROM sys.dm_exec_input_buffer(@@spid, CURRENT_REQUEST_ID())
  )

IF @execution_instance_guid IS NULL
 SET @execution_instance_guid = NEWID();
--SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1
SET @step_name = 'start'

--SET @source_object = NULL
--SET @target_object = NULL
EXEC [logs].usp_ExecutionLog_insert @execution_instance_guid = @execution_instance_guid
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
 , @execution_log_id = @current_execution_log_id OUTPUT;

--
----START
--
DECLARE @RepoObject_guid UNIQUEIDENTIFIER
 , @SysObject_query_sql NVARCHAR(4000)
 , @SysObject_query_plan XML
 , @SysObject_query_executed_dt DATETIME
 , @select_into_query AS VARCHAR(4000)

DECLARE view_cursor CURSOR
FOR
--
SELECT [ro].[RepoObject_guid]
 , [ro].[SysObject_query_sql]
 , [ro].[SysObject_query_plan]
 , [ro].[SysObject_query_executed_dt]
--, ro.[SysObject_modify_date]
FROM repo.RepoObject_gross AS ro
WHERE
 --   --only views and tables (for calculated columns)
 ----we don't need tables, references for calculated columns we have in [repo].[RepoObjectColumn_reference__sql_expression_dependencies]
 --   [ro].[SysObject_type] IN
 --                            (
 --                            'V' , 'U'
 --                            )
 --only views
 [ro].[SysObject_type] = 'V'
 AND [ro].[SysObject_query_sql] <> ''
 AND (
  [ro].[SysObject_query_plan] IS NULL
  OR [ro].[SysObject_query_executed_dt] IS NULL
  --query plan could be outdated
  OR [ro].[SysObject_query_executed_dt] < [ro].[SysObject_modify_date]
  )
 --we can't catch some issues with sys.dm_exec_query_stats
 --thats why as an workaround we exclude them
 AND ISNULL([ro].[has_execution_plan_issue], 0) = 0
ORDER BY [ro].[RepoObject_guid]

--FOR UPDATE OF [SysObject_query_plan]
-- , [SysObject_query_executed_dt]
OPEN view_cursor

FETCH NEXT
FROM view_cursor
INTO @RepoObject_guid
 , @SysObject_query_sql
 , @SysObject_query_plan
 , @SysObject_query_executed_dt

WHILE @@fetch_status <> - 1
BEGIN
 IF @@fetch_status <> - 2
 BEGIN
  SET @select_into_query = 'select top (1) * into #foo from (' + @SysObject_query_sql + ') as src'

  --information about the current RepoObject in case of error
  --some query plans can't be extracted, some can be extracted but not analyzed
  --in this case mark the RepoObject in repo.RepoObject
  --SET [has_execution_plan_issue] = 1
  PRINT CONCAT (
    @RepoObject_guid
    , ' '
    , @SysObject_query_sql
    )
  PRINT 'if you get issues and TRY CATCH doesn''t solve them, then execute this:'
  PRINT CONCAT (
    'UPDATE [repo].[RepoObject] SET [has_execution_plan_issue] = 1 WHERE [RepoObject_guid] = '''
    , @RepoObject_guid
    , ''''
    )

  DECLARE @xml_plan AS XML = NULL
   , @xml_generation_tries AS TINYINT = 10

  WHILE @xml_plan IS NULL
   AND @xml_generation_tries > 0 -- There is no guaranty that plan will be cached.
  BEGIN
   PRINT @select_into_query;

   EXECUTE (@select_into_query);

   --most time TRY CATCH doesn't work
   --sometimes any select from sys.dm_exec_query_stats results in an error:
   --Msg 681, Level 16, State 3, Line 1
   --Attempting to set a non-NULL-able column's value to NULL.
   --sometimes we get other errors
   BEGIN TRY
    SELECT @xml_plan = [pln].[query_plan]
    FROM sys.dm_exec_query_stats AS qry
    CROSS APPLY sys.dm_exec_sql_text(qry.sql_handle) AS txt
    CROSS APPLY sys.dm_exec_query_plan(qry.plan_handle) AS pln
    WHERE [txt].TEXT = @select_into_query;
   END TRY

   BEGIN CATCH
    PRINT 'Can''t get query_plan'

    UPDATE ro
    SET [has_execution_plan_issue] = 1
    FROM [repo].[RepoObject] AS [ro]
    WHERE [ro].[RepoObject_guid] = @RepoObject_guid
   END CATCH

   SET @xml_generation_tries = @xml_generation_tries - 1
  END

  --PRINT 'IF @xml_plan IS NULL';
  --IF @xml_plan IS NULL
  --    BEGIN
  --        --RAISERROR(N'Can''t extract XML query plan from cache.' , 15 , 0);
  --        RAISERROR(N'Can''t extract XML query plan from cache.' , 10 , 0);
  --        RETURN;
  --END;
  MERGE INTO [repo].[RepoObject_QueryPlan] T
  USING (
   SELECT @RepoObject_guid
    , @xml_plan
   ) AS S(RepoObject_guid, SysObject_query_plan)
   ON S.RepoObject_guid = T.RepoObject_guid
  WHEN MATCHED
   THEN
    UPDATE
    SET [SysObject_query_plan] = [S].[SysObject_query_plan]
     , [SysObject_query_executed_dt] = GETDATE()
  WHEN NOT MATCHED
   THEN
    INSERT (
     [RepoObject_guid]
     , [SysObject_query_plan]
     , [SysObject_query_executed_dt]
     )
    VALUES (
     S.RepoObject_guid
     , S.SysObject_query_plan
     , GETDATE()
     );

  --UPDATE repo.RepoObject
  --SET [SysObject_query_plan] = @xml_plan
  -- , [SysObject_query_executed_dt] = GETDATE()
  --WHERE [RepoObject_guid] = @RepoObject_guid
  SET @rows = @@rowcount;
  SET @step_id = @step_id + 1
  SET @step_name = 'UPDATE SET [SysObject_query_plan] = @xml_plan, [SysObject_query_executed_dt] = GETDATE()'
  SET @source_object = '[repo].[RepoObject]'
  SET @target_object = '[repo].[RepoObject]'

  EXEC [logs].usp_ExecutionLog_insert @execution_instance_guid = @execution_instance_guid
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
   , @updated = @rows
   , @deleted = NULL
   , @info_01 = @RepoObject_guid
   , @info_02 = @SysObject_query_sql
   , @info_03 = NULL
   , @info_04 = NULL
   , @info_05 = NULL
   , @info_06 = NULL
   , @info_07 = NULL
   , @info_08 = NULL
   , @info_09 = NULL
 END

 FETCH NEXT
 FROM view_cursor
 INTO @RepoObject_guid
  , @SysObject_query_sql
  , @SysObject_query_plan
  , @SysObject_query_executed_dt
END

CLOSE view_cursor

DEALLOCATE view_cursor

--
--END
--
--SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1;
SET @step_name = 'end'
SET @source_object = NULL
SET @target_object = NULL

EXEC [logs].usp_ExecutionLog_insert @execution_instance_guid = @execution_instance_guid
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

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9d90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_RepoObject_update_SysObjectQueryPlan';


GO


