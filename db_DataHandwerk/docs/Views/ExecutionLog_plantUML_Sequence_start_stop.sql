
CREATE VIEW [docs].[ExecutionLog_plantUML_Sequence_start_stop]
AS
--
--, [plantUML_Sequence] = --
--  --combine the result with
--  --skinparam maxmessagesize 250
--  CASE
--      WHEN [source_object] IS NULL
--           AND [target_object] IS NULL
--      THEN CONCAT(CHAR(13) , CHAR(10) , '== ' , QUOTENAME([proc_schema_name]) , '.' , QUOTENAME([proc_name]) , ' - ' , [step_name] , ' ==' , CHAR(13) , CHAR(10) , CHAR(13) , CHAR(10))
--      ELSE CONCAT(
--      --
--      CASE
--          WHEN NOT [source_object] IS NULL
--          THEN QUOTENAME([source_object] , '"')
--      END ,
--      CASE
--          WHEN NOT [inserted] IS NULL
--          THEN CASE
--                   WHEN [source_object] IS NULL
--                   THEN '?-> '
--                   ELSE ' -> '
--               END
--          WHEN NOT [updated] IS NULL
--          THEN CASE
--                   WHEN [source_object] IS NULL
--                   THEN '?->o '
--                   ELSE ' ->O '
--               END
--          WHEN NOT [deleted] IS NULL
--          THEN CASE
--                   WHEN [source_object] IS NULL
--                   THEN '?->x '
--                   ELSE ' ->x '
--               END
--      END ,
--      CASE
--          WHEN NOT [target_object] IS NULL
--          THEN QUOTENAME([target_object] , '"')
--      END
--      --
--      --, ' : ' , QUOTENAME([step_name] , '"')
--      , ' : ' , [step_name] , CHAR(13) , CHAR(10)
--      -- "r" - rectangle note
--      , 'rnote right:' , COALESCE([inserted] , [updated] , [deleted])
--      --
--      )
--  END
--  --
--, [source_object]
--, [target_object]
--, [inserted]
--, [updated]
--, [deleted]
--, [ssis_execution_id]
--, [sub_execution_id]
--, [proc_id]
--, [step_id]
--, [created_dt]
--, [info_01]
--, [info_02]
--, [info_03]
--, [info_04]
--, [info_05]
--, [info_06]
--, [info_07]
--, [info_08]
--, [info_09]
--, [event_info]
--, [parameter_01]
--, [parameter_02]
--, [parameter_03]
--, [parameter_04]
--, [parameter_05]
--, [parameter_06]
--, [parameter_07]
--, [parameter_08]
--, [parameter_09]
--, [parameter_10]
--, [parameter_11]
--, [parameter_12]
--, [parameter_13]
--, [parameter_14]
--, [parameter_15]
--, [parameter_16]
--, [parameter_17]
--, [parameter_18]
--, [parameter_19]
--, [parameter_20]
SELECT [T1].[id]
 , [plantUML_Sequence_start_stop] = --
 --
 CONCAT (
  --
  CASE 
   WHEN [parent].[parent_proc_fullname] <> ''
    THEN CONCAT (
      '"'
      , [parent].[parent_proc_fullname]
      , '"'
      )
     --ELSE CONCAT('"' , [T1].[execution_instance_guid] , '"')
   END
  --
  , CASE [T1].[step_name]
   WHEN 'start'
    THEN ' -> '
   WHEN 'end'
    THEN ' <- '
   END
  --
  , '"'
  , [T1].[proc_fullname]
  , '"'
  --
  , CHAR(13)
  , CHAR(10)
  --
  , CASE [T1].[step_name]
   WHEN 'start'
    THEN 'activate '
   WHEN 'end'
    THEN 'deactivate '
   END
  --
  , '"'
  , [T1].[proc_fullname]
  , '"'
  )
 --
 --
 , [T1].[proc_fullname]
 , [parent].[parent_proc_fullname]
 , [T1].[created_dt]
FROM [repo].[ExecutionLog] AS T1
LEFT JOIN [repo].[ExecutionLog_parent] AS parent
 ON parent.id = T1.id
WHERE [T1].[step_name] IN (
  'start'
  , 'end'
  )
 --ORDER BY
 --         [T1].[id]

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'bf90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ExecutionLog_plantUML_Sequence_start_stop';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b2f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ExecutionLog_plantUML_Sequence_start_stop', @level2type = N'COLUMN', @level2name = N'proc_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b1f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ExecutionLog_plantUML_Sequence_start_stop', @level2type = N'COLUMN', @level2name = N'plantUML_Sequence_start_stop';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b3f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ExecutionLog_plantUML_Sequence_start_stop', @level2type = N'COLUMN', @level2name = N'parent_proc_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b0f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ExecutionLog_plantUML_Sequence_start_stop', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '08b0ba8c-ad72-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ExecutionLog_plantUML_Sequence_start_stop', @level2type = N'COLUMN', @level2name = N'created_dt';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'[repo].[ExecutionLog]
[repo].[ExecutionLog_parent]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ExecutionLog_plantUML_Sequence_start_stop';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[ExecutionLog].[proc_fullname]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ExecutionLog_plantUML_Sequence_start_stop', @level2type = N'COLUMN', @level2name = N'proc_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(quotename([proc_schema_name]),''.'',quotename([proc_name])))', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ExecutionLog_plantUML_Sequence_start_stop', @level2type = N'COLUMN', @level2name = N'proc_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[ExecutionLog_parent].[parent_proc_fullname]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ExecutionLog_plantUML_Sequence_start_stop', @level2type = N'COLUMN', @level2name = N'parent_proc_fullname';

