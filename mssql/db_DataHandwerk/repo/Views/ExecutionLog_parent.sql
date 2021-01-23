
-- Alter View ExecutionLog_parent
-- Alter View execution_log__parent
CREATE VIEW [repo].[ExecutionLog_parent]
AS
--
SELECT
       [T1].[id]
     , [T1].[parent_execution_log_id]
     , [parent].[current_execution_guid] AS [parent_current_execution_guid]
     , [parent].[proc_id] AS                [parent_proc_id]
     , [parent].[proc_schema_name] AS       [parent_proc_schema_name]
     , [parent].[proc_name] AS              [parent_proc_name]
     , [parent].[step_id] AS                [parent_step_id]
     , [parent].[step_name] AS              [parent_step_name]
     , [parent].[created_dt] AS             [parent_created_dt]
     , [parent].[parameter_01] AS           [parent_parameter_01]
     , [parent].[parameter_02] AS           [parent_parameter_02]
     , [parent].[parameter_03] AS           [parent_parameter_03]
     , [parent].[parameter_04] AS           [parent_parameter_04]
     , [parent].[parameter_05] AS           [parent_parameter_05]
     , [parent].[parameter_06] AS           [parent_parameter_06]
     , [parent].[parameter_07] AS           [parent_parameter_07]
     , [parent].[parameter_08] AS           [parent_parameter_08]
     , [parent].[parameter_09] AS           [parent_parameter_09]
     , [parent].[parameter_10] AS           [parent_parameter_10]
     , [parent].[parameter_11] AS           [parent_parameter_11]
     , [parent].[parameter_12] AS           [parent_parameter_12]
     , [parent].[parameter_13] AS           [parent_parameter_13]
     , [parent].[parameter_14] AS           [parent_parameter_14]
     , [parent].[parameter_15] AS           [parent_parameter_15]
     , [parent].[parameter_16] AS           [parent_parameter_16]
     , [parent].[parameter_17] AS           [parent_parameter_17]
     , [parent].[parameter_18] AS           [parent_parameter_18]
     , [parent].[parameter_19] AS           [parent_parameter_19]
     , [parent].[parameter_20] AS           [parent_parameter_20]
     , [parent].[proc_fullname] AS          [parent_proc_fullname]
FROM
     repo.ExecutionLog AS T1
     LEFT JOIN
     repo.ExecutionLog AS parent
     ON parent.id = T1.parent_execution_log_id
WHERE  NOT [parent].[id] IS NULL