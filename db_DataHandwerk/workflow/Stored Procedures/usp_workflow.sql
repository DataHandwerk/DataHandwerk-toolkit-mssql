/*
code of this procedure is managed in the dhw repository. Do not modify manually.
Use [uspgenerator].[GeneratorUsp], [uspgenerator].[GeneratorUspParameter], [uspgenerator].[GeneratorUspStep], [uspgenerator].[GeneratorUsp_SqlUsp]
*/
CREATE   PROCEDURE [workflow].[usp_workflow]
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

--
PRINT '[workflow].[usp_workflow]'
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
--
/*{"ReportUspStep":[{"Number":210,"Name":"[workflow].[usp_PERSIST_ProcedureDependency_input_PersistenceDependency]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":1,"log_flag_InsertUpdateDelete":"u"}]}*/
EXEC [workflow].[usp_PERSIST_ProcedureDependency_input_PersistenceDependency]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":220,"Name":"[workflow].[usp_PERSIST_WorkflowStep]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":1,"log_flag_InsertUpdateDelete":"u"}]}*/
EXEC [workflow].[usp_PERSIST_WorkflowStep]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":310,"Name":"[workflow].[usp_PERSIST_Workflow_ProcedureDependency_T]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":1,"log_flag_InsertUpdateDelete":"u"}]}*/
EXEC [workflow].[usp_PERSIST_Workflow_ProcedureDependency_T]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":330,"Name":"[workflow].[usp_PERSIST_Workflow_ProcedureDependency_T_bidirectional_T]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":1,"log_flag_InsertUpdateDelete":"u"}]}*/
EXEC [workflow].[usp_PERSIST_Workflow_ProcedureDependency_T_bidirectional_T]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":410,"Name":"workflow.Workflow_ProcedureDependency_T: iterative update, set is_redundant = 1","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[workflow].[Workflow_ProcedureDependency_T]","log_target_object":"[workflow].[Workflow_ProcedureDependency_T]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',51,';',410,';',NULL);

--Declare @rows Int;

Set @rows = 0;
Declare @updated Int = -1;

While @updated <> 0
Begin

    Update
        T1
    Set
        T1.is_redundant = 1
    From
        workflow.Workflow_ProcedureDependency_T             As T1
        Inner Join
            workflow.Workflow_ProcedureDependency_T_redundant As T2
                On
                T1.Workflow_id                               = T2.Workflow_id
                And T1.referencing_Procedure_RepoObject_guid = T2.referencing_Procedure_RepoObject_guid
                And T1.referenced_Procedure_RepoObject_guid  = T2.referenced_Procedure_RepoObject_guid
    Where
        ( T1.is_redundant            = 0 )
        And T2.[RownrPerReferencing] = 1;

    Set @updated = @@RowCount;
    Set @rows = @rows + @updated;

End;

--Print @updated;
--Print @rows;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'workflow.Workflow_ProcedureDependency_T: iterative update, set is_redundant = 1'
SET @source_object = '[workflow].[Workflow_ProcedureDependency_T]'
SET @target_object = '[workflow].[Workflow_ProcedureDependency_T]'

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
 , @updated = @rows
-- Logging END --

