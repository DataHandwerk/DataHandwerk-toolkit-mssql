
/*
only insert, no update

to get duration and grouping, use unique combinations of keys,for example

- @execution_instance_guid (which should be unique per execution)
- @ssis_execution_id
- @sub_execution_id
- @proc_id
- @step_id
- @parent_execution_log_id

if a procedure is called several times per ssis_execution, for example the @ssis_execution_id could be used as group and @execution_instance_guid for individual execution

it is also possible to use the @execution_log_id output parameter ad to store it back as @parent_execution_log_id

*/
CREATE Procedure logs.usp_ExecutionLog_insert
    @execution_instance_guid UniqueIdentifier
  , @ssis_execution_id       BigInt           = Null
  , @sub_execution_id        Int              = Null
  , @parent_execution_log_id BigInt           = Null
  , @current_execution_guid  UniqueIdentifier = Null
  , @proc_id                 Int              = Null
  , @proc_schema_name        NVarchar(128)    = Null
  , @proc_name               NVarchar(128)    = Null
  , @event_info              NVarchar(Max)    = Null
  , @step_id                 Int              = Null
  , @step_name               NVarchar(1000)   = Null
  , @source_object           NVarchar(261)    = Null
  , @target_object           NVarchar(261)    = Null
  , @inserted                Int              = Null
  , @updated                 Int              = Null
  , @deleted                 Int              = Null
  , @info_01                 NVarchar(4000)   = Null
  , @info_02                 NVarchar(4000)   = Null
  , @info_03                 NVarchar(4000)   = Null
  , @info_04                 NVarchar(4000)   = Null
  , @info_05                 NVarchar(4000)   = Null
  , @info_06                 NVarchar(4000)   = Null
  , @info_07                 NVarchar(4000)   = Null
  , @info_08                 NVarchar(4000)   = Null
  , @info_09                 NVarchar(4000)   = Null
  , @parameter_01            NVarchar(4000)   = Null
  , @parameter_02            NVarchar(4000)   = Null
  , @parameter_03            NVarchar(4000)   = Null
  , @parameter_04            NVarchar(4000)   = Null
  , @parameter_05            NVarchar(4000)   = Null
  , @parameter_06            NVarchar(4000)   = Null
  , @parameter_07            NVarchar(4000)   = Null
  , @parameter_08            NVarchar(4000)   = Null
  , @parameter_09            NVarchar(4000)   = Null
  , @parameter_10            NVarchar(4000)   = Null
  , @parameter_11            NVarchar(4000)   = Null
  , @parameter_12            NVarchar(4000)   = Null
  , @parameter_13            NVarchar(4000)   = Null
  , @parameter_14            NVarchar(4000)   = Null
  , @parameter_15            NVarchar(4000)   = Null
  , @parameter_16            NVarchar(4000)   = Null
  , @parameter_17            NVarchar(4000)   = Null
  , @parameter_18            NVarchar(4000)   = Null
  , @parameter_19            NVarchar(4000)   = Null
  , @parameter_20            NVarchar(4000)   = Null
  , @execution_log_id        BigInt           = Null Output
As
Declare @start_dt DateTime = GetDate ();

Insert Into logs.ExecutionLog
(
    execution_instance_guid
  , parent_execution_log_id
  , ssis_execution_id
  , sub_execution_id
  , current_execution_guid
  , proc_id
  , proc_schema_name
  , proc_name
  , event_info
  , step_id
  , step_name
  , created_dt
  , source_object
  , target_object
  , inserted
  , updated
  , deleted
  , info_01
  , info_02
  , info_03
  , info_04
  , info_05
  , info_06
  , info_07
  , info_08
  , info_09
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
)
Values
    (
        @execution_instance_guid
      , @parent_execution_log_id
      , @ssis_execution_id
      , @sub_execution_id
      , @current_execution_guid
      , @proc_id
      , @proc_schema_name
      , @proc_name
      , @event_info
      , @step_id
      , @step_name
      , @start_dt
      , @source_object
      , @target_object
      , @inserted
      , @updated
      , @deleted
      , Try_Cast(@info_01 As NVarchar(4000))
      , Try_Cast(@info_02 As NVarchar(4000))
      , Try_Cast(@info_03 As NVarchar(4000))
      , Try_Cast(@info_04 As NVarchar(4000))
      , Try_Cast(@info_05 As NVarchar(4000))
      , Try_Cast(@info_06 As NVarchar(4000))
      , Try_Cast(@info_07 As NVarchar(4000))
      , Try_Cast(@info_08 As NVarchar(4000))
      , Try_Cast(@info_09 As NVarchar(4000))
      , Try_Cast(@parameter_01 As NVarchar(4000))
      , Try_Cast(@parameter_02 As NVarchar(4000))
      , Try_Cast(@parameter_03 As NVarchar(4000))
      , Try_Cast(@parameter_04 As NVarchar(4000))
      , Try_Cast(@parameter_05 As NVarchar(4000))
      , Try_Cast(@parameter_06 As NVarchar(4000))
      , Try_Cast(@parameter_07 As NVarchar(4000))
      , Try_Cast(@parameter_08 As NVarchar(4000))
      , Try_Cast(@parameter_09 As NVarchar(4000))
      , Try_Cast(@parameter_10 As NVarchar(4000))
      , Try_Cast(@parameter_11 As NVarchar(4000))
      , Try_Cast(@parameter_12 As NVarchar(4000))
      , Try_Cast(@parameter_13 As NVarchar(4000))
      , Try_Cast(@parameter_14 As NVarchar(4000))
      , Try_Cast(@parameter_15 As NVarchar(4000))
      , Try_Cast(@parameter_16 As NVarchar(4000))
      , Try_Cast(@parameter_17 As NVarchar(4000))
      , Try_Cast(@parameter_18 As NVarchar(4000))
      , Try_Cast(@parameter_19 As NVarchar(4000))
      , Try_Cast(@parameter_20 As NVarchar(4000))
    );

