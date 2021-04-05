
--todo: refactoring RepoObjectProperty_InheritanceType_InheritanceDefinition
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
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '64b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_InheritanceType_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e0b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'sub_InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e3b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'sub_InheritanceDefintion';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e6b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'sub_Inheritance_StringAggSeparatorSql';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dfb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'ro_InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e2b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'ro_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e5b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'ro_Inheritance_StringAggSeparatorSql';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'deb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd7b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ddb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd9b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd8b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e1b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'par_InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e4b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'par_InheritanceDefintion';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e7b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'par_Inheritance_StringAggSeparatorSql';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dcb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dbb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dab33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'Inheritance_StringAggSeparatorSql';

