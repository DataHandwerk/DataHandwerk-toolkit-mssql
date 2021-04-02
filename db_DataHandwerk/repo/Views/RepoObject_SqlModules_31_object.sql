
CREATE VIEW [repo].[RepoObject_SqlModules_31_object]
AS
--
SELECT [RepoObject_guid]
 , MAX([SysObject_fullname]) AS [SysObject_fullname]
 , MAX([is_1_create]) AS [is_1_create]
 , MAX([is_2_view]) AS [is_2_view]
 , MAX([is_3_Identifier]) AS [is_3_Identifier]
 , MAX([is_4_as]) AS [is_4_as]
 , MAX([is_5_select]) AS [is_5_select]
 , MAX([is_6_Identifier]) AS [is_6_Identifier]
 , MAX([is_6_IdentifierList]) AS [is_6_IdentifierList]
 , MAX([is_7_from]) AS [is_7_from]
 , MAX([is_7_IdentifierList]) AS [is_7_IdentifierList]
 , MAX([is_8_IdentifierList]) AS [is_8_IdentifierList]
FROM repo.[RepoObject_SqlModules_21_statement_children_helper]
GROUP BY [RepoObject_guid]

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'fe8f291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_31_object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '04f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_31_object', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '03f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_31_object', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0df27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_31_object', @level2type = N'COLUMN', @level2name = N'is_8_IdentifierList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0cf27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_31_object', @level2type = N'COLUMN', @level2name = N'is_7_IdentifierList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0bf27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_31_object', @level2type = N'COLUMN', @level2name = N'is_7_from';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0af27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_31_object', @level2type = N'COLUMN', @level2name = N'is_6_IdentifierList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '09f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_31_object', @level2type = N'COLUMN', @level2name = N'is_5_select';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '08f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_31_object', @level2type = N'COLUMN', @level2name = N'is_4_as';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '07f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_31_object', @level2type = N'COLUMN', @level2name = N'is_3_Identifier';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '06f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_31_object', @level2type = N'COLUMN', @level2name = N'is_2_view';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '05f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_31_object', @level2type = N'COLUMN', @level2name = N'is_1_create';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '31813ebd-7764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_31_object', @level2type = N'COLUMN', @level2name = N'is_6_Identifier';


GO



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject_SqlModules_21_statement_children_helper].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_31_object', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';

