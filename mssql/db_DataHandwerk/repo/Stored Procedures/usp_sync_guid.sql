
-- Create Procedure usp_sync_guid
-- Create Procedure usp_sync_guid
-- Create Procedure usp_sync_guid
-- Alter Procedure usp_sync_guid
-- Alter Procedure usp_sync_guid
-- Alter Procedure usp_sync_RepoObject_RepoObjectColumn
CREATE PROCEDURE [repo].[usp_sync_guid]
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
--SET @source_object = NULL
--SET @target_object = NULL
EXEC repo.usp_execution_log__insert
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
   , @execution_log_id = @current_execution_log_id OUTPUT;
--
----START
--
EXEC repo.usp_sync_guid_RepoObject
     @execution_instance_guid = @execution_instance_guid
   , @ssis_execution_id = @ssis_execution_id
   , @sub_execution_id = @sub_execution_id
   , @parent_execution_log_id = @current_execution_log_id

EXEC repo.usp_sync_guid_RepoObjectColumn
     @execution_instance_guid = @execution_instance_guid
   , @ssis_execution_id = @ssis_execution_id
   , @sub_execution_id = @sub_execution_id
   , @parent_execution_log_id = @current_execution_log_id

--
--END
--
--SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1;
SET @step_name = 'end'
SET @source_object = NULL
SET @target_object = NULL

EXEC repo.usp_execution_log__insert
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
GO


