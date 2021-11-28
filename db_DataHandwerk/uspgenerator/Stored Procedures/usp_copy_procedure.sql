/*
code of this procedure is managed in the dhw repository. Do not modify manually.
Use [uspgenerator].[GeneratorUsp], [uspgenerator].[GeneratorUspParameter], [uspgenerator].[GeneratorUspStep], [uspgenerator].[GeneratorUsp_SqlUsp]
*/
CREATE   PROCEDURE [uspgenerator].[usp_copy_procedure]
@source_usp_id int /* usp_id of the source procedure, you want to copy */
,@target_usp_schema NVARCHAR(128) = NULL /* usp_schema of the target procedure (the procedure to be created), if NULL, the source usp_schema will be used */
,@target_usp_name NVARCHAR(128) = NULL /* usp_schema of the target procedure (the procedure to be created), if NULL, the source usp_schema will be used with suffix _copy */
,
----keep the code between logging parameters and "START" unchanged!
---- parameters, used for logging; you don't need to care about them, but you can use them, wenn calling from SSIS or in your workflow to log the context of the procedure call
  @execution_instance_guid UNIQUEIDENTIFIER = NULL --SSIS system variable ExecutionInstanceGUID could be used, any other unique guid is also fine. If NULL, then NEWID() is used to create one
, @ssis_execution_id BIGINT = NULL --only SSIS system variable ServerExecutionID should be used, or any other consistent number system, do not mix different number systems
, @sub_execution_id INT = NULL --in case you log some sub_executions, for example in SSIS loops or sub packages
, @parent_execution_log_id BIGINT = NULL --in case a sup procedure is called, the @current_execution_log_id of the parent procedure should be propagated here. It allowes call stack analyzing

AS
BEGIN
DECLARE
 --
   @current_execution_log_id BIGINT --this variable should be filled only once per procedure call, it contains the first logging call for the step 'start'.
 , @current_execution_guid UNIQUEIDENTIFIER = NEWID() --a unique guid for any procedure call. It should be propagated to sub procedures using "@parent_execution_log_id = @current_execution_log_id"
 , @source_object NVARCHAR(261) = NULL --use it like '[schema].[object]', this allows data flow vizualizatiuon (include square brackets)
 , @target_object NVARCHAR(261) = NULL --use it like '[schema].[object]', this allows data flow vizualizatiuon (include square brackets)
 , @proc_id INT = @@procid
 , @proc_schema_name NVARCHAR(128) = OBJECT_SCHEMA_NAME(@@procid) --schema ande name of the current procedure should be automatically logged
 , @proc_name NVARCHAR(128) = OBJECT_NAME(@@procid)               --schema ande name of the current procedure should be automatically logged
 , @event_info NVARCHAR(MAX)
 , @step_id INT = 0
 , @step_name NVARCHAR(1000) = NULL
 , @rows INT

--[event_info] get's only the information about the "outer" calling process
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
SET @step_name = 'start'
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
 , @parameter_01 = @source_usp_id
 , @parameter_02 = @target_usp_schema
 , @parameter_03 = @target_usp_name
--
PRINT '[uspgenerator].[usp_copy_procedure]'
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
--
/*{"ReportUspStep":[{"Number":300,"Name":"copy [uspgenerator].[GeneratorUsp]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[GeneratorUsp]","log_target_object":"[repo].[GeneratorUsp]","log_flag_InsertUpdateDelete":"i"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',139,';',300,';',NULL);

Declare @target_usp_id Int

Insert Into uspgenerator.GeneratorUsp
(
    usp_schema
  , usp_name
  , has_logging
  , usp_Description
  , usp_Examples
)
Select
    usp_schema = IsNull ( @target_usp_schema, usp_schema )
  , usp_name   = IsNull ( @target_usp_name, usp_name + '_copy' )
  , has_logging
  , usp_Description
  , usp_Examples
From
    uspgenerator.GeneratorUsp
Where
    ( id = @source_usp_id )

Select
    @target_usp_id = Scope_Identity ()

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'copy [uspgenerator].[GeneratorUsp]'
SET @source_object = '[repo].[GeneratorUsp]'
SET @target_object = '[repo].[GeneratorUsp]'

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
 , @inserted = @rows
-- Logging END --

/*{"ReportUspStep":[{"Number":400,"Name":"check for inserted procedure","has_logging":0,"is_condition":1,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing]"}]}*/
IF @target_usp_id Is Null

