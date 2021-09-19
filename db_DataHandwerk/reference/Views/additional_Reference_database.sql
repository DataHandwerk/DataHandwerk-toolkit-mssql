CREATE View [reference].[additional_Reference_database]
As
Select
    AntoraComponent = referenced_AntoraComponent
  , AntoraModule    = referenced_AntoraModule
From
    reference.additional_Reference
Union
Select
    AntoraComponent = referencing_AntoraComponent
  , AntoraModule    = referencing_AntoraModule
From
    reference.additional_Reference
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a2ed2e9f-d017-ec11-851c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_database', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a1ed2e9f-d017-ec11-851c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_database', @level2type = N'COLUMN', @level2name = N'AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'c8b17b93-d017-ec11-851c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_database';

