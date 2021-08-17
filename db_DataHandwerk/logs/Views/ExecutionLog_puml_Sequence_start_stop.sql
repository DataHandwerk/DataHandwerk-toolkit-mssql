

CREATE View logs.ExecutionLog_puml_Sequence_start_stop
As
Select
    T1.id
  , T1.execution_instance_guid
  , puml_Sequence_start_stop =
  --
  Concat (   Case
                 When parent.parent_proc_fullname <> ''
                     Then
                     Concat ( '"', parent.parent_proc_fullname, '"' )
             --ELSE CONCAT('"' , [T1].[execution_instance_guid] , '"')
             End
           , Case T1.step_name
                 When 'start'
                     Then
                     ' -> '
                 When 'end'
                     Then
                     ' <- '
             End
           , '"'
           , T1.proc_fullname
           , '"'
           , Char ( 13 ) + Char ( 10 )
           , Case T1.step_name
                 When 'start'
                     Then
                     'activate '
                 When 'end'
                     Then
                     'deactivate '
             End
           , '"'
           , T1.proc_fullname
           , '"'
         )
  , T1.proc_fullname
  , parent.parent_proc_fullname
  , T1.created_dt
From
    logs.ExecutionLog            As T1
    Left Join
        logs.ExecutionLog_parent As parent
            On
            parent.id = T1.id
Where
    T1.step_name In
    ( 'start', 'end' )
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '08b0ba8c-ad72-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_puml_Sequence_start_stop', @level2type = N'COLUMN', @level2name = N'created_dt';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b3f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_puml_Sequence_start_stop', @level2type = N'COLUMN', @level2name = N'parent_proc_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[ExecutionLog_parent].[parent_proc_fullname]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_puml_Sequence_start_stop', @level2type = N'COLUMN', @level2name = N'parent_proc_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b2f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_puml_Sequence_start_stop', @level2type = N'COLUMN', @level2name = N'proc_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[ExecutionLog].[proc_fullname]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_puml_Sequence_start_stop', @level2type = N'COLUMN', @level2name = N'proc_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(quotename([proc_schema_name]),''.'',quotename([proc_name])))', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_puml_Sequence_start_stop', @level2type = N'COLUMN', @level2name = N'proc_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ea48b3ff-fda5-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_puml_Sequence_start_stop', @level2type = N'COLUMN', @level2name = N'puml_Sequence_start_stop';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e948b3ff-fda5-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_puml_Sequence_start_stop', @level2type = N'COLUMN', @level2name = N'execution_instance_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b0f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_puml_Sequence_start_stop', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'bf90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_puml_Sequence_start_stop';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [logs].[ExecutionLog]
* [logs].[ExecutionLog_parent]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_puml_Sequence_start_stop';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'ExecutionLog_id', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_puml_Sequence_start_stop';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'id', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_puml_Sequence_start_stop';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'bigint', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_puml_Sequence_start_stop';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = 'e48f3062-759b-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_puml_Sequence_start_stop';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:logs.ftv_ExecutionLog_puml_sequence_start_stop_per_execution.adoc[]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_puml_Sequence_start_stop';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:logs.ExecutionLog.adoc[]
* xref:logs.ExecutionLog_parent.adoc[]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_puml_Sequence_start_stop';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(quotename([proc_schema_name]),''.'',quotename([proc_name])))', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_puml_Sequence_start_stop', @level2type = N'COLUMN', @level2name = N'parent_proc_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[id]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_puml_Sequence_start_stop', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[execution_instance_guid]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_puml_Sequence_start_stop', @level2type = N'COLUMN', @level2name = N'execution_instance_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[created_dt]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_puml_Sequence_start_stop', @level2type = N'COLUMN', @level2name = N'created_dt';

