

CREATE View [property].[RepoObjectProperty_Collect_source_ROGross]
As
Select
    ro.RepoObject_guid
  , property_name  = p_names.property_name
  , property_value =
  --
  Case p_names.property_name
      When 'pk_index_guid'
          Then
          Cast(ro.pk_index_guid As NVarchar(Max))
      When 'pk_IndexPatternColumnDatatype'
          Then
          Cast(ro.pk_IndexPatternColumnDatatype As NVarchar(Max))
      When 'pk_IndexPatternColumnName'
          Then
          Cast(ro.pk_IndexPatternColumnName As NVarchar(Max))
      When 'pk_IndexSemanticGroup'
          Then
          Cast(ro.pk_IndexSemanticGroup As NVarchar(Max))
      When 'is_repo_managed'
          Then
          Cast(IsNull ( ro.is_repo_managed, 0 ) As NVarchar(Max))
      When 'is_ssas'
          Then
          Cast(IsNull ( ro.is_ssas, 0 ) As NVarchar(Max))
      When 'usp_persistence_RepoObject_guid'
          Then
          Cast(ro.usp_persistence_RepoObject_guid As NVarchar(Max))
      When 'persistence_source_RepoObject_guid'
          Then
          Cast(ro.persistence_source_RepoObject_guid As NVarchar(Max))
      When 'persistence_source_RepoObject_fullname'
          Then
          Cast(ro.persistence_source_RepoObject_fullname As NVarchar(Max))
      When 'persistence_source_RepoObject_fullname2'
          Then
          Cast(ro.persistence_source_RepoObject_fullname2 As NVarchar(Max))
      When 'persistence_source_RepoObject_xref'
          Then
          Cast(ro.persistence_source_RepoObject_xref As NVarchar(Max))
      When 'has_history'
          Then
          Cast(ro.has_history As NVarchar(Max))
      When 'has_history_columns'
          Then
          Cast(ro.has_history_columns As NVarchar(Max))
      When 'is_persistence'
          Then
          Cast(ro.is_persistence As NVarchar(Max))
      When 'is_persistence_check_duplicate_per_pk'
          Then
          Cast(ro.is_persistence_check_duplicate_per_pk As NVarchar(Max))
      When 'is_persistence_check_for_empty_source'
          Then
          Cast(ro.is_persistence_check_for_empty_source As NVarchar(Max))
      When 'is_persistence_delete_missing'
          Then
          Cast(ro.is_persistence_delete_missing As NVarchar(Max))
      When 'is_persistence_delete_changed'
          Then
          Cast(ro.is_persistence_delete_changed As NVarchar(Max))
      When 'is_persistence_insert'
          Then
          Cast(ro.is_persistence_insert As NVarchar(Max))
      When 'is_persistence_truncate'
          Then
          Cast(ro.is_persistence_truncate As NVarchar(Max))
      When 'is_persistence_update_changed'
          Then
          Cast(ro.is_persistence_update_changed As NVarchar(Max))
      When 'history_schema_name'
          Then
          Cast(ro.history_schema_name As NVarchar(Max))
      When 'history_table_name'
          Then
          Cast(ro.history_table_name As NVarchar(Max))
      When 'AntoraReferencedList'
          Then
          Cast(ro.AntoraReferencedList As NVarchar(Max))
      When 'AntoraReferencingList'
          Then
          Cast(ro.AntoraReferencingList As NVarchar(Max))
      When 'AntoraExternalReferencedList'
          Then
          Cast(ro.AntoraExternalReferencedList As NVarchar(Max))
      When 'AntoraExternalReferencingList'
          Then
          Cast(ro.AntoraExternalReferencingList As NVarchar(Max))
      When 'has_execution_plan_issue'
          Then
          Cast(ro.has_execution_plan_issue As NVarchar(Max))
      When 'has_get_referenced_issue'
          Then
          Cast(ro.has_get_referenced_issue As NVarchar(Max))
  End
From
    repo.RepoObject_gross2 As ro
    --ensure all these property_name are included in the resulting view per RepoObject
    Cross Join
    (
        Values
            ( 'pk_index_guid' )
          , ( 'pk_IndexPatternColumnDatatype' )
          , ( 'pk_IndexPatternColumnName' )
          , ( 'pk_IndexSemanticGroup' )
          , ( 'is_repo_managed' )
          , ( 'is_ssas' )
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
          , ( 'AntoraExternalReferencedList' )
          , ( 'AntoraExternalReferencingList' )
          , ( 'has_execution_plan_issue' )
          , ( 'has_get_referenced_issue' )
    )                     As p_names ( property_name )
Where
    Not ro.RepoObject_guid Is Null
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bcfe9885-ea9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_ROGross', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bbfe9885-ea9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_ROGross', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bafe9885-ea9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_ROGross', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b6fe9885-ea9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_ROGross';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[RepoObject_gross]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_ROGross';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'RepoObject_guid,property_name', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_ROGross';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObject_guid,property_name', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_ROGross';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier,varchar(39)', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_ROGross';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = '0e77eb3a-5f9f-eb11-84f8-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_ROGross';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:property.usp_RepoObjectProperty_collect.adoc[]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_ROGross';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.RepoObject_gross.adoc[]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_ROGross';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_ROGross', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';

