
/*
<<property_start>>Description
to avoid cyclic object references we use a limited xref:sqldb:repo.repoobject_gross_persistence.adoc[] instead of xref:sqldb:repo.repoobject_gross.adoc[] in xref:sqldb:reference.repoobject_reference_persistence_target_as_source.adoc[]
<<property_end>>
*/
CREATE View repo.RepoObject_gross_persistence
As
Select
    --
    ro.RepoObject_guid
  , ro.RepoObject_schema_name
  , ro.RepoObject_name
  , ro.RepoObject_type
  , RepoObject_type_name                                = repo_type.type_desc
  , ro.has_different_sys_names
  , ro.has_execution_plan_issue
  , ro.has_get_referenced_issue
  , ro.Inheritance_StringAggSeparatorSql
  , ro.InheritanceDefinition
  , ro.InheritanceType
  , ro.is_DocsExclude
  , ty.is_DocsOutput
  --, is_in_reference                                     = Case
  --                                                            When Exists
  --                                                                 (
  --                                                                     Select
  --                                                                         1
  --                                                                     From
  --                                                                         reference.RepoObject_ReferencedReferencing As ref
  --                                                                     Where
  --                                                                         ref.Referenced_guid     = ro.RepoObject_guid
  --                                                                         Or ref.Referencing_guid = ro.RepoObject_guid
  --                                                                 )
  --                                                                Then
  --                                                                1
  --                                                            Else
  --                                                                0
  --                                                        End
  , ro.is_repo_managed
  , ro.is_ssas
  , ro.is_required_ObjectMerge
  , ro.is_RepoObject_name_uniqueidentifier
  , ro.is_SysObject_missing
  , ro.is_SysObject_name_uniqueidentifier
  , ro.modify_dt
  , ro.node_id
  , ro.pk_index_guid
  --, pk_IndexPatternColumnDatatype                       = ipk.IndexPatternColumnDatatype
  --, pk_IndexPatternColumnName                           = ipk.IndexPatternColumnName
  --, ro.pk_IndexPatternColumnName_new
  --, pk_IndexSemanticGroup                               = ipk.IndexSemanticGroup
  , ro.Repo_history_table_guid
  , ro.Repo_temporal_type
  , ro.RepoObject_fullname
  , ro.RepoObject_fullname2
  , ro.RepoObject_Referencing_Count
  , ro.SysObject_fullname
  , ro.SysObject_fullname2
  , ro.SysObject_id
  , ro.SysObject_modify_date
  , ro.SysObject_name
  , ro.SysObject_parent_object_id
  --, QueryPlan.SysObject_query_executed_dt
  --, QueryPlan.SysObject_query_plan
  , ro.SysObject_query_sql
  , ro.SysObject_schema_name
  , ro.SysObject_type
  , ro.external_AntoraComponent
  , ro.external_AntoraModule
  --, external_DatabaseName                               = ard.DatabaseName
  --, external_RepoDatabaseName                           = ard.RepoDatabaseName
  , ro.is_external
  --, AntoraComponent                                     = Coalesce ( ro.external_AntoraComponent, AntoraComponent.Parameter_value_result )
  --, AntoraModule                                        = Coalesce ( ro.external_AntoraModule, AntoraModule.Parameter_value_result )
  , SysObject_type_name                                 = sys_type.type_desc
  , ro.usp_persistence_name
  , usp_persistence_RepoObject_guid                     = ro_usp_p.RepoObject_guid
  , persistence_source_RepoObject_guid                  = ro_p.source_RepoObject_guid
  , persistence_source_RepoObject_fullname              = ro_p_s.RepoObject_fullname
  , persistence_source_RepoObject_fullname2             = ro_p_s.RepoObject_fullname2
  , persistence_source_RepoObject_xref                  = 'xref:' + docs.fs_cleanStringForFilename ( ro_p_s.RepoObject_fullname2 )
                                                          + '.adoc[]'
  , persistence_source_SysObject_fullname               = ro_p_s.SysObject_fullname
  , persistence_source_SysObject_fullname_or_tempsource = Iif(ro_p.is_persistence_persist_source = 1
                                                              , '#source'
                                                              , ro_p_s.SysObject_fullname)
  , persistence_source_SysObject_fullname2              = ro_p_s.SysObject_fullname2
  , persistence_source_SysObject_xref                   = 'xref:' + docs.fs_cleanStringForFilename ( ro_p_s.SysObject_fullname2 )
                                                          + '.adoc[]'
  --, uspgenerator_usp_id                                 = gusp.id
  , ro_p.has_history
  , ro_p.has_history_columns
  , ro_p.is_persistence
  , ro_p.is_persistence_check_duplicate_per_pk
  , ro_p.is_persistence_check_for_empty_source
  , ro_p.is_persistence_delete_missing
  , ro_p.is_persistence_delete_changed
  , ro_p.is_persistence_insert
  , ro_p.is_persistence_truncate
  , ro_p.is_persistence_update_changed
  , ro_p.is_persistence_merge_delete_missing
  , ro_p.is_persistence_merge_insert
  , ro_p.is_persistence_merge_update_changed
  , ro_p.is_persistence_persist_source
  , ro_p.history_schema_name
  , ro_p.history_table_name
  , prescript                                           = ro_p.prescript
  , postscript                                          = ro_p.postscript
  , ro_p.temporal_type
