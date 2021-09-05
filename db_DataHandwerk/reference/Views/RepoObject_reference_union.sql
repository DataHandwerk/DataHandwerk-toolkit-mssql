
CREATE View reference.RepoObject_reference_union
As
Select
    T1.referenced_RepoObject_guid
  , T1.referencing_RepoObject_guid
  , T1.referenced_entity_name
  , T1.referenced_fullname
  , T1.referenced_id
  --, T1.referenced_node_id
  , T1.referenced_schema_name
  , T1.referenced_type
  , T1.referencing_entity_name
  , T1.referencing_fullname
  , T1.referencing_id
  --, T1.referencing_node_id
  , T1.referencing_schema_name
  , T1.referencing_type
  , T1.InformationSource
  , one = 1
From
    reference.RepoObject_reference_SqlExpressionDependencies As T1
Union All
Select
    T1.referenced_RepoObject_guid
  , T1.referencing_RepoObject_guid
  , T1.referenced_entity_name
  , T1.referenced_fullname
  , T1.referenced_id
  --, T1.referenced_node_id
  , T1.referenced_schema_name
  , T1.referenced_type
  , T1.referencing_entity_name
  , T1.referencing_fullname
  , T1.referencing_id
  --, T1.referencing_node_id
  , T1.referencing_schema_name
  , T1.referencing_type
  , T1.InformationSource
  , one = 1
From
    reference.RepoObject_reference_persistence As T1
Union All
Select
    T1.referenced_RepoObject_guid
  , T1.referencing_RepoObject_guid
  , T1.referenced_entity_name
  , T1.referenced_fullname
  , T1.referenced_id
  --, T1.referenced_node_id
  , T1.referenced_schema_name
  , T1.referenced_type
  , T1.referencing_entity_name
  , T1.referencing_fullname
  , T1.referencing_id
  --, T1.referencing_node_id
  , T1.referencing_schema_name
  , T1.referencing_type
  , T1.InformationSource
  , one = 1
From
    reference.RepoObject_reference_virtual As T1
Union All
Select
    T1.referenced_RepoObject_guid
  , T1.referencing_RepoObject_guid
  , T1.referenced_entity_name
  , T1.referenced_fullname
  , T1.referenced_id
  --, T1.referenced_node_id
  , T1.referenced_schema_name
  , T1.referenced_type
  , T1.referencing_entity_name
  , T1.referencing_fullname
  , T1.referencing_id
  --, T1.referencing_node_id
  , T1.referencing_schema_name
  , T1.referencing_type
  , T1.InformationSource
  , one = 1
From
    reference.RepoObject_reference_persistence_target_as_source As T1
Union All
Select
    T1.referenced_RepoObject_guid
  , T1.referencing_RepoObject_guid
  , T1.referenced_entity_name
  , T1.referenced_fullname
  , T1.referenced_id
  --, T1.referenced_node_id
  , T1.referenced_schema_name
  , T1.referenced_type
  , T1.referencing_entity_name
  , T1.referencing_fullname
  , T1.referencing_id
  --, T1.referencing_node_id
  , T1.referencing_schema_name
  , T1.referencing_type
  , T1.InformationSource
  , one = 1
From
    reference.RepoObject_reference_additional_internal As T1
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '6390291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_union';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'daf57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_union'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'dbf57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_union'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd8f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_union'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_RepoObject_guid';
Go


Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd4f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_union'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'dcf57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_union'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_entity_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'dff57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_union'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ddf57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_union'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd9f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_union'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_RepoObject_guid';
Go


Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd6f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_union'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'def57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_union'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_entity_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e0f57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_union'
  , @level2type = N'COLUMN'
  , @level2name = N'InformationSource';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '38df2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_union'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '37df2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_union'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '39df2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_reference_union'
  , @level2type = N'COLUMN'
  , @level2name = N'one';
Go
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [reference].[RepoObject_reference_additional_internal]
* [reference].[RepoObject_reference_persistence]
* [reference].[RepoObject_reference_persistence_target_as_source]
* [reference].[RepoObject_reference_SqlExpressionDependencies]
* [reference].[RepoObject_reference_virtual]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_union';




GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'referenced_RepoObject_guid,referencing_RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_union';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier,uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_union';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'2563C687-0D96-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_union';


GO
EXECUTE sp_addextendedproperty @name = N'has_execution_plan_issue', @value = N'1', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_union';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:reference.RepoObject_reference.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_union';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:reference.RepoObject_reference_additional_internal.adoc[]
* xref:reference.RepoObject_reference_persistence.adoc[]
* xref:reference.RepoObject_reference_persistence_target_as_source.adoc[]
* xref:reference.RepoObject_reference_SqlExpressionDependencies.adoc[]
* xref:reference.RepoObject_reference_virtual.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_union';




GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_union';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_union';

