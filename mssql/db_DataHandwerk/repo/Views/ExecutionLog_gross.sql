
-- Alter View ExecutionLog_gross
-- Alter View execution_log__gross

-- Alter View execution_log__gross
CREATE VIEW [repo].[ExecutionLog_gross]
AS
--
SELECT
       [id]
     , [parent_execution_log_id]
     , [execution_instance_guid]
     , [ssis_execution_id]
     , [sub_execution_id]
     , [current_execution_guid]
     , [proc_id]
     , [proc_schema_name]
     , [proc_name]
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
     , [event_info]
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
       --
     , [created_dt_min__execution_instance_guid] = MIN([created_dt]) OVER(PARTITION BY [execution_instance_guid])
     , [created_dt_max__execution_instance_guid] = MAX([created_dt]) OVER(PARTITION BY [execution_instance_guid])
     , [duration__execution_instance_guid] = DATEDIFF([ss] , MIN([created_dt]) OVER(PARTITION BY [execution_instance_guid]) , MAX([created_dt]) OVER(PARTITION BY [execution_instance_guid]))
       --
     , [plantUML_Sequence] = --
       --combine the result with
       --skinparam maxmessagesize 250
       CASE
           WHEN [source_object] IS NULL
                AND [target_object] IS NULL
           THEN CONCAT(CHAR(13) , CHAR(10) , '== ' , [proc_fullname] , ' - ' , [step_name] , ' ==' , CHAR(13) , CHAR(10) , CHAR(13) , CHAR(10))
           ELSE CONCAT(
           --
           CASE
               WHEN NOT [source_object] IS NULL
               THEN QUOTENAME([source_object] , '"')
           END ,
           CASE
               WHEN NOT [inserted] IS NULL
               THEN CASE
                        WHEN [source_object] IS NULL
                        THEN '?-> '
                        ELSE ' -> '
                    END
               WHEN NOT [updated] IS NULL
               THEN CASE
                        WHEN [source_object] IS NULL
                        THEN '?->o '
                        ELSE ' ->O '
                    END
               WHEN NOT [deleted] IS NULL
               THEN CASE
                        WHEN [source_object] IS NULL
                        THEN '?->x '
                        ELSE ' ->x '
                    END
           END ,
           CASE
               WHEN NOT [target_object] IS NULL
               THEN QUOTENAME([target_object] , '"')
           END
           --
           --, ' : ' , QUOTENAME([step_name] , '"')
           , ' : ' , [step_name] , CHAR(13) , CHAR(10)
           -- "r" - rectangle note
           , 'rnote right:' , COALESCE([inserted] , [updated] , [deleted])
           --
           )
       END
FROM
     repo.ExecutionLog