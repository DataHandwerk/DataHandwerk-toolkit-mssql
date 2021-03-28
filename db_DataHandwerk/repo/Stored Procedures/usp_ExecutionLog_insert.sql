/*
only insert, no update

to get duration and grouping, use unique combinations of keys,for example

- @execution_instance_guid (which should be unique per execution)
- @ssis_execution_id
- @sub_execution_id
- @proc_id
- @step_id
- @parent_execution_log_id

if a procedure is called several times per ssis_execution, for example the @ssis_execution_id could be used as group and @execution_instance_guid for individual execution

it is also possible to use the @execution_log_id output parameter ad to store it back as @parent_execution_log_id

*/
CREATE PROCEDURE [repo].[usp_ExecutionLog_insert] @execution_instance_guid UNIQUEIDENTIFIER
 , @ssis_execution_id BIGINT = NULL
 , @sub_execution_id INT = NULL
 , @parent_execution_log_id BIGINT = NULL
 , @current_execution_guid UNIQUEIDENTIFIER = NULL
 , @proc_id INT = NULL
 , @proc_schema_name NVARCHAR(128) = NULL
 , @proc_name NVARCHAR(128) = NULL
 , @event_info NVARCHAR(MAX) = NULL
 , @step_id INT = NULL
 , @step_name NVARCHAR(1000) = NULL
 , @source_object NVARCHAR(261) = NULL
 , @target_object NVARCHAR(261) = NULL
 , @inserted INT = NULL
 , @updated INT = NULL
 , @deleted INT = NULL
 , @info_01 SQL_VARIANT = NULL
 , @info_02 SQL_VARIANT = NULL
 , @info_03 SQL_VARIANT = NULL
 , @info_04 SQL_VARIANT = NULL
 , @info_05 SQL_VARIANT = NULL
 , @info_06 SQL_VARIANT = NULL
 , @info_07 SQL_VARIANT = NULL
 , @info_08 SQL_VARIANT = NULL
 , @info_09 SQL_VARIANT = NULL
 , @parameter_01 SQL_VARIANT = NULL
 , @parameter_02 SQL_VARIANT = NULL
 , @parameter_03 SQL_VARIANT = NULL
 , @parameter_04 SQL_VARIANT = NULL
 , @parameter_05 SQL_VARIANT = NULL
 , @parameter_06 SQL_VARIANT = NULL
 , @parameter_07 SQL_VARIANT = NULL
 , @parameter_08 SQL_VARIANT = NULL
 , @parameter_09 SQL_VARIANT = NULL
 , @parameter_10 SQL_VARIANT = NULL
 , @parameter_11 SQL_VARIANT = NULL
 , @parameter_12 SQL_VARIANT = NULL
 , @parameter_13 SQL_VARIANT = NULL
 , @parameter_14 SQL_VARIANT = NULL
 , @parameter_15 SQL_VARIANT = NULL
 , @parameter_16 SQL_VARIANT = NULL
 , @parameter_17 SQL_VARIANT = NULL
 , @parameter_18 SQL_VARIANT = NULL
 , @parameter_19 SQL_VARIANT = NULL
 , @parameter_20 SQL_VARIANT = NULL
 , @execution_log_id BIGINT = NULL OUTPUT
AS
DECLARE @start_dt DATETIME = GETDATE();

INSERT INTO repo.ExecutionLog (
 [execution_instance_guid]
 , [parent_execution_log_id]
 , [ssis_execution_id]
 , [sub_execution_id]
 , [current_execution_guid]
 , [proc_id]
 , [proc_schema_name]
 , [proc_name]
 , [event_info]
 , [step_id]
 , [step_name]
 , [created_dt]
 , [source_object]
 , [target_object]
 , [inserted]
 , [updated]
 , [deleted]
 , [info_01]
 , [info_02]
 , [info_03]
 , [info_04]
 , [info_05]
 , [info_06]
 , [info_07]
 , [info_08]
 , [info_09]
 , [parameter_01]
 , [parameter_02]
 , [parameter_03]
 , [parameter_04]
 , [parameter_05]
 , [parameter_06]
 , [parameter_07]
 , [parameter_08]
 , [parameter_09]
 , [parameter_10]
 , [parameter_11]
 , [parameter_12]
 , [parameter_13]
 , [parameter_14]
 , [parameter_15]
 , [parameter_16]
 , [parameter_17]
 , [parameter_18]
 , [parameter_19]
 , [parameter_20]
 )
VALUES (
 @execution_instance_guid
 , @parent_execution_log_id
 , @ssis_execution_id
 , @sub_execution_id
 , @current_execution_guid
 , @proc_id
 , @proc_schema_name
 , @proc_name
 , @event_info
 , @step_id
 , @step_name
 , @start_dt
 , @source_object
 , @target_object
 , @inserted
 , @updated
 , @deleted
 , @info_01
 , @info_02
 , @info_03
 , @info_04
 , @info_05
 , @info_06
 , @info_07
 , @info_08
 , @info_09
 , @parameter_01
 , @parameter_02
 , @parameter_03
 , @parameter_04
 , @parameter_05
 , @parameter_06
 , @parameter_07
 , @parameter_08
 , @parameter_09
 , @parameter_10
 , @parameter_11
 , @parameter_12
 , @parameter_13
 , @parameter_14
 , @parameter_15
 , @parameter_16
 , @parameter_17
 , @parameter_18
 , @parameter_19
 , @parameter_20
 );

SET @execution_log_id = SCOPE_IDENTITY();

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '8b90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_ExecutionLog_insert';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'[repo].[ExecutionLog]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_ExecutionLog_insert';

