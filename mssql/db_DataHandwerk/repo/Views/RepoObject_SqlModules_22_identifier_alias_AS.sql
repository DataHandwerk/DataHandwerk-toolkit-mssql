/*
this works good for identifier, used in the FROM block of a statement:
it looks like these identifiers have only one child and inside this one child only one child identifier which is the alias
we also add a Row_number to enable filtering for the first alias (there should only be one, but who knows...)
by filtering ([RowNumber] = 1) in some next steps we ensure one entry per ([RepoObject_guid], [key])

But we have also a lot of other representations of tables, especially because of the (NOLOCK)
and we need some extra handling to extract them
*/
CREATE VIEW [repo].[RepoObject_SqlModules_22_identifier_alias_AS]
AS
--
SELECT [T1].[RepoObject_guid]
 , [T1].[key]
 , [T1].[SysObject_fullname]
 , [identifier_name] = [T1].[normalized]
 , [identifier_alias] = [T2].[normalized]
 , [RowNumber] = ROW_NUMBER() OVER (
  PARTITION BY [T1].[RepoObject_guid]
  , [T1].[key] ORDER BY [T2].[json_key]
  )
FROM repo.[RepoObject_SqlModules_20_statement_children] AS T1
CROSS APPLY [repo].[ftv_sqlparse]([T1].[children]) AS T2
WHERE [T1].[class] = 'Identifier'
 AND [T2].[class] = 'Identifier'

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '3790291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_22_identifier_alias_AS';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b3f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_22_identifier_alias_AS', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b6f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_22_identifier_alias_AS', @level2type = N'COLUMN', @level2name = N'RowNumber';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b1f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_22_identifier_alias_AS', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b2f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_22_identifier_alias_AS', @level2type = N'COLUMN', @level2name = N'key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b4f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_22_identifier_alias_AS', @level2type = N'COLUMN', @level2name = N'identifier_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b5f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_22_identifier_alias_AS', @level2type = N'COLUMN', @level2name = N'identifier_alias';

