
CREATE View repo.RepoObjectColumn_gross
As
Select
    roc.RepoObjectColumn_guid
  , ro.RepoObject_fullname
  , RepoObjectColumn_fullname          = Concat ( ro.RepoObject_fullname, '.', QuoteName ( roc.RepoObjectColumn_name ))
  , roc.Column_name
  , roc.has_different_sys_names
  , roc.Inheritance_StringAggSeparatorSql
  , roc.InheritanceDefinition
  , roc.InheritanceType
  , roc.is_persistence_NoCompareNoUpdate
  , roc.is_persistence_Ignore
  , roc.is_persistence_NoCompareButUpdate
  , roc.is_query_plan_expression
  , roc.is_RepoObjectColumn_name_uniqueidentifier
  , roc.is_required_ColumnMerge
  , roc.is_SysObjectColumn_missing
  , roc.is_SysObjectColumn_name_uniqueidentifier
  , persistence_source_RepoObject_guid = rop.source_RepoObject_guid
  , roc.persistence_source_RepoObjectColumn_guid
  , roc.Referencing_Count
  , roc.Repo_default_definition
  , roc.Repo_default_is_system_named
  , roc.Repo_default_name
  , roc.Repo_definition
  , roc.Repo_generated_always_type
  , roc.Repo_graph_type
  , roc.Repo_is_computed
  , roc.Repo_is_identity
  , roc.Repo_is_nullable
  , roc.Repo_is_persisted
  , roc.Repo_seed_value
  , roc.Repo_increment_value
  , roc.Repo_user_type_fullname
  , roc.Repo_user_type_name
  , roc.Repo_uses_database_collation
  , roc.RepoObject_guid
  , roc.RepoObjectColumn_column_id
  , RepoObjectColumn_fullname2         = Concat ( ro.RepoObject_fullname2, '.', roc.RepoObjectColumn_name )
  , roc.RepoObjectColumn_name
  , roc.SysObjectColumn_column_id
  , roc.SysObjectColumn_name
  , ro.has_get_referenced_issue
  , ro.is_repo_managed
  , ro.is_ssas
  , ro.is_external
  , ro.is_RepoObject_name_uniqueidentifier
  , ro.is_SysObject_missing
  , ro.is_SysObject_name_uniqueidentifier
  , ro.modify_dt
  , ro.node_id
  , ro.pk_index_guid
  , ro.RepoObject_fullname2
  , ro.RepoObject_name
  , ro.RepoObject_Referencing_Count
  , ro.RepoObject_schema_name
  , ro.RepoObject_type
  , ro.SysObject_fullname
  , ro.SysObject_fullname2
  , ro.SysObject_id
  , ro.SysObject_modify_date
  , ro.SysObject_name
  , ro.SysObject_schema_name
  , ro.SysObject_type
  , ro.SysObject_parent_object_id
  --based on ro.pk_index_guid
  --in other words: only, if the columns are part of the PK
  , Property_ms_description            = property.fs_get_RepoObjectColumnProperty_nvarchar (
                                                                                               roc.RepoObjectColumn_guid
                                                                                             , 'ms_description'
                                                                                           )
  --Attention, this will be written back into Property 'Description'
  --this could be an issue, if it will be changed in differen places, which should be the primary?
  , Description                        = Coalesce (
                                                      --keep existing Description
                                                      property.fs_get_RepoObjectColumnProperty_nvarchar (
                                                                                                            roc.RepoObjectColumn_guid
                                                                                                          , 'Description'
                                                                                                        )
                                                    , tabcol.tables_columns_description
                                                    , tabcol2.descriptions_StrAgg
                                                    , property.fs_get_RepoObjectColumnProperty_nvarchar (
                                                                                                            roc.RepoObjectColumn_guid
                                                                                                          , 'ms_description'
                                                                                                        )
                                                  )
  , tabcol_Description                 = Coalesce ( tabcol.tables_columns_description, tabcol2.descriptions_StrAgg )
  , tabcol_DisplayFolder               = tabcol.tables_columns_displayFolder
  , tabcol_Expression                  = Coalesce ( tabcol.tables_columns_expression, tabcol3.expressions_StrAgg )
  , tabcol_FormatString                = tabcol.tables_columns_formatString
  --required in String_Agg in next steps
  , tabcol_IsHidden                    = IsNull ( tabcol.tables_columns_isHidden, 0 )
  , tabcol_IsKey                       = IsNull ( tabcol.tables_columns_isKey, 0 )
  , tabcol_IsUnique                    = IsNull ( tabcol.tables_columns_isUnique, 0 )
  , tabcol_SummarizeBy                 = tabcol.tables_columns_summarizeBy
  , tabcol_Type                        = tabcol.tables_columns_type

