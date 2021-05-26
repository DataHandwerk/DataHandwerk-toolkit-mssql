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
Create Procedure logs.usp_ExecutionLog_insert
    @execution_instance_guid UniqueIdentifier
  , @ssis_execution_id       BigInt           = Null
  , @sub_execution_id        Int              = Null
  , @parent_execution_log_id BigInt           = Null
  , @current_execution_guid  UniqueIdentifier = Null
  , @proc_id                 Int              = Null
  , @proc_schema_name        NVarchar(128)    = Null
  , @proc_name               NVarchar(128)    = Null
  , @event_info              NVarchar(Max)    = Null
  , @step_id                 Int              = Null
  , @step_name               NVarchar(1000)   = Null
  , @source_object           NVarchar(261)    = Null
  , @target_object           NVarchar(261)    = Null
  , @inserted                Int              = Null
  , @updated                 Int              = Null
  , @deleted                 Int              = Null
  , @info_01                 Sql_Variant      = Null
  , @info_02                 Sql_Variant      = Null
  , @info_03                 Sql_Variant      = Null
  , @info_04                 Sql_Variant      = Null
  , @info_05                 Sql_Variant      = Null
  , @info_06                 Sql_Variant      = Null
  , @info_07                 Sql_Variant      = Null
  , @info_08                 Sql_Variant      = Null
  , @info_09                 Sql_Variant      = Null
  , @parameter_01            Sql_Variant      = Null
  , @parameter_02            Sql_Variant      = Null
  , @parameter_03            Sql_Variant      = Null
  , @parameter_04            Sql_Variant      = Null
  , @parameter_05            Sql_Variant      = Null
  , @parameter_06            Sql_Variant      = Null
  , @parameter_07            Sql_Variant      = Null
  , @parameter_08            Sql_Variant      = Null
  , @parameter_09            Sql_Variant      = Null
  , @parameter_10            Sql_Variant      = Null
  , @parameter_11            Sql_Variant      = Null
  , @parameter_12            Sql_Variant      = Null
  , @parameter_13            Sql_Variant      = Null
  , @parameter_14            Sql_Variant      = Null
  , @parameter_15            Sql_Variant      = Null
  , @parameter_16            Sql_Variant      = Null
  , @parameter_17            Sql_Variant      = Null
  , @parameter_18            Sql_Variant      = Null
  , @parameter_19            Sql_Variant      = Null
  , @parameter_20            Sql_Variant      = Null
  , @execution_log_id        BigInt           = Null Output
As
Declare @start_dt DateTime = GetDate ();

Insert Into logs.ExecutionLog
(
    execution_instance_guid
  , parent_execution_log_id
  , ssis_execution_id
  , sub_execution_id
  , current_execution_guid
  , proc_id
  , proc_schema_name
  , proc_name
  , event_info
  , step_id
  , step_name
  , created_dt
  , source_object
  , target_object
  , inserted
  , updated
  , deleted
  , info_01
  , info_02
  , info_03
  , info_04
  , info_05
  , info_06
  , info_07
  , info_08
  , info_09
  , parameter_01
  , parameter_02
  , parameter_03
  , parameter_04
  , parameter_05
  , parameter_06
  , parameter_07
  , parameter_08
  , parameter_09
  , parameter_10
  , parameter_11
  , parameter_12
  , parameter_13
  , parameter_14
  , parameter_15
  , parameter_16
  , parameter_17
  , parameter_18
  , parameter_19
  , parameter_20
)
Values
    (
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

Set @execution_log_id = Scope_Identity ();

Go
Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '8b90291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'PROCEDURE'
  , @level1name = N'usp_ExecutionLog_insert';


Go


