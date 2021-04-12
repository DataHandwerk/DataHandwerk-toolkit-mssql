

/*helpers are required in next steps to check several conditions
here we prepare the check if the parsed statement will follow some required logic, for example
CREATE;VIEW;Identifier;AS;SELECT;IdentifierList;FROM
*/
Create View repo.RepoObject_SqlModules_21_statement_children_helper
As
--
Select
    T1.RepoObject_guid
  , T1.json_key
  , T1.SysObject_fullname
  , T1.RowNumber_per_Object
  , T1.class
  , T1.is_group
  , T1.is_keyword
  , T1.is_whitespace
  , T1.normalized
  , T1.children
  --the entry 1 in the parsed sql is 'CREATE'
  , is_1_create         = Iif(RowNumber_per_Object = 1 And normalized = 'CREATE', 1, 0)
  --the entry 2 in the parsed sql is 'VIEW'
  , is_2_view           = Iif(RowNumber_per_Object = 2 And normalized = 'VIEW', 1, 0)
  , is_3_Identifier     = Iif(RowNumber_per_Object = 3 And class = 'Identifier', 1, 0)
  , is_4_as             = Iif(RowNumber_per_Object = 4 And normalized = 'AS', 1, 0)
  , is_5_select         = Iif(RowNumber_per_Object = 5 And normalized = 'SELECT', 1, 0)
  , is_6_Identifier     = Iif(RowNumber_per_Object = 6 And class = 'Identifier', 1, 0)
  , is_6_IdentifierList = Iif(RowNumber_per_Object = 6 And class = 'IdentifierList', 1, 0)
  , is_7_from           = Iif(RowNumber_per_Object = 7 And normalized = 'FROM', 1, 0)
  , is_7_IdentifierList = Iif(RowNumber_per_Object = 7 And class = 'IdentifierList', 1, 0)
  , is_8_IdentifierList = Iif(RowNumber_per_Object = 8 And class = 'IdentifierList', 1, 0)
From
    repo.RepoObject_SqlModules_20_statement_children T1;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'f98f291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_21_statement_children_helper';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'eef17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_21_statement_children_helper'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'eff17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_21_statement_children_helper'
  , @level2type = N'COLUMN'
  , @level2name = N'RowNumber_per_Object';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ecf17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_21_statement_children_helper'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f4f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_21_statement_children_helper'
  , @level2type = N'COLUMN'
  , @level2name = N'normalized';
Go

Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f3f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_21_statement_children_helper'
  , @level2type = N'COLUMN'
  , @level2name = N'is_whitespace';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f2f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_21_statement_children_helper'
  , @level2type = N'COLUMN'
  , @level2name = N'is_keyword';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f1f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_21_statement_children_helper'
  , @level2type = N'COLUMN'
  , @level2name = N'is_group';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fef17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_21_statement_children_helper'
  , @level2type = N'COLUMN'
  , @level2name = N'is_8_IdentifierList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fdf17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_21_statement_children_helper'
  , @level2type = N'COLUMN'
  , @level2name = N'is_7_IdentifierList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fcf17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_21_statement_children_helper'
  , @level2type = N'COLUMN'
  , @level2name = N'is_7_from';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fbf17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_21_statement_children_helper'
  , @level2type = N'COLUMN'
  , @level2name = N'is_6_IdentifierList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'faf17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_21_statement_children_helper'
  , @level2type = N'COLUMN'
  , @level2name = N'is_5_select';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f9f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_21_statement_children_helper'
  , @level2type = N'COLUMN'
  , @level2name = N'is_4_as';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f8f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_21_statement_children_helper'
  , @level2type = N'COLUMN'
  , @level2name = N'is_3_Identifier';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f7f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_21_statement_children_helper'
  , @level2type = N'COLUMN'
  , @level2name = N'is_2_view';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f6f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_21_statement_children_helper'
  , @level2type = N'COLUMN'
  , @level2name = N'is_1_create';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f0f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_21_statement_children_helper'
  , @level2type = N'COLUMN'
  , @level2name = N'class';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f5f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_21_statement_children_helper'
  , @level2type = N'COLUMN'
  , @level2name = N'children';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '2f813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_21_statement_children_helper'
  , @level2type = N'COLUMN'
  , @level2name = N'json_key';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '30813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_21_statement_children_helper'
  , @level2type = N'COLUMN'
  , @level2name = N'is_6_Identifier';
Go

Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_20_statement_children].[SysObject_fullname]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_21_statement_children_helper'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_20_statement_children].[RowNumber_per_Object]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_21_statement_children_helper'
  , @level2type = N'COLUMN'
  , @level2name = N'RowNumber_per_Object';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_20_statement_children].[RepoObject_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_21_statement_children_helper'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_20_statement_children].[normalized]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_21_statement_children_helper'
  , @level2type = N'COLUMN'
  , @level2name = N'normalized';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_20_statement_children].[json_key]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_21_statement_children_helper'
  , @level2type = N'COLUMN'
  , @level2name = N'json_key';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_20_statement_children].[is_whitespace]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_21_statement_children_helper'
  , @level2type = N'COLUMN'
  , @level2name = N'is_whitespace';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_20_statement_children].[is_keyword]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_21_statement_children_helper'
  , @level2type = N'COLUMN'
  , @level2name = N'is_keyword';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_20_statement_children].[is_group]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_21_statement_children_helper'
  , @level2type = N'COLUMN'
  , @level2name = N'is_group';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_20_statement_children].[class]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_21_statement_children_helper'
  , @level2type = N'COLUMN'
  , @level2name = N'class';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_20_statement_children].[children]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_21_statement_children_helper'
  , @level2type = N'COLUMN'
  , @level2name = N'children';
