CREATE   PROCEDURE [property].[usp_RepoObjectProperty_collect]
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
PRINT '[property].[usp_RepoObjectProperty_collect]'
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
--
/*{"ReportUspStep":[{"Number":210,"Name":"[property].[RepoObjectProperty_Collect_source_uspgenerator]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[GeneratorUsp_SqlUsp]","log_target_object":"[property].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',20,';',210,';',NULL);

Merge property.RepoObjectProperty As t
Using
(
    Select
        RepoObject_guid
      , property_name
      , property_value
    From
        property.RepoObjectProperty_Collect_source_uspgenerator
) As s
On t.RepoObject_guid = s.RepoObject_guid
   And t.property_name = s.property_name
When Matched And (
                     t.property_nvarchar <> Cast(s.property_value As NVarchar(4000))
                     Or t.property_value Is Null
                        And Not s.property_value Is Null
                     Or s.property_value Is Null
                        And Not t.property_value Is Null
                 )
    Then Update Set
             property_value = s.property_value
When Not Matched And Not s.property_value Is Null
    Then Insert
         (
             RepoObject_guid
           , property_name
           , property_value
         )
         Values
             (
                 s.RepoObject_guid
               , s.property_name
               , s.property_value
             )
----this causes sometimes conversion errors
--Output
--    deleted.*
--  , $ACTION
--  , inserted.*
;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = '[property].[RepoObjectProperty_Collect_source_uspgenerator]'
SET @source_object = '[repo].[GeneratorUsp_SqlUsp]'
SET @target_object = '[property].[RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":310,"Name":"[property].[RepoObjectProperty_Collect_source_ROGross]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject_gross]","log_target_object":"[property].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',20,';',310,';',NULL);

Merge property.RepoObjectProperty As t
Using
(
    Select
        RepoObject_guid
      , property_name
      , property_value
    From
        property.RepoObjectProperty_Collect_source_ROGross
) As s
On t.RepoObject_guid = s.RepoObject_guid
   And t.property_name = s.property_name
When Matched And (
                     t.property_nvarchar <> Cast(s.property_value As NVarchar(4000))
                     Or t.property_value Is Null
                        And Not s.property_value Is Null
                     Or s.property_value Is Null
                        And Not t.property_value Is Null
                 )
    Then Update Set
             property_value = s.property_value
When Not Matched And Not s.property_value Is Null
    Then Insert
         (
             RepoObject_guid
           , property_name
           , property_value
         )
         Values
             (
                 s.RepoObject_guid
               , s.property_name
               , s.property_value
             )
----this causes sometimes conversion errors
--Output
--    deleted.*
--  , $ACTION
--  , inserted.*
;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = '[property].[RepoObjectProperty_Collect_source_ROGross]'
SET @source_object = '[repo].[RepoObject_gross]'
SET @target_object = '[property].[RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":410,"Name":"[property].[RepoObjectProperty_Collect_source_sql_modules_definition]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[property].[RepoObjectProperty_from_sql_modules_definition]","log_target_object":"[property].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',20,';',410,';',NULL);

Merge property.RepoObjectProperty As t
Using
(
    Select
        RepoObject_guid
      , property_name
      , property_value
    From
        property.RepoObjectProperty_Collect_source_sql_modules_definition
) As s
On t.RepoObject_guid = s.RepoObject_guid
   And t.property_name = s.property_name
When Matched And (
                     t.property_nvarchar <> Cast(s.property_value As NVarchar(4000))
                     Or t.property_value Is Null
                        And Not s.property_value Is Null
                     Or s.property_value Is Null
                        And Not t.property_value Is Null
                 )
    Then Update Set
             property_value = s.property_value
When Not Matched And Not s.property_value Is Null
    Then Insert
         (
             RepoObject_guid
           , property_name
           , property_value
         )
         Values
             (
                 s.RepoObject_guid
               , s.property_name
               , s.property_value
             )
----this causes sometimes conversion errors
--Output
--    deleted.*
--  , $ACTION
--  , inserted.*
;


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = '[property].[RepoObjectProperty_Collect_source_sql_modules_definition]'
SET @source_object = '[property].[RepoObjectProperty_from_sql_modules_definition]'
SET @target_object = '[property].[RepoObjectProperty]'

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

/*{"ReportUspStep":[{"Number":3000,"Name":"DELETE WHERE [property_value] IS NULL","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[property].[RepoObjectProperty]","log_target_object":"[property].[RepoObjectProperty]","log_flag_InsertUpdateDelete":"d"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',20,';',3000,';',NULL);

DELETE
FROM [dhw_self].[property].[RepoObjectProperty]
WHERE [property_value] IS NULL

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'DELETE WHERE [property_value] IS NULL'
SET @source_object = '[property].[RepoObjectProperty]'
SET @target_object = '[property].[RepoObjectProperty]'

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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'bd24df58-0b9a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'PROCEDURE', @level1name = N'usp_RepoObjectProperty_collect';

