/*
<<property_start>>Description
include::partial$docsnippet/reference-from-persistence.adoc[]
<<property_end>>
*/
Create View reference.RepoObject_reference_persistence_target_as_source_explicit
As
Select
    referenced_id               = ref.referencing_id
  , referencing_id              = ref.referenced_id
  , referenced_entity_name      = ref.referencing_entity_name
  , referenced_fullname         = ref.referencing_fullname
  --, [referenced_node_id]          = [referencing_node_id]
  , referenced_RepoObject_guid  = ref.referencing_RepoObject_guid
  , referenced_schema_name      = ref.referencing_schema_name
  , referenced_type             = ref.referencing_type
  , referencing_entity_name     = ref.referenced_entity_name
  , referencing_fullname        = ref.referenced_fullname
  --, [referencing_node_id]         = [referenced_node_id]
  , referencing_RepoObject_guid = ref.referenced_RepoObject_guid
  , referencing_schema_name     = ref.referenced_schema_name
  , referencing_type            = ref.referenced_type
  , InformationSource           = 'persistence_target_as_source_explicit'
From
    reference.RepoObject_reference_SqlExpressionDependencies As ref
    Left Join
        repo.RepoObject                                      As ro
            On
            ro.RepoObject_guid             = ref.referencing_RepoObject_guid

    Left Outer Join
        repo.RepoObject_persistence                          As ro_p
            On
            ro_p.target_RepoObject_guid    = ro.RepoObject_guid

    Left Outer Join
        repo.RepoObject                                      As ro2
            On
            ro2.RepoObject_name            = ro_p.final_target_RepoObject_name
            And ro2.RepoObject_schema_name = ro.RepoObject_schema_name
            And ro2.RepoObject_guid        = ref.referenced_RepoObject_guid
Where
    Not ro2.RepoObject_guid Is Null
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '42393564-ae7b-ec11-8541-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence_target_as_source_explicit', @level2type = N'COLUMN', @level2name = N'InformationSource';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '41393564-ae7b-ec11-8541-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence_target_as_source_explicit', @level2type = N'COLUMN', @level2name = N'referencing_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '40393564-ae7b-ec11-8541-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence_target_as_source_explicit', @level2type = N'COLUMN', @level2name = N'referencing_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3f393564-ae7b-ec11-8541-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence_target_as_source_explicit', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3e393564-ae7b-ec11-8541-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence_target_as_source_explicit', @level2type = N'COLUMN', @level2name = N'referencing_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3d393564-ae7b-ec11-8541-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence_target_as_source_explicit', @level2type = N'COLUMN', @level2name = N'referencing_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3c393564-ae7b-ec11-8541-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence_target_as_source_explicit', @level2type = N'COLUMN', @level2name = N'referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3b393564-ae7b-ec11-8541-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence_target_as_source_explicit', @level2type = N'COLUMN', @level2name = N'referenced_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3a393564-ae7b-ec11-8541-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence_target_as_source_explicit', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '39393564-ae7b-ec11-8541-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence_target_as_source_explicit', @level2type = N'COLUMN', @level2name = N'referenced_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '38393564-ae7b-ec11-8541-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence_target_as_source_explicit', @level2type = N'COLUMN', @level2name = N'referenced_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '37393564-ae7b-ec11-8541-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence_target_as_source_explicit', @level2type = N'COLUMN', @level2name = N'referencing_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '36393564-ae7b-ec11-8541-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence_target_as_source_explicit', @level2type = N'COLUMN', @level2name = N'referenced_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'c71dca55-ae7b-ec11-8541-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence_target_as_source_explicit';

