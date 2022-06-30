


/*
<<property_start>>exampleUsage 
--get detailed PlantUML sequence diagram
--you could add skinparam to modify it, for example
--skinparam maxmessagesize 250

Select
    id
  , puml_Sequence
  , execution_instance_guid
  , parent_execution_log_id
  , proc_schema_name
  , proc_name
  , step_id
  , step_name
  , created_dt
  , source_object
  , target_object
  , inserted
  , updated
  , deleted
From
    logs.ExecutionLog_gross
Where
    id
Between 33386 And 33404
Order By
    id;
<<property_end>> 
*/
CREATE View [logs].[ExecutionLog_gross]
As
Select
    id
  , parent_execution_log_id
  , duration_current_execution_guid         = DateDiff (
                                                           ss
                                                         , Min ( created_dt ) Over ( Partition By current_execution_guid )
                                                         , Max ( created_dt ) Over ( Partition By current_execution_guid )
                                                       )
  , duration_execution_instance_guid        = DateDiff (
                                                           ss
                                                         , Min ( created_dt ) Over ( Partition By execution_instance_guid )
                                                         , Max ( created_dt ) Over ( Partition By execution_instance_guid )
                                                       )
  , duration_step                           = Iif(Not step_name In ( 'start', 'end' )
                        , DateDiff ( ss, Lag ( created_dt ) Over ( Order By id ), created_dt )
                        , Null)
  , created_dt
  , proc_schema_name
  , proc_name
  , step_id
  , step_name
  , inserted
  , updated
  , deleted
  , source_object
  , target_object
  , execution_instance_guid
  , ssis_execution_id
  , sub_execution_id
  , current_execution_guid
  , proc_id
  , info_01
  , info_02
  , info_03
  , info_04
  , info_05
  , info_06
  , info_07
  , info_08
  , info_09
  , event_info
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
  --
  , created_dt_min_execution_instance_guid = Min ( created_dt ) Over ( Partition By execution_instance_guid )
  , created_dt_max_execution_instance_guid = Max ( created_dt ) Over ( Partition By execution_instance_guid )
  --
  , puml_Sequence                           = --
  --combine the result with
  --skinparam maxmessagesize 250
  Case
      When source_object Is Null
           And target_object Is Null
          Then
          Concat (
                     Char ( 13 ) + Char ( 10 )
                   , '== '
                   , concat(quotename([proc_schema_name]),'.',quotename([proc_name])) --proc_fullname
                   , ' - '
                   , step_name
                   , ' =='
                   , Char ( 13 ) + Char ( 10 )
                   , Char ( 13 ) + Char ( 10 )
                 )
      Else
          Concat (
                     --
                     Case
                         When Not source_object Is Null
                             Then
                             QuoteName ( source_object, '"' )
                     End
                   , Case
                         When Not inserted Is Null
                             Then
                             Case
                                 When source_object Is Null
                                     Then
                                     '?-> '
                                 Else
                                     ' -> '
                             End
                         When Not updated Is Null
                             Then
                             Case
                                 When source_object Is Null
                                     Then
                                     '?->o '
                                 Else
                                     ' ->O '
                             End
                         When Not deleted Is Null
                             Then
                             Case
                                 When source_object Is Null
                                     Then
                                     '?->x '
                                 Else
                                     ' ->x '
                             End
                         Else
                             Case
                                 When source_object Is Null
                                     Then
                                     '?--> '
                                 Else
                                     ' --> '
                             End
                     End
                   , Case
                         When Not target_object Is Null
                             Then
                             QuoteName ( target_object, '"' )
                     End
                   --
                   --, ' : ' , QUOTENAME([step_name] , '"')
                   , ' : '
                   , step_name
                   , Char ( 13 ) + Char ( 10 )
                   -- "r" - rectangle note
                   , 'rnote right:'
                   , Coalesce ( inserted, updated, deleted )
                 --
                 )
  End
From
    logs.ExecutionLog

Go
Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'bb90291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6df77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'updated';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6bf77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'target_object';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '62f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'sub_execution_id';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '68f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'step_name';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '67f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'step_id';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '61f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'ssis_execution_id';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6af77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'source_object';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '65f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'proc_schema_name';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '66f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'proc_name';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '64f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'proc_id';


