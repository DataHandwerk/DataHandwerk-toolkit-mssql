
CREATE View sqlparse.RepoObject_SqlModules_43_from_Identifier
As
Select
    --
    RepoObject_guid
  , json_key
  , SysObject_fullname
  , class
  , RowNumber_per_Object
  , name
  , name_charindex_dot
  , name_PreDot             = Case
                                  When name_charindex_dot > 1
                                      Then
                                      Left(name, name_charindex_dot - 1)
                              End
  , name_PostDot            = Case
                                  When name_charindex_dot > 1
                                      Then
                                      Substring ( name, name_charindex_dot + 1, Len ( name ))
                              End
  , alias
  , T1_identifier_alias
  , lag_normalized_wo_nolock
From
    sqlparse.RepoObject_SqlModules_42_from_Identifier
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0d5cfbad-f063-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_43_from_Identifier'
  , @level2type = N'COLUMN'
  , @level2name = N'lag_normalized_wo_nolock';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0c5cfbad-f063-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_43_from_Identifier'
  , @level2type = N'COLUMN'
  , @level2name = N'T1_identifier_alias';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0a5cfbad-f063-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_43_from_Identifier'
  , @level2type = N'COLUMN'
  , @level2name = N'alias';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '5f4241cb-fb63-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_43_from_Identifier'
  , @level2type = N'COLUMN'
  , @level2name = N'name_PostDot';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '5e4241cb-fb63-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_43_from_Identifier'
  , @level2type = N'COLUMN'
  , @level2name = N'name_PreDot';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '095cfbad-f063-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_43_from_Identifier'
  , @level2type = N'COLUMN'
  , @level2name = N'name_charindex_dot';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '085cfbad-f063-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_43_from_Identifier'
  , @level2type = N'COLUMN'
  , @level2name = N'name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '075cfbad-f063-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_43_from_Identifier'
  , @level2type = N'COLUMN'
  , @level2name = N'RowNumber_per_Object';
Go

Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '055cfbad-f063-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_43_from_Identifier'
  , @level2type = N'COLUMN'
  , @level2name = N'class';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '045cfbad-f063-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_43_from_Identifier'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '035cfbad-f063-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_43_from_Identifier'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'fe5bfbad-f063-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_43_from_Identifier';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '39813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_43_from_Identifier'
  , @level2type = N'COLUMN'
  , @level2name = N'json_key';
Go

Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_42_from_Identifier].[T1_identifier_alias]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_43_from_Identifier'
  , @level2type = N'COLUMN'
  , @level2name = N'T1_identifier_alias';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_42_from_Identifier].[lag_normalized_wo_nolock]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_43_from_Identifier'
  , @level2type = N'COLUMN'
  , @level2name = N'lag_normalized_wo_nolock';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_42_from_Identifier].[alias]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_43_from_Identifier'
  , @level2type = N'COLUMN'
  , @level2name = N'alias';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [sqlparse].[RepoObject_SqlModules_42_from_Identifier]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_43_from_Identifier';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:sqlparse.RepoObject_SqlModules_44_from_Identifier_QuoteName.adoc[]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_43_from_Identifier';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:sqlparse.RepoObject_SqlModules_42_from_Identifier.adoc[]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_43_from_Identifier';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_42_from_Identifier].[SysObject_fullname]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_43_from_Identifier', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[SysObject_schema_name],''].['',[SysObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_43_from_Identifier', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_42_from_Identifier].[RowNumber_per_Object]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_43_from_Identifier', @level2type = N'COLUMN', @level2name = N'RowNumber_per_Object';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_42_from_Identifier].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_43_from_Identifier', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_42_from_Identifier].[name_charindex_dot]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_43_from_Identifier', @level2type = N'COLUMN', @level2name = N'name_charindex_dot';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_42_from_Identifier].[name]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_43_from_Identifier', @level2type = N'COLUMN', @level2name = N'name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_42_from_Identifier].[json_key]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_43_from_Identifier', @level2type = N'COLUMN', @level2name = N'json_key';

