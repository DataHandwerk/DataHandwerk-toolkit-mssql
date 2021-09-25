
CREATE View reference.RepoObject_reference_additional
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
  , T1.referenced_external_AntoraComponent
  , T1.referenced_external_AntoraModule
  , referenced_is_external
  , referencing_entity_name = T1.referencing_Object
  , T1.referencing_fullname
  , T1.referencing_id
  --, referencing_node_id       
  , referencing_schema_name = T1.referencing_Schema
  , T1.referencing_type
  , T1.referencing_external_AntoraComponent
  , T1.referencing_external_AntoraModule
  , referencing_is_external
  , InformationSource       = 'reference.additional_Reference'
From
    reference.additional_Reference_guid As T1
Where
    (
        T1.referenced_is_external     = 0
        Or T1.referencing_is_external = 0
    )
    And Not T1.referenced_RepoObject_guid Is Null
    And Not T1.referencing_RepoObject_guid Is Null
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '65320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional', @level2type = N'COLUMN', @level2name = N'InformationSource';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '64320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional', @level2type = N'COLUMN', @level2name = N'referencing_is_external';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '63320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional', @level2type = N'COLUMN', @level2name = N'referencing_external_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '62320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional', @level2type = N'COLUMN', @level2name = N'referencing_external_AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '61320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional', @level2type = N'COLUMN', @level2name = N'referencing_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '60320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional', @level2type = N'COLUMN', @level2name = N'referencing_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5f320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional', @level2type = N'COLUMN', @level2name = N'referencing_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5e320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional', @level2type = N'COLUMN', @level2name = N'referencing_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5d320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional', @level2type = N'COLUMN', @level2name = N'referencing_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5c320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional', @level2type = N'COLUMN', @level2name = N'referenced_is_external';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5b320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional', @level2type = N'COLUMN', @level2name = N'referenced_external_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5a320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional', @level2type = N'COLUMN', @level2name = N'referenced_external_AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '59320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional', @level2type = N'COLUMN', @level2name = N'referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '58320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional', @level2type = N'COLUMN', @level2name = N'referenced_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '57320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional', @level2type = N'COLUMN', @level2name = N'referenced_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '56320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional', @level2type = N'COLUMN', @level2name = N'referenced_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '55320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional', @level2type = N'COLUMN', @level2name = N'referenced_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '54320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '53320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7bdaaa1b-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_reference_additional';