/*{"ReportUspStep":[{"Number":510,"Name":"fill [workflow].[WorkflowStep_Sortorder]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[workflow].[WorkflowStep_active]","log_target_object":"[workflow].[WorkflowStep_Sortorder]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',51,';',510,';',NULL);

Truncate Table [workflow].[WorkflowStep_Sortorder];

Insert Into [workflow].[WorkflowStep_Sortorder]
(
    Workflow_id
  , Procedure_RepoObject_guid
)

--Procedure without referenced, not yet in [WorkflowStep_Sortorder]
Select
    T1.Workflow_id
  , T1.Procedure_RepoObject_guid
From
    workflow.WorkflowStep_active As T1
Where
    --exclude those procedure that are already listed in the target table.
    Not Exists
(
    Select
        1
    From
        [workflow].[WorkflowStep_Sortorder] T2
    Where
        T2.Workflow_id                   = T1.Workflow_id
        And T2.Procedure_RepoObject_guid = T1.Procedure_RepoObject_guid
)
    -- procedure should not be referenced by other procedures
    And Not Exists
(
    Select
        1
    From
        workflow.Workflow_ProcedureDependency_T_NotInSortorder T2
    Where
        T2.Workflow_id                               = T1.Workflow_id
        And T2.referencing_Procedure_RepoObject_guid = T1.Procedure_RepoObject_guid
);



-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'fill [workflow].[WorkflowStep_Sortorder]'
SET @source_object = '[workflow].[WorkflowStep_active]'
SET @target_object = '[workflow].[WorkflowStep_Sortorder]'

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
 , @updated = @rows
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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ffa5bb9c-a0f6-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'PROCEDURE', @level1name = N'usp_workflow';


GO
EXECUTE sp_addextendedproperty @name = N'ExampleUsage', @value = N'EXEC [workflow].[usp_workflow]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'PROCEDURE', @level1name = N'usp_workflow';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:logs.usp_ExecutionLog_insert.adoc[]
* xref:workflow.usp_PERSIST_ProcedureDependency_input_PersistenceDependency.adoc[]
* xref:workflow.usp_PERSIST_Workflow_ProcedureDependency_T.adoc[]
* xref:workflow.usp_PERSIST_Workflow_ProcedureDependency_T_bidirectional_T.adoc[]
* xref:workflow.usp_PERSIST_WorkflowStep.adoc[]
* xref:workflow.Workflow_ProcedureDependency_T.adoc[]
* xref:workflow.Workflow_ProcedureDependency_T_NotInSortorder.adoc[]
* xref:workflow.Workflow_ProcedureDependency_T_redundant.adoc[]
* xref:workflow.WorkflowStep_active.adoc[]
* xref:workflow.WorkflowStep_Sortorder.adoc[]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'PROCEDURE', @level1name = N'usp_workflow';




GO
EXECUTE sp_addextendedproperty @name = N'AdocUspSteps', @value = N'.Steps in [workflow].[usp_workflow]
[cols="d,15a,d"]
|===
|Number|Name (Action, Source, Target)|Parent

|210
|
*[workflow].[usp_PERSIST_ProcedureDependency_input_PersistenceDependency]*

* `EXEC [workflow].[usp_PERSIST_ProcedureDependency_input_PersistenceDependency]`
* u

|

|220
|
*[workflow].[usp_PERSIST_WorkflowStep]*

* `EXEC [workflow].[usp_PERSIST_WorkflowStep]`
* u

|

|310
|
*[workflow].[usp_PERSIST_Workflow_ProcedureDependency_T]*

* `EXEC [workflow].[usp_PERSIST_Workflow_ProcedureDependency_T]`
* u

|

|330
|
*[workflow].[usp_PERSIST_Workflow_ProcedureDependency_T_bidirectional_T]*

* `EXEC [workflow].[usp_PERSIST_Workflow_ProcedureDependency_T_bidirectional_T]`
* u

|

|410
|
*workflow.Workflow_ProcedureDependency_T: iterative update, set is_redundant = 1*

* u
* [workflow].[Workflow_ProcedureDependency_T]
* [workflow].[Workflow_ProcedureDependency_T]

|

|510
|
*fill [workflow].[WorkflowStep_Sortorder]*

* u
* [workflow].[WorkflowStep_active]
* [workflow].[WorkflowStep_Sortorder]

|
|===
', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'PROCEDURE', @level1name = N'usp_workflow';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [logs].[usp_ExecutionLog_insert]
* [workflow].[usp_PERSIST_ProcedureDependency_input_PersistenceDependency]
* [workflow].[usp_PERSIST_Workflow_ProcedureDependency_T]
* [workflow].[usp_PERSIST_Workflow_ProcedureDependency_T_bidirectional_T]
* [workflow].[usp_PERSIST_WorkflowStep]
* [workflow].[Workflow_ProcedureDependency_T]
* [workflow].[Workflow_ProcedureDependency_T_NotInSortorder]
* [workflow].[Workflow_ProcedureDependency_T_redundant]
* [workflow].[WorkflowStep_active]
* [workflow].[WorkflowStep_Sortorder]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'PROCEDURE', @level1name = N'usp_workflow';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'PROCEDURE', @level1name = N'usp_workflow';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'PROCEDURE', @level1name = N'usp_workflow';