Set @execution_log_id = Scope_Identity ();

Go
Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '8b90291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'logs'
  , @level1type = N'PROCEDURE'
  , @level1name = N'usp_ExecutionLog_insert';


Go
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [logs].[ExecutionLog]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'PROCEDURE', @level1name = N'usp_ExecutionLog_insert';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.usp_AntoraExport.adoc[]
* xref:docs.usp_AntoraExport_DocSnippet.adoc[]
* xref:docs.usp_AntoraExport_navigation.adoc[]
* xref:docs.usp_AntoraExport_ObjectPage.adoc[]
* xref:docs.usp_AntoraExport_ObjectPageTemplate.adoc[]
* xref:docs.usp_AntoraExport_ObjectPartialProperties.adoc[]
* xref:docs.usp_AntoraExport_ObjectPuml.adoc[]
* xref:docs.usp_AntoraExport_Page_IndexSemanticGroup.adoc[]
* xref:docs.usp_PERSIST_RepoObject_Adoc_T.adoc[]
* xref:docs.usp_PERSIST_RepoObject_IndexList_T.adoc[]
* xref:docs.usp_PERSIST_RepoObject_Plantuml_Entity_T.adoc[]
* xref:docs.usp_PERSIST_RepoObject_Plantuml_T.adoc[]
* xref:graph.usp_PERSIST_RepoObject.adoc[]
* xref:graph.usp_PERSIST_RepoObjectColumn.adoc[]
* xref:property.usp_RepoObject_Inheritance.adoc[]
* xref:property.usp_RepoObjectColumn_Inheritance.adoc[]
* xref:property.usp_RepoObjectProperty_collect.adoc[]
* xref:property.usp_sync_ExtendedProperties_Repo2Sys_Delete.adoc[]
* xref:property.usp_sync_ExtendedProperties_Repo2Sys_InsertUpdate.adoc[]
* xref:property.usp_sync_ExtendedProperties_Sys2Repo_InsertUpdate.adoc[]
* xref:reference.usp_PERSIST_RepoObject_reference_T.adoc[]
* xref:reference.usp_PERSIST_RepoObject_referenced_level_T.adoc[]
* xref:reference.usp_PERSIST_RepoObject_ReferenceTree_0_30_T.adoc[]
* xref:reference.usp_PERSIST_RepoObject_ReferenceTree_30_0_T.adoc[]
* xref:reference.usp_PERSIST_RepoObject_referencing_level_T.adoc[]
* xref:reference.usp_PERSIST_RepoObjectColumn_reference_T.adoc[]
* xref:reference.usp_RepoObject_update_SysObjectQueryPlan.adoc[]
* xref:reference.usp_RepoObjectSource_FirstResultSet.adoc[]
* xref:reference.usp_RepoObjectSource_QueryPlan.adoc[]
* xref:reference.usp_update_Referencing_Count.adoc[]
* xref:repo.usp_Index_finish.adoc[]
* xref:repo.usp_Index_ForeignKey.adoc[]
* xref:repo.usp_index_inheritance.adoc[]
* xref:repo.usp_Index_Settings.adoc[]
* xref:repo.usp_Index_virtual_set.adoc[]
* xref:repo.usp_main.adoc[]
* xref:repo.usp_PERSIST_ForeignKey_Indexes_union_T.adoc[]
* xref:repo.usp_PERSIST_IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T.adoc[]
* xref:repo.usp_persistence_set.adoc[]
* xref:repo.usp_RepoObjectColumn_update_RepoObjectColumn_column_id.adoc[]
* xref:repo.usp_sync_guid.adoc[]
* xref:repo.usp_sync_guid_RepoObject.adoc[]
* xref:repo.usp_sync_guid_RepoObjectColumn.adoc[]
* xref:repo.usp_sync_guid_RepoSchema.adoc[]
* xref:repo.usp_update_Referencing_Count.adoc[]
* xref:sqlparse.usp_PERSIST_RepoObject_SqlModules_41_from_T.adoc[]
* xref:sqlparse.usp_PERSIST_RepoObject_SqlModules_61_SelectIdentifier_Union_T.adoc[]
* xref:uspgenerator.usp_GeneratorUsp_insert_update_persistence.adoc[]
* xref:workflow.usp_workflow.adoc[]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'PROCEDURE', @level1name = N'usp_ExecutionLog_insert';






GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:logs.ExecutionLog.adoc[]', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'PROCEDURE', @level1name = N'usp_ExecutionLog_insert';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'PROCEDURE', @level1name = N'usp_ExecutionLog_insert';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'logs', @level1type = N'PROCEDURE', @level1name = N'usp_ExecutionLog_insert';

