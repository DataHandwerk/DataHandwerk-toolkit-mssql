﻿
/*
--get and check existing values

Select
    Distinct
    j2.[Key]
  , j2.Type
From
    ssas.model_json_314_tables_hierarchies                   As T1
    Cross Apply OpenJson ( T1.tables_hierarchies_levels_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
ORDER BY
    j2.[Key]
  , j2.Type
Go

Select
    T1.*
  , j2.*
From
    ssas.model_json_314_tables_hierarchies                   As T1
    Cross Apply OpenJson ( T1.tables_hierarchies_levels_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Go

Select
    DISTINCT
    j2.*
From
    ssas.model_json_314_tables_hierarchies                   As T1
    Cross Apply OpenJson ( T1.tables_hierarchies_levels_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Where
    j2.[Key] = 'levels'
GO
*/
create View ssas.model_json_3141_tables_hierarchies_levels
As
Select
    T1.databasename
  , T1.tables_name
  , T1.tables_hierarchies_name
  , j2.tables_hierarchies_levels_name
  , j2.tables_hierarchies_levels_column
  , j2.tables_hierarchies_levels_ordinal
From
    ssas.model_json_314_tables_hierarchies                   As T1
    Cross Apply OpenJson ( T1.tables_hierarchies_levels_ja ) As j1
    Cross Apply
    OpenJson ( j1.Value )
    With
    (
        tables_hierarchies_levels_name NVarchar ( 500 ) N'$.name'
      , tables_hierarchies_levels_column NVarchar ( 500 ) N'$.column'
      , tables_hierarchies_levels_ordinal Int N'$.ordinal'
    ) As j2
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ad60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3141_tables_hierarchies_levels', @level2type = N'COLUMN', @level2name = N'tables_hierarchies_levels_ordinal';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ac60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3141_tables_hierarchies_levels', @level2type = N'COLUMN', @level2name = N'tables_hierarchies_levels_column';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ab60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3141_tables_hierarchies_levels', @level2type = N'COLUMN', @level2name = N'tables_hierarchies_levels_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aa60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3141_tables_hierarchies_levels', @level2type = N'COLUMN', @level2name = N'tables_hierarchies_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a960d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3141_tables_hierarchies_levels', @level2type = N'COLUMN', @level2name = N'tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a860d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3141_tables_hierarchies_levels', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f75fd8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3141_tables_hierarchies_levels';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [ssas].[model_json_314_tables_hierarchies]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3141_tables_hierarchies_levels';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'databasename,tables_name,tables_hierarchies_name,tables_hierarchies_levels_name', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3141_tables_hierarchies_levels';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'nvarchar(128),nvarchar(500),nvarchar(500),nvarchar(500)', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3141_tables_hierarchies_levels';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'09B0C093-EC0A-EC11-8516-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3141_tables_hierarchies_levels';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3141_tables_hierarchies_levels';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3141_tables_hierarchies_levels';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:ssas.model_json_314_tables_hierarchies.adoc[]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3141_tables_hierarchies_levels';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_314_tables_hierarchies].[tables_name]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3141_tables_hierarchies_levels', @level2type = N'COLUMN', @level2name = N'tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_314_tables_hierarchies].[tables_hierarchies_name]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3141_tables_hierarchies_levels', @level2type = N'COLUMN', @level2name = N'tables_hierarchies_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_314_tables_hierarchies].[databasename]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3141_tables_hierarchies_levels', @level2type = N'COLUMN', @level2name = N'databasename';
