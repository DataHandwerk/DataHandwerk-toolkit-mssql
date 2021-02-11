
CREATE VIEW [repo].[RepoObject_InheritanceType_InheritanceDefinition]
AS
SELECT
 --
 [ro].[RepoObject_guid]
 , [pn].[property_name]
 , [rop].[property_value]
 , [InheritanceType] = COALESCE([ro].[InheritanceType], [par_sub].[Parameter_value__result_int], [par].[Parameter_value__result_int])
 , [InheritanceDefinition] = COALESCE([ro].[InheritanceDefinition], [par_sub_c].[Parameter_value__result_nvarchar], [par_c].[Parameter_value__result_nvarchar])
 , [ro].[RepoObject_fullname]
 , [ro_InheritanceType] = [ro].[InheritanceType]
 , [sub_InheritanceType] = [par_sub].[Parameter_value__result_int]
 , [par_InheritanceType] = [par].[Parameter_value__result_int]
 , [ro_InheritanceDefinition] = [ro].[InheritanceDefinition]
 , [sub_InheritanceDefintion] = [par_sub_c].[Parameter_value__result_nvarchar]
 , [par_InheritanceDefintion] = [par_c].[Parameter_value__result_nvarchar]
FROM [repo].[RepoObject] AS ro
CROSS JOIN [repo].[PropertyName_RepoObject] AS pn
LEFT JOIN [repo].[Parameter] AS par_sub
 ON par_sub.[Parameter_name] = 'InheritanceType_object'
  AND par_sub.[sub_Parameter] = [pn].[property_name]
LEFT JOIN [repo].[Parameter] AS par
 ON par.[Parameter_name] = 'InheritanceType_object'
  AND par.[sub_Parameter] = ''
LEFT JOIN [repo].[Parameter] AS par_sub_c
 ON par_sub_c.[Parameter_name] = 'InheritanceDefinition_object'
  AND par_sub_c.[sub_Parameter] = [pn].[property_name]
LEFT JOIN [repo].[Parameter] AS par_c
 ON par_c.[Parameter_name] = 'InheritanceDefinition_object'
  AND par_c.[sub_Parameter] = ''
LEFT JOIN [repo].[RepoObjectProperty] AS rop
 ON rop.RepoObject_guid = [ro].[RepoObject_guid]
  AND rop.property_name = [pn].[property_name]