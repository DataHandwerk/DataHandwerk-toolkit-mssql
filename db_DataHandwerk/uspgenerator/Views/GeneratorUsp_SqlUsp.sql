
/*
[SqlUsp] contains the final code for the usp, defined in
- [repo].[GeneratorUsp]
- [repo].[GeneratorUspParameter]
- [repo].[GeneratorUspStep]
*/
CREATE View uspgenerator.GeneratorUsp_SqlUsp
As
Select
    usp_id         = u.id
  , SqlUsp         = Concat (
                                'USE  ['
                              , dwhdb.dwh_database_name
                              , ']'
                              , Char ( 13 ) + Char ( 10 )
                              , 'GO'
                              , Char ( 13 ) + Char ( 10 )
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

GO
'
                            )
  --2022-09-02 SqlViewPersistenceUpdateCheck
  , sqlview.SqlViewPersistenceUpdateCheck
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
    uspgenerator.GeneratorUsp                                   As u
    Left Join
        uspgenerator.GeneratorUsp_ParameterList                 As ParameterList
            On
            ParameterList.usp_id = u.id

    Left Join
        uspgenerator.GeneratorUsp_StepList                      As StepList
            On
            StepList.usp_id = u.id

    Left Join
        repo.RepoObject                                         As ro
            On
            ro.RepoObject_fullname = u.usp_fullname
    --2022-09-02

    Left Join
        uspgenerator.GeneratorUsp_SqlViewPersistenceUpdateCheck As sqlview
            On
            sqlview.usp_id = u.id
    Cross Join config.ftv_dwh_database ()                       As dwhdb
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '4990291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUsp_SqlUsp';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '36f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUsp_SqlUsp'
  , @level2type = N'COLUMN'
  , @level2name = N'usp_schema';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '37f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUsp_SqlUsp'
  , @level2type = N'COLUMN'
  , @level2name = N'usp_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '34f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUsp_SqlUsp'
  , @level2type = N'COLUMN'
  , @level2name = N'usp_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3af47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUsp_SqlUsp'
  , @level2type = N'COLUMN'
  , @level2name = N'usp_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '39f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUsp_SqlUsp'
  , @level2type = N'COLUMN'
  , @level2name = N'usp_Description';
Go

Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '35f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUsp_SqlUsp'
  , @level2type = N'COLUMN'
  , @level2name = N'SqlUsp';
Go

Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '38f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUsp_SqlUsp'
  , @level2type = N'COLUMN'
  , @level2name = N'has_logging';
Go

Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [uspgenerator].[GeneratorUsp].[usp_schema]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp', @level2type = N'COLUMN', @level2name = N'usp_schema';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [uspgenerator].[GeneratorUsp].[usp_name]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp', @level2type = N'COLUMN', @level2name = N'usp_name';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [uspgenerator].[GeneratorUsp].[usp_fullname]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp', @level2type = N'COLUMN', @level2name = N'usp_fullname';


Go


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [uspgenerator].[GeneratorUsp].[usp_Description]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp', @level2type = N'COLUMN', @level2name = N'usp_Description';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [uspgenerator].[GeneratorUsp].[has_logging]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp', @level2type = N'COLUMN', @level2name = N'has_logging';


Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '2a1a8d58-e08f-eb11-84f1-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUsp_SqlUsp'
  , @level2type = N'COLUMN'
  , @level2name = N'AdocUspSteps';
Go

Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '2c1a8d58-e08f-eb11-84f1-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUsp_SqlUsp'
  , @level2type = N'COLUMN'
  , @level2name = N'UspParameters';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '2b1a8d58-e08f-eb11-84f1-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUsp_SqlUsp'
  , @level2type = N'COLUMN'
  , @level2name = N'UspExamples';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '2d1a8d58-e08f-eb11-84f1-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUsp_SqlUsp'
  , @level2type = N'COLUMN'
  , @level2name = N'SqlStepList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '2e1a8d58-e08f-eb11-84f1-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUsp_SqlUsp'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '127e7a91-ca97-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUsp_SqlUsp'
  , @level2type = N'COLUMN'
  , @level2name = N'MS_Description';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [config].[ftv_dwh_database]
* [repo].[RepoObject]
* [uspgenerator].[GeneratorUsp]
* [uspgenerator].[GeneratorUsp_ParameterList]
* [uspgenerator].[GeneratorUsp_StepList]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp';


GO



GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'has_execution_plan_issue', @value = N'1', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:property.RepoObjectProperty_Collect_source_uspgenerator.adoc[]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:config.ftv_dwh_database.adoc[]
* xref:repo.RepoObject.adoc[]
* xref:uspgenerator.GeneratorUsp.adoc[]
* xref:uspgenerator.GeneratorUsp_ParameterList.adoc[]
* xref:uspgenerator.GeneratorUsp_StepList.adoc[]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [uspgenerator].[GeneratorUsp_ParameterList].[ParameterList]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp', @level2type = N'COLUMN', @level2name = N'UspParameters';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [uspgenerator].[GeneratorUsp_StepList].[StepList]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp', @level2type = N'COLUMN', @level2name = N'SqlStepList';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [uspgenerator].[GeneratorUsp].[usp_Description]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp', @level2type = N'COLUMN', @level2name = N'MS_Description';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [uspgenerator].[GeneratorUsp].[id]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp', @level2type = N'COLUMN', @level2name = N'usp_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '183ad98e-d92a-ed11-8577-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlUsp', @level2type = N'COLUMN', @level2name = N'SqlViewPersistenceUpdateCheck';

