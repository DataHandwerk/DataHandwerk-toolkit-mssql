
/*
<<property_start>>Description 
* xref:sqldb:logs.ftv_executionlog_puml_tree.adoc[] uses xref:sqldb:logs.executionlog.adoc[] to create PlantUML code for procedure execution
* Only procedure calls are considered, not "normal code".
** PlantUmlTree
+
[code,plantuml]
------
@startsalt
{
{T
'Procedure  <1>
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
} <1>
}
@endsalt
------
<1> you need to add header and footer around the generated code, which contains only the lines starting with '+' 
** PlantUmlTreeTable
+
[code,plantuml]
------
@startsalt
{
{T
Procedure  |  Duration <1>
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
} <1>
}
@endsalt
------
<1> you need to add header and footer around the generated code, which contains only the lines starting with '+' 

results:

[plantuml, dhw-treeTable-ExecutionLog-usp_main, svg]
....
@startsalt
{
{T
Procedure  |  Duration <1>
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
--get all puml for all executions

Select
    execution_instance_guid
  , id
  , parent_execution_log_id
  , Depth
  , proc_schema_name
  , proc_name
  , step_id
  , duration__current_execution_guid
  , PlantUmlTree
  , PlantUmlTreeTable
From
    logs.ftv_ExecutionLog_puml_tree ( Default, Default )
Order By
    id;

--get the puml for a specific execution

Select
    *
From
    logs.ftv_ExecutionLog_puml_tree ( '069F29D0-829E-4D2B-BAE9-9D032DA1FF22', Default )
Order By
    id;
<<property_end>> 
*/
CREATE Function [logs].[ftv_ExecutionLog_puml_tree]
(
    @execution_instance_guid UniqueIdentifier = Null
  , @parent_execution_log_id Int              = Null
)
Returns Table
As
Return
(
    With
    tree
    As
        --tree is recursive to solve parent child hierarchies
        (
        Select
            execution_instance_guid
          , id
          , parent_execution_log_id
          , 1                               As Depth
          , proc_schema_name
          , proc_name
          , step_id
          , duration_current_execution_guid
        From
            logs.ExecutionLog_gross
        Where
            (
                id                      = @parent_execution_log_id
                Or @parent_execution_log_id Is Null
                   And parent_execution_log_id Is Null
            )
            And
            (
                execution_instance_guid = @execution_instance_guid
                Or @execution_instance_guid Is Null
            )
            And step_id                 = 1
        Union All
        Select
            child.execution_instance_guid
          , child.id
          , child.parent_execution_log_id
          , parent.Depth + 1
          , child.proc_schema_name
          , child.proc_name
          , child.step_id
          , child.duration_current_execution_guid
        From
            logs.ExecutionLog_gross As child
            Inner Join
                tree                As parent
                    On
                    child.parent_execution_log_id = parent.id
        Where
            --
            child.execution_instance_guid = parent.execution_instance_guid
            And child.step_id             = 1
        )
    Select
        *
      , PlantUmlTree      = Concat (
                                       Replicate ( '+', Depth )
                                     , ' '
                                     , QuoteName ( proc_schema_name )
                                     , '.'
                                     , QuoteName ( proc_name )
                                   )
      , PlantUmlTreeTable = Concat (
                                       Replicate ( '+', Depth )
                                     , ' '
                                     , QuoteName ( proc_schema_name )
                                     , '.'
                                     , QuoteName ( proc_name )
                                     , '  |  '
                                     , duration_current_execution_guid
                                   )
    From
        tree
);
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'fbafba8c-ad72-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'FUNCTION', @level1name = N'ftv_ExecutionLog_puml_tree';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [logs].[ExecutionLog_gross]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'FUNCTION', @level1name = N'ftv_ExecutionLog_puml_tree';


GO
EXECUTE sp_addextendedproperty @name = N'exampleUsage', @value = N'
--get all puml for all executions

Select
    execution_instance_guid
  , id
  , parent_execution_log_id
  , Depth
  , proc_schema_name
  , proc_name
  , step_id
  , duration__current_execution_guid
  , PlantUmlTree
  , PlantUmlTreeTable
From
    logs.ftv_ExecutionLog_puml_tree ( Default, Default )
Order By
    id;

--get the puml for a specific execution

Select
    *
From
    logs.ftv_ExecutionLog_puml_tree ( ''069F29D0-829E-4D2B-BAE9-9D032DA1FF22'', Default )
Order By
    id;', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'FUNCTION', @level1name = N'ftv_ExecutionLog_puml_tree';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:logs.ftv_ExecutionLog_puml_tree_per_execution.adoc[]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'FUNCTION', @level1name = N'ftv_ExecutionLog_puml_tree';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:logs.ExecutionLog_gross.adoc[]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'FUNCTION', @level1name = N'ftv_ExecutionLog_puml_tree';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'FUNCTION', @level1name = N'ftv_ExecutionLog_puml_tree';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'FUNCTION', @level1name = N'ftv_ExecutionLog_puml_tree';

