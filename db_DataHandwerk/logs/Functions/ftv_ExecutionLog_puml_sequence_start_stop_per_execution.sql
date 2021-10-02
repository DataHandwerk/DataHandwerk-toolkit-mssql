
/*
<<property_start>>Description 
* xref:sqldb:logs.ftv_executionlog_puml_sequence_start_stop_per_execution.adoc[] uses xref:sqldb:logs.executionlog.adoc[] to create PlantUML code for sequence diagrams
* Only procedure calls are considered, not "normal code".
<<property_end>> 

<<property_start>>exampleUsage 
--analyse the last 1000 entries in logs.ExecutionLog

Select
    ex.execution_instance_guid
  , tree.puml_Sequence_start_stop
From
(
    Select
        execution_instance_guid
    From
    (
        Select
            Top ( 1000 )
            execution_instance_guid
          , id
        From
            logs.ExecutionLog
        Order By
            id Desc
    ) el1000
    Group By
        execution_instance_guid
)                                                                                    ex
    Cross Apply logs.ftv_ExecutionLog_puml_sequence_start_stop_per_execution ( execution_instance_guid ) tree;

--one specific execution

Select
    tree.puml_Sequence_start_stop
from
    logs.ftv_ExecutionLog_puml_sequence_start_stop_per_execution ( '5E960CEB-187C-4C75-8465-3F2FA8363CA5' ) tree;

<<property_end>> 
*/
CREATE Function [logs].[ftv_ExecutionLog_puml_sequence_start_stop_per_execution]
(
    @execution_instance_guid UniqueIdentifier
)
Returns Table
As
Return
(
    Select
        puml_Sequence_start_stop =
        --
        Concat (
                   '@startuml' + Char ( 13 ) + Char ( 10 )
                 , String_Agg ( Cast(puml_Sequence_start_stop As NVarchar(Max)), Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                                             id)
                 , Char ( 13 ) + Char ( 10 ) + '@enduml' + Char ( 13 ) + Char ( 10 )
               )
    From
        logs.ExecutionLog_puml_Sequence_start_stop T1
    Where
        T1.execution_instance_guid = @execution_instance_guid
--Group By
--    @execution_instance_guid
);
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'e448b3ff-fda5-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'FUNCTION', @level1name = N'ftv_ExecutionLog_puml_sequence_start_stop_per_execution';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [logs].[ExecutionLog_puml_Sequence_start_stop]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'FUNCTION', @level1name = N'ftv_ExecutionLog_puml_sequence_start_stop_per_execution';


GO



GO
EXECUTE sp_addextendedproperty @name = N'exampleUsage', @value = N'
--analyse the last 1000 entries in logs.ExecutionLog

Select
    ex.execution_instance_guid
  , tree.puml_Sequence_start_stop
From
(
    Select
        execution_instance_guid
    From
    (
        Select
            Top ( 1000 )
            execution_instance_guid
          , id
        From
            logs.ExecutionLog
        Order By
            id Desc
    ) el1000
    Group By
        execution_instance_guid
)                                                                                    ex
    Cross Apply logs.ftv_ExecutionLog_puml_sequence_start_stop_per_execution ( execution_instance_guid ) tree;

--one specific execution

Select
    tree.puml_Sequence_start_stop
from
    logs.ftv_ExecutionLog_puml_sequence_start_stop_per_execution ( ''5E960CEB-187C-4C75-8465-3F2FA8363CA5'' ) tree;
', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'FUNCTION', @level1name = N'ftv_ExecutionLog_puml_sequence_start_stop_per_execution';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:logs.ExecutionLog_puml_Sequence_start_stop.adoc[]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'FUNCTION', @level1name = N'ftv_ExecutionLog_puml_sequence_start_stop_per_execution';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'FUNCTION', @level1name = N'ftv_ExecutionLog_puml_sequence_start_stop_per_execution';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'FUNCTION', @level1name = N'ftv_ExecutionLog_puml_sequence_start_stop_per_execution';

