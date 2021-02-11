
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