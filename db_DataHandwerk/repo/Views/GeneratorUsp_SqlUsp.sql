


/*
[SqlUsp] contains the final code for the usp, defined in
- [repo].[GeneratorUsp]
- [repo].[GeneratorUspParameter]
- [repo].[GeneratorUspStep]
*/
CREATE VIEW [repo].[GeneratorUsp_SqlUsp]
AS
SELECT [u].[id] AS [usp_id]
 , [SqlUsp] = CONCAT (
  --todo - maybe add use
  'USE  ['
  , [repo].[fs_dwh_database_name]()
  , ']'
  , CHAR(13) + CHAR(10)
  , 'GO'
  , CHAR(13) + CHAR(10)
  --todo - maybe add description + example as comment
  , 'CREATE OR ALTER PROCEDURE '
  , [u].[usp_fullname]
  , CHAR(13) + CHAR(10)
  , [ParameterList].[ParameterList]
  , CASE [u].[has_logging]
   WHEN 1
    THEN CONCAT (
      IIF([ParameterList].[ParameterList] <> '', CHAR(13) + CHAR(10) + ',' + CHAR(13) + CHAR(10), '')
      , 
      '----keep the code between logging parameters and "START" unchanged!
---- parameters, used for logging; you don''t need to care about them, but you can use them, wenn calling from SSIS or in your workflow to log the context of the procedure call
  @execution_instance_guid UNIQUEIDENTIFIER = NULL --SSIS system variable ExecutionInstanceGUID could be used, any other unique guid is also fine. If NULL, then NEWID() is used to create one
, @ssis_execution_id BIGINT = NULL --only SSIS system variable ServerExecutionID should be used, or any other consistent number system, do not mix different number systems
, @sub_execution_id INT = NULL --in case you log some sub_executions, for example in SSIS loops or sub packages
, @parent_execution_log_id BIGINT = NULL --in case a sup procedure is called, the @current_execution_log_id of the parent procedure should be propagated here. It allowes call stack analyzing
AS
DECLARE
 --
   @current_execution_log_id BIGINT --this variable should be filled only once per procedure call, it contains the first logging call for the step ''start''.
 , @current_execution_guid UNIQUEIDENTIFIER = NEWID() --a unique guid for any procedure call. It should be propagated to sub procedures using "@parent_execution_log_id = @current_execution_log_id"
 , @source_object NVARCHAR(261) = NULL --use it like ''[schema].[object]'', this allows data flow vizualizatiuon (include square brackets)
 , @target_object NVARCHAR(261) = NULL --use it like ''[schema].[object]'', this allows data flow vizualizatiuon (include square brackets)
 , @proc_id INT = @@procid
 , @proc_schema_name NVARCHAR(128) = OBJECT_SCHEMA_NAME(@@procid) --schema ande name of the current procedure should be automatically logged
 , @proc_name NVARCHAR(128) = OBJECT_NAME(@@procid)               --schema ande name of the current procedure should be automatically logged
 , @event_info NVARCHAR(MAX)
 , @step_id INT = 0
 , @step_name NVARCHAR(1000) = NULL
 , @rows INT

--[event_info] get''s only the information about the "outer" calling process
--wenn the procedure calls sub procedures, the [event_info] will not change
SET @event_info = (
  SELECT [event_info]
  FROM sys.dm_exec_input_buffer(@@spid, CURRENT_REQUEST_ID())
  )

IF @execution_instance_guid IS NULL
 SET @execution_instance_guid = NEWID();
--
--SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1
SET @step_name = ''start''
SET @source_object = NULL
SET @target_object = NULL

EXEC repo.usp_ExecutionLog_insert
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
 , @step_id = @step_id --@step_id should be incremented before each call
 , @step_name = @step_name --assign individual step names for each call
 --only the "start" step should return the log id into @current_execution_log_id
 --all other calls should not overwrite @current_execution_log_id
 , @execution_log_id = @current_execution_log_id OUTPUT
----you can log the content of your own parameters, do this only in the start-step
----data type is sql_variant
'
      , [ParameterList].[ParameterListLogging]
      , '
--
PRINT '''
      , u.[usp_fullname]
      , '''
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
--
'
      )
   END --[u].[has_logging]
  , [StepList].[StepList]
  , CASE [u].[has_logging]
   WHEN 1
    THEN '
--
--finish your own code here
--keep the code between "END" and the end of the procedure unchanged!
--
--END
--
--SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = ''end''
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

GO
'
   END --[u].[has_logging]
  )
 , [AdocUspSteps] = CONCAT (
  '.Steps in '
  , [u].[usp_fullname]
  , CHAR(13) + CHAR(10)
  , '[cols="d,15a,d"]'
  , CHAR(13) + CHAR(10)
  , '|==='
  , CHAR(13) + CHAR(10)
  , '|'
  , 'Number'
  , '|'
  , 'Name (Action, Source, Target)'
  , '|'
  , 'Parent'
  , CHAR(13) + CHAR(10)
  , CHAR(13) + CHAR(10)
  , [StepList].[AdocStepList]
  , '|==='
  , CHAR(13) + CHAR(10)
  )
 , MS_Description = [u].[usp_Description]
 , [u].[has_logging]
 , [u].[usp_Description]
 , [u].[usp_fullname]
 , [u].[usp_name]
 , [u].[usp_schema]
 , UspExamples = ISNULL(u.usp_Examples, 'EXEC ' + u.usp_schema + u.usp_name)
 , UspParameters = [ParameterList].[ParameterList]
 , SqlStepList = [StepList].[StepList]
 , ro.RepoObject_guid
