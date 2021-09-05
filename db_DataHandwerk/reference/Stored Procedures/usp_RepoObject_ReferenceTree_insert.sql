/*
code of this procedure is managed in the dhw repository. Do not modify manually.
Use [uspgenerator].[GeneratorUsp], [uspgenerator].[GeneratorUspParameter], [uspgenerator].[GeneratorUspStep], [uspgenerator].[GeneratorUsp_SqlUsp]
*/
CREATE   PROCEDURE [reference].[usp_RepoObject_ReferenceTree_insert]
@Referenced_Depth int = 30
,@Referencing_Depth int = 30
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
 , @parameter_01 = @Referenced_Depth
 , @parameter_02 = @Referencing_Depth
--
PRINT '[reference].[usp_RepoObject_ReferenceTree_insert]'
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
--
/*{"ReportUspStep":[{"Number":100,"Name":"declare variables","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',86,';',100,';',NULL);

Declare @Referenced_current Int = 2
Declare @Referencing_current Int = 2


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'declare variables'
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

-- Logging END --

/*{"ReportUspStep":[{"Number":400,"Name":"Truncate Table reference.RepoObject_ReferenceTree","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_target_object":"[reference].[RepoObject_ReferenceTree]","log_flag_InsertUpdateDelete":"D"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',86,';',400,';',NULL);

Truncate Table reference.RepoObject_ReferenceTree

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'Truncate Table reference.RepoObject_ReferenceTree'
SET @source_object = NULL
SET @target_object = '[reference].[RepoObject_ReferenceTree]'

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
 , @deleted = @rows
-- Logging END --

/*{"ReportUspStep":[{"Number":410,"Name":"initial data","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[reference].[RepoObject_ReferencingReferenced]","log_target_object":"[reference].[RepoObject_ReferenceTree]","log_flag_InsertUpdateDelete":"I"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',86,';',410,';',NULL);

--initial data
Insert Into reference.RepoObject_ReferenceTree
(
    RepoObject_guid
  , Referenced_guid
  , Referenced_Depth
  , referenced_fullname
  , referenced_fullname2
  , referenced_type
  , Referencing_guid
  , Referencing_Depth
  , referencing_fullname
  , referencing_fullname2
  , referencing_type
)
--RepoObject_guid = FirstNode.Referencing_guid 
Select
    RepoObject_guid   = FirstNode.Referencing_guid
  , FirstNode.Referenced_guid
  , Referenced_Depth  = 1
  , FirstNode.referenced_fullname
  , FirstNode.referenced_fullname2
  , FirstNode.referenced_type
  , FirstNode.Referencing_guid
  , Referencing_Depth = 0
  , FirstNode.referencing_fullname
  , FirstNode.referencing_fullname2
  , FirstNode.referencing_type
From
    reference.RepoObject_ReferencingReferenced As FirstNode
Where
    --FirstNode.Referencing_guid = @RepoObject_guid
    --And 
    1 <= @Referenced_Depth
Union All
--RepoObject_guid   = FirstNode.Referenced_guid
Select
    RepoObject_guid   = FirstNode.Referenced_guid
  , FirstNode.Referenced_guid
  , Referenced_Depth  = 0
  , FirstNode.referenced_fullname
  , FirstNode.referenced_fullname2
  , FirstNode.referenced_type
  , FirstNode.Referencing_guid
  , Referencing_Depth = 1
  , FirstNode.referencing_fullname
  , FirstNode.referencing_fullname2
  , FirstNode.referencing_type
From
    reference.RepoObject_ReferencingReferenced As FirstNode
Where
    --FirstNode.Referenced_guid = @RepoObject_guid
    --And 
    1 <= @Referencing_Depth

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'initial data'
SET @source_object = '[reference].[RepoObject_ReferencingReferenced]'
SET @target_object = '[reference].[RepoObject_ReferenceTree]'

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

/*{"ReportUspStep":[{"Number":510,"Name":"insert referenced","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[reference].[RepoObject_ReferencingReferenced]","log_target_object":"[reference].[RepoObject_ReferenceTree]","log_flag_InsertUpdateDelete":"I"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',86,';',510,';',NULL);

While @Referenced_current <= @Referenced_Depth
Begin
    Print Concat ( '@Referenced_current: ', @Referenced_current )

    Insert Into reference.RepoObject_ReferenceTree
    (
        RepoObject_guid
      , Referenced_guid
      , Referenced_Depth
      , referenced_fullname
      , referenced_fullname2
      , referenced_type
      , Referencing_guid
      , Referencing_Depth
      , referencing_fullname
      , referencing_fullname2
      , referencing_type
    )
    Select
        parent.RepoObject_guid
      , child.Referenced_guid
      , Referenced_Depth  = @Referenced_current
      , child.referenced_fullname
      , child.referenced_fullname2
      , child.referenced_type
      , child.Referencing_guid
      , Referencing_Depth = 0
      , child.referencing_fullname
      , child.referencing_fullname2
      , child.referencing_type
    From
        reference.RepoObject_ReferencingReferenced As child
        Inner Join
            reference.RepoObject_ReferenceTree     As parent
                On
                parent.Referenced_guid = child.Referencing_guid
    Where
        parent.Referenced_Depth      < @Referenced_current
        And parent.Referencing_Depth = 0
        --shortest path, don't add any deeper path
        And Not Exists
    (
        Select
            1
        From
            reference.RepoObject_ReferenceTree As tgt
        Where
            tgt.RepoObject_guid       = parent.RepoObject_guid
            And tgt.Referenced_guid   = child.Referenced_guid
            And tgt.Referencing_guid  = child.Referencing_guid
            And tgt.Referencing_Depth = 0
    )

    Set @Referenced_current = @Referenced_current + 1
End

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'insert referenced'
SET @source_object = '[reference].[RepoObject_ReferencingReferenced]'
SET @target_object = '[reference].[RepoObject_ReferenceTree]'

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

/*{"ReportUspStep":[{"Number":520,"Name":"insert referencing","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[reference].[RepoObject_ReferencingReferenced]","log_target_object":"[reference].[RepoObject_ReferenceTree]","log_flag_InsertUpdateDelete":"I"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',86,';',520,';',NULL);

While @Referencing_current <= @Referencing_Depth
Begin
    Print Concat ( '@Referencing_current: ', @Referencing_current )

    Insert Into reference.RepoObject_ReferenceTree
    (
        RepoObject_guid
      , Referenced_guid
      , Referenced_Depth
      , referenced_fullname
      , referenced_fullname2
      , referenced_type
      , Referencing_guid
      , Referencing_Depth
      , referencing_fullname
      , referencing_fullname2
      , referencing_type
    )
    Select
        parent.RepoObject_guid
      , child.Referenced_guid
      , Referenced_Depth  = 0
      , child.referenced_fullname
      , child.referenced_fullname2
      , child.referenced_type
      , child.Referencing_guid
      , Referencing_Depth = @Referencing_current
      , child.referencing_fullname
      , child.referencing_fullname2
      , child.referencing_type
    From
        reference.RepoObject_ReferencingReferenced As child
        Inner Join
            reference.RepoObject_ReferenceTree     As parent
                On
                parent.Referencing_guid = child.Referenced_guid
    Where
        parent.Referencing_Depth    < @Referencing_current
        And parent.Referenced_Depth = 0
        --shortest path, don't add any deeper path
        And Not Exists
    (
        Select
            1
        From
            reference.RepoObject_ReferenceTree As tgt
        Where
            tgt.RepoObject_guid      = parent.RepoObject_guid
            And tgt.Referenced_guid  = child.Referenced_guid
            And tgt.Referencing_guid = child.Referencing_guid
            And tgt.Referenced_Depth = 0
    )

    Set @Referencing_current = @Referencing_current + 1
End

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'insert referencing'
SET @source_object = '[reference].[RepoObject_ReferencingReferenced]'
SET @target_object = '[reference].[RepoObject_ReferenceTree]'

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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f1460ef5-1a0e-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'PROCEDURE', @level1name = N'usp_RepoObject_ReferenceTree_insert';

