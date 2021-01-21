
-- Alter View execution_log__gross

CREATE VIEW [repo].[execution_log__gross]
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
     repo.execution_log
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'0900581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'duration__execution_instance_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'0600581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'created_dt_max__execution_instance_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'0700581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'created_dt_min__execution_instance_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'2200581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'parameter_13';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'2100581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'parameter_12';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'2000581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'parameter_11';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'1f00581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'parameter_10';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'1e00581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'parameter_09';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'1d00581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'parameter_08';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'1c00581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'parameter_07';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'1b00581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'parameter_06';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'1a00581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'parameter_05';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'1900581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'parameter_04';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'1800581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'parameter_03';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'1700581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'parameter_02';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'1600581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'parameter_01';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'1400581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'info_09';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'1300581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'info_08';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'1200581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'info_07';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'1100581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'info_06';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'1000581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'info_05';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'0f00581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'info_04';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'0e00581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'info_03';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'0d00581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'info_02';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'0c00581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'info_01';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'0800581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'deleted';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'2b00581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'updated';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'1500581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'inserted';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'0500581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'created_dt';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'2900581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'step_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'2800581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'step_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'2500581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'proc_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'2600581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'proc_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'2400581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'proc_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'2a00581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'sub_execution_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'2700581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'ssis_execution_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'0a00581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'execution_instance_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'2300581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'parent_execution_log_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'0b00581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = N'fcff571c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'execution_log__gross';