/*{"ReportUspStep":[{"Number":410,"Parent_Number":400,"Name":"ERROR 50110: @target_usp_id empty, nothing was inserted","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":0}]}*/
BEGIN
PRINT CONCAT('usp_id;Number;Parent_Number: ',139,';',410,';',400);

 THROW 50110
  , '@target_usp_id empty, nothing was inserted'
  , 1;

END;

/*{"ReportUspStep":[{"Number":500,"Name":"copy [uspgenerator].[GeneratorUspParameter]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[uspgenerator].[GeneratorUspParameter]","log_target_object":"[uspgenerator].[GeneratorUspParameter]","log_flag_InsertUpdateDelete":"i"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',139,';',500,';',NULL);

Insert Into uspgenerator.GeneratorUspParameter
(
    usp_id
  , Number
  , Name
  , UserTypeFullname
  , is_inactive
  , is_out
  , has_DefaultValue
  , DefaultValue
  , Description
)
Select
    usp_id = @target_usp_id
  , S.Number
  , S.Name
  , S.UserTypeFullname
  , S.is_inactive
  , S.is_out
  , S.has_DefaultValue
  , S.DefaultValue
  , S.Description
From
    uspgenerator.GeneratorUspParameter As S
Where
    S.usp_id = @source_usp_id

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'copy [uspgenerator].[GeneratorUspParameter]'
SET @source_object = '[uspgenerator].[GeneratorUspParameter]'
SET @target_object = '[uspgenerator].[GeneratorUspParameter]'

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
 , @inserted = @rows
-- Logging END --

/*{"ReportUspStep":[{"Number":600,"Name":"copy [uspgenerator].[GeneratorUspStep]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[uspgenerator].[GeneratorUspStep]","log_target_object":"[uspgenerator].[GeneratorUspStep]","log_flag_InsertUpdateDelete":"i"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',139,';',600,';',NULL);

Insert Into uspgenerator.GeneratorUspStep
(
    usp_id
  , Number
  , Parent_Number
  , Name
  , has_logging
  , is_condition
  , is_inactive
  , is_SubProcedure
  , Statement
  , log_source_object
  , log_target_object
  , log_flag_InsertUpdateDelete
  , Description
  , info_01
  , info_02
  , info_03
  , info_04
  , info_05
  , info_06
  , info_07
  , info_08
  , info_09
)
Select
    usp_id = @target_usp_id
  , S.Number
  , S.Parent_Number
  , S.Name
  , S.has_logging
  , S.is_condition
  , S.is_inactive
  , S.is_SubProcedure
  , S.Statement
  , S.log_source_object
  , S.log_target_object
  , S.log_flag_InsertUpdateDelete
  , S.Description
  , S.info_01
  , S.info_02
  , S.info_03
  , S.info_04
  , S.info_05
  , S.info_06
  , S.info_07
  , S.info_08
  , S.info_09
From
    uspgenerator.GeneratorUspStep As S
Where
    ( usp_id = @source_usp_id )

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'copy [uspgenerator].[GeneratorUspStep]'
SET @source_object = '[uspgenerator].[GeneratorUspStep]'
SET @target_object = '[uspgenerator].[GeneratorUspStep]'

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
 , @inserted = @rows
-- Logging END --

--
--finish your own code here
--keep the code between "END" and the end of the procedure unchanged!
--
--END
--
--SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'end'
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

END
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f11ea651-464d-ec11-8531-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'PROCEDURE', @level1name = N'usp_copy_procedure';

