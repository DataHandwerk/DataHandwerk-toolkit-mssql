﻿/*
[SqlUsp] contains the final code for the usp, defined in
- [repo].[GeneratorUsp]
- [repo].[GeneratorUspParameter]
- [repo].[GeneratorUspStep]

USE [...] and GO are removed to be used by AnalyticsCreator in Post-Creation-Scripts
*/
create   View [uspgenerator].[GeneratorUsp_SqlUsp_wo_GO]
As
Select
    usp_id         = u.id
  , SqlUsp_wo_GO   = Concat (
                              --  'USE  ['
                              --, dwhdb.dwh_database_name
                              --, ']'
                              --, Char ( 13 ) + Char ( 10 )
                              --, 'GO'
                              --, Char ( 13 ) + Char ( 10 )
                              ''  
                              , '/*'
                              , Char ( 13 ) + Char ( 10 )
                              , 'code of this procedure is managed in the dhw repository. Do not modify manually.'
                              , Char ( 13 ) + Char ( 10 )
                              , 'Use [uspgenerator].[GeneratorUsp], [uspgenerator].[GeneratorUspParameter], [uspgenerator].[GeneratorUspStep], [uspgenerator].[GeneratorUsp_SqlUsp]'
                              , Char ( 13 ) + Char ( 10 )
                              , '*/'
                              , Char ( 13 ) + Char ( 10 )
                              , 'CREATE OR ALTER PROCEDURE '
                              , u.usp_fullname
                              , Char ( 13 ) + Char ( 10 )
                              , ParameterList.ParameterList
                              , Case u.has_logging
                                    When 1
                                        Then
                                        Concat (
                                                   Iif(ParameterList.ParameterList <> ''
                                               , Char ( 13 ) + Char ( 10 ) + ',' + Char ( 13 ) + Char ( 10 )
                                               , '')
                                                 , '----keep the code between logging parameters and "START" unchanged!
---- parameters, used for logging; you don''t need to care about them, but you can use them, wenn calling from SSIS or in your workflow to log the context of the procedure call
  @execution_instance_guid UNIQUEIDENTIFIER = NULL --SSIS system variable ExecutionInstanceGUID could be used, any other unique guid is also fine. If NULL, then NEWID() is used to create one
, @ssis_execution_id BIGINT = NULL --only SSIS system variable ServerExecutionID should be used, or any other consistent number system, do not mix different number systems
, @sub_execution_id INT = NULL --in case you log some sub_executions, for example in SSIS loops or sub packages
, @parent_execution_log_id BIGINT = NULL --in case a sup procedure is called, the @current_execution_log_id of the parent procedure should be propagated here. It allowes call stack analyzing
'
                                               )
                                End --[u].[has_logging]
                              , '
AS
BEGIN
'
                              , Case u.has_logging
                                    When 1
                                        Then
                                        Concat (
                                                   'DECLARE
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
  SELECT TOP 1 [event_info]
  FROM sys.dm_exec_input_buffer(@@spid, CURRENT_REQUEST_ID())
  ORDER BY [event_info]
  )

IF @execution_instance_guid IS NULL
 SET @execution_instance_guid = NEWID();
--
--SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1
SET @step_name = ''start''
SET @source_object = NULL
SET @target_object = NULL

EXEC logs.usp_ExecutionLog_insert
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
                                                 , ParameterList.ParameterListLogging
                                                 , '
--
PRINT '''
                                                 , u.usp_fullname
                                                 , '''
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
--
'
                                               )
                                End --[u].[has_logging]
                              , StepList.StepList
                              , Case u.has_logging
                                    When 1
                                        Then
                                        '
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

EXEC logs.usp_ExecutionLog_insert
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
'
                                End --[u].[has_logging]
                              , '
END
'
                            )
  , AdocUspSteps   = Concat (
                                '.Steps in '
                              , u.usp_fullname
                              , Char ( 13 ) + Char ( 10 )
                              , '[cols="d,15a,d"]'
                              , Char ( 13 ) + Char ( 10 )
                              , '|==='
                              , Char ( 13 ) + Char ( 10 )
                              , '|'
                              , 'Number'
                              , '|'
                              , 'Name (Action, Source, Target)'
                              , '|'
                              , 'Parent'
                              , Char ( 13 ) + Char ( 10 )
                              , Char ( 13 ) + Char ( 10 )
                              , StepList.AdocStepList
                              , '|==='
                              , Char ( 13 ) + Char ( 10 )
                            )
  , MS_Description = u.usp_Description
  , u.has_logging
  , u.usp_Description
  , u.usp_fullname
  , u.usp_name
  , u.usp_schema
  , UspExamples    = IsNull ( u.usp_Examples, 'EXEC ' + u.usp_fullname )
  , UspParameters  = ParameterList.ParameterList
  , SqlStepList    = StepList.StepList
  , ro.RepoObject_guid
From
    uspgenerator.GeneratorUsp                   As u
    Left Join
        uspgenerator.GeneratorUsp_ParameterList As ParameterList
            On
            ParameterList.usp_id = u.id

    Left Join
        uspgenerator.GeneratorUsp_StepList      As StepList
            On
            StepList.usp_id = u.id

    Left Join
        repo.RepoObject                         As ro
            On
            ro.RepoObject_fullname = u.usp_fullname
    Cross Join config.ftv_dwh_database ()       As dwhdb
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9169cc39-c2eb-ec11-8568-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp_wo_GO', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9069cc39-c2eb-ec11-8568-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp_wo_GO', @level2type = N'COLUMN', @level2name = N'SqlStepList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8f69cc39-c2eb-ec11-8568-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp_wo_GO', @level2type = N'COLUMN', @level2name = N'UspParameters';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8e69cc39-c2eb-ec11-8568-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp_wo_GO', @level2type = N'COLUMN', @level2name = N'UspExamples';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8d69cc39-c2eb-ec11-8568-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp_wo_GO', @level2type = N'COLUMN', @level2name = N'usp_schema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8c69cc39-c2eb-ec11-8568-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp_wo_GO', @level2type = N'COLUMN', @level2name = N'usp_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8b69cc39-c2eb-ec11-8568-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp_wo_GO', @level2type = N'COLUMN', @level2name = N'usp_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8a69cc39-c2eb-ec11-8568-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp_wo_GO', @level2type = N'COLUMN', @level2name = N'usp_Description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8969cc39-c2eb-ec11-8568-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp_wo_GO', @level2type = N'COLUMN', @level2name = N'has_logging';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8869cc39-c2eb-ec11-8568-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp_wo_GO', @level2type = N'COLUMN', @level2name = N'MS_Description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8769cc39-c2eb-ec11-8568-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp_wo_GO', @level2type = N'COLUMN', @level2name = N'AdocUspSteps';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8669cc39-c2eb-ec11-8568-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp_wo_GO', @level2type = N'COLUMN', @level2name = N'SqlUsp_wo_GO';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8569cc39-c2eb-ec11-8568-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp_wo_GO', @level2type = N'COLUMN', @level2name = N'usp_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '71d4ae2c-c2eb-ec11-8568-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp_wo_GO';

