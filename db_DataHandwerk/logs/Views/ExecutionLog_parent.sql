CREATE View logs.ExecutionLog_parent
As
Select
    T1.id
  , T1.parent_execution_log_id
  , parent.current_execution_guid As parent_current_execution_guid
  , parent.proc_id                As parent_proc_id
  , parent.proc_schema_name       As parent_proc_schema_name
  , parent.proc_name              As parent_proc_name
  , parent.step_id                As parent_step_id
  , parent.step_name              As parent_step_name
  , parent.created_dt             As parent_created_dt
  , parent.parameter_01           As parent_parameter_01
  , parent.parameter_02           As parent_parameter_02
  , parent.parameter_03           As parent_parameter_03
  , parent.parameter_04           As parent_parameter_04
  , parent.parameter_05           As parent_parameter_05
  , parent.parameter_06           As parent_parameter_06
  , parent.parameter_07           As parent_parameter_07
  , parent.parameter_08           As parent_parameter_08
  , parent.parameter_09           As parent_parameter_09
  , parent.parameter_10           As parent_parameter_10
  , parent.parameter_11           As parent_parameter_11
  , parent.parameter_12           As parent_parameter_12
  , parent.parameter_13           As parent_parameter_13
  , parent.parameter_14           As parent_parameter_14
  , parent.parameter_15           As parent_parameter_15
  , parent.parameter_16           As parent_parameter_16
  , parent.parameter_17           As parent_parameter_17
  , parent.parameter_18           As parent_parameter_18
  , parent.parameter_19           As parent_parameter_19
  , parent.parameter_20           As parent_parameter_20
  , parent.proc_fullname          As parent_proc_fullname
From
    logs.ExecutionLog     As T1
    Left Join
        logs.ExecutionLog As parent
            On
            parent.id = T1.parent_execution_log_id
Where
    Not parent.id Is Null;

Go
Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'bd90291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_parent';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '98f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_parent'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_step_name';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '97f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_parent'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_step_id';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '95f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_parent'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_proc_schema_name';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '96f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_parent'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_proc_name';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '94f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_parent'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_proc_id';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'aef77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_parent'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_proc_fullname';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'adf77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_parent'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_parameter_20';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'acf77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_parent'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_parameter_19';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'abf77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_parent'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_parameter_18';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'aaf77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_parent'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_parameter_17';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a9f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_parent'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_parameter_16';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a8f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_parent'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_parameter_15';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a7f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_parent'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_parameter_14';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a6f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_parent'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_parameter_13';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a5f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_parent'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_parameter_12';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a4f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_parent'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_parameter_11';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a3f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_parent'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_parameter_10';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a2f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_parent'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_parameter_09';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a1f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_parent'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_parameter_08';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a0f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_parent'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_parameter_07';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '9ff77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_parent'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_parameter_06';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '9ef77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_parent'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_parameter_05';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '9df77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_parent'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_parameter_04';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '9cf77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_parent'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_parameter_03';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '9bf77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_parent'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_parameter_02';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '9af77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_parent'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_parameter_01';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '92f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_parent'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_execution_log_id';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '93f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_parent'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_current_execution_guid';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '99f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_parent'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_created_dt';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '91f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_parent'
  , @level2type = N'COLUMN'
  , @level2name = N'id';


Go



Go
Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[ExecutionLog].[parent_execution_log_id]'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_parent'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_execution_log_id';


Go
Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[ExecutionLog].[id]'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_parent'
  , @level2type = N'COLUMN'
  , @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [logs].[ExecutionLog]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'ExecutionLog_id', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'id', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'bigint', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = 'e38f3062-759b-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:logs.ExecutionLog_puml_Sequence_start_stop.adoc[]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:logs.ExecutionLog.adoc[]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(quotename([proc_schema_name]),''.'',quotename([proc_name])))', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_proc_fullname';

