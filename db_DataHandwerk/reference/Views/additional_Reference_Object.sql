
CREATE View reference.additional_Reference_Object
As
Select
    AntoraComponent = referenced_AntoraComponent
  , AntoraModule    = referenced_AntoraModule
  , SchemaName      = referenced_Schema
  , ObjectName      = referenced_Object
From
    reference.additional_Reference_is_external
--only external with any connenction to internal RepoObject
Where
    referenced_is_external      = 1
    And referencing_is_external = 0
Union
Select
    AntoraComponent = referencing_AntoraComponent
  , AntoraModule    = referencing_AntoraModule
  , SchemaName      = referencing_Schema
  , ObjectName      = referencing_Object
From
    reference.additional_Reference_is_external
--only external with any connenction to internal RepoObject
Where
    referenced_is_external      = 0
    And referencing_is_external = 1
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a8ed2e9f-d017-ec11-851c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_Object', @level2type = N'COLUMN', @level2name = N'ObjectName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a7ed2e9f-d017-ec11-851c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_Object', @level2type = N'COLUMN', @level2name = N'SchemaName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a6ed2e9f-d017-ec11-851c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_Object', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a5ed2e9f-d017-ec11-851c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_Object', @level2type = N'COLUMN', @level2name = N'AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'cab17b93-d017-ec11-851c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_Object';

