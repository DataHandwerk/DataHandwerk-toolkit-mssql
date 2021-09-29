
Create View reference.additional_Reference_from_ssas_tgt
As
Select
    referenced_AntoraComponent
  , referenced_AntoraModule
  , referenced_Schema
  , referenced_Object
  , referenced_Column
  , referencing_AntoraComponent
  , referencing_AntoraModule
  , referencing_Schema
  , referencing_Object
  , referencing_Column
  , Id
  , tik
  , tik_hash
From
    reference.additional_Reference
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '66d1bfd9-8020-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_from_ssas_tgt', @level2type = N'COLUMN', @level2name = N'tik_hash';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '65d1bfd9-8020-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_from_ssas_tgt', @level2type = N'COLUMN', @level2name = N'tik';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '64d1bfd9-8020-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_from_ssas_tgt', @level2type = N'COLUMN', @level2name = N'Id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '63d1bfd9-8020-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_from_ssas_tgt', @level2type = N'COLUMN', @level2name = N'referencing_Column';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '62d1bfd9-8020-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_from_ssas_tgt', @level2type = N'COLUMN', @level2name = N'referencing_Object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '61d1bfd9-8020-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_from_ssas_tgt', @level2type = N'COLUMN', @level2name = N'referencing_Schema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '60d1bfd9-8020-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_from_ssas_tgt', @level2type = N'COLUMN', @level2name = N'referencing_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5fd1bfd9-8020-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_from_ssas_tgt', @level2type = N'COLUMN', @level2name = N'referencing_AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5ed1bfd9-8020-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_from_ssas_tgt', @level2type = N'COLUMN', @level2name = N'referenced_Column';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5dd1bfd9-8020-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_from_ssas_tgt', @level2type = N'COLUMN', @level2name = N'referenced_Object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5cd1bfd9-8020-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_from_ssas_tgt', @level2type = N'COLUMN', @level2name = N'referenced_Schema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5bd1bfd9-8020-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_from_ssas_tgt', @level2type = N'COLUMN', @level2name = N'referenced_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5ad1bfd9-8020-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_from_ssas_tgt', @level2type = N'COLUMN', @level2name = N'referenced_AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '999cf4ce-8020-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_from_ssas_tgt';

