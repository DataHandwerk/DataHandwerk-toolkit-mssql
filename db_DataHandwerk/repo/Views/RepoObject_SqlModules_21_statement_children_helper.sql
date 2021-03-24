

/*helpers are required in next steps to check several conditions
here we prepare the check if the parsed statement will follow some required logic, for example
CREATE;VIEW;Identifier;AS;SELECT;IdentifierList;FROM
*/
CREATE VIEW [repo].[RepoObject_SqlModules_21_statement_children_helper]
AS
--
SELECT [T1].[RepoObject_guid]
 , [T1].[json_key]
 , [T1].[SysObject_fullname]
 , [T1].[RowNumber_per_Object]
 , [T1].[class]
 , [T1].[is_group]
 , [T1].[is_keyword]
 , [T1].[is_whitespace]
 , [T1].[normalized]
 , [T1].[children]
 --the entry 1 in the parsed sql is 'CREATE'
 , is_1_create = IIF([RowNumber_per_Object] = 1
  AND [normalized] = 'CREATE', 1, 0)
 --the entry 2 in the parsed sql is 'VIEW'
 , is_2_view = IIF([RowNumber_per_Object] = 2
  AND [normalized] = 'VIEW', 1, 0)
 , is_3_Identifier = IIF([RowNumber_per_Object] = 3
  AND [class] = 'Identifier', 1, 0)
 , is_4_as = IIF([RowNumber_per_Object] = 4
  AND [normalized] = 'AS', 1, 0)
 , is_5_select = IIF([RowNumber_per_Object] = 5
  AND [normalized] = 'SELECT', 1, 0)
 , is_6_Identifier = IIF([RowNumber_per_Object] = 6
  AND [class] = 'Identifier', 1, 0)
 , is_6_IdentifierList = IIF([RowNumber_per_Object] = 6
  AND [class] = 'IdentifierList', 1, 0)
 , is_7_from = IIF([RowNumber_per_Object] = 7
  AND [normalized] = 'FROM', 1, 0)
 , is_7_IdentifierList = IIF([RowNumber_per_Object] = 7
  AND [class] = 'IdentifierList', 1, 0)
 , is_8_IdentifierList = IIF([RowNumber_per_Object] = 8
  AND [class] = 'IdentifierList', 1, 0)
FROM [repo].[RepoObject_SqlModules_20_statement_children] T1

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f98f291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_21_statement_children_helper';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eef17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_21_statement_children_helper', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eff17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_21_statement_children_helper', @level2type = N'COLUMN', @level2name = N'RowNumber_per_Object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ecf17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_21_statement_children_helper', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f4f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_21_statement_children_helper', @level2type = N'COLUMN', @level2name = N'normalized';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f3f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_21_statement_children_helper', @level2type = N'COLUMN', @level2name = N'is_whitespace';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f2f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_21_statement_children_helper', @level2type = N'COLUMN', @level2name = N'is_keyword';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f1f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_21_statement_children_helper', @level2type = N'COLUMN', @level2name = N'is_group';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fef17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_21_statement_children_helper', @level2type = N'COLUMN', @level2name = N'is_8_IdentifierList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fdf17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_21_statement_children_helper', @level2type = N'COLUMN', @level2name = N'is_7_IdentifierList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fcf17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_21_statement_children_helper', @level2type = N'COLUMN', @level2name = N'is_7_from';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fbf17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_21_statement_children_helper', @level2type = N'COLUMN', @level2name = N'is_6_IdentifierList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'faf17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_21_statement_children_helper', @level2type = N'COLUMN', @level2name = N'is_5_select';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f9f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_21_statement_children_helper', @level2type = N'COLUMN', @level2name = N'is_4_as';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f8f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_21_statement_children_helper', @level2type = N'COLUMN', @level2name = N'is_3_Identifier';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f7f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_21_statement_children_helper', @level2type = N'COLUMN', @level2name = N'is_2_view';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f6f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_21_statement_children_helper', @level2type = N'COLUMN', @level2name = N'is_1_create';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f0f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_21_statement_children_helper', @level2type = N'COLUMN', @level2name = N'class';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f5f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_21_statement_children_helper', @level2type = N'COLUMN', @level2name = N'children';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2f813ebd-7764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_21_statement_children_helper', @level2type = N'COLUMN', @level2name = N'json_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '30813ebd-7764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_21_statement_children_helper', @level2type = N'COLUMN', @level2name = N'is_6_Identifier';