--, ic.index_column_id
--, ic.index_name
--, ic.is_index_primary_key
--, isAnyIndexColumn           =
--  (
--      Select
--          Top 1
--          1
--      From
--          repo.IndexColumn_union As icu
--      Where
--          icu.RepoObjectColumn_guid = roc.RepoObjectColumn_guid
--  )
--, roc_referenced.AntoraReferencedColumnList
--, roc_referencing.AntoraReferencingColumnList
From
    repo.RepoObjectColumn                                        As roc
    Inner Join
        repo.RepoObject                                          As ro
            On
            roc.RepoObject_guid           = ro.RepoObject_guid

    Left Join
        repo.RepoObject_persistence                              As rop
            On
            roc.RepoObject_guid           = rop.target_RepoObject_guid

    Left Join
        ssas.model_json_311_tables_columns_T                     As tabcol
            On
            tabcol.RepoObjectColumn_guid  = roc.RepoObjectColumn_guid

    Left Join
        ssas.model_json_31111_tables_columns_descriptions_StrAgg As tabcol2
            On
            tabcol2.RepoObjectColumn_guid = roc.RepoObjectColumn_guid

    Left Join
        ssas.model_json_31121_tables_columns_expressions_StrAgg  As tabcol3
            On
            tabcol3.RepoObjectColumn_guid = roc.RepoObjectColumn_guid

--Left Join
--    ssas.TMSCHEMA_COLUMNS_T As ssascol
--        On
--        ssascol.RepoObjectColumn_guid = roc.RepoObjectColumn_guid

--Left Outer Join
--    repo.IndexColumn_union                     As ic
--        On
--        ic.index_guid                   = ro.pk_index_guid
--        And ic.RepoObjectColumn_guid    = roc.RepoObjectColumn_guid

--Left Join
--    reference.RepoObjectColumn_ReferencedList  As roc_referenced
--        On
--        roc_referenced.Referencing_guid = roc.RepoObjectColumn_guid

--Left Join
--    reference.RepoObjectColumn_ReferencingList As roc_referencing
--        On
--        roc_referencing.Referenced_guid = roc.RepoObjectColumn_guid
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '6990291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '31f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObjectColumn_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '30f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObjectColumn_column_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '44f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '43f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '45f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_parent_object_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '42f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '41f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_modify_date';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '40f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3ff67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '2ff67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '13f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '2ef67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_column_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3ef67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3df67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3cf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_Referencing_Count';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3bf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '2df67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3af67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '2cf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_uses_database_collation';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '2bf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_user_type_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '2af67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_user_type_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '28f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_seed_value';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '27f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_is_persisted';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '26f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_is_nullable';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '25f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_is_identity';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '24f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_is_computed';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '29f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_increment_value';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '23f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_graph_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '22f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_generated_always_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '21f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_definition';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '20f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_default_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1ff67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_default_is_system_named';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1ef67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_default_definition';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1df67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Referencing_Count';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '39f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'pk_index_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1cf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'persistence_source_RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '38f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'node_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '37f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'modify_dt';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1bf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_SysObjectColumn_name_uniqueidentifier';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1af67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_SysObjectColumn_missing';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '36f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_SysObject_name_uniqueidentifier';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '35f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_SysObject_missing';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '19f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_RepoObjectColumn_name_uniqueidentifier';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '34f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_RepoObject_name_uniqueidentifier';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '33f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_repo_managed';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '18f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_query_plan_expression';
Go

EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '90034690-576e-ec11-8539-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'is_persistence_NoCompareButUpdate';


Go

EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8f034690-576e-ec11-8539-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'is_persistence_Ignore';


Go

EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8e034690-576e-ec11-8539-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'is_persistence_NoCompareNoUpdate';


Go


Go


