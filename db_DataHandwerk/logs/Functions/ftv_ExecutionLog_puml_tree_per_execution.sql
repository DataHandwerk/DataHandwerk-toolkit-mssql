
/*
<<property_start>>Description 
* xref:sqldb:logs.ftv_executionlog_puml_tree_per_execution.adoc[] uses xref:sqldb:logs.executionlog.adoc[] to create PlantUML code for procedure execution
* Only procedure calls are considered, not "normal code".

results:

[plantuml, ProcedurePumlTree-usp_main, svg]
....

@startsalt
{
{T
+ Procedure
+ [repo].[usp_main]
++ [repo].[usp_sync_guid]
+++ [repo].[usp_sync_guid_RepoSchema]
+++ [repo].[usp_sync_guid_RepoObject]
++++ [graph].[usp_PERSIST_RepoObject]
+++ [repo].[usp_sync_guid_RepoObjectColumn]
++++ [graph].[usp_PERSIST_RepoObjectColumn]
++ [reference].[usp_update_Referencing_Count]
++ [repo].[usp_index_inheritance]
+++ [repo].[usp_PERSIST_IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T]
+++ [repo].[usp_Index_finish]
++++ [repo].[usp_Index_Settings]
++++ [graph].[usp_PERSIST_Index]
++ [repo].[usp_Index_ForeignKey]
+++ [repo].[usp_PERSIST_ForeignKey_Indexes_union_T]
+++ [repo].[usp_Index_finish]
++++ [repo].[usp_Index_Settings]
++++ [graph].[usp_PERSIST_Index]
++ [repo].[usp_RepoObjectColumn_update_RepoObjectColumn_column_id]
++ [uspgenerator].[usp_GeneratorUsp_insert_update_persistence]
++ [property].[usp_RepoObject_Inheritance]
++ [property].[usp_RepoObjectColumn_Inheritance]
}
}
@endsalt
....

[plantuml, ProcedurePumlTreeTable-ExecutionLog-usp_main, svg]
....
@startsalt
{
{T
+ Procedure  |  Duration
+ [repo].[usp_main]  |  243
++ [repo].[usp_sync_guid]  |  12
+++ [repo].[usp_sync_guid_RepoSchema]  |  0
+++ [repo].[usp_sync_guid_RepoObject]  |  3
++++ [graph].[usp_PERSIST_RepoObject]  |  0
+++ [repo].[usp_sync_guid_RepoObjectColumn]  |  4
++++ [graph].[usp_PERSIST_RepoObjectColumn]  |  0
++ [reference].[usp_update_Referencing_Count]  |  13
++ [repo].[usp_index_inheritance]  |  31
+++ [repo].[usp_PERSIST_IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T]  |  12
+++ [repo].[usp_Index_finish]  |  8
++++ [repo].[usp_Index_Settings]  |  1
++++ [graph].[usp_PERSIST_Index]  |  0
++ [repo].[usp_Index_ForeignKey]  |  9
+++ [repo].[usp_PERSIST_ForeignKey_Indexes_union_T]  |  1
+++ [repo].[usp_Index_finish]  |  1
++++ [repo].[usp_Index_Settings]  |  1
++++ [graph].[usp_PERSIST_Index]  |  0
++ [repo].[usp_RepoObjectColumn_update_RepoObjectColumn_column_id]  |  1
++ [uspgenerator].[usp_GeneratorUsp_insert_update_persistence]  |  53
++ [property].[usp_RepoObject_Inheritance]  |  3
++ [property].[usp_RepoObjectColumn_Inheritance]  |  30
}
}
@endsalt
....

<<property_end>> 

<<property_start>>exampleUsage 
--analyse the last 1000 entries in logs.ExecutionLog

Select
    ex.execution_instance_guid
  , tree.ProcedurePumlTree
  , tree.ProcedurePumlTreeTable
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
    Cross Apply logs.ftv_ExecutionLog_puml_tree_per_execution ( execution_instance_guid ) tree;

--one specific execution

Select
    tree.ProcedurePumlTree
  , tree.ProcedurePumlTreeTable
from
    logs.ftv_ExecutionLog_puml_tree_per_execution ( '5E960CEB-187C-4C75-8465-3F2FA8363CA5' ) tree;

<<property_end>> 
*/
CREATE Function [logs].[ftv_ExecutionLog_puml_tree_per_execution]
(
    @execution_instance_guid UniqueIdentifier
)
Returns Table
As
Return
(
    Select
        ProcedurePumlTree      =
        --
        Concat (
                   '
@startsalt
{
{T
+ Procedure
'
                 , String_Agg ( Cast(PlantUmlTree As NVarchar(Max)), Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                                 id)
                 , '
}
}
@endsalt
'
               )
      , ProcedurePumlTreeTable =
      --
      Concat (
                 '
@startsalt
{
{T
+ Procedure  |  Duration
'
               , String_Agg ( Cast(PlantUmlTreeTable As NVarchar(Max)), Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                                    id)
               , '
}
}
@endsalt
'
             )
    From
        logs.ftv_ExecutionLog_puml_tree ( @execution_instance_guid, Default )
--Group By
--    @execution_instance_guid
);
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'e348b3ff-fda5-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'FUNCTION', @level1name = N'ftv_ExecutionLog_puml_tree_per_execution';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [logs].[ftv_ExecutionLog_puml_tree]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'FUNCTION', @level1name = N'ftv_ExecutionLog_puml_tree_per_execution';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'
* xref:sqldb:logs.ftv_ExecutionLog_puml_tree_per_execution.adoc[] uses xref:sqldb:logs.ExecutionLog.adoc[] to create PlantUML code for procedure execution
* Only procedure calls are considered, not "normal code".

