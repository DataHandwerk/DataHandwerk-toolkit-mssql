﻿--Objects, containing the keywords ('UNION', 'UNION ALL')
--We assume that it is UNION.
Create View [sqlparse].RepoObject_SqlModules_29_1_object_is_union
As
--
Select
    RepoObject_guid
  , is_union = 1
From
    [sqlparse].RepoObject_SqlModules_20_statement_children
Where
    ( is_keyword = 1 )
    And ( normalized In
          ( 'UNION', 'UNION ALL' )
        )
Group By
    RepoObject_guid;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'fb8f291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_29_1_object_is_union';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fff17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_29_1_object_is_union'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '00f27926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_29_1_object_is_union'
  , @level2type = N'COLUMN'
  , @level2name = N'is_union';
Go

Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_20_statement_children].[RepoObject_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_29_1_object_is_union'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
