
CREATE View reference.additional_Reference_from_ssas_src
As
Select
    Distinct
    referenced_AntoraComponent
  , referenced_AntoraModule
  , referenced_Schema          = Replace ( Replace ( Part2, '[', '' ), ']', '' )
  , referenced_Object          = Replace ( Replace ( Part3, '[', '' ), ']', '' )
  , referenced_Column          = tables_columns_sourceColumn
  , referencing_AntoraComponent
  , referencing_AntoraModule
  , referencing_Schema         = databasename
  , referencing_Object         = tables_name
  , referencing_Column         = tables_columns_name
--, RepoObject_guid
--, RepoObjectColumn_guid
--, databasename
--, tables_name
--, tables_columns_name
--, tables_columns_sourceColumn
--, tables_partitions_source_dataSource
--, Part1
--, Part2
--, Part3
--, tables_partitions_name
From
    ssas.additional_Reference_step1
Where
    Not referenced_AntoraComponent Is Null
    And Not referenced_AntoraModule Is Null
    And Not Part2 Is Null
    And Not Part3 Is Null
    And Not tables_columns_sourceColumn Is Null
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '59d1bfd9-8020-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_from_ssas_src', @level2type = N'COLUMN', @level2name = N'referencing_Column';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '58d1bfd9-8020-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_from_ssas_src', @level2type = N'COLUMN', @level2name = N'referencing_Object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '57d1bfd9-8020-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_from_ssas_src', @level2type = N'COLUMN', @level2name = N'referencing_Schema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '56d1bfd9-8020-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_from_ssas_src', @level2type = N'COLUMN', @level2name = N'referencing_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '55d1bfd9-8020-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_from_ssas_src', @level2type = N'COLUMN', @level2name = N'referencing_AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '54d1bfd9-8020-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_from_ssas_src', @level2type = N'COLUMN', @level2name = N'referenced_Column';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '53d1bfd9-8020-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_from_ssas_src', @level2type = N'COLUMN', @level2name = N'referenced_Object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '52d1bfd9-8020-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_from_ssas_src', @level2type = N'COLUMN', @level2name = N'referenced_Schema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '51d1bfd9-8020-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_from_ssas_src', @level2type = N'COLUMN', @level2name = N'referenced_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '50d1bfd9-8020-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_from_ssas_src', @level2type = N'COLUMN', @level2name = N'referenced_AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '989cf4ce-8020-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_from_ssas_src';

