Create View reference.additional_Reference_ObjectColumn
As
Select
    AntoraComponent = referenced_AntoraComponent
  , AntoraModule    = referenced_AntoraModule
  , SchemaName      = referenced_Schema
  , ObjectName      = referenced_Object
  , ColumnName      = referenced_Column
From
    reference.additional_Reference
Where
    Not referenced_Column Is Null
Union
Select
    AntoraComponent = referencing_AntoraComponent
  , AntoraModule    = referencing_AntoraModule
  , SchemaName      = referencing_Schema
  , ObjectName      = referencing_Object
  , ColumnName      = referencing_Column
From
    reference.additional_Reference
Where
    Not referencing_Column Is Null
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'afed2e9f-d017-ec11-851c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_ObjectColumn', @level2type = N'COLUMN', @level2name = N'ColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aeed2e9f-d017-ec11-851c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_ObjectColumn', @level2type = N'COLUMN', @level2name = N'ObjectName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aded2e9f-d017-ec11-851c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_ObjectColumn', @level2type = N'COLUMN', @level2name = N'SchemaName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aced2e9f-d017-ec11-851c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_ObjectColumn', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'abed2e9f-d017-ec11-851c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_ObjectColumn', @level2type = N'COLUMN', @level2name = N'AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ccb17b93-d017-ec11-851c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_ObjectColumn';

