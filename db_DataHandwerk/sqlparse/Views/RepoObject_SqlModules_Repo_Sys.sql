

CREATE View sqlparse.RepoObject_SqlModules_Repo_Sys
As
--
Select
    ro.RepoObject_guid
  ----when outdated, use original [sql_modules_definition], otherwise use saved [sql_modules_definition]
  --, [sql_modules_definition] = CASE 
  -- WHEN (
  --   [ros].[sql_modules_dt] IS NULL
  --   OR [ros].[sql_modules_dt] < [so].[modify_date]
  --   )
  --  THEN [so].[sql_modules_definition]
  -- ELSE [ros].[sql_modules_definition]
  -- END
  , so.sql_modules_definition
  , ros.sql_modules_dt
  --, [ros].[sql_modules_antora]
  , ros.sql_modules_formatted
  , ros.sql_modules_formatted2
  , ros.sql_modules_json
  , ros.is_json_sql_modules_json
  , so.modify_date
  , ro.SysObject_type
  , is_outdated = Cast(Case
                           When
                           (
                               ros.sql_modules_dt Is Null
                               Or ros.sql_modules_dt < so.modify_date
                           )
                               Then
                               1
                           Else
                               0
                       End As Bit)
From
    repo.RepoObject                    As ro
    Inner Join
        repo_sys.SysObject             As so
            On
            --ro.RepoObject_guid  = so.SysObject_RepoObject_guid
            so.SysObject_fullname2 = ro.SysObject_fullname2

    Left Join
        sqlparse.RepoObject_SqlModules As ros
            On
            ros.RepoObject_guid    = ro.RepoObject_guid
Where
    Not so.sql_modules_definition Is Null
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '5390291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_Repo_Sys';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8bf47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_Repo_Sys'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '88f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_Repo_Sys'
  , @level2type = N'COLUMN'
  , @level2name = N'sql_modules_json';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '87f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_Repo_Sys'
  , @level2type = N'COLUMN'
  , @level2name = N'sql_modules_formatted2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '86f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_Repo_Sys'
  , @level2type = N'COLUMN'
  , @level2name = N'sql_modules_formatted';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '85f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_Repo_Sys'
  , @level2type = N'COLUMN'
  , @level2name = N'sql_modules_dt';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '84f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_Repo_Sys'
  , @level2type = N'COLUMN'
  , @level2name = N'sql_modules_definition';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '83f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_Repo_Sys'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8af47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_Repo_Sys'
  , @level2type = N'COLUMN'
  , @level2name = N'modify_date';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8cf47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_Repo_Sys'
  , @level2type = N'COLUMN'
  , @level2name = N'is_outdated';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '89f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_Repo_Sys'
  , @level2type = N'COLUMN'
  , @level2name = N'is_json_sql_modules_json';
Go

Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[SysObject_type]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys', @level2type = N'COLUMN', @level2name = N'SysObject_type';


Go


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules].[sql_modules_json]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys', @level2type = N'COLUMN', @level2name = N'sql_modules_json';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules].[sql_modules_formatted2]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys', @level2type = N'COLUMN', @level2name = N'sql_modules_formatted2';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules].[sql_modules_formatted]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys', @level2type = N'COLUMN', @level2name = N'sql_modules_formatted';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules].[sql_modules_dt]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys', @level2type = N'COLUMN', @level2name = N'sql_modules_dt';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo_sys].[SysObject].[sql_modules_definition]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys', @level2type = N'COLUMN', @level2name = N'sql_modules_definition';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo_sys].[SysObject].[modify_date]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys', @level2type = N'COLUMN', @level2name = N'modify_date';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules].[is_json_sql_modules_json]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys', @level2type = N'COLUMN', @level2name = N'is_json_sql_modules_json';


Go



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[RepoObject]
* [repo_sys].[SysObject]
* [sqlparse].[RepoObject_SqlModules]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:property.RepoObjectProperty_Collect_source_sql_modules_definition.adoc[]
* xref:repo.RepoObject_gross2.adoc[]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys';




GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.RepoObject.adoc[]
* xref:repo_sys.SysObject.adoc[]
* xref:sqlparse.RepoObject_SqlModules.adoc[]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_Repo_Sys';

