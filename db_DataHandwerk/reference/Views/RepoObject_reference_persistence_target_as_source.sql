

/*
If a view is the target of a persistence to write to the data source of the view via this view, then this reverse reference is also to be displayed and used
*/
CREATE View [reference].[RepoObject_reference_persistence_target_as_source]
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
  , InformationSource           = 'persistence_target_as_source'
From
    reference.RepoObject_reference_SqlExpressionDependencies As ref
    Left Join
        repo.RepoObject_gross                                As ro
            On
            ro.RepoObject_guid = ref.referencing_RepoObject_guid
Where
    ro.is_persistence = 1
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '4ab8c8a5-cef9-eb11-850d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence_target_as_source';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '83448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence_target_as_source', @level2type = N'COLUMN', @level2name = N'referencing_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '82448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence_target_as_source', @level2type = N'COLUMN', @level2name = N'referencing_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '81448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence_target_as_source', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '79448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence_target_as_source', @level2type = N'COLUMN', @level2name = N'referencing_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '80448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence_target_as_source', @level2type = N'COLUMN', @level2name = N'referencing_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7f448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence_target_as_source', @level2type = N'COLUMN', @level2name = N'referencing_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7e448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence_target_as_source', @level2type = N'COLUMN', @level2name = N'referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7d448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence_target_as_source', @level2type = N'COLUMN', @level2name = N'referenced_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7c448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence_target_as_source', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '78448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence_target_as_source', @level2type = N'COLUMN', @level2name = N'referenced_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7b448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence_target_as_source', @level2type = N'COLUMN', @level2name = N'referenced_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7a448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence_target_as_source', @level2type = N'COLUMN', @level2name = N'referenced_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '84448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_persistence_target_as_source', @level2type = N'COLUMN', @level2name = N'InformationSource';