results:

[plantuml, ProcedurePumlTree-usp_main, svg]
....

@startsalt
{
{T
+ Procedure
+ [repo].[usp_main]
++ [repo].[usp_sync_guid]
+++ [repo].[usp_sync_guid_RepoSchema]
+++ [repo].[usp_sync_guid_RepoObject]
++++ [graph].[usp_PERSIST_RepoObject]
+++ [repo].[usp_sync_guid_RepoObjectColumn]
++++ [graph].[usp_PERSIST_RepoObjectColumn]
++ [reference].[usp_update_Referencing_Count]
++ [repo].[usp_index_inheritance]
+++ [repo].[usp_PERSIST_IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T]
+++ [repo].[usp_Index_finish]
++++ [repo].[usp_Index_Settings]
++++ [graph].[usp_PERSIST_Index]
++ [repo].[usp_Index_ForeignKey]
+++ [repo].[usp_PERSIST_ForeignKey_Indexes_union_T]
+++ [repo].[usp_Index_finish]
++++ [repo].[usp_Index_Settings]
++++ [graph].[usp_PERSIST_Index]
++ [repo].[usp_RepoObjectColumn_update_RepoObjectColumn_column_id]
++ [uspgenerator].[usp_GeneratorUsp_insert_update_persistence]
++ [property].[usp_RepoObject_Inheritance]
++ [property].[usp_RepoObjectColumn_Inheritance]
}
}
@endsalt
....

[plantuml, ProcedurePumlTreeTable-ExecutionLog-usp_main, svg]
....
@startsalt
{
{T
+ Procedure  |  Duration
+ [repo].[usp_main]  |  243
++ [repo].[usp_sync_guid]  |  12
+++ [repo].[usp_sync_guid_RepoSchema]  |  0
+++ [repo].[usp_sync_guid_RepoObject]  |  3
++++ [graph].[usp_PERSIST_RepoObject]  |  0
+++ [repo].[usp_sync_guid_RepoObjectColumn]  |  4
++++ [graph].[usp_PERSIST_RepoObjectColumn]  |  0
++ [reference].[usp_update_Referencing_Count]  |  13
++ [repo].[usp_index_inheritance]  |  31
+++ [repo].[usp_PERSIST_IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T]  |  12
+++ [repo].[usp_Index_finish]  |  8
++++ [repo].[usp_Index_Settings]  |  1
++++ [graph].[usp_PERSIST_Index]  |  0
++ [repo].[usp_Index_ForeignKey]  |  9
+++ [repo].[usp_PERSIST_ForeignKey_Indexes_union_T]  |  1
+++ [repo].[usp_Index_finish]  |  1
++++ [repo].[usp_Index_Settings]  |  1
++++ [graph].[usp_PERSIST_Index]  |  0
++ [repo].[usp_RepoObjectColumn_update_RepoObjectColumn_column_id]  |  1
++ [uspgenerator].[usp_GeneratorUsp_insert_update_persistence]  |  53
++ [property].[usp_RepoObject_Inheritance]  |  3
++ [property].[usp_RepoObjectColumn_Inheritance]  |  30
}
}
@endsalt
....
', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'FUNCTION', @level1name = N'ftv_ExecutionLog_puml_tree_per_execution';


GO
EXECUTE sp_addextendedproperty @name = N'exampleUsage', @value = N'
--analyse the last 1000 entries in logs.ExecutionLog

Select
    ex.execution_instance_guid
  , tree.ProcedurePumlTree
  , tree.ProcedurePumlTreeTable
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
    Cross Apply logs.ftv_ExecutionLog_puml_tree_per_execution ( execution_instance_guid ) tree;

--one specific execution

Select
    tree.ProcedurePumlTree
  , tree.ProcedurePumlTreeTable
from
    logs.ftv_ExecutionLog_puml_tree_per_execution ( ''5E960CEB-187C-4C75-8465-3F2FA8363CA5'' ) tree;
', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'FUNCTION', @level1name = N'ftv_ExecutionLog_puml_tree_per_execution';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:logs.ftv_ExecutionLog_puml_tree.adoc[]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'FUNCTION', @level1name = N'ftv_ExecutionLog_puml_tree_per_execution';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'FUNCTION', @level1name = N'ftv_ExecutionLog_puml_tree_per_execution';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'FUNCTION', @level1name = N'ftv_ExecutionLog_puml_tree_per_execution';

