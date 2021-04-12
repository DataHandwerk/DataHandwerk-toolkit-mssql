
/*
exec repo.usp_RepoObjectColumn__update_RepoObjectColumn_column_id

exec repo.usp_RepoObjectColumn__update_RepoObjectColumn_column_id
@RepoObject_guid = '7E756329-D857-EB11-84D8-A81E8446D5B0'

*/
--if @RepoObject_guid = NULL then all RepoObject will be updated
--@OrderBy is defined by a parameter: 'RepoObjectColumn_column_id_OrderBy'
Create Procedure repo.usp_RepoObjectColumn_update_RepoObjectColumn_column_id
    --
    @RepoObject_guid         UniqueIdentifier = Null
                                                     -- some optional parameters, used for logging
  , @execution_instance_guid UniqueIdentifier = Null --SSIS system variable ExecutionInstanceGUID could be used, but other any other guid
  , @ssis_execution_id       BigInt           = Null --only SSIS system variable ServerExecutionID should be used, or any other consistent number system, do not mix
  , @sub_execution_id        Int              = Null
  , @parent_execution_log_id BigInt           = Null
--, @debug                   BIT              = 0
As
Declare
    @current_execution_log_id BigInt
  , @current_execution_guid   UniqueIdentifier = NewId ()
  , @source_object            NVarchar(261)    = Null
  , @target_object            NVarchar(261)    = Null
  , @proc_id                  Int              = @@ProcId
  , @proc_schema_name         NVarchar(128)    = Object_Schema_Name ( @@ProcId )
  , @proc_name                NVarchar(128)    = Object_Name ( @@ProcId )
  , @event_info               NVarchar(Max)
  , @step_id                  Int              = 0
  , @step_name                NVarchar(1000)   = Null
  , @rows                     Int;

Set @event_info =
(
    Select
        event_info
    From
        sys.dm_exec_input_buffer ( @@Spid, Current_Request_Id ())
);

If @execution_instance_guid Is Null
    Set @execution_instance_guid = NewId ();
--SET @rows = @@ROWCOUNT;
Set @step_id = @step_id + 1;
Set @step_name = N'start';
Set @source_object = Null;
Set @target_object = Null;

Exec logs.usp_ExecutionLog_insert
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
  , @inserted = Null
  , @updated = Null
  , @deleted = Null
  , @info_01 = Null
  , @info_02 = Null
  , @info_03 = Null
  , @info_04 = Null
  , @info_05 = Null
  , @info_06 = Null
  , @info_07 = Null
  , @info_08 = Null
  , @info_09 = Null
  , @execution_log_id = @current_execution_log_id Output;

--
----START
--
Declare @OrderBy NVarchar(1000);
Declare @sqlCommand NVarchar(4000);

--set @RepoObject_guid = '7E756329-D857-EB11-84D8-A81E8446D5B0'
Set @OrderBy
    = Cast((
               Select
                   repo.fs_get_parameter_value ( 'RepoObjectColumn_column_id_OrderBy', Default )
           ) As NVarchar(1000));
--'
--[roc].[Repo_is_identity]
--, [roc].[Repo_is_computed]
--, ISNULL([ic].[index_column_id] , 99999) --ensure PK index is sorted before other columns
--, [roc].[Repo_generated_always_type]
--, [roc].[RepoObjectColumn_name]
--'
--	SET @sqlCommand = '
--SELECT
--     [roc].[RepoObjectColumn_guid]
--     ,  [RepoObjectColumn_column_id_setpoint] = ROW_NUMBER() OVER(PARTITION BY [roc].[RepoObject_guid]
--       ORDER BY
--       --
--' + @OrderBy + '
--       --
--       )
--     , [roc].[RepoObjectColumn_column_id]
--     , [roc].[RepoObject_guid]
--     , [roc].[Repo_is_identity]
--     , [roc].[Repo_is_computed]
--     , [ic].[index_column_id]
--     , [ic].[is_index_primary_key]
--     , [roc].[Repo_generated_always_type]
--     , [roc].[SysObjectColumn_column_id]
--     , [roc].[RepoObjectColumn_name]
--FROM
--     [repo].[RepoObjectColumn] AS roc
--     LEFT JOIN
--     [repo].[IndexColumn_union] AS ic
--     ON ic.RepoObjectColumn_guid = roc.RepoObjectColumn_guid
--        AND ic.[is_index_primary_key] = 1
--WHERE
----not [is_query_plan_expression]
--[is_query_plan_expression] IS NULL
----we need the datatype
--AND NOT [Repo_user_type_fullname] IS NULL
--'
--	IF NOT @RepoObject_guid IS NULL
--		SET @sqlCommand = @sqlCommand + '
--AND [roc].[RepoObject_guid] = @RepoObject_guid
--'
Set @sqlCommand
    = Concat (
                 '
UPDATE roc
SET [RepoObjectColumn_column_id] = rocg.[RepoObjectColumn_column_id_setpoint]
FROM repo.RepoObjectColumn roc
LEFT JOIN (
 SELECT [roc].[RepoObjectColumn_guid]
  , [RepoObjectColumn_column_id_setpoint] = ROW_NUMBER() OVER (
   PARTITION BY [roc].[RepoObject_guid] ORDER BY
       --
'
               , @OrderBy
               , '
       --
   )
  , [roc].[RepoObjectColumn_column_id]
  , [roc].[RepoObject_guid]
  , [roc].[Repo_is_identity]
  , [roc].[Repo_is_computed]
  , [ic].[index_column_id]
  , [ic].[is_index_primary_key]
  , [roc].[Repo_generated_always_type]
  , [roc].[SysObjectColumn_column_id]
  , [roc].[RepoObjectColumn_name]
 FROM [repo].[RepoObjectColumn] AS roc
 LEFT JOIN [repo].[IndexColumn_union] AS ic
  ON ic.RepoObjectColumn_guid = roc.RepoObjectColumn_guid
   AND ic.[is_index_primary_key] = 1
 WHERE
  --not [is_query_plan_expression]
  [is_query_plan_expression] IS NULL
  --we need the datatype
  AND NOT [roc].[Repo_user_type_fullname] IS NULL
'
               , Case
                     When Not @RepoObject_guid Is Null
                         Then
                         ' AND [roc].[RepoObject_guid] = @RepoObject_guid
'
                 End
               , ' ) rocg
 ON rocg.[RepoObjectColumn_guid] = roc.RepoObjectColumn_guid
WHERE rocg.[RepoObjectColumn_column_id_setpoint] <> ISNULL(roc.RepoObjectColumn_column_id, 0)
'
             );

Print @sqlCommand;

--EXECUTE sp_executesql @sqlCommand
Execute sp_executesql
    @sqlCommand
  , N'@RepoObject_guid uniqueidentifier'
  , @RepoObject_guid = @RepoObject_guid;

--
--END
--
--SET @rows = @@ROWCOUNT;
Set @step_id = @step_id + 1;
Set @step_name = N'end';
Set @source_object = Null;
Set @target_object = Null;

Exec logs.usp_ExecutionLog_insert
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
  , @inserted = Null
  , @updated = Null
  , @deleted = Null
  , @info_01 = Null
  , @info_02 = Null
  , @info_03 = Null
  , @info_04 = Null
  , @info_05 = Null
  , @info_06 = Null
  , @info_07 = Null
  , @info_08 = Null
  , @info_09 = Null;

Go
Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '9b90291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'PROCEDURE'
  , @level1name = N'usp_RepoObjectColumn_update_RepoObjectColumn_column_id';


Go