Go



Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '5ff77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_execution_log_id';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8cf77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'parameter_20';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8bf77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'parameter_19';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8af77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'parameter_18';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '89f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'parameter_17';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '88f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'parameter_16';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '87f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'parameter_15';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '86f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'parameter_14';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '85f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'parameter_13';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '84f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'parameter_12';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '83f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'parameter_11';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '82f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'parameter_10';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '81f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'parameter_09';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '80f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'parameter_08';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '7ff77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'parameter_07';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '7ef77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'parameter_06';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '7df77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'parameter_05';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '7cf77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'parameter_04';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '7bf77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'parameter_03';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '7af77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'parameter_02';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '79f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'parameter_01';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6cf77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'inserted';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '77f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'info_09';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '76f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'info_08';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '75f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'info_07';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '74f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'info_06';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '73f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'info_05';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '72f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'info_04';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '71f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'info_03';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '70f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'info_02';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6ff77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'info_01';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '5ef77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'id';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '60f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'execution_instance_guid';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '78f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'event_info';


Go



Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6ef77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'deleted';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '63f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'current_execution_guid';


Go



Go



Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '69f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'VIEW'
  , @level1name = N'ExecutionLog_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'created_dt';


Go



Go
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e848b3ff-fda5-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'puml_Sequence';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [logs].[ExecutionLog]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross';


GO



GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'exampleUsage', @value = N'
--get detailed PlantUML sequence diagram
--you could add skinparam to modify it, for example
--skinparam maxmessagesize 250

Select
    id
  , puml_Sequence
  , execution_instance_guid
  , parent_execution_log_id
  , proc_schema_name
  , proc_name
  , step_id
  , step_name
  , created_dt
  , source_object
  , target_object
  , inserted
  , updated
  , deleted
From
    logs.ExecutionLog_gross
Where
    id
Between 33386 And 33404
Order By
    id;', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:logs.ftv_ExecutionLog_puml_tree.adoc[]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:logs.ExecutionLog.adoc[]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[updated]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'updated';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[target_object]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'target_object';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[sub_execution_id]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'sub_execution_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[step_name]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'step_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[step_id]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'step_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[ssis_execution_id]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'ssis_execution_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[source_object]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'source_object';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[proc_schema_name]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'proc_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[proc_name]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'proc_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[proc_id]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'proc_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parent_execution_log_id]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'parent_execution_log_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_20]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'parameter_20';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_19]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'parameter_19';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_18]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'parameter_18';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_17]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'parameter_17';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_16]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'parameter_16';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_15]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'parameter_15';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_14]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'parameter_14';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_13]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'parameter_13';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_12]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'parameter_12';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_11]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'parameter_11';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_10]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'parameter_10';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_09]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'parameter_09';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_08]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'parameter_08';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_07]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'parameter_07';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_06]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'parameter_06';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_05]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'parameter_05';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_04]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'parameter_04';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_03]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'parameter_03';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_02]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'parameter_02';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[parameter_01]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'parameter_01';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[inserted]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'inserted';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[info_09]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'info_09';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[info_08]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'info_08';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[info_07]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'info_07';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[info_06]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'info_06';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[info_05]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'info_05';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[info_04]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'info_04';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[info_03]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'info_03';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[info_02]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'info_02';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[info_01]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'info_01';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[id]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[execution_instance_guid]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'execution_instance_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[event_info]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'event_info';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[deleted]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'deleted';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[current_execution_guid]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'current_execution_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [logs].[ExecutionLog].[created_dt]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'created_dt';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b8952df6-4712-ec11-851a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'duration_step';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b7952df6-4712-ec11-851a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'duration_execution_instance_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b6952df6-4712-ec11-851a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'duration_current_execution_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '90d52116-ba13-ec11-851a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'created_dt_min_execution_instance_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '91d52116-ba13-ec11-851a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'VIEW', @level1name = N'ExecutionLog_gross', @level2type = N'COLUMN', @level2name = N'created_dt_max_execution_instance_guid';

