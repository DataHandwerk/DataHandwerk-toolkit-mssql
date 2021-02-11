
CREATE VIEW [repo].[RepoObject_InheritanceType_InheritanceDefinition]
AS
SELECT
 --
 [ro].[RepoObject_guid]
 , [pn].[property_name]
 , [rop].[property_value]
 , [Inheritance_StringAggSeparatorSql] = COALESCE([ro].[Inheritance_StringAggSeparatorSql], [par_sub_sep].[Parameter_value__result_nvarchar], [par_sep].[Parameter_value__result_nvarchar])
 , [InheritanceDefinition] = COALESCE([ro].[InheritanceDefinition], [par_sub_def].[Parameter_value__result_nvarchar], [par_def].[Parameter_value__result_nvarchar])
 , [InheritanceType] = COALESCE([ro].[InheritanceType], [par_sub].[Parameter_value__result_int], [par].[Parameter_value__result_int])
 , [ro].[RepoObject_fullname]
 , [ro].[RepoObject_type]
 , [ro_InheritanceType] = [ro].[InheritanceType]
 , [sub_InheritanceType] = [par_sub].[Parameter_value__result_int]
 , [par_InheritanceType] = [par].[Parameter_value__result_int]
 , [ro_InheritanceDefinition] = [ro].[InheritanceDefinition]
 , [sub_InheritanceDefintion] = [par_sub_def].[Parameter_value__result_nvarchar]
 , [par_InheritanceDefintion] = [par_def].[Parameter_value__result_nvarchar]
 , [ro_Inheritance_StringAggSeparatorSql] = [ro].[Inheritance_StringAggSeparatorSql]
 , [sub_Inheritance_StringAggSeparatorSql] = [par_sub_sep].[Parameter_value__result_nvarchar]
 , [par_Inheritance_StringAggSeparatorSql] = [par_sep].[Parameter_value__result_nvarchar]
FROM [repo].[RepoObject] AS ro
CROSS JOIN [repo].[PropertyName_RepoObject] AS pn
LEFT JOIN [repo].[RepoObjectProperty] AS rop
 ON rop.RepoObject_guid = [ro].[RepoObject_guid]
  AND rop.property_name = [pn].[property_name]
LEFT JOIN [repo].[Parameter] AS par_sub
 ON par_sub.[Parameter_name] = 'InheritanceType_object'
  AND par_sub.[sub_Parameter] = [pn].[property_name]
LEFT JOIN [repo].[Parameter] AS par
 ON par.[Parameter_name] = 'InheritanceType_object'
  AND par.[sub_Parameter] = ''
LEFT JOIN [repo].[Parameter] AS par_sub_def
 ON par_sub_def.[Parameter_name] = 'InheritanceDefinition_object'
  AND par_sub_def.[sub_Parameter] = [pn].[property_name]
LEFT JOIN [repo].[Parameter] AS par_def
 ON par_def.[Parameter_name] = 'InheritanceDefinition_object'
  AND par_def.[sub_Parameter] = ''
LEFT JOIN [repo].[Parameter] AS par_sub_sep
 ON par_sub_sep.[Parameter_name] = 'Inheritance_StringAggSeparatorSql_object'
  AND par_sub_sep.[sub_Parameter] = [pn].[property_name]
LEFT JOIN [repo].[Parameter] AS par_sep
 ON par_sep.[Parameter_name] = 'Inheritance_StringAggSeparatorSql_object'
  AND par_sep.[sub_Parameter] = ''