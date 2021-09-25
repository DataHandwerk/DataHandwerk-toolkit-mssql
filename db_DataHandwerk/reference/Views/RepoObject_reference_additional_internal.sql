
CREATE View reference.RepoObject_reference_additional_internal
As
Select
--distinct, because the source also contains columns
    Distinct
    T1.referenced_RepoObject_guid
  , T1.referencing_RepoObject_guid
  , referenced_entity_name  = T1.referenced_Object
  , T1.referenced_fullname
  , T1.referenced_id
  --, referenced_node_id        
  , referenced_schema_name  = T1.referenced_Schema
  , T1.referenced_type
  , referencing_entity_name = T1.referencing_Object
  , T1.referencing_fullname
  , T1.referencing_id
  --, referencing_node_id       
  , referencing_schema_name = T1.referencing_Schema
  , T1.referencing_type
  , InformationSource       = 'reference.additional_Reference'
From
    reference.additional_Reference_guid As T1
Where
    T1.referenced_is_external      = 0
    And T1.referencing_is_external = 0
    And Not T1.referenced_RepoObject_guid Is Null
    And Not T1.referencing_RepoObject_guid Is Null
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6208fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal', @level2type = N'COLUMN', @level2name = N'InformationSource';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6108fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal', @level2type = N'COLUMN', @level2name = N'referencing_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6008fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal', @level2type = N'COLUMN', @level2name = N'referencing_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5f08fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal', @level2type = N'COLUMN', @level2name = N'referencing_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5e08fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal', @level2type = N'COLUMN', @level2name = N'referencing_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5d08fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal', @level2type = N'COLUMN', @level2name = N'referencing_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5c08fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal', @level2type = N'COLUMN', @level2name = N'referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5b08fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal', @level2type = N'COLUMN', @level2name = N'referenced_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5a08fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal', @level2type = N'COLUMN', @level2name = N'referenced_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5908fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal', @level2type = N'COLUMN', @level2name = N'referenced_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5808fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal', @level2type = N'COLUMN', @level2name = N'referenced_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5708fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5608fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9eb0b5f7-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [reference].[additional_Reference_guid]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:reference.RepoObject_reference_union.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:reference.additional_Reference_guid.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[additional_Reference_guid].[referencing_type]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal', @level2type = N'COLUMN', @level2name = N'referencing_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'reference in [repo_sys].[type]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal', @level2type = N'COLUMN', @level2name = N'referencing_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[additional_Reference_guid].[referencing_Schema]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal', @level2type = N'COLUMN', @level2name = N'referencing_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[additional_Reference_guid].[referencing_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[additional_Reference_guid].[referencing_id]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal', @level2type = N'COLUMN', @level2name = N'referencing_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[additional_Reference_guid].[referencing_fullname]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal', @level2type = N'COLUMN', @level2name = N'referencing_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal', @level2type = N'COLUMN', @level2name = N'referencing_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[additional_Reference_guid].[referencing_Object]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal', @level2type = N'COLUMN', @level2name = N'referencing_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[additional_Reference_guid].[referenced_type]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal', @level2type = N'COLUMN', @level2name = N'referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'reference in [repo_sys].[type]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal', @level2type = N'COLUMN', @level2name = N'referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[additional_Reference_guid].[referenced_Schema]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal', @level2type = N'COLUMN', @level2name = N'referenced_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[additional_Reference_guid].[referenced_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[additional_Reference_guid].[referenced_id]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal', @level2type = N'COLUMN', @level2name = N'referenced_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[additional_Reference_guid].[referenced_fullname]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal', @level2type = N'COLUMN', @level2name = N'referenced_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal', @level2type = N'COLUMN', @level2name = N'referenced_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[additional_Reference_guid].[referenced_Object]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional_internal', @level2type = N'COLUMN', @level2name = N'referenced_entity_name';

