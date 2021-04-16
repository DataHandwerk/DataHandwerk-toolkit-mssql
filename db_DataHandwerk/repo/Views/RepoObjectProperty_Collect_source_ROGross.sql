
CREATE View repo.RepoObjectProperty_Collect_source_ROGross
As
Select
    ro.RepoObject_guid
  , property_name  = p_names.property_name
  , property_value = Case p_names.property_name
                         When 'pk_index_guid'
                             Then
                             Cast(ro.pk_index_guid As Sql_Variant)
                         When 'pk_IndexPatternColumnDatatype'
                             Then
                             Cast(ro.pk_IndexPatternColumnDatatype As Sql_Variant)
                         When 'pk_IndexPatternColumnName'
                             Then
                             Cast(ro.pk_IndexPatternColumnName As Sql_Variant)
                         When 'pk_IndexSemanticGroup'
                             Then
                             Cast(ro.pk_IndexSemanticGroup As Sql_Variant)
                         When 'is_repo_managed'
                             Then
                             Cast(ro.is_repo_managed As Sql_Variant)
                         When 'usp_persistence_RepoObject_guid'
                             Then
                             Cast(ro.usp_persistence_RepoObject_guid As Sql_Variant)
                         When 'persistence_source_RepoObject_guid'
                             Then
                             Cast(ro.persistence_source_RepoObject_guid As Sql_Variant)
                         When 'persistence_source_RepoObject_fullname'
                             Then
                             Cast(ro.persistence_source_RepoObject_fullname As Sql_Variant)
                         When 'persistence_source_RepoObject_fullname2'
                             Then
                             Cast(ro.persistence_source_RepoObject_fullname2 As Sql_Variant)
                         When 'persistence_source_RepoObject_xref'
                             Then
                             Cast(ro.persistence_source_RepoObject_xref As Sql_Variant)
                         When 'has_history'
                             Then
                             Cast(ro.has_history As Sql_Variant)
                         When 'has_history_columns'
                             Then
                             Cast(ro.has_history_columns As Sql_Variant)
                         When 'is_persistence'
                             Then
                             Cast(ro.is_persistence As Sql_Variant)
                         When 'is_persistence_check_duplicate_per_pk'
                             Then
                             Cast(ro.is_persistence_check_duplicate_per_pk As Sql_Variant)
                         When 'is_persistence_check_for_empty_source'
                             Then
                             Cast(ro.is_persistence_check_for_empty_source As Sql_Variant)
                         When 'is_persistence_delete_missing'
                             Then
                             Cast(ro.is_persistence_delete_missing As Sql_Variant)
                         When 'is_persistence_delete_changed'
                             Then
                             Cast(ro.is_persistence_delete_changed As Sql_Variant)
                         When 'is_persistence_insert'
                             Then
                             Cast(ro.is_persistence_insert As Sql_Variant)
                         When 'is_persistence_truncate'
                             Then
                             Cast(ro.is_persistence_truncate As Sql_Variant)
                         When 'is_persistence_update_changed'
                             Then
                             Cast(ro.is_persistence_update_changed As Sql_Variant)
                         When 'history_schema_name'
                             Then
                             Cast(ro.history_schema_name As Sql_Variant)
                         When 'history_table_name'
                             Then
                             Cast(ro.history_table_name As Sql_Variant)
                         When 'AntoraReferencedList'
                             Then
                             Cast(Cast(ro.AntoraReferencedList As NVarchar(4000)) As Sql_Variant)
                         When 'AntoraReferencingList'
                             Then
                             Cast(Cast(ro.AntoraReferencingList As NVarchar(4000)) As Sql_Variant)
                         When 'has_execution_plan_issue'
                             Then
                             Cast(ro.has_execution_plan_issue As Sql_Variant)
                         When 'has_get_referenced_issue'
                             Then
                             Cast(ro.has_get_referenced_issue As Sql_Variant)
                     End
From
    repo.RepoObject_gross ro
    Cross Join
    (
        Values
            ( 'pk_index_guid' )
          , ( 'pk_IndexPatternColumnDatatype' )
          , ( 'pk_IndexPatternColumnName' )
          , ( 'pk_IndexSemanticGroup' )
          , ( 'is_repo_managed' )
          , ( 'usp_persistence_RepoObject_guid' )
          , ( 'persistence_source_RepoObject_guid' )
          , ( 'persistence_source_RepoObject_fullname' )
          , ( 'persistence_source_RepoObject_fullname2' )
          , ( 'persistence_source_RepoObject_xref' )
          , ( 'has_history' )
          , ( 'has_history_columns' )
          , ( 'is_persistence' )
          , ( 'is_persistence_check_duplicate_per_pk' )
          , ( 'is_persistence_check_for_empty_source' )
          , ( 'is_persistence_delete_missing' )
          , ( 'is_persistence_delete_changed' )
          , ( 'is_persistence_insert' )
          , ( 'is_persistence_truncate' )
          , ( 'is_persistence_update_changed' )
          , ( 'history_schema_name' )
          , ( 'history_table_name' )
          , ( 'AntoraReferencedList' )
          , ( 'AntoraReferencingList' )
          , ( 'has_execution_plan_issue' )
          , ( 'has_get_referenced_issue' )
    )                     p_names ( property_name )
Where
    Not RepoObject_guid Is Null;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bcfe9885-ea9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_ROGross', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bbfe9885-ea9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_ROGross', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bafe9885-ea9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_ROGross', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b6fe9885-ea9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_ROGross';