--Attention, this will be written back into Property 'Description'
--this could be an issue, if it will be changed in differen places, which should be the primary?
--, Description                                         = Coalesce (
--                                                                     --use description in uspgenerator.GeneratorUsp
--                                                                     NullIf(gusp.usp_Description, '')
--                                                                   --keep existing Description
--                                                                   , NullIf(property.fs_get_RepoObjectProperty_nvarchar ( ro.RepoObject_guid, 'Description' ), '')
--                                                                   , modeltab.tables_description
--                                                                   , modeltab2.descriptions_StrAgg
--                                                                   , property.fs_get_RepoObjectProperty_nvarchar ( ro.RepoObject_guid, 'ms_description' )
--                                                                 )
--, Property_ms_description                             = property.fs_get_RepoObjectProperty_nvarchar ( ro.RepoObject_guid, 'ms_description' )
--, modeltab.tables_dataCategory
--, modeltab.tables_isHidden
--, tables_description                                  = Coalesce ( modeltab.tables_description, modeltab2.descriptions_StrAgg )
From
    repo.RepoObject                 As ro
    Left Outer Join
        repo.RepoObject_persistence As ro_p
            On
            ro_p.target_RepoObject_guid         = ro.RepoObject_guid

    Left Outer Join
        repo.RepoObject             As ro_p_s
            On
            ro_p_s.RepoObject_guid              = ro_p.source_RepoObject_guid

    Left Outer Join
        repo.RepoObject             As ro_usp_p
            On
            ro_usp_p.RepoObject_name            = ro.usp_persistence_name
            And ro_usp_p.RepoObject_schema_name = ro.RepoObject_schema_name

    --Left Outer Join
    --    reference.RepoObject_QueryPlan                                  As QueryPlan
    --        On
    --        QueryPlan.RepoObject_guid = ro.RepoObject_guid

    --Left Join
    --    repo.Index_Settings                                             As ipk
    --        On
    --        ipk.index_guid = ro.pk_index_guid

    Left Join
        configT.type                As repo_type
            On
            repo_type.type                      = ro.RepoObject_type

    Left Join
        configT.type                As sys_type
            On
            sys_type.type                       = ro.SysObject_type

    Left Join
        configT.type                As ty
            On
            ty.type                             = ro.RepoObject_type

--Left Outer Join
--    ssas.model_json_31_tables_T                                     As modeltab
--        On
--        modeltab.RepoObject_guid = ro.RepoObject_guid

--Left Outer Join
--    ssas.model_json_3161_tables_descriptions_StrAgg                 As modeltab2
--        On
--        modeltab2.RepoObject_guid = ro.RepoObject_guid

--Left Join
--    uspgenerator.GeneratorUsp                                       As gusp
--        On
--        gusp.usp_fullname = ro.RepoObject_fullname

--Left Join
--    reference.additional_Reference_database_T                       As ard
--        On
--        ard.AntoraComponent = ro.external_AntoraComponent
--        And ard.AntoraModule = ro.external_AntoraModule
--Cross Join config.ftv_get_parameter_value ( 'AntoraComponent', '' ) As AntoraComponent
--Cross Join config.ftv_get_parameter_value ( 'AntoraModule', '' ) As AntoraModule
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b2634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'temporal_type';


GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'af634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'history_table_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ae634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'history_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ad634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_persist_source';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ac634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_merge_update_changed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ab634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_merge_insert';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aa634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_merge_delete_missing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a9634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_update_changed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a8634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_truncate';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a7634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_insert';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a6634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_delete_changed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a5634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_delete_missing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a4634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_check_for_empty_source';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a3634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence_check_duplicate_per_pk';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a2634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'is_persistence';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a1634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'has_history_columns';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a0634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'has_history';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9f634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'persistence_source_SysObject_xref';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9e634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'persistence_source_SysObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9d634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'persistence_source_SysObject_fullname_or_tempsource';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9c634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'persistence_source_SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9b634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'persistence_source_RepoObject_xref';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9a634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'persistence_source_RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '99634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'persistence_source_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '98634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'persistence_source_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '97634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'usp_persistence_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '96634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'usp_persistence_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '95634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'SysObject_type_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '94634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'is_external';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '93634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'external_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '92634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'external_AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '91634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '90634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8f634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'SysObject_query_sql';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8e634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'SysObject_parent_object_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8d634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8c634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'SysObject_modify_date';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8b634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'SysObject_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8a634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'SysObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '89634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '88634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'RepoObject_Referencing_Count';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '87634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '86634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '85634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'Repo_temporal_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '84634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'Repo_history_table_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '83634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'pk_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '82634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'node_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '81634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'modify_dt';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '80634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'is_SysObject_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7f634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'is_SysObject_missing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7e634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'is_RepoObject_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7d634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'is_required_ObjectMerge';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7c634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'is_ssas';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7b634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'is_repo_managed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7a634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'is_DocsOutput';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '79634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'is_DocsExclude';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '78634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '77634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '76634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'Inheritance_StringAggSeparatorSql';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '75634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'has_get_referenced_issue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '74634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'has_execution_plan_issue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '73634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'has_different_sys_names';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '72634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'RepoObject_type_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '71634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '70634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6f634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6e634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '89f74ad3-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b0634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'prescript';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b1634de2-5048-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_gross_persistence', @level2type = N'COLUMN', @level2name = N'postscript';

