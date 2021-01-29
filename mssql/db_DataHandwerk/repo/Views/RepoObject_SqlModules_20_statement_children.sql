/*
Assuming that a statement has only one child, this one child is decomposed into its components here.

In the next step the reiehenfolge can be checked
For example
- CREATE
- VIEW
- (identifier)
- AS
- SELECT

It can be checked if there are other components between SELECT and IdentifierList, like DISTINCT
- SELECT
- optional ... (DISTINCT, TOP xyz, ...)
- IdentifierList
- FROM

- FROM
- ...
- WHERE / HAVING

and so on
*/
CREATE VIEW [repo].[RepoObject_SqlModules_20_statement_children]
AS
--
SELECT [T1].[RepoObject_guid]
 --we need the key for ROW_NUMBER
 --key is an int in this case, maybe because the json is an array
 , [j1].[key]
 , [T1].[SysObject_fullname]
 --a statement should have only one child
 --if this is not the case we need to include into ROW_NUMBER()
 --, T1.[children]
 , [RowNumber_per_Object] = ROW_NUMBER() OVER (
  PARTITION BY [T1].[RepoObject_guid] ORDER BY TRY_CAST([j1].[key] AS INT)
  )
 --, j1.[value]
 --, j1.[type]
 , [j2].*
FROM [repo].[RepoObject_SqlModules_10_statement] AS T1
CROSS APPLY OPENJSON(T1.[children]) AS j1
CROSS APPLY OPENJSON(j1.[value]) WITH (
  class NVARCHAR(500) N'$.class'
  , is_group BIT N'$.is_group'
  , is_keyword BIT N'$.is_keyword'
  , is_whitespace BIT N'$.is_whitespace'
  , normalized NVARCHAR(MAX) N'$.normalized'
  , children NVARCHAR(MAX) N'$.children' AS JSON
  ) AS j2

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f78f291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_20_statement_children';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e4f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_20_statement_children', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e5f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_20_statement_children', @level2type = N'COLUMN', @level2name = N'RowNumber_per_Object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e2f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_20_statement_children', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eaf17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_20_statement_children', @level2type = N'COLUMN', @level2name = N'normalized';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e3f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_20_statement_children', @level2type = N'COLUMN', @level2name = N'key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e9f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_20_statement_children', @level2type = N'COLUMN', @level2name = N'is_whitespace';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e8f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_20_statement_children', @level2type = N'COLUMN', @level2name = N'is_keyword';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e7f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_20_statement_children', @level2type = N'COLUMN', @level2name = N'is_group';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e6f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_20_statement_children', @level2type = N'COLUMN', @level2name = N'class';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ebf17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_20_statement_children', @level2type = N'COLUMN', @level2name = N'children';

