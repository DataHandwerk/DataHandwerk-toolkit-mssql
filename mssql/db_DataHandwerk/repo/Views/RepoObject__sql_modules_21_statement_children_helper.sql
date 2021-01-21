




/*helpers are required in next steps to check several conditions*/
CREATE    view [repo].[RepoObject__sql_modules_21_statement_children_helper]
as
--
SELECT 
[T1].[RepoObject_guid]
, [T1].[key]
, [T1].[SysObject_fullname]
, [T1].[RowNumber_per_Object]
, [T1].[class]
, [T1].[is_group]
, [T1].[is_keyword]
, [T1].[is_whitespace]
, [T1].[normalized]
, [T1].[children]
, is_1_create = IIF ([RowNumber_per_Object] = 1 AND [normalized] = 'CREATE', 1, 0) 
, is_2_view = IIF ([RowNumber_per_Object] = 2 AND [normalized] = 'VIEW', 1, 0) 
, is_3_Identifier = IIF ([RowNumber_per_Object] = 3 AND [class] = 'Identifier', 1, 0) 
, is_4_as = IIF ([RowNumber_per_Object] = 4 AND [normalized] = 'AS', 1, 0) 
, is_5_select = IIF ([RowNumber_per_Object] = 5 AND [normalized] = 'SELECT', 1, 0) 
, is_6_IdentifierList = IIF ([RowNumber_per_Object] = 6 AND [class] = 'IdentifierList', 1, 0) 
, is_7_from = IIF ([RowNumber_per_Object] = 7 AND [normalized] = 'FROM', 1, 0) 
, is_7_IdentifierList = IIF ([RowNumber_per_Object] = 7 AND [class] = 'IdentifierList', 1, 0) 
, is_8_IdentifierList = IIF ([RowNumber_per_Object] = 8 AND [class] = 'IdentifierList', 1, 0) 
 FROM [repo].[RepoObject__sql_modules_20_statement_children] T1
