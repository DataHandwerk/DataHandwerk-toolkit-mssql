

CREATE View [logs].[ExecutionLog_parent]
As
Select
    T1.id
  , T1.parent_execution_log_id
  , parent_current_execution_guid = parent.current_execution_guid
  , parent_proc_id                = parent.proc_id
  , parent_proc_schema_name       = parent.proc_schema_name
  , parent_proc_name              = parent.proc_name
  , parent_step_id                = parent.step_id
  , parent_step_name              = parent.step_name
  , parent_created_dt             = parent.created_dt
  , parent_parameter_01           = parent.parameter_01
  , parent_parameter_02           = parent.parameter_02
  , parent_parameter_03           = parent.parameter_03
  , parent_parameter_04           = parent.parameter_04
  , parent_parameter_05           = parent.parameter_05
  , parent_parameter_06           = parent.parameter_06
  , parent_parameter_07           = parent.parameter_07
  , parent_parameter_08           = parent.parameter_08
  , parent_parameter_09           = parent.parameter_09
  , parent_parameter_10           = parent.parameter_10
  , parent_parameter_11           = parent.parameter_11
  , parent_parameter_12           = parent.parameter_12
  , parent_parameter_13           = parent.parameter_13
  , parent_parameter_14           = parent.parameter_14
  , parent_parameter_15           = parent.parameter_15
  , parent_parameter_16           = parent.parameter_16
  , parent_parameter_17           = parent.parameter_17
  , parent_parameter_18           = parent.parameter_18
  , parent_parameter_19           = parent.parameter_19
  , parent_parameter_20           = parent.parameter_20
  , parent_proc_fullname          = Concat(QuoteName(parent.[proc_schema_name]),'.',QuoteName(parent.[proc_name])) --proc_fullname
From
    logs.ExecutionLog     As T1
    Left Join
        logs.ExecutionLog As parent
            On
            parent.id = T1.parent_execution_log_id
Where
    Not parent.id Is Null

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
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parent_execution_log_id]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_execution_log_id';




Go
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[id]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'id';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [logs].[ExecutionLog]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent';


GO



GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:logs.ExecutionLog_puml_Sequence_start_stop.adoc[]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:logs.ExecutionLog.adoc[]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent';


GO



GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[step_name]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_step_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[step_id]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_step_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[proc_schema_name]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_proc_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[proc_name]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_proc_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[proc_id]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_proc_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[proc_fullname]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_proc_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_20]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_20';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_19]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_19';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_18]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_18';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_17]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_17';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_16]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_16';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_15]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_15';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_14]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_14';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_13]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_13';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_12]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_12';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_11]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_11';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_10]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_10';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_09]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_09';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_08]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_08';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_07]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_07';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_06]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_06';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_05]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_05';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_04]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_04';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_03]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_03';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_02]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_02';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_01]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_parameter_01';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[current_execution_guid]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_current_execution_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[created_dt]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_parent', @level2type = N'COLUMN', @level2name = N'parent_created_dt';

