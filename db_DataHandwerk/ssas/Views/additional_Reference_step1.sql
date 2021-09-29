Create View ssas.additional_Reference_step1
As
Select
    col.RepoObject_guid
  , col.RepoObjectColumn_guid
  , part.databasename
  , part.tables_name
  , col.tables_columns_name
  , col.tables_columns_sourceColumn
  , part.tables_partitions_source_dataSource
  , part.Part1
  , part.Part2
  , part.Part3
  , part.tables_partitions_name
  , dsource.referenced_AntoraComponent
  , dsource.referenced_AntoraModule
  , referencing_AntoraComponent = AntoraComponent.Parameter_value_result
  , referencing_AntoraModule    = AntoraModule.Parameter_value_result

--, part.tables_partitions_source_name
--, part.tables_partitions_source_expression
--, part.tables_partitions_source_query
--, part.tables_partitions_source_query_ja
--, part.tables_partitions_source_type
--, part.PosFrom
--, part.PosFromWhere
--, part.StringFrom
--, part.PosDot1
--, part.PosDot2
From
    ssas.model_json_31311111_tables_partitions_source_Part123           As part
    Left Outer Join
        ssas.model_json_311_tables_columns_T                            As col
            On
            col.RepoObject_guid = part.RepoObject_guid

    Left Join
        ssas.model_json_33_dataSources_T                                As dsource
            On
            dsource.databasename = part.databasename
            And dsource.dataSources_name = part.tables_partitions_source_dataSource
    Cross Join config.ftv_get_parameter_value ( 'AntoraComponent', '' ) As AntoraComponent
    Cross Join config.ftv_get_parameter_value ( 'AntoraModule', '' ) As AntoraModule
Where
    Not col.tables_columns_name Is Null
    And Not col.tables_columns_sourceColumn Is Null
    And col.tables_name = part.tables_name
    And Not part.Part3 Is Null
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e296c746-7c20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'additional_Reference_step1', @level2type = N'COLUMN', @level2name = N'referencing_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e196c746-7c20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'additional_Reference_step1', @level2type = N'COLUMN', @level2name = N'referencing_AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e096c746-7c20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'additional_Reference_step1', @level2type = N'COLUMN', @level2name = N'referenced_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'df96c746-7c20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'additional_Reference_step1', @level2type = N'COLUMN', @level2name = N'referenced_AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'de96c746-7c20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'additional_Reference_step1', @level2type = N'COLUMN', @level2name = N'tables_partitions_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dd96c746-7c20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'additional_Reference_step1', @level2type = N'COLUMN', @level2name = N'Part3';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dc96c746-7c20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'additional_Reference_step1', @level2type = N'COLUMN', @level2name = N'Part2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'db96c746-7c20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'additional_Reference_step1', @level2type = N'COLUMN', @level2name = N'Part1';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'da96c746-7c20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'additional_Reference_step1', @level2type = N'COLUMN', @level2name = N'tables_partitions_source_dataSource';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd996c746-7c20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'additional_Reference_step1', @level2type = N'COLUMN', @level2name = N'tables_columns_sourceColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd896c746-7c20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'additional_Reference_step1', @level2type = N'COLUMN', @level2name = N'tables_columns_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd796c746-7c20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'additional_Reference_step1', @level2type = N'COLUMN', @level2name = N'tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd696c746-7c20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'additional_Reference_step1', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd596c746-7c20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'additional_Reference_step1', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd496c746-7c20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'additional_Reference_step1', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '1eefa93c-7c20-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'additional_Reference_step1';

