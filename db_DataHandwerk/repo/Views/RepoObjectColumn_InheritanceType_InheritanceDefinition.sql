
/*
Maybe rename RepoObjectColumnProperty_InheritanceType_InheritanceDefinition
*/
CREATE VIEW [repo].[RepoObjectColumn_InheritanceType_InheritanceDefinition]
AS
SELECT
 --
 [roc].[RepoObjectColumn_guid]
 , [pn].[property_name]
 , [rocp].[property_value]
 , [Inheritance_StringAggSeparatorSql] = COALESCE([roc].[Inheritance_StringAggSeparatorSql], [par_sub_sep].[Parameter_value__result_nvarchar], [par_sep].[Parameter_value__result_nvarchar])
 , [InheritanceDefinition] = COALESCE([roc].[InheritanceDefinition], [par_sub_def].[Parameter_value__result_nvarchar], [par_def].[Parameter_value__result_nvarchar])
 , [InheritanceType] = COALESCE([roc].[InheritanceType], [par_sub].[Parameter_value__result_int], [par].[Parameter_value__result_int])
 , [roc].[RepoObjectColumn_name]
 , [roc_InheritanceType] = [roc].[InheritanceType]
 , [sub_InheritanceType] = [par_sub].[Parameter_value__result_int]
 , [par_InheritanceType] = [par].[Parameter_value__result_int]
 , [roc_InheritanceDefinition] = [roc].[InheritanceDefinition]
 , [sub_InheritanceDefinition] = [par_sub_def].[Parameter_value__result_nvarchar]
 , [par_InheritanceDefinition] = [par_def].[Parameter_value__result_nvarchar]
 , [roc_Inheritance_StringAggSeparatorSql] = [roc].[Inheritance_StringAggSeparatorSql]
 , [sub_Inheritance_StringAggSeparatorSql] = [par_sub_sep].[Parameter_value__result_nvarchar]
 , [par_Inheritance_StringAggSeparatorSql] = [par_sep].[Parameter_value__result_nvarchar]
FROM [repo].[RepoObjectColumn] AS roc
CROSS JOIN [repo].[PropertyName_RepoObjectColumn] AS pn
LEFT JOIN [repo].[RepoObjectColumnProperty] AS rocp
 ON rocp.RepoObjectColumn_guid = [roc].[RepoObjectColumn_guid]
  AND rocp.property_name = [pn].[property_name]
LEFT JOIN [repo].[Parameter] AS par_sub
 ON par_sub.[Parameter_name] = 'InheritanceType_column'
  AND par_sub.[sub_Parameter] = [pn].[property_name]
LEFT JOIN [repo].[Parameter] AS par
 ON par.[Parameter_name] = 'InheritanceType_column'
  AND par.[sub_Parameter] = ''
LEFT JOIN [repo].[Parameter] AS par_sub_def
 ON par_sub_def.[Parameter_name] = 'InheritanceDefinition_column'
  AND par_sub_def.[sub_Parameter] = [pn].[property_name]
LEFT JOIN [repo].[Parameter] AS par_def
 ON par_def.[Parameter_name] = 'InheritanceDefinition_column'
  AND par_def.[sub_Parameter] = ''
LEFT JOIN [repo].[Parameter] AS par_sub_sep
 ON par_sub_sep.[Parameter_name] = 'Inheritance_StringAggSeparatorSql_column'
  AND par_sub_sep.[sub_Parameter] = [pn].[property_name]
LEFT JOIN [repo].[Parameter] AS par_sep
 ON par_sep.[Parameter_name] = 'Inheritance_StringAggSeparatorSql_column'
  AND par_sep.[sub_Parameter] = ''
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '65b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_InheritanceType_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f0b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'sub_InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f3b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'sub_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f6b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'sub_Inheritance_StringAggSeparatorSql';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'efb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'roc_InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f2b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'roc_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f5b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'roc_Inheritance_StringAggSeparatorSql';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eeb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e8b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eab33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e9b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f1b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'par_InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f4b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'par_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f7b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'par_Inheritance_StringAggSeparatorSql';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'edb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ecb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ebb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'Inheritance_StringAggSeparatorSql';