Go


Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '32f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'has_get_referenced_issue';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '14f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'has_different_sys_names';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd2b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'InheritanceType';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd1b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'InheritanceDefinition';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd0b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Inheritance_StringAggSeparatorSql';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd3b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3bdf2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'Property_ms_description';
Go

Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[SysObjectColumn_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'SysObjectColumn_name';


Go


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[SysObjectColumn_column_id]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'SysObjectColumn_column_id';


Go


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[SysObject_type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'SysObject_type';


Go


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[SysObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'SysObject_schema_name';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[SysObject_parent_object_id]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'SysObject_parent_object_id';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[SysObject_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'SysObject_name';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[SysObject_modify_date]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'SysObject_modify_date';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[SysObject_id]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'SysObject_id';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[SysObject_fullname]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


Go


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[RepoObjectColumn_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_name';


Go


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[RepoObjectColumn_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[RepoObjectColumn_column_id]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_column_id';


Go


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


Go


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_Referencing_Count]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'RepoObject_Referencing_Count';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'RepoObject_name';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_fullname]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


Go


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[Repo_uses_database_collation]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'Repo_uses_database_collation';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[Repo_user_type_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'Repo_user_type_name';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[Repo_user_type_fullname]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'Repo_user_type_fullname';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[Repo_seed_value]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'Repo_seed_value';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[Repo_is_persisted]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'Repo_is_persisted';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[Repo_is_nullable]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'Repo_is_nullable';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[Repo_is_identity]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'Repo_is_identity';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[Repo_is_computed]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'Repo_is_computed';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[Repo_increment_value]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'Repo_increment_value';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[Repo_graph_type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'Repo_graph_type';


Go


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[Repo_generated_always_type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'Repo_generated_always_type';


Go


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[Repo_definition]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'Repo_definition';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[Repo_default_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'Repo_default_name';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[Repo_default_is_system_named]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'Repo_default_is_system_named';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[Repo_default_definition]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'Repo_default_definition';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[Referencing_Count]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'Referencing_Count';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[pk_index_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'pk_index_guid';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[persistence_source_RepoObjectColumn_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'persistence_source_RepoObjectColumn_guid';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[node_id]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'node_id';


Go


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[modify_dt]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'modify_dt';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[is_SysObjectColumn_name_uniqueidentifier]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'is_SysObjectColumn_name_uniqueidentifier';


Go


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[is_SysObjectColumn_missing]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'is_SysObjectColumn_missing';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[is_SysObject_name_uniqueidentifier]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'is_SysObject_name_uniqueidentifier';


Go


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[is_SysObject_missing]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'is_SysObject_missing';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[is_RepoObjectColumn_name_uniqueidentifier]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'is_RepoObjectColumn_name_uniqueidentifier';


Go


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[is_RepoObject_name_uniqueidentifier]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'is_RepoObject_name_uniqueidentifier';


Go


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[is_repo_managed]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'is_repo_managed';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[is_query_plan_expression]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'is_query_plan_expression';


Go




Go




Go




Go


Go


Go


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[has_get_referenced_issue]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'has_get_referenced_issue';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[has_different_sys_names]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'has_different_sys_names';


Go


Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0039cf17-0592-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fe38cf17-0592-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ff38cf17-0592-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname2';
Go


Go


Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0bfb57e8-9f9b-eb11-84f6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_required_ColumnMerge';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [property].[fs_get_RepoObjectColumnProperty_nvarchar]
* [repo].[RepoObject]
* [repo].[RepoObjectColumn]
* [ssas].[model_json_311_tables_columns_T]
* [ssas].[model_json_31111_tables_columns_descriptions_StrAgg]
* [ssas].[model_json_31121_tables_columns_expressions_StrAgg]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross';




GO



GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'has_execution_plan_issue', @value = N'1', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.Unit_1_union.adoc[]
* xref:graph.RepoObjectColumn_S.adoc[]
* xref:property.RepoObjectColumnProperty_ForUpdate.adoc[]
* xref:reference.RepoObjectColumn_reference_FirstResultSet.adoc[]
* xref:reference.RepoObjectColumn_reference_QueryPlan.adoc[]
* xref:reference.RepoObjectColumn_reference_virtual.adoc[]
* xref:reference.usp_RepoObjectColumnSource_virtual_set.adoc[]
* xref:repo.RepoObjectColumn_gross2.adoc[]
* xref:repo.usp_sync_guid_RepoObjectColumn.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross';






GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:property.fs_get_RepoObjectColumnProperty_nvarchar.adoc[]
* xref:repo.RepoObject.adoc[]
* xref:repo.RepoObjectColumn.adoc[]
* xref:ssas.model_json_311_tables_columns_T.adoc[]
* xref:ssas.model_json_31111_tables_columns_descriptions_StrAgg.adoc[]
* xref:ssas.model_json_31121_tables_columns_expressions_StrAgg.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[SysObject_fullname2]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'SysObject_fullname2';


GO



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_fullname2]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[is_required_ColumnMerge]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'is_required_ColumnMerge';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[InheritanceType]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[InheritanceDefinition]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[Inheritance_StringAggSeparatorSql]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'Inheritance_StringAggSeparatorSql';


GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4bae410c-d3f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'Column_name';


GO



GO



GO



GO



GO



GO



GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4b6d05d0-0b08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'is_ssas';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4c6d05d0-0b08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '98dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'tabcol_Type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '97dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'tabcol_SummarizeBy';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '96dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'tabcol_IsUnique';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '95dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'tabcol_IsKey';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '94dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'tabcol_IsHidden';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '93dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'tabcol_FormatString';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '92dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'tabcol_Expression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '91dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'tabcol_DisplayFolder';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '90dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'tabcol_Description';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_311_tables_columns_T].[tables_columns_type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'tabcol_Type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_311_tables_columns_T].[tables_columns_summarizeBy]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'tabcol_SummarizeBy';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_311_tables_columns_T].[tables_columns_formatString]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'tabcol_FormatString';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_311_tables_columns_T].[tables_columns_displayFolder]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'tabcol_DisplayFolder';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[is_ssas]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'is_ssas';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[Column_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'Column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2aa38ed4-6012-ec11-851a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'persistence_source_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '90e80294-161b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_gross', @level2type = N'COLUMN', @level2name = N'is_external';

