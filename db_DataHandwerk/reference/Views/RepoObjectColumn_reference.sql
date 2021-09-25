
CREATE View reference.RepoObjectColumn_reference
As
Select
    referenced_RepoObjectColumn_guid
  , referencing_RepoObjectColumn_guid
  , referenced_RepoObject_guid                    = Max ( referenced_RepoObject_guid )
  , referenced_schema_name                        = Max ( referenced_schema_name )
  , referenced_entity_name                        = Max ( referenced_entity_name )
  , referenced_column_name                        = Max ( referenced_column_name )
  , referenced_type                               = Max ( referenced_type )
  , referenced_external_AntoraComponent           = Max ( referenced_external_AntoraComponent )
  , referenced_external_AntoraModule              = Max ( referenced_external_AntoraModule )
  , referenced_is_external                        = Max ( IsNull ( referenced_is_external, 0 ))
  , referencing_RepoObject_guid                   = Max ( referencing_RepoObject_guid )
  , referencing_schema_name                       = Max ( referencing_schema_name )
  , referencing_entity_name                       = Max ( referencing_entity_name )
  , referencing_column_name                       = Max ( referencing_column_name )
  , referencing_type                              = Max ( referencing_type )
  , referencing_external_AntoraComponent          = Max ( referencing_external_AntoraComponent )
  , referencing_external_AntoraModule             = Max ( referencing_external_AntoraModule )
  , referencing_is_external                       = Max ( IsNull ( referencing_is_external, 0 ))
  , is_referencing_object_equal_referenced_object = Max ( Cast(is_referencing_object_equal_referenced_object As TinyInt))
  , is_referenced_object                          = Max ( Cast(is_referenced_object As TinyInt))
From
    reference.RepoObjectColumn_reference_union
Group By
    referenced_RepoObjectColumn_guid
  , referencing_RepoObjectColumn_guid
Having
    ( Not ( referenced_RepoObjectColumn_guid Is Null ))
    And ( Not ( referencing_RepoObjectColumn_guid Is Null ))
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e67c5574-89f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference', @level2type = N'COLUMN', @level2name = N'is_referenced_object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e57c5574-89f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference', @level2type = N'COLUMN', @level2name = N'is_referencing_object_equal_referenced_object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '38d81bf9-57f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference', @level2type = N'COLUMN', @level2name = N'referencing_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '37d81bf9-57f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference', @level2type = N'COLUMN', @level2name = N'referencing_column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '36d81bf9-57f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference', @level2type = N'COLUMN', @level2name = N'referencing_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '35d81bf9-57f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference', @level2type = N'COLUMN', @level2name = N'referencing_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '34d81bf9-57f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '33d81bf9-57f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference', @level2type = N'COLUMN', @level2name = N'referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '32d81bf9-57f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference', @level2type = N'COLUMN', @level2name = N'referenced_column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '31d81bf9-57f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference', @level2type = N'COLUMN', @level2name = N'referenced_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '30d81bf9-57f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference', @level2type = N'COLUMN', @level2name = N'referenced_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2fd81bf9-57f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2ed81bf9-57f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference', @level2type = N'COLUMN', @level2name = N'referencing_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2dd81bf9-57f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference', @level2type = N'COLUMN', @level2name = N'referenced_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '2cd81bf9-57f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'referenced_RepoObjectColumn_guid,referencing_RepoObjectColumn_guid', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier,uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = '82daa843-5bf5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:reference.RepoObjectColumn_reference_T.adoc[]
* xref:reference.usp_PERSIST_RepoObjectColumn_reference_T.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:reference.RepoObjectColumn_reference_union.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [reference].[RepoObjectColumn_reference_union]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference_union].[referencing_RepoObjectColumn_guid]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference', @level2type = N'COLUMN', @level2name = N'referencing_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference_union].[referenced_RepoObjectColumn_guid]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference', @level2type = N'COLUMN', @level2name = N'referenced_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference_union].[referenced_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ac320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference', @level2type = N'COLUMN', @level2name = N'referencing_is_external';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ab320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference', @level2type = N'COLUMN', @level2name = N'referencing_external_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aa320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference', @level2type = N'COLUMN', @level2name = N'referencing_external_AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a9320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference', @level2type = N'COLUMN', @level2name = N'referenced_is_external';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a8320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference', @level2type = N'COLUMN', @level2name = N'referenced_external_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a7320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference', @level2type = N'COLUMN', @level2name = N'referenced_external_AntoraComponent';

