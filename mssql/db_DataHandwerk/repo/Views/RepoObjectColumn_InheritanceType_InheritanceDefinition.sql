
CREATE VIEW [repo].[RepoObjectColumn_InheritanceType_InheritanceDefinition]
AS
SELECT
 --
 [roc].[RepoObjectColumn_guid]
 , [pn].[property_name]
 , [rocp].[property_value]
 , [InheritanceType] = COALESCE([roc].[InheritanceType], [par_sub].[Parameter_value__result_int], [par].[Parameter_value__result_int])
 , [InheritanceDefinition] = COALESCE([roc].[InheritanceDefinition], [par_sub_c].[Parameter_value__result_nvarchar], [par_c].[Parameter_value__result_nvarchar])
 , [roc].[RepoObjectColumn_name]
 , [roc_InheritanceType] = [roc].[InheritanceType]
 , [sub_InheritanceType] = [par_sub].[Parameter_value__result_int]
 , [par_InheritanceType] = [par].[Parameter_value__result_int]
 , [roc_InheritanceDefinition] = [roc].[InheritanceDefinition]
 , [sub_InheritanceDefinition] = [par_sub_c].[Parameter_value__result_nvarchar]
 , [par_InheritanceDefinition] = [par_c].[Parameter_value__result_nvarchar]
FROM [repo].[RepoObjectColumn] AS roc
CROSS JOIN [repo].[PropertyName_RepoObjectColumn] AS pn
LEFT JOIN [repo].[Parameter] AS par_sub
 ON par_sub.[Parameter_name] = 'InheritanceType_column'
  AND par_sub.[sub_Parameter] = [pn].[property_name]
LEFT JOIN [repo].[Parameter] AS par
 ON par.[Parameter_name] = 'InheritanceType_column'
  AND par.[sub_Parameter] = ''
LEFT JOIN [repo].[Parameter] AS par_sub_c
 ON par_sub_c.[Parameter_name] = 'InheritanceDefinition_column'
  AND par_sub_c.[sub_Parameter] = [pn].[property_name]
LEFT JOIN [repo].[Parameter] AS par_c
 ON par_c.[Parameter_name] = 'InheritanceDefinition_column'
  AND par_c.[sub_Parameter] = ''
LEFT JOIN [repo].[RepoObjectColumnProperty] AS rocp
 ON rocp.RepoObjectColumn_guid = [roc].[RepoObjectColumn_guid]
  AND rocp.property_name = [pn].[property_name]