FROM [repo].[GeneratorUsp] AS u
LEFT JOIN [repo].[GeneratorUsp_ParameterList] AS ParameterList
 ON ParameterList.usp_id = u.id
LEFT JOIN [repo].[GeneratorUsp_StepList] AS StepList
 ON StepList.usp_id = u.id
LEFT JOIN [repo].[RepoObject] ro
 ON ro.RepoObject_fullname = u.usp_fullname

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '4990291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '36f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp', @level2type = N'COLUMN', @level2name = N'usp_schema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '37f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp', @level2type = N'COLUMN', @level2name = N'usp_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '34f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp', @level2type = N'COLUMN', @level2name = N'usp_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3af47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp', @level2type = N'COLUMN', @level2name = N'usp_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '39f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp', @level2type = N'COLUMN', @level2name = N'usp_Description';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '35f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp', @level2type = N'COLUMN', @level2name = N'SqlUsp';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '38f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp', @level2type = N'COLUMN', @level2name = N'has_logging';


GO



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[GeneratorUsp].[usp_schema]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp', @level2type = N'COLUMN', @level2name = N'usp_schema';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[GeneratorUsp].[usp_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp', @level2type = N'COLUMN', @level2name = N'usp_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[GeneratorUsp].[usp_fullname]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp', @level2type = N'COLUMN', @level2name = N'usp_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[usp_schema],''].['',[usp_name],'']''))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp', @level2type = N'COLUMN', @level2name = N'usp_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[GeneratorUsp].[usp_Description]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp', @level2type = N'COLUMN', @level2name = N'usp_Description';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[GeneratorUsp].[has_logging]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp', @level2type = N'COLUMN', @level2name = N'has_logging';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2a1a8d58-e08f-eb11-84f1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp', @level2type = N'COLUMN', @level2name = N'AdocUspSteps';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2c1a8d58-e08f-eb11-84f1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp', @level2type = N'COLUMN', @level2name = N'UspParameters';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2b1a8d58-e08f-eb11-84f1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp', @level2type = N'COLUMN', @level2name = N'UspExamples';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2d1a8d58-e08f-eb11-84f1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp', @level2type = N'COLUMN', @level2name = N'SqlStepList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2e1a8d58-e08f-eb11-84f1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '127e7a91-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp', @level2type = N'COLUMN', @level2name = N'MS_Description';